# nim-uring
# Copyright (c) 2026 Status Research & Development GmbH
# Licensed and distributed under either of
#   * MIT license (license terms in the root directory or at https://opensource.org/licenses/MIT).
#   * Apache v2 license (license terms in the root directory or at https://www.apache.org/licenses/LICENSE-2.0).
# at your option. This file may not be copied, modified, or distributed except according to those terms.

## Nim wrapper for `liburing <https://github.com/axboe/liburing>`_,
## the userspace library for the Linux `io_uring` interface.
##
## The bindings in `uring_generated.nim` are generated from the vendored
## `liburing.h` with `Futhark <https://github.com/PMunch/futhark>`_ and cover
## the complete public liburing API, keeping the C names and semantics
## (functions return negative `errno` values on failure). liburing's static
## inline helpers are called through `liburing-ffi.a`, which compiles them as
## real functions for FFI use. The archive is built on first compilation
## using liburing's own `configure` and `make` and linked statically, so
## there is no runtime dependency on a system liburing.
##
## To regenerate the bindings after updating the liburing submodule, run
## `scripts/generate_wrapper.sh` (see the script header for the required
## tools; regular users of this wrapper don't need them).

when not defined(linux):
  {.error: "io_uring is only available on Linux".}

from std/os import parentDir, quoteShell, `/`, fileExists

const
  uringDir = currentSourcePath.parentDir / "vendor" / "liburing"
  uringLib = uringDir / "src" / "liburing-ffi.a"
  uringBuildScript = currentSourcePath.parentDir / "scripts" / "build_static_lib.sh"
  uringHeader* = uringDir / "src" / "include" / "liburing.h"
    ## Path to the vendored `liburing.h`; usable with `importc` to read
    ## values through the header in application code. Do this in a module
    ## that doesn't also call the wrapper functions: including the header in
    ## a C translation unit that declares the wrapper's extern prototypes
    ## conflicts with the header's static-inline definitions (see
    ## `tests/cconsts.nim` for the pattern).

when not fileExists(uringLib):
  # Build the vendored liburing with the same script as `nimble staticLib`;
  # it fetches the submodule if needed and runs liburing's own configure and
  # make. This runs once; later compilations just link the result.
  static:
    echo "nim-uring: building vendored liburing-ffi.a"
    let (output, exitCode) = gorgeEx("sh " & quoteShell(uringBuildScript))
    doAssert exitCode == 0, "failed to build vendored liburing:\n" & output

{.passc: "-D_GNU_SOURCE".}
{.passl: quoteShell(uringLib).}

