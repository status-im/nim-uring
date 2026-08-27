# nim-uring
# Copyright (c) 2026 Status Research & Development GmbH
# Licensed and distributed under either of
#   * MIT license (license terms in the root directory or at https://opensource.org/licenses/MIT).
#   * Apache v2 license (license terms in the root directory or at https://www.apache.org/licenses/LICENSE-2.0).
# at your option. This file may not be copied, modified, or distributed except according to those terms.

import std/os
import std/posix
import unittest2
import ../uring
import ./cconsts

suite "ABI":
  test "type layouts match the C header":
    check:
      sizeof(IoUringSqe) == cSqeSize()
      offsetOf(IoUringSqe, addr_u) == cSqeOffAddr()
      offsetOf(IoUringSqe, len) == cSqeOffLen()
      offsetOf(IoUringSqe, user_data) == cSqeOffUserData()
      offsetOf(IoUringSqe, personality) == cSqeOffPersonality()
      offsetOf(IoUringSqe, cmd_u) == cSqeOffAddr3()
      sizeof(IoUringCqe) == cCqeSize()
      offsetOf(IoUringCqe, res) == cCqeOffRes()
      sizeof(IoUring) == cRingSize()
      sizeof(IoUringParams) == cParamsSize()
      sizeof(IoUringProbe) == cProbeSize()
      sizeof(EpollEvent) == cEpollEventSize()
      sizeof(Cmsghdr) == cCmsghdrSize()
      sizeof(Statx) == cStatxSize()
      offsetOf(Statx, stx_mtime) == cStatxOffMtime()
    # Skipped when the build system's kernel headers predate the field
    # (cLayoutIf returns -1 there); the uapi reserves the space either way.
    if cFutexWaitvSize() >= 0:
      check sizeof(FutexWaitv) == cFutexWaitvSize()
    if cStatxOffSubvol() >= 0:
      check offsetOf(Statx, stx_subvol) == cStatxOffSubvol()

  test "struct-typed fields keep their C names and offsets":
    # opir drops the name of a field whose type is another named struct;
    # `restoreNamedStructFields` in scripts/gen_wrapper.nim puts it back.
    # Without that repair these come out as positional `anon0`/`anon1`
    # wrappers, so check that each field is present and where C puts it.
    #
    # `offsetOf` takes a single field name, so the three members that sit
    # inside a genuine anonymous union are measured from the object address.
    template fieldOff(base, field: untyped): int =
      int(cast[uint](addr field) - cast[uint](addr base))

    var
      ctrl: ZcrxCtrl
      bpf: IoUringBpf
    check:
      fieldOff(ctrl, ctrl.anon0.zc_export) == cZcrxCtrlOffExport()
      fieldOff(ctrl, ctrl.anon0.zc_flush) == cZcrxCtrlOffFlush()
      fieldOff(bpf, bpf.anon0.filter) == cBpfOffFilter()
      offsetOf(IoUring, sq) == cRingOffSq()
      offsetOf(IoUring, cq) == cRingOffCq()
      offsetOf(IoUringParams, sq_off) == cParamsOffSqOff()
      offsetOf(IoUringParams, cq_off) == cParamsOffCqOff()
      offsetOf(IoUringRegWait, ts) == cRegWaitOffTs()
      offsetOf(IoUringSyncCancelReg, timeout) == cSyncCancelOffTimeout()
      offsetOf(IoUringZcrxIfqReg, offsets) == cZcrxIfqRegOffOffsets()
      sizeof(IoUringSq) == cSqRingSize()
      sizeof(IoUringCq) == cCqRingSize()
      sizeof(IoSqringOffsets) == cSqOffsetsSize()
      sizeof(IoCqringOffsets) == cCqOffsetsSize()

  test "constants match the C header":
    check:
      IORING_SETUP_SQPOLL == hdrSetupSqpoll
      IORING_SETUP_SQ_REWIND == hdrSetupSqRewind
      IOSQE_IO_LINK == hdrSqeIoLink
      IORING_ENTER_GETEVENTS == hdrEnterGetevents
      IORING_FEAT_NO_IOWAIT == hdrFeatNoIowait
      IORING_CQE_F_32 == hdrCqeF32

  test "liburing version":
    check io_uring_major_version() == 2

suite "io_uring":
  test "nop round trip":
    var ring: IoUring
    check io_uring_queue_init(8, addr ring, 0) == 0
    check ring.ring_fd > 0

    let sqe = io_uring_get_sqe(addr ring)
    check sqe != nil
    io_uring_prep_nop(sqe)
    io_uring_sqe_set_data64(sqe, 0xdeadbeef'u64)
    check io_uring_submit(addr ring) == 1

    var cqe: ptr IoUringCqe
    check io_uring_wait_cqe(addr ring, addr cqe) == 0
    check cqe.res == 0
    check io_uring_cqe_get_data64(cqe) == 0xdeadbeef'u64
    io_uring_cqe_seen(addr ring, cqe)

    io_uring_queue_exit(addr ring)

  test "file write, read and close":
    let path = getTempDir() / "nim_uring_test_" & $getCurrentProcessId()
    let fd = posix.open(path.cstring, O_CREAT or O_RDWR or O_TRUNC, 0o600)
    check fd > 0

    var ring: IoUring
    check io_uring_queue_init(8, addr ring, 0) == 0

    var wbuf = "hello io_uring from Nim"
    var sqe = io_uring_get_sqe(addr ring)
    io_uring_prep_write(sqe, fd, addr wbuf[0], wbuf.len.cuint, 0)
    check io_uring_submit_and_wait(addr ring, 1) == 1

    var cqe: ptr IoUringCqe
    check io_uring_peek_cqe(addr ring, addr cqe) == 0
    check cqe.res == wbuf.len.int32
    io_uring_cqe_seen(addr ring, cqe)

    var rbuf = newString(wbuf.len)
    sqe = io_uring_get_sqe(addr ring)
    io_uring_prep_read(sqe, fd, addr rbuf[0], rbuf.len.cuint, 0)
    check io_uring_submit_and_wait(addr ring, 1) == 1
    check io_uring_peek_cqe(addr ring, addr cqe) == 0
    check cqe.res == rbuf.len.int32
    io_uring_cqe_seen(addr ring, cqe)
    check rbuf == wbuf

    # close the file through the ring as well
    sqe = io_uring_get_sqe(addr ring)
    io_uring_prep_close(sqe, fd)
    check io_uring_submit_and_wait(addr ring, 1) == 1
    check io_uring_peek_cqe(addr ring, addr cqe) == 0
    check cqe.res == 0
    io_uring_cqe_seen(addr ring, cqe)

    io_uring_queue_exit(addr ring)
    removeFile(path)

  test "timeout expires with ETIME":
    var ring: IoUring
    check io_uring_queue_init(4, addr ring, 0) == 0

    var ts = KernelTimespec(tv_sec: 0, tv_nsec: 1_000_000) # 1ms
    let sqe = io_uring_get_sqe(addr ring)
    io_uring_prep_timeout(sqe, addr ts, 0, 0)
    check io_uring_submit(addr ring) == 1

    var cqe: ptr IoUringCqe
    check io_uring_wait_cqe(addr ring, addr cqe) == 0
    check cqe.res == -ETIME.int32 # timeout expired, no completions
    io_uring_cqe_seen(addr ring, cqe)

    io_uring_queue_exit(addr ring)
