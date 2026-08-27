# nim-uring
# Copyright (c) 2026 Status Research & Development GmbH
# Licensed and distributed under either of
#   * MIT license (license terms in the root directory or at https://opensource.org/licenses/MIT).
#   * Apache v2 license (license terms in the root directory or at https://www.apache.org/licenses/LICENSE-2.0).
# at your option. This file may not be copied, modified, or distributed except according to those terms.

## Thin Nim wrapper for `liburing <https://github.com/axboe/liburing>`_,
## the userspace library for the Linux `io_uring` interface.
##
## The wrapper binds directly against the vendored liburing header, keeping
## the C names and semantics (functions return negative `errno` values on
## failure). liburing's static inline helpers are called through the header;
## everything else links against `liburing.a`, which is built on first
## compilation using liburing's own `configure` and `make` and linked
## statically, so there is no runtime dependency on a system liburing.

when not defined(linux):
  {.error: "io_uring is only available on Linux".}

from std/os import parentDir, quoteShell, `/`, fileExists
from std/posix import IOVec, Tmsghdr, SockAddr, SockLen, Sigset, Mode
from std/epoll import EpollEvent

export IOVec, Tmsghdr, SockAddr, SockLen, Sigset, Mode, EpollEvent

const
  uringDir = currentSourcePath.parentDir / "vendor" / "liburing"
  uringLib = uringDir / "src" / "liburing.a"
  uringBuildScript = currentSourcePath.parentDir / "scripts" / "build_static_lib.sh"
  uringHeader* = uringDir / "src" / "include" / "liburing.h"
    ## Path to the vendored `liburing.h`; usable with `importc` to bind
    ## additional liburing functions in application code.

when not fileExists(uringLib):
  # Build the vendored liburing with the same script as `nimble staticLib`;
  # it fetches the submodule if needed and runs liburing's own configure and
  # make. This runs once; later compilations just link the result.
  static:
    echo "nim-uring: building vendored liburing.a"
    let (output, exitCode) = gorgeEx("sh " & quoteShell(uringBuildScript))
    doAssert exitCode == 0, "failed to build vendored liburing:\n" & output

{.passc: "-D_GNU_SOURCE".}
{.passl: quoteShell(uringLib).}

type
  KernelTimespec* {.importc: "struct __kernel_timespec",
      header: uringHeader.} = object
    tv_sec*: int64
    tv_nsec*: clonglong

  Statx* {.importc: "struct statx", header: uringHeader.} = object

  IoSqringOffsets* {.importc: "struct io_sqring_offsets",
      header: uringHeader.} = object
    head*, tail*, ring_mask*, ring_entries*: uint32
    flags*, dropped*, array*, resv1*: uint32
    user_addr*: uint64

  IoCqringOffsets* {.importc: "struct io_cqring_offsets",
      header: uringHeader.} = object
    head*, tail*, ring_mask*, ring_entries*: uint32
    overflow*, cqes*, flags*, resv1*: uint32
    user_addr*: uint64

  IoUringParams* {.importc: "struct io_uring_params",
      header: uringHeader.} = object
    sq_entries*, cq_entries*, flags*: uint32
    sq_thread_cpu*, sq_thread_idle*: uint32
    features*, wq_fd*: uint32
    resv*: array[3, uint32]
    sq_off*: IoSqringOffsets
    cq_off*: IoCqringOffsets

  IoUringSqe* {.importc: "struct io_uring_sqe", header: uringHeader.} = object
    ## Submission queue entry. Only the commonly accessed fields are
    ## declared; the layout always comes from the C header. Prefer the
    ## `io_uring_prep_*` functions over writing fields directly.
    opcode*: uint8
    flags*: uint8
    ioprio*: uint16
    fd*: int32
    off*: uint64
    address* {.importc: "addr".}: uint64
    len*: uint32
    user_data*: uint64
    buf_index*: uint16
    buf_group*: uint16

  IoUringCqe* {.importc: "struct io_uring_cqe", header: uringHeader.} = object
    ## Completion queue entry. `res` is the syscall result, negative values
    ## are `-errno`.
    user_data*: uint64
    res*: int32
    flags*: uint32

  IoUring* {.importc: "struct io_uring", header: uringHeader.} = object
    ## The ring handle. Contains further (undeclared) fields; treat it as
    ## opaque and let liburing manage it.
    flags*: cuint
    ring_fd*: cint
    features*: cuint

const
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

{.push cdecl, importc, header: uringHeader.}

# Library version
proc io_uring_major_version*(): cint
proc io_uring_minor_version*(): cint

# Queue setup and teardown
proc io_uring_queue_init*(entries: cuint; ring: ptr IoUring;
  flags: cuint): cint
