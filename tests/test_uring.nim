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

# Constant cross-checks read the C values through the header; importc
# variables must live at module scope.
var
  cSetupSqpoll {.importc: "IORING_SETUP_SQPOLL", header: uringHeader.}: culonglong
  cSetupSqRewind {.importc: "IORING_SETUP_SQ_REWIND", header: uringHeader.}: culonglong
  cSqeIoLink {.importc: "IOSQE_IO_LINK", header: uringHeader.}: culonglong
  cEnterGetevents {.importc: "IORING_ENTER_GETEVENTS", header: uringHeader.}: culonglong
  cFeatNoIowait {.importc: "IORING_FEAT_NO_IOWAIT", header: uringHeader.}: culonglong
  cCqeF32 {.importc: "IORING_CQE_F_32", header: uringHeader.}: culonglong

suite "ABI":
  test "type sizes match the C header":
    check:
      sizeof(IoUringSqe) == 64
      sizeof(IoUringCqe) == 16

  test "constants match the C header":
    check:
      IORING_SETUP_SQPOLL == cSetupSqpoll.uint32
      IORING_SETUP_SQ_REWIND == cSetupSqRewind.uint32
      IOSQE_IO_LINK == cSqeIoLink.uint8
      IORING_ENTER_GETEVENTS == cEnterGetevents.uint32
      IORING_FEAT_NO_IOWAIT == cFeatNoIowait.uint32
      IORING_CQE_F_32 == cCqeF32.uint32

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