const
  # The constants below are function-like macros in the C headers
  # (`(1U << n)`-style), which the binding generator cannot translate; they
  # are maintained by hand and cross-checked against the header in the tests.

  # io_uring_setup() flags
  IORING_SETUP_IOPOLL* = 1'u32 shl 0
  IORING_SETUP_SQPOLL* = 1'u32 shl 1
  IORING_SETUP_SQ_AFF* = 1'u32 shl 2
  IORING_SETUP_CQSIZE* = 1'u32 shl 3
  IORING_SETUP_CLAMP* = 1'u32 shl 4
  IORING_SETUP_ATTACH_WQ* = 1'u32 shl 5
  IORING_SETUP_R_DISABLED* = 1'u32 shl 6
  IORING_SETUP_SUBMIT_ALL* = 1'u32 shl 7
  IORING_SETUP_COOP_TASKRUN* = 1'u32 shl 8
  IORING_SETUP_TASKRUN_FLAG* = 1'u32 shl 9
  IORING_SETUP_SQE128* = 1'u32 shl 10
  IORING_SETUP_CQE32* = 1'u32 shl 11
  IORING_SETUP_SINGLE_ISSUER* = 1'u32 shl 12
  IORING_SETUP_DEFER_TASKRUN* = 1'u32 shl 13
  IORING_SETUP_NO_MMAP* = 1'u32 shl 14
  IORING_SETUP_REGISTERED_FD_ONLY* = 1'u32 shl 15
  IORING_SETUP_NO_SQARRAY* = 1'u32 shl 16
  IORING_SETUP_HYBRID_IOPOLL* = 1'u32 shl 17
  IORING_SETUP_CQE_MIXED* = 1'u32 shl 18
  IORING_SETUP_SQE_MIXED* = 1'u32 shl 19
  IORING_SETUP_SQ_REWIND* = 1'u32 shl 20

  # sqe.flags
  IOSQE_FIXED_FILE* = 1'u8 shl 0
  IOSQE_IO_DRAIN* = 1'u8 shl 1
  IOSQE_IO_LINK* = 1'u8 shl 2
  IOSQE_IO_HARDLINK* = 1'u8 shl 3
  IOSQE_ASYNC* = 1'u8 shl 4
  IOSQE_BUFFER_SELECT* = 1'u8 shl 5
  IOSQE_CQE_SKIP_SUCCESS* = 1'u8 shl 6

  # cqe.flags
  IORING_CQE_F_BUFFER* = 1'u32 shl 0
  IORING_CQE_F_MORE* = 1'u32 shl 1
  IORING_CQE_F_SOCK_NONEMPTY* = 1'u32 shl 2
  IORING_CQE_F_NOTIF* = 1'u32 shl 3
  IORING_CQE_F_BUF_MORE* = 1'u32 shl 4
  IORING_CQE_F_SKIP* = 1'u32 shl 5
  IORING_CQE_F_32* = 1'u32 shl 15
  IORING_CQE_BUFFER_SHIFT* = 16

  # io_uring_enter() flags
  IORING_ENTER_GETEVENTS* = 1'u32 shl 0
  IORING_ENTER_SQ_WAKEUP* = 1'u32 shl 1
  IORING_ENTER_SQ_WAIT* = 1'u32 shl 2
  IORING_ENTER_EXT_ARG* = 1'u32 shl 3
  IORING_ENTER_REGISTERED_RING* = 1'u32 shl 4
  IORING_ENTER_ABS_TIMER* = 1'u32 shl 5
  IORING_ENTER_EXT_ARG_REG* = 1'u32 shl 6
  IORING_ENTER_NO_IOWAIT* = 1'u32 shl 7

  # io_uring_params.features
  IORING_FEAT_SINGLE_MMAP* = 1'u32 shl 0
  IORING_FEAT_NODROP* = 1'u32 shl 1
  IORING_FEAT_SUBMIT_STABLE* = 1'u32 shl 2
  IORING_FEAT_RW_CUR_POS* = 1'u32 shl 3
  IORING_FEAT_CUR_PERSONALITY* = 1'u32 shl 4
  IORING_FEAT_FAST_POLL* = 1'u32 shl 5
  IORING_FEAT_POLL_32BITS* = 1'u32 shl 6
  IORING_FEAT_SQPOLL_NONFIXED* = 1'u32 shl 7
  IORING_FEAT_EXT_ARG* = 1'u32 shl 8
  IORING_FEAT_NATIVE_WORKERS* = 1'u32 shl 9
  IORING_FEAT_RSRC_TAGS* = 1'u32 shl 10
  IORING_FEAT_CQE_SKIP* = 1'u32 shl 11
  IORING_FEAT_LINKED_FILE* = 1'u32 shl 12
  IORING_FEAT_REG_REG_RING* = 1'u32 shl 13
  IORING_FEAT_RECVSEND_BUNDLE* = 1'u32 shl 14
  IORING_FEAT_MIN_TIMEOUT* = 1'u32 shl 15
  IORING_FEAT_RW_ATTR* = 1'u32 shl 16
  IORING_FEAT_NO_IOWAIT* = 1'u32 shl 17

  LIBURING_UDATA_TIMEOUT* = not 0'u64
    ## `user_data` value of timeout CQEs generated by `io_uring_wait_cqes`.