proc io_uring_queue_init_params*(entries: cuint; ring: ptr IoUring;
  p: ptr IoUringParams): cint
proc io_uring_queue_exit*(ring: ptr IoUring)
proc io_uring_ring_dontfork*(ring: ptr IoUring): cint

# Submission queue entries
proc io_uring_get_sqe*(ring: ptr IoUring): ptr IoUringSqe
proc io_uring_sqe_set_data*(sqe: ptr IoUringSqe; data: pointer)
proc io_uring_sqe_set_data64*(sqe: ptr IoUringSqe; data: uint64)
proc io_uring_sqe_set_flags*(sqe: ptr IoUringSqe; flags: cuint)
proc io_uring_sqe_set_buf_group*(sqe: ptr IoUringSqe; bgid: cint)

# Submission
proc io_uring_submit*(ring: ptr IoUring): cint
proc io_uring_submit_and_wait*(ring: ptr IoUring; wait_nr: cuint): cint
proc io_uring_submit_and_wait_timeout*(ring: ptr IoUring;
  cqe_ptr: ptr ptr IoUringCqe; wait_nr: cuint; ts: ptr KernelTimespec;
  sigmask: ptr Sigset): cint

# Completions
proc io_uring_wait_cqe*(ring: ptr IoUring; cqe_ptr: ptr ptr IoUringCqe): cint
proc io_uring_wait_cqe_nr*(ring: ptr IoUring; cqe_ptr: ptr ptr IoUringCqe;
  wait_nr: cuint): cint
proc io_uring_wait_cqe_timeout*(ring: ptr IoUring;
  cqe_ptr: ptr ptr IoUringCqe; ts: ptr KernelTimespec): cint
proc io_uring_wait_cqes*(ring: ptr IoUring; cqe_ptr: ptr ptr IoUringCqe;
  wait_nr: cuint; ts: ptr KernelTimespec; sigmask: ptr Sigset): cint
proc io_uring_peek_cqe*(ring: ptr IoUring; cqe_ptr: ptr ptr IoUringCqe): cint
proc io_uring_peek_batch_cqe*(ring: ptr IoUring; cqes: ptr ptr IoUringCqe;
  count: cuint): cuint
proc io_uring_cqe_get_data*(cqe: ptr IoUringCqe): pointer
proc io_uring_cqe_get_data64*(cqe: ptr IoUringCqe): uint64
proc io_uring_cqe_seen*(ring: ptr IoUring; cqe: ptr IoUringCqe)
proc io_uring_cq_advance*(ring: ptr IoUring; nr: cuint)

# Ring state
proc io_uring_sq_ready*(ring: ptr IoUring): cuint
proc io_uring_sq_space_left*(ring: ptr IoUring): cuint
proc io_uring_cq_ready*(ring: ptr IoUring): cuint
proc io_uring_cq_has_overflow*(ring: ptr IoUring): bool

# Resource registration
proc io_uring_register_buffers*(ring: ptr IoUring; iovecs: ptr IOVec;
  nr_iovecs: cuint): cint
proc io_uring_unregister_buffers*(ring: ptr IoUring): cint
proc io_uring_register_files*(ring: ptr IoUring; files: ptr cint;
  nr_files: cuint): cint
proc io_uring_register_files_update*(ring: ptr IoUring; off: cuint;
  files: ptr cint; nr_files: cuint): cint
proc io_uring_unregister_files*(ring: ptr IoUring): cint
proc io_uring_register_eventfd*(ring: ptr IoUring; fd: cint): cint
proc io_uring_unregister_eventfd*(ring: ptr IoUring): cint

# Request preparation
proc io_uring_prep_rw*(op: cint; sqe: ptr IoUringSqe; fd: cint;
  address: pointer; len: cuint; offset: uint64)
proc io_uring_prep_nop*(sqe: ptr IoUringSqe)
proc io_uring_prep_read*(sqe: ptr IoUringSqe; fd: cint; buf: pointer;
  nbytes: cuint; offset: uint64)
proc io_uring_prep_write*(sqe: ptr IoUringSqe; fd: cint; buf: pointer;
  nbytes: cuint; offset: uint64)
proc io_uring_prep_readv*(sqe: ptr IoUringSqe; fd: cint; iovecs: ptr IOVec;
  nr_vecs: cuint; offset: uint64)
proc io_uring_prep_writev*(sqe: ptr IoUringSqe; fd: cint; iovecs: ptr IOVec;
  nr_vecs: cuint; offset: uint64)
proc io_uring_prep_read_fixed*(sqe: ptr IoUringSqe; fd: cint; buf: pointer;
  nbytes: cuint; offset: uint64; buf_index: cint)
proc io_uring_prep_write_fixed*(sqe: ptr IoUringSqe; fd: cint; buf: pointer;
  nbytes: cuint; offset: uint64; buf_index: cint)
proc io_uring_prep_fsync*(sqe: ptr IoUringSqe; fd: cint; fsync_flags: cuint)
proc io_uring_prep_openat*(sqe: ptr IoUringSqe; dfd: cint; path: cstring;
  flags: cint; mode: Mode)
proc io_uring_prep_close*(sqe: ptr IoUringSqe; fd: cint)
proc io_uring_prep_statx*(sqe: ptr IoUringSqe; dfd: cint; path: cstring;
  flags: cint; mask: cuint; statxbuf: ptr Statx)
proc io_uring_prep_fallocate*(sqe: ptr IoUringSqe; fd: cint; mode: cint;
  offset: uint64; len: uint64)
proc io_uring_prep_splice*(sqe: ptr IoUringSqe; fd_in: cint; off_in: int64;
  fd_out: cint; off_out: int64; nbytes: cuint; splice_flags: cuint)
proc io_uring_prep_unlinkat*(sqe: ptr IoUringSqe; dfd: cint; path: cstring;
  flags: cint)
proc io_uring_prep_renameat*(sqe: ptr IoUringSqe; olddfd: cint;
  oldpath: cstring; newdfd: cint; newpath: cstring; flags: cuint)
proc io_uring_prep_timeout*(sqe: ptr IoUringSqe; ts: ptr KernelTimespec;
  count: cuint; flags: cuint)
proc io_uring_prep_timeout_remove*(sqe: ptr IoUringSqe; user_data: uint64;
  flags: cuint)
proc io_uring_prep_timeout_update*(sqe: ptr IoUringSqe;
  ts: ptr KernelTimespec; user_data: uint64; flags: cuint)
proc io_uring_prep_link_timeout*(sqe: ptr IoUringSqe; ts: ptr KernelTimespec;
  flags: cuint)
proc io_uring_prep_poll_add*(sqe: ptr IoUringSqe; fd: cint; poll_mask: cuint)
proc io_uring_prep_poll_multishot*(sqe: ptr IoUringSqe; fd: cint;
  poll_mask: cuint)
proc io_uring_prep_poll_remove*(sqe: ptr IoUringSqe; user_data: uint64)
proc io_uring_prep_cancel*(sqe: ptr IoUringSqe; user_data: pointer;
  flags: cint)
proc io_uring_prep_cancel64*(sqe: ptr IoUringSqe; user_data: uint64;
  flags: cint)
proc io_uring_prep_accept*(sqe: ptr IoUringSqe; fd: cint;
  address: ptr SockAddr; addrlen: ptr SockLen; flags: cint)
proc io_uring_prep_multishot_accept*(sqe: ptr IoUringSqe; fd: cint;
  address: ptr SockAddr; addrlen: ptr SockLen; flags: cint)
proc io_uring_prep_connect*(sqe: ptr IoUringSqe; fd: cint;
  address: ptr SockAddr; addrlen: SockLen)
proc io_uring_prep_socket*(sqe: ptr IoUringSqe; domain: cint; kind: cint;
  protocol: cint; flags: cuint)
proc io_uring_prep_shutdown*(sqe: ptr IoUringSqe; fd: cint; how: cint)
proc io_uring_prep_send*(sqe: ptr IoUringSqe; sockfd: cint; buf: pointer;
  len: csize_t; flags: cint)
proc io_uring_prep_recv*(sqe: ptr IoUringSqe; sockfd: cint; buf: pointer;
  len: csize_t; flags: cint)
proc io_uring_prep_sendmsg*(sqe: ptr IoUringSqe; fd: cint; msg: ptr Tmsghdr;
  flags: cuint)
proc io_uring_prep_recvmsg*(sqe: ptr IoUringSqe; fd: cint; msg: ptr Tmsghdr;
  flags: cuint)
proc io_uring_prep_provide_buffers*(sqe: ptr IoUringSqe; address: pointer;
  len: cint; nr: cint; bgid: cint; bid: cint)
proc io_uring_prep_remove_buffers*(sqe: ptr IoUringSqe; nr: cint; bgid: cint)
proc io_uring_prep_files_update*(sqe: ptr IoUringSqe; fds: ptr cint;
  nr_fds: cuint; offset: cint)
proc io_uring_prep_epoll_ctl*(sqe: ptr IoUringSqe; epfd: cint; fd: cint;
  op: cint; ev: ptr EpollEvent)

{.pop.}