type
  # Hand-maintained definitions for C constructs that Futhark mistranslates:
  # anonymous unions with members named after Nim keywords get dropped,
  # flexible array members become phantom pointer fields, and types that
  # liburing.h only forward-declares come out as empty objects. Declaring a
  # type here before the include makes the generated bindings use it instead
  # (each generated declaration is guarded by `when not declared`). The
  # layouts are cross-checked against the C compiler in the test suite.

  IoUringSqeOffUnion* {.union, bycopy.} = object
    off*: uint64
    addr2*: uint64
    cmd_op*: uint32

  IoUringSqeSockopt* {.bycopy.} = object
    level*: uint32
    optname*: uint32

  IoUringSqeAddrUnion* {.union, bycopy.} = object
    address*: uint64 ## `addr` in C
    splice_off_in*: uint64
    sockopt*: IoUringSqeSockopt

  IoUringSqeOpFlagsUnion* {.union, bycopy.} = object
    rw_flags*: int32
    fsync_flags*: uint32
    poll_events*: uint16
    poll32_events*: uint32
    sync_range_flags*: uint32
    msg_flags*: uint32
    timeout_flags*: uint32
    accept_flags*: uint32
    cancel_flags*: uint32
    open_flags*: uint32
    statx_flags*: uint32
    fadvise_advice*: uint32
    splice_flags*: uint32
    rename_flags*: uint32
    unlink_flags*: uint32
    hardlink_flags*: uint32
    xattr_flags*: uint32
    msg_ring_flags*: uint32
    uring_cmd_flags*: uint32
    waitid_flags*: uint32
    futex_flags*: uint32
    install_fd_flags*: uint32
    nop_flags*: uint32
    pipe_flags*: uint32

  IoUringSqeBufUnion* {.union, bycopy.} = object
    buf_index*: uint16
    buf_group*: uint16

  IoUringSqeFileUnion* {.union, bycopy.} = object
    splice_fd_in*: int32
    file_index*: uint32
    zcrx_ifq_idx*: uint32
    optlen*: uint32
    addr_len*: uint16

  IoUringSqeAttr* {.bycopy.} = object
    attr_ptr*: uint64
    attr_type_mask*: uint64

  IoUringSqeCmdUnion* {.union, bycopy.} = object
    addr3*: uint64
    attr*: IoUringSqeAttr
    optval*: uint64
    ## With `IORING_SETUP_SQE128`, arbitrary command data (`sqe->cmd`)
    ## starts at this union's offset.

  IoUringSqe* {.bycopy.} = object
    ## Submission queue entry, laid out as in `liburing/io_uring.h`. The
    ## anonymous C unions are named here; prefer the `io_uring_prep_*`
    ## functions over writing fields directly.
    opcode*: uint8
    flags*: uint8
    ioprio*: uint16
    fd*: int32
    off_u*: IoUringSqeOffUnion
    addr_u*: IoUringSqeAddrUnion
    len*: uint32
    opflags_u*: IoUringSqeOpFlagsUnion
    user_data*: uint64
    buf_u*: IoUringSqeBufUnion
    personality*: uint16
    file_u*: IoUringSqeFileUnion
    cmd_u*: IoUringSqeCmdUnion

  IoUringCqe* {.bycopy.} = object
    ## Completion queue entry. `res` is the syscall result, negative values
    ## are `-errno`. With `IORING_SETUP_CQE32`, 16 extra bytes of completion
    ## data follow each entry; see `big_cqe`.
    user_data*: uint64
    res*: int32
    flags*: uint32

  IoUringProbe* {.bycopy.} = object
    ## Probe header; `ops_len` entries follow in memory, see `ops`.
    last_op*: uint8
    ops_len*: uint8
    resv: uint16
    resv2: array[3, uint32]

  Cmsghdr* {.bycopy.} = object
    cmsg_len*: csize_t
    cmsg_level*: int32
    cmsg_type*: int32

  EpollEvent* {.bycopy, packed.} = object
    # The kernel packs epoll_event on x86_64; on other Linux targets the
    # layout is identical with or without packing (u32 + padding-free u64
    # data union), so packing unconditionally matches the C layout.
    events*: uint32
    data*: uint64

  FutexWaitv* {.bycopy.} = object
    val*: uint64
    uaddr*: uint64
    flags*: uint32
    reserved: uint32

  StatxTimestamp* {.bycopy.} = object
    tv_sec*: int64
    tv_nsec*: uint32
    reserved: int32

  Statx* {.bycopy.} = object
    stx_mask*: uint32
    stx_blksize*: uint32
    stx_attributes*: uint64
    stx_nlink*: uint32
    stx_uid*: uint32
    stx_gid*: uint32
    stx_mode*: uint16
    spare0: array[1, uint16]
    stx_ino*: uint64
    stx_size*: uint64
    stx_blocks*: uint64
    stx_attributes_mask*: uint64
    stx_atime*: StatxTimestamp
    stx_btime*: StatxTimestamp
    stx_ctime*: StatxTimestamp
    stx_mtime*: StatxTimestamp
    stx_rdev_major*: uint32
    stx_rdev_minor*: uint32
    stx_dev_major*: uint32
    stx_dev_minor*: uint32
    stx_mnt_id*: uint64
    stx_dio_mem_align*: uint32
    stx_dio_offset_align*: uint32
    stx_subvol*: uint64
    stx_atomic_write_unit_min*: uint32
    stx_atomic_write_unit_max*: uint32
    stx_atomic_write_segments_max*: uint32
    stx_dio_read_offset_align*: uint32
    stx_atomic_write_unit_max_opt*: uint32
    spare2: array[1, uint32]
    spare3: array[8, uint64]

include uring_generated

func big_cqe*(cqe: ptr IoUringCqe): ptr UncheckedArray[uint64] =
  ## The extra completion data following the CQE on rings set up with
  ## `IORING_SETUP_CQE32` (`cqe->big_cqe[]` in C).
  cast[ptr UncheckedArray[uint64]](cast[uint](cqe) + uint(sizeof(IoUringCqe)))

func ops*(probe: ptr IoUringProbe): ptr UncheckedArray[IoUringProbeOp] =
  ## The `ops_len` probe entries following the probe header
  ## (`probe->ops[]` in C).
  cast[ptr UncheckedArray[IoUringProbeOp]](
    cast[uint](probe) + uint(sizeof(IoUringProbe)))
