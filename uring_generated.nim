
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from std / macros import hint, warning, newLit, getSize

from std / os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

when not declared(IORING_MEM_REGION_TYPE_USER):
  const
    IORING_MEM_REGION_TYPE_USER* = cuint(1)
else:
  static :
    hint("Declaration of " & "IORING_MEM_REGION_TYPE_USER" &
        " already exists, not redeclaring")
when not declared(IORING_MEM_REGION_REG_WAIT_ARG):
  const
    IORING_MEM_REGION_REG_WAIT_ARG* = cuint(1)
else:
  static :
    hint("Declaration of " & "IORING_MEM_REGION_REG_WAIT_ARG" &
        " already exists, not redeclaring")
when not declared(IORING_REGISTER_SRC_REGISTERED):
  const
    IORING_REGISTER_SRC_REGISTERED* = cuint(1)
else:
  static :
    hint("Declaration of " & "IORING_REGISTER_SRC_REGISTERED" &
        " already exists, not redeclaring")
when not declared(IORING_REGISTER_DST_REPLACE):
  const
    IORING_REGISTER_DST_REPLACE* = cuint(2)
else:
  static :
    hint("Declaration of " & "IORING_REGISTER_DST_REPLACE" &
        " already exists, not redeclaring")
when not declared(IORING_REG_WAIT_TS):
  const
    IORING_REG_WAIT_TS* = cuint(1)
else:
  static :
    hint("Declaration of " & "IORING_REG_WAIT_TS" &
        " already exists, not redeclaring")
when not declared(IO_URING_QUERY_OPCODES):
  const
    IO_URING_QUERY_OPCODES* = cuint(0)
else:
  static :
    hint("Declaration of " & "IO_URING_QUERY_OPCODES" &
        " already exists, not redeclaring")
when not declared(IO_URING_QUERY_ZCRX):
  const
    IO_URING_QUERY_ZCRX* = cuint(1)
else:
  static :
    hint("Declaration of " & "IO_URING_QUERY_ZCRX" &
        " already exists, not redeclaring")
when not declared(IO_URING_QUERY_SCQ):
  const
    IO_URING_QUERY_SCQ* = cuint(2)
else:
  static :
    hint("Declaration of " & "IO_URING_QUERY_SCQ" &
        " already exists, not redeclaring")
when not declared(compiler_IO_URING_QUERY_MAX):
  const
    compiler_IO_URING_QUERY_MAX* = cuint(3)
else:
  static :
    hint("Declaration of " & "compiler_IO_URING_QUERY_MAX" &
        " already exists, not redeclaring")
when not declared(IO_URING_BPF_FILTER_DENY_REST):
  const
    IO_URING_BPF_FILTER_DENY_REST* = cuint(1)
else:
  static :
    hint("Declaration of " & "IO_URING_BPF_FILTER_DENY_REST" &
        " already exists, not redeclaring")
when not declared(IO_URING_BPF_FILTER_SZ_STRICT):
  const
    IO_URING_BPF_FILTER_SZ_STRICT* = cuint(2)
else:
  static :
    hint("Declaration of " & "IO_URING_BPF_FILTER_SZ_STRICT" &
        " already exists, not redeclaring")
when not declared(IO_URING_BPF_CMD_FILTER):
  const
    IO_URING_BPF_CMD_FILTER* = cuint(1)
else:
  static :
    hint("Declaration of " & "IO_URING_BPF_CMD_FILTER" &
        " already exists, not redeclaring")
type
  IoUringSqeFlagsBit_570426088* {.size: sizeof(cuint).} = enum
    IOSQE_FIXED_FILE_BIT = 0, IOSQE_IO_DRAIN_BIT = 1, IOSQE_IO_LINK_BIT = 2,
    IOSQE_IO_HARDLINK_BIT = 3, IOSQE_ASYNC_BIT = 4, IOSQE_BUFFER_SELECT_BIT = 5,
    IOSQE_CQE_SKIP_SUCCESS_BIT = 6
type
  IoUringOp_570426090* {.size: sizeof(cuint).} = enum
    IORING_OP_NOP = 0, IORING_OP_READV = 1, IORING_OP_WRITEV = 2,
    IORING_OP_FSYNC = 3, IORING_OP_READ_FIXED = 4, IORING_OP_WRITE_FIXED = 5,
    IORING_OP_POLL_ADD = 6, IORING_OP_POLL_REMOVE = 7,
    IORING_OP_SYNC_FILE_RANGE = 8, IORING_OP_SENDMSG = 9,
    IORING_OP_RECVMSG = 10, IORING_OP_TIMEOUT = 11,
    IORING_OP_TIMEOUT_REMOVE = 12, IORING_OP_ACCEPT = 13,
    IORING_OP_ASYNC_CANCEL = 14, IORING_OP_LINK_TIMEOUT = 15,
    IORING_OP_CONNECT = 16, IORING_OP_FALLOCATE = 17, IORING_OP_OPENAT = 18,
    IORING_OP_CLOSE = 19, IORING_OP_FILES_UPDATE = 20, IORING_OP_STATX = 21,
    IORING_OP_READ = 22, IORING_OP_WRITE = 23, IORING_OP_FADVISE = 24,
    IORING_OP_MADVISE = 25, IORING_OP_SEND = 26, IORING_OP_RECV = 27,
    IORING_OP_OPENAT2 = 28, IORING_OP_EPOLL_CTL = 29, IORING_OP_SPLICE = 30,
    IORING_OP_PROVIDE_BUFFERS = 31, IORING_OP_REMOVE_BUFFERS = 32,
    IORING_OP_TEE = 33, IORING_OP_SHUTDOWN = 34, IORING_OP_RENAMEAT = 35,
    IORING_OP_UNLINKAT = 36, IORING_OP_MKDIRAT = 37, IORING_OP_SYMLINKAT = 38,
    IORING_OP_LINKAT = 39, IORING_OP_MSG_RING = 40, IORING_OP_FSETXATTR = 41,
    IORING_OP_SETXATTR = 42, IORING_OP_FGETXATTR = 43, IORING_OP_GETXATTR = 44,
    IORING_OP_SOCKET = 45, IORING_OP_URING_CMD = 46, IORING_OP_SEND_ZC = 47,
    IORING_OP_SENDMSG_ZC = 48, IORING_OP_READ_MULTISHOT = 49,
    IORING_OP_WAITID = 50, IORING_OP_FUTEX_WAIT = 51, IORING_OP_FUTEX_WAKE = 52,
    IORING_OP_FUTEX_WAITV = 53, IORING_OP_FIXED_FD_INSTALL = 54,
    IORING_OP_FTRUNCATE = 55, IORING_OP_BIND = 56, IORING_OP_LISTEN = 57,
    IORING_OP_RECV_ZC = 58, IORING_OP_EPOLL_WAIT = 59,
    IORING_OP_READV_FIXED = 60, IORING_OP_WRITEV_FIXED = 61,
    IORING_OP_PIPE = 62, IORING_OP_NOP128 = 63, IORING_OP_URING_CMD128 = 64,
    IORING_OP_LAST = 65
type
  IoUringMsgRingFlags_570426092* {.size: sizeof(cuint).} = enum
    IORING_MSG_DATA = 0, IORING_MSG_SEND_FD = 1
type
  IoUringRegisterOp_570426102* {.size: sizeof(cuint).} = enum
    IORING_REGISTER_USE_REGISTERED_RING = -2147483648,
    IORING_REGISTER_BUFFERS = 0, IORING_UNREGISTER_BUFFERS = 1,
    IORING_REGISTER_FILES = 2, IORING_UNREGISTER_FILES = 3,
    IORING_REGISTER_EVENTFD = 4, IORING_UNREGISTER_EVENTFD = 5,
    IORING_REGISTER_FILES_UPDATE = 6, IORING_REGISTER_EVENTFD_ASYNC = 7,
    IORING_REGISTER_PROBE = 8, IORING_REGISTER_PERSONALITY = 9,
    IORING_UNREGISTER_PERSONALITY = 10, IORING_REGISTER_RESTRICTIONS = 11,
    IORING_REGISTER_ENABLE_RINGS = 12, IORING_REGISTER_FILES2 = 13,
    IORING_REGISTER_FILES_UPDATE2 = 14, IORING_REGISTER_BUFFERS2 = 15,
    IORING_REGISTER_BUFFERS_UPDATE = 16, IORING_REGISTER_IOWQ_AFF = 17,
    IORING_UNREGISTER_IOWQ_AFF = 18, IORING_REGISTER_IOWQ_MAX_WORKERS = 19,
    IORING_REGISTER_RING_FDS = 20, IORING_UNREGISTER_RING_FDS = 21,
    IORING_REGISTER_PBUF_RING = 22, IORING_UNREGISTER_PBUF_RING = 23,
    IORING_REGISTER_SYNC_CANCEL = 24, IORING_REGISTER_FILE_ALLOC_RANGE = 25,
    IORING_REGISTER_PBUF_STATUS = 26, IORING_REGISTER_NAPI = 27,
    IORING_UNREGISTER_NAPI = 28, IORING_REGISTER_CLOCK = 29,
    IORING_REGISTER_CLONE_BUFFERS = 30, IORING_REGISTER_SEND_MSG_RING = 31,
    IORING_REGISTER_ZCRX_IFQ = 32, IORING_REGISTER_RESIZE_RINGS = 33,
    IORING_REGISTER_MEM_REGION = 34, IORING_REGISTER_QUERY = 35,
    IORING_REGISTER_ZCRX_CTRL = 36, IORING_REGISTER_BPF_FILTER = 37,
    IORING_REGISTER_LAST = 38
type
  IoWqType_570426104* {.size: sizeof(cuint).} = enum
    IO_WQ_BOUND = 0, IO_WQ_UNBOUND = 1
type
  IoUringRegisterPbufRingFlags_570426134* {.size: sizeof(cuint).} = enum
    IOU_PBUF_RING_MMAP = 1, IOU_PBUF_RING_INC = 2
type
  IoUringRegisterRestrictionOp_570426142* {.size: sizeof(cuint).} = enum
    IORING_RESTRICTION_REGISTER_OP = 0, IORING_RESTRICTION_SQE_OP = 1,
    IORING_RESTRICTION_SQE_FLAGS_ALLOWED = 2,
    IORING_RESTRICTION_SQE_FLAGS_REQUIRED = 3, IORING_RESTRICTION_LAST = 4
type
  IoUringSocketOp_570426156* {.size: sizeof(cuint).} = enum
    SOCKET_URING_OP_SIOCINQ = 0, SOCKET_URING_OP_SIOCOUTQ = 1,
    SOCKET_URING_OP_GETSOCKOPT = 2, SOCKET_URING_OP_SETSOCKOPT = 3,
    SOCKET_URING_OP_TX_TIMESTAMP = 4, SOCKET_URING_OP_GETSOCKNAME = 5
type
  IoUringZcrxAreaFlags_570426173* {.size: sizeof(cuint).} = enum
    IORING_ZCRX_AREA_DMABUF = 1
type
  ZcrxRegFlags_570426177* {.size: sizeof(cuint).} = enum
    ZCRX_REG_IMPORT = 1, ZCRX_REG_NODEV = 2
type
  ZcrxFeatures_570426179* {.size: sizeof(cuint).} = enum
    ZCRX_FEATURE_RX_PAGE_SIZE = 1
type
  ZcrxCtrlOp_570426183* {.size: sizeof(cuint).} = enum
    ZCRX_CTRL_FLUSH_RQ_enumval = 0, ZCRX_CTRL_EXPORT_enumval = 1,
    compiler_ZCRX_CTRL_LAST = 2
type
  Idtype_570426263* {.size: sizeof(cuint).} = enum
    P_ALL = 0, P_PID = 1, P_PGID = 2, P_PIDFD = 3
when not declared(EpollEvent):
  type
    EpollEvent* = object
else:
  static :
    hint("Declaration of " & "EpollEvent" & " already exists, not redeclaring")
when not declared(IORING_URING_CMD_FIXED):
  type
    IORING_URING_CMD_FIXED* = object
else:
  static :
    hint("Declaration of " & "IORING_URING_CMD_FIXED" &
        " already exists, not redeclaring")
when not declared(FutexWaitv):
  type
    FutexWaitv* = object
else:
  static :
    hint("Declaration of " & "FutexWaitv" & " already exists, not redeclaring")
type
  IoUringSqe_Ua_t_anon0_t {.pure, inheritable, bycopy.} = object
    cmd_op*: compiler_u32_570426083
    compiler_pad1*: compiler_u32_570426083
  IoUringSqe_Ua_t {.union, bycopy.} = object
    off*: compiler_u64_570426081
    addr2*: compiler_u64_570426081
    anon0*: IoUringSqe_Ua_t_anon0_t
  IoUringSqe_anon0_t {.union, bycopy.} = object
    rw_flags*: compiler_kernel_rwf_t_570426085
    fsync_flags*: compiler_u32_570426083
    poll_events*: compiler_u16_570426077
    poll32_events*: compiler_u32_570426083
    sync_range_flags*: compiler_u32_570426083
    msg_flags*: compiler_u32_570426083
    timeout_flags*: compiler_u32_570426083
    accept_flags*: compiler_u32_570426083
    cancel_flags*: compiler_u32_570426083
    open_flags*: compiler_u32_570426083
    statx_flags*: compiler_u32_570426083
    fadvise_advice*: compiler_u32_570426083
    splice_flags*: compiler_u32_570426083
    rename_flags*: compiler_u32_570426083
    unlink_flags*: compiler_u32_570426083
    hardlink_flags*: compiler_u32_570426083
    xattr_flags*: compiler_u32_570426083
    msg_ring_flags*: compiler_u32_570426083
    uring_cmd_flags*: compiler_u32_570426083
    waitid_flags*: compiler_u32_570426083
    futex_flags*: compiler_u32_570426083
    install_fd_flags*: compiler_u32_570426083
    nop_flags*: compiler_u32_570426083
    pipe_flags*: compiler_u32_570426083
  IoUringSqe_anon1_t {.union, bycopy, packed.} = object
    buf_index*: compiler_u16_570426077
    buf_group*: compiler_u16_570426077
  IoUringSqe_Ua_field_t_anon0_t {.pure, inheritable, bycopy.} = object
    addr_len*: compiler_u16_570426077
    compiler_pad3*: array[1'i64, compiler_u16_570426077]
  IoUringSqe_Ua_field_t {.union, bycopy.} = object
    splice_fd_in*: compiler_s32_570426079
    file_index*: compiler_u32_570426083
    zcrx_ifq_idx*: compiler_u32_570426083
    optlen*: compiler_u32_570426083
    anon0*: IoUringSqe_Ua_field_t_anon0_t
  IoUringSqe_570426072 {.pure, inheritable, bycopy.} = object
    opcode*: compiler_u8_570426075 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:30:8
    flags*: compiler_u8_570426075
    ioprio*: compiler_u16_570426077
    fd*: compiler_s32_570426079
    Ua*: IoUringSqe_Ua_t
    len*: compiler_u32_570426083
    anon0*: IoUringSqe_anon0_t
    user_data*: compiler_u64_570426081
    anon1*: IoUringSqe_anon1_t
    personality*: compiler_u16_570426077
    Ua_field*: IoUringSqe_Ua_field_t
  compiler_u8_570426074 = uint8 ## Generated based on /usr/include/asm-generic/int-ll64.h:21:23
  compiler_u16_570426076 = cushort ## Generated based on /usr/include/asm-generic/int-ll64.h:24:24
  compiler_s32_570426078 = cint ## Generated based on /usr/include/asm-generic/int-ll64.h:26:24
  compiler_u64_570426080 = culonglong ## Generated based on /usr/include/asm-generic/int-ll64.h:31:42
  compiler_u32_570426082 = cuint ## Generated based on /usr/include/asm-generic/int-ll64.h:27:22
  compiler_kernel_rwf_t_570426084 = cint ## Generated based on /usr/include/linux/fs.h:405:23
  IoUringAttrPi_570426086 {.pure, inheritable, bycopy.} = object
    flags*: compiler_u16_570426077 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:119:8
    app_tag*: compiler_u16_570426077
    len*: compiler_u32_570426083
    addr_field*: compiler_u64_570426081
    seed*: compiler_u64_570426081
    rsvd*: compiler_u64_570426081
  IoUringCqe_570426094 {.pure, inheritable, bycopy.} = object
    user_data*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:486:8
    res*: compiler_s32_570426079
    flags*: compiler_u32_570426083
    big_cqe*: ptr UncheckedArray[compiler_u64_570426081]
  IoSqringOffsets_570426096 {.pure, inheritable, bycopy.} = object
    head*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:547:8
    tail*: compiler_u32_570426083
    ring_mask*: compiler_u32_570426083
    ring_entries*: compiler_u32_570426083
    flags*: compiler_u32_570426083
    dropped*: compiler_u32_570426083
    array*: compiler_u32_570426083
    resv1*: compiler_u32_570426083
    user_addr*: compiler_u64_570426081
  IoCqringOffsets_570426098 {.pure, inheritable, bycopy.} = object
    head*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:566:8
    tail*: compiler_u32_570426083
    ring_mask*: compiler_u32_570426083
    ring_entries*: compiler_u32_570426083
    overflow*: compiler_u32_570426083
    cqes*: compiler_u32_570426083
    flags*: compiler_u32_570426083
    resv1*: compiler_u32_570426083
    user_addr*: compiler_u64_570426081
  IoUringParams_570426100 {.pure, inheritable, bycopy.} = object
    sq_entries*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:600:8
    cq_entries*: compiler_u32_570426083
    flags*: compiler_u32_570426083
    sq_thread_cpu*: compiler_u32_570426083
    sq_thread_idle*: compiler_u32_570426083
    features*: compiler_u32_570426083
    wq_fd*: compiler_u32_570426083
    resv*: array[3'i64, compiler_u32_570426083]
    sq_off*: IoSqringOffsets_570426097
    cq_off*: IoCqringOffsets_570426099
  IoUringFilesUpdate_570426106 {.pure, inheritable, bycopy.} = object
    offset*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:726:8
    resv*: compiler_u32_570426083
    fds*: compiler_u64_570426081
  IoUringRegionDesc_570426108 {.pure, inheritable, bycopy.} = object
    user_addr*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:737:8
    size*: compiler_u64_570426081
    flags*: compiler_u32_570426083
    id*: compiler_u32_570426083
    mmap_offset*: compiler_u64_570426081
    compiler_resv*: array[4'i64, compiler_u64_570426081]
  IoUringMemRegionReg_570426110 {.pure, inheritable, bycopy.} = object
    region_uptr*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:751:8
    flags*: compiler_u64_570426081
    compiler_resv*: array[2'i64, compiler_u64_570426081]
  IoUringRsrcRegister_570426112 {.pure, inheritable, bycopy.} = object
    nr*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:763:8
    flags*: compiler_u32_570426083
    resv2*: compiler_u64_570426081
    data*: compiler_u64_570426081
    tags*: compiler_u64_570426081
  IoUringRsrcUpdate_570426114 {.pure, inheritable, bycopy.} = object
    offset*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:771:8
    resv*: compiler_u32_570426083
    data*: compiler_u64_570426081
  IoUringRsrcUpdate2_570426116 {.pure, inheritable, bycopy.} = object
    offset*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:777:8
    resv*: compiler_u32_570426083
    data*: compiler_u64_570426081
    tags*: compiler_u64_570426081
    nr*: compiler_u32_570426083
    resv2*: compiler_u32_570426083
  IoUringProbeOp_570426118 {.pure, inheritable, bycopy.} = object
    op*: compiler_u8_570426075 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:791:8
    resv*: compiler_u8_570426075
    flags*: compiler_u16_570426077
    resv2*: compiler_u32_570426083
  IoUringProbe_570426120 {.pure, inheritable, bycopy.} = object
    last_op*: compiler_u8_570426075 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:798:8
    ops_len*: compiler_u8_570426075
    resv*: compiler_u16_570426077
    resv2*: array[3'i64, compiler_u32_570426083]
    ops*: ptr UncheckedArray[IoUringProbeOp_570426119]
  IoUringRestriction_anon0_t {.union, bycopy.} = object
    register_op*: compiler_u8_570426075
    sqe_op*: compiler_u8_570426075
    sqe_flags*: compiler_u8_570426075
  IoUringRestriction_570426122 {.pure, inheritable, bycopy.} = object
    opcode*: compiler_u16_570426077 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:806:8
    anon0*: IoUringRestriction_anon0_t
    resv*: compiler_u8_570426075
    resv2*: array[3'i64, compiler_u32_570426083]
  IoUringTaskRestriction_570426124 {.pure, inheritable, bycopy.} = object
    flags*: compiler_u16_570426077 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:817:8
    nr_res*: compiler_u16_570426077
    resv*: array[3'i64, compiler_u32_570426083]
    restrictions*: array[0'i64, IoUringRestriction_570426123]
  IoUringClockRegister_570426126 {.pure, inheritable, bycopy.} = object
    clockid*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:824:8
    compiler_resv*: array[3'i64, compiler_u32_570426083]
  IoUringCloneBuffers_570426128 {.pure, inheritable, bycopy.} = object
    src_fd*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:834:8
    flags*: compiler_u32_570426083
    src_off*: compiler_u32_570426083
    dst_off*: compiler_u32_570426083
    nr*: compiler_u32_570426083
    pad*: array[3'i64, compiler_u32_570426083]
  IoUringBuf_570426130 {.pure, inheritable, bycopy.} = object
    addr_field*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:843:8
    len*: compiler_u32_570426083
    bid*: compiler_u16_570426077
    resv*: compiler_u16_570426077
  IoUringBufRing_anon0_t_anon0_t {.pure, inheritable, bycopy.} = object
    resv1*: compiler_u64_570426081
    resv2*: compiler_u32_570426083
    resv3*: compiler_u16_570426077
    tail*: compiler_u16_570426077
  IoUringBufRing_anon0_t {.union, bycopy.} = object
    anon0*: IoUringBufRing_anon0_t_anon0_t
    bufs*: array[0'i64, IoUringBuf_570426131]
  IoUringBufRing_570426132 {.pure, inheritable, bycopy.} = object
    anon0*: IoUringBufRing_anon0_t ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:850:8
  IoUringBufReg_570426136 {.pure, inheritable, bycopy.} = object
    ring_addr*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:889:8
    ring_entries*: compiler_u32_570426083
    bgid*: compiler_u16_570426077
    flags*: compiler_u16_570426077
    min_left*: compiler_u32_570426083
    resv*: array[5'i64, compiler_u32_570426083]
  IoUringBufStatus_570426138 {.pure, inheritable, bycopy.} = object
    buf_group*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:899:8
    head*: compiler_u32_570426083
    resv*: array[8'i64, compiler_u32_570426083]
  IoUringNapi_570426140 {.pure, inheritable, bycopy.} = object
    busy_poll_to*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:906:8
    prefer_busy_poll*: compiler_u8_570426075
    pad*: array[3'i64, compiler_u8_570426075]
    resv*: compiler_u64_570426081
  IoUringRegWait_570426144 {.pure, inheritable, bycopy.} = object
    ts*: KernelTimespec_570426147 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:942:8
    min_wait_usec*: compiler_u32_570426083
    flags*: compiler_u32_570426083
    sigmask*: compiler_u64_570426081
    sigmask_sz*: compiler_u32_570426083
    pad*: array[3'i64, compiler_u32_570426083]
    pad2*: array[2'i64, compiler_u64_570426081]
  KernelTimespec_570426146 {.pure, inheritable, bycopy.} = object
    tv_sec*: compiler_kernel_time64_t_570426248 ## Generated based on /usr/include/linux/time_types.h:7:8
    tv_nsec*: clonglong
  IoUringGeteventsArg_570426148 {.pure, inheritable, bycopy.} = object
    sigmask*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:955:8
    sigmask_sz*: compiler_u32_570426083
    min_wait_usec*: compiler_u32_570426083
    ts*: compiler_u64_570426081
  IoUringSyncCancelReg_570426150 {.pure, inheritable, bycopy.} = object
    addr_field*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:965:8
    fd*: compiler_s32_570426079
    flags*: compiler_u32_570426083
    timeout*: KernelTimespec_570426147
    opcode*: compiler_u8_570426075
    pad*: array[7'i64, compiler_u8_570426075]
    pad2*: array[3'i64, compiler_u64_570426081]
  IoUringFileIndexRange_570426152 {.pure, inheritable, bycopy.} = object
    off*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:979:8
    len*: compiler_u32_570426083
    resv*: compiler_u64_570426081
  IoUringRecvmsgOut_570426154 {.pure, inheritable, bycopy.} = object
    namelen*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:985:8
    controllen*: compiler_u32_570426083
    payloadlen*: compiler_u32_570426083
    flags*: compiler_u32_570426083
  IoTimespec_570426158 {.pure, inheritable, bycopy.} = object
    tv_sec*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1014:8
    tv_nsec*: compiler_u64_570426081
  IoUringZcrxRqe_570426167 {.pure, inheritable, bycopy.} = object
    off*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1020:8
    len*: compiler_u32_570426083
    compiler_pad*: compiler_u32_570426083
  IoUringZcrxCqe_570426169 {.pure, inheritable, bycopy.} = object
    off*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1026:8
    compiler_pad*: compiler_u64_570426081
  IoUringZcrxOffsets_570426171 {.pure, inheritable, bycopy.} = object
    head*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1035:8
    tail*: compiler_u32_570426083
    rqes*: compiler_u32_570426083
    compiler_resv2*: compiler_u32_570426083
    compiler_resv*: array[2'i64, compiler_u64_570426081]
  IoUringZcrxAreaReg_570426175 {.pure, inheritable, bycopy.} = object
    addr_field*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1047:8
    len*: compiler_u64_570426081
    rq_area_token*: compiler_u64_570426081
    flags*: compiler_u32_570426083
    dmabuf_fd*: compiler_u32_570426083
    compiler_resv2*: array[2'i64, compiler_u64_570426081]
  IoUringZcrxIfqReg_570426181 {.pure, inheritable, bycopy.} = object
    if_idx*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1077:8
    if_rxq*: compiler_u32_570426083
    rq_entries*: compiler_u32_570426083
    flags*: compiler_u32_570426083
    area_ptr*: compiler_u64_570426081
    region_ptr*: compiler_u64_570426081
    offsets*: IoUringZcrxOffsets_570426172
    zcrx_id*: compiler_u32_570426083
    rx_buf_len*: compiler_u32_570426083
    compiler_resv*: array[3'i64, compiler_u64_570426081]
  ZcrxCtrlFlushRq_570426185 {.pure, inheritable, bycopy.} = object
    compiler_resv*: array[6'i64, compiler_u64_570426081] ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1099:8
  ZcrxCtrlExport_570426187 {.pure, inheritable, bycopy.} = object
    zcrx_fd*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1103:8
    compiler_resv1*: array[11'i64, compiler_u32_570426083]
  ZcrxCtrl_anon0_t {.union, bycopy.} = object
    zc_export*: ZcrxCtrlExport_570426188
    zc_flush*: ZcrxCtrlFlushRq_570426186
  ZcrxCtrl_570426189 {.pure, inheritable, bycopy.} = object
    zcrx_id*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1108:8
    op*: compiler_u32_570426083
    compiler_resv*: array[2'i64, compiler_u64_570426081]
    anon0*: ZcrxCtrl_anon0_t
  IoUringQueryHdr_570426191 {.pure, inheritable, bycopy.} = object
    next_entry*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring/query.h:10:8
    query_data*: compiler_u64_570426081
    query_op*: compiler_u32_570426083
    size*: compiler_u32_570426083
    result*: compiler_s32_570426079
    compiler_resv*: array[3'i64, compiler_u32_570426083]
  IoUringQueryOpcode_570426193 {.pure, inheritable, bycopy.} = object
    nr_request_opcodes*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring/query.h:28:8
    nr_register_opcodes*: compiler_u32_570426083
    feature_flags*: compiler_u64_570426081
    ring_setup_flags*: compiler_u64_570426081
    enter_flags*: compiler_u64_570426081
    sqe_flags*: compiler_u64_570426081
    nr_query_opcodes*: compiler_u32_570426083
    compiler_pad*: compiler_u32_570426083
  IoUringQueryZcrx_struct_570426195 {.pure, inheritable, bycopy.} = object
    register_flags*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring/query.h:46:8
    area_flags*: compiler_u64_570426081
    nr_ctrl_opcodes*: compiler_u32_570426083
    features*: compiler_u32_570426083
    rq_hdr_size*: compiler_u32_570426083
    rq_hdr_alignment*: compiler_u32_570426083
    compiler_resv2*: compiler_u64_570426081
  IoUringQueryScq_struct_570426197 {.pure, inheritable, bycopy.} = object
    hdr_size*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring/query.h:62:8
    hdr_alignment*: compiler_u64_570426081
  IoUringBpfCtx_anon0_t_socket_t {.pure, inheritable, bycopy.} = object
    family*: compiler_u32_570426083
    type_field*: compiler_u32_570426083
    protocol*: compiler_u32_570426083
  IoUringBpfCtx_anon0_t_open_t {.pure, inheritable, bycopy.} = object
    flags*: compiler_u64_570426081
    mode*: compiler_u64_570426081
    resolve*: compiler_u64_570426081
  IoUringBpfCtx_anon0_t {.union, bycopy.} = object
    socket*: IoUringBpfCtx_anon0_t_socket_t
    open*: IoUringBpfCtx_anon0_t_open_t
  IoUringBpfCtx_570426199 {.pure, inheritable, bycopy.} = object
    user_data*: compiler_u64_570426081 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring/bpf_filter.h:13:8
    opcode*: compiler_u8_570426075
    sqe_flags*: compiler_u8_570426075
    pdu_size*: compiler_u8_570426075
    pad*: array[5'i64, compiler_u8_570426075]
    anon0*: IoUringBpfCtx_anon0_t
  IoUringBpfFilter_570426201 {.pure, inheritable, bycopy.} = object
    opcode*: compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring/bpf_filter.h:45:8
    flags*: compiler_u32_570426083
    filter_len*: compiler_u32_570426083
    pdu_size*: compiler_u8_570426075
    resv*: array[3'i64, compiler_u8_570426075]
    filter_ptr*: compiler_u64_570426081
    resv2*: array[5'i64, compiler_u64_570426081]
  IoUringBpf_anon0_t {.union, bycopy.} = object
    filter*: IoUringBpfFilter_570426202
  IoUringBpf_570426203 {.pure, inheritable, bycopy.} = object
    cmd_type*: compiler_u16_570426077 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring/bpf_filter.h:59:8
    cmd_flags*: compiler_u16_570426077
    resv*: compiler_u32_570426083
    anon0*: IoUringBpf_anon0_t
  IoUringSq_570426205 {.pure, inheritable, bycopy.} = object
    khead*: ptr cuint        ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:122:8
    ktail*: ptr cuint
    kring_mask*: ptr cuint
    kring_entries*: ptr cuint
    kflags*: ptr cuint
    kdropped*: ptr cuint
    array*: ptr cuint
    sqes*: ptr IoUringSqe_570426073
    sqe_head*: cuint
    sqe_tail*: cuint
    ring_sz*: csize_t
    ring_ptr*: pointer
    ring_mask*: cuint
    ring_entries*: cuint
    sqes_sz*: cuint
    pad*: cuint
  IoUringCq_570426207 {.pure, inheritable, bycopy.} = object
    khead*: ptr cuint        ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:147:8
    ktail*: ptr cuint
    kring_mask*: ptr cuint
    kring_entries*: ptr cuint
    kflags*: ptr cuint
    koverflow*: ptr cuint
    cqes*: ptr IoUringCqe_570426095
    ring_sz*: csize_t
    ring_ptr*: pointer
    ring_mask*: cuint
    ring_entries*: cuint
    pad*: array[2'i64, cuint]
  IoUring_570426209 {.pure, inheritable, bycopy.} = object
    sq*: IoUringSq_570426206 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:167:8
    cq*: IoUringCq_570426208
    flags*: cuint
    ring_fd*: cint
    features*: cuint
    enter_ring_fd*: cint
    int_flags*: compiler_u8_570426075
    pad*: array[3'i64, compiler_u8_570426075]
    pad2*: cuint
  IoUringZcrxRq_570426211 {.pure, inheritable, bycopy.} = object
    khead*: ptr compiler_u32_570426083 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:180:8
    ktail*: ptr compiler_u32_570426083
    rq_tail*: compiler_u32_570426083
    ring_entries*: cuint
    rqes*: ptr IoUringZcrxRqe_570426168
    ring_ptr*: pointer
  sigset_t_570426213 = compiler_sigset_t_570426250 ## Generated based on /usr/include/bits/types/sigset_t.h:7:20
  Iovec_570426215 {.pure, inheritable, bycopy.} = object
    iov_base*: pointer       ## Generated based on /usr/include/bits/types/struct_iovec.h:26:8
    iov_len*: csize_t
  cpu_set_t_570426217 = CpuSet_570426252 ## Generated based on /usr/include/bits/cpu-set.h:42:3
  IoUringCqeIter_570426219 {.pure, inheritable, bycopy.} = object
    cqes*: ptr IoUringCqe_570426095 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:444:8
    mask*: cuint
    shift*: cuint
    head*: cuint
    tail*: cuint
  Msghdr_570426221 {.pure, inheritable, bycopy.} = object
    msg_name*: pointer       ## Generated based on /usr/include/bits/socket.h:265:8
    msg_namelen*: socklen_t_570426226
    msg_iov*: ptr Iovec_570426216
    msg_iovlen*: csize_t
    msg_control*: pointer
    msg_controllen*: csize_t
    msg_flags*: cint
  Sockaddr_570426223 {.pure, inheritable, bycopy.} = object
    sa_family*: sa_family_t_570426254 ## Generated based on /usr/include/bits/socket.h:184:39
    sa_data*: array[14'i64, cschar]
  socklen_t_570426225 = compiler_socklen_t_570426256 ## Generated based on /usr/include/bits/socket.h:33:21
  mode_t_570426227 = compiler_mode_t_570426258 ## Generated based on /usr/include/sys/types.h:69:18
  Statx_stx_btime_t {.pure, inheritable, bycopy.} = object
    anon0*: StatxTimestamp_570426260
  Statx_stx_mtime_t {.pure, inheritable, bycopy.} = object
    anon0*: StatxTimestamp_570426260
  Statx_570426229 {.pure, inheritable, bycopy.} = object
    stx_mask*: compiler_u32_570426083 ## Generated based on /usr/include/linux/stat.h:99:8
    stx_blksize*: compiler_u32_570426083
    stx_attributes*: compiler_u64_570426081
    stx_nlink*: compiler_u32_570426083
    stx_uid*: compiler_u32_570426083
    stx_gid*: compiler_u32_570426083
    stx_mode*: compiler_u16_570426077
    compiler_spare0*: array[1'i64, compiler_u16_570426077]
    stx_ino*: compiler_u64_570426081
    stx_size*: compiler_u64_570426081
    stx_blocks*: compiler_u64_570426081
    stx_attributes_mask*: compiler_u64_570426081
    stx_btime*: Statx_stx_btime_t
    stx_mtime*: Statx_stx_mtime_t
    stx_rdev_major*: compiler_u32_570426083
    stx_rdev_minor*: compiler_u32_570426083
    stx_dev_major*: compiler_u32_570426083
    stx_dev_minor*: compiler_u32_570426083
    stx_mnt_id*: compiler_u64_570426081
    stx_dio_mem_align*: compiler_u32_570426083
    stx_dio_offset_align*: compiler_u32_570426083
    stx_subvol*: compiler_u64_570426081
    stx_atomic_write_unit_min*: compiler_u32_570426083
    stx_atomic_write_unit_max*: compiler_u32_570426083
    stx_atomic_write_segments_max*: compiler_u32_570426083
    stx_dio_read_offset_align*: compiler_u32_570426083
    stx_atomic_write_unit_max_opt*: compiler_u32_570426083
    compiler_spare2*: array[1'i64, compiler_u32_570426083]
    compiler_spare3*: array[8'i64, compiler_u64_570426081]
  off_t_570426231 = compiler_off_t_570426262 ## Generated based on /usr/include/sys/types.h:85:17
  Cmsghdr_570426233 {.pure, inheritable, bycopy.} = object
    cmsg_len*: csize_t       ## Generated based on /usr/include/bits/socket.h:283:8
    cmsg_level*: cint
    cmsg_type*: cint
    compiler_cmsg_data*: ptr UncheckedArray[uint8]
  OpenHow_570426235 {.pure, inheritable, bycopy.} = object
    flags*: compiler_u64_570426081 ## Generated based on /usr/include/linux/openat2.h:19:8
    mode*: compiler_u64_570426081
    resolve*: compiler_u64_570426081
  idtype_t_570426237 = Idtype_570426264 ## Generated based on /usr/include/bits/types/idtype_t.h:12:3
  id_t_570426239 = compiler_id_t_570426266 ## Generated based on /usr/include/sys/types.h:103:16
  siginfo_t_570426241 = Siginfo_570426268 ## Generated based on /usr/include/bits/types/siginfo_t.h:124:5
  loff_t_570426243 = compiler_loff_t_570426270 ## Generated based on /usr/include/sys/types.h:42:18
  ssize_t_570426245 = compiler_ssize_t_570426272 ## Generated based on /usr/include/sys/types.h:108:19
  compiler_kernel_time64_t_570426247 = clonglong ## Generated based on /usr/include/asm-generic/posix_types.h:92:19
  compiler_sigset_t_570426249 = Sigset_570426274 ## Generated based on /usr/include/bits/types/__sigset_t.h:8:3
  CpuSet_570426251 {.pure, inheritable, bycopy.} = object
    compiler_bits*: array[16'i64, compiler_cpu_mask_570426276] ## Generated based on /usr/include/bits/cpu-set.h:39:9
  sa_family_t_570426253 = cushort ## Generated based on /usr/include/bits/sockaddr.h:28:28
  compiler_socklen_t_570426255 = cuint ## Generated based on /usr/include/bits/types.h:210:23
  compiler_mode_t_570426257 = cuint ## Generated based on /usr/include/bits/types.h:150:26
  StatxTimestamp_570426259 {.pure, inheritable, bycopy.} = object
    tv_sec*: compiler_s64_570426278 ## Generated based on /usr/include/linux/stat.h:56:8
    tv_nsec*: compiler_u32_570426083
    compiler_reserved*: compiler_s32_570426079
  compiler_off_t_570426261 = clong ## Generated based on /usr/include/bits/types.h:152:25
  compiler_id_t_570426265 = cuint ## Generated based on /usr/include/bits/types.h:159:24
  Siginfo_internal_sifields_t_internal_kill_t {.pure, inheritable, bycopy.} = object
    si_pid*: compiler_pid_t_570426280
    si_uid*: compiler_uid_t_570426282
  Siginfo_internal_sifields_t_internal_timer_t {.pure, inheritable, bycopy.} = object
    si_tid*: cint
    si_overrun*: cint
    si_sigval*: compiler_sigval_t_570426284
  Siginfo_internal_sifields_t_internal_rt_t {.pure, inheritable, bycopy.} = object
    si_pid*: compiler_pid_t_570426280
    si_uid*: compiler_uid_t_570426282
    si_sigval*: compiler_sigval_t_570426284
  Siginfo_internal_sifields_t_internal_sigchld_t {.pure, inheritable, bycopy.} = object
    si_pid*: compiler_pid_t_570426280
    si_uid*: compiler_uid_t_570426282
    si_status*: cint
    si_utime*: compiler_clock_t_570426286
    si_stime*: compiler_clock_t_570426286
  Siginfo_internal_sifields_t_internal_sigfault_t_internal_bounds_t_internal_addr_bnd_t {.
      pure, inheritable, bycopy.} = object
    internal_lower*: pointer
    internal_upper*: pointer
  Siginfo_internal_sifields_t_internal_sigfault_t_internal_bounds_t {.union,
      bycopy.} = object
    internal_addr_bnd*: Siginfo_internal_sifields_t_internal_sigfault_t_internal_bounds_t_internal_addr_bnd_t
    internal_pkey*: compiler_uint32_t_570426288
  Siginfo_internal_sifields_t_internal_sigfault_t {.pure, inheritable, bycopy.} = object
    si_addr*: pointer
    si_addr_lsb*: cshort
    internal_bounds*: Siginfo_internal_sifields_t_internal_sigfault_t_internal_bounds_t
  Siginfo_internal_sifields_t_internal_sigpoll_t {.pure, inheritable, bycopy.} = object
    si_band*: clong
    si_fd*: cint
  Siginfo_internal_sifields_t_internal_sigsys_t {.pure, inheritable, bycopy.} = object
    internal_call_addr*: pointer
    internal_syscall*: cint
    internal_arch*: cuint
  Siginfo_internal_sifields_t {.union, bycopy.} = object
    internal_pad*: array[28'i64, cint]
    internal_kill*: Siginfo_internal_sifields_t_internal_kill_t
    internal_timer*: Siginfo_internal_sifields_t_internal_timer_t
    internal_rt*: Siginfo_internal_sifields_t_internal_rt_t
    internal_sigchld*: Siginfo_internal_sifields_t_internal_sigchld_t
    internal_sigfault*: Siginfo_internal_sifields_t_internal_sigfault_t
    internal_sigpoll*: Siginfo_internal_sifields_t_internal_sigpoll_t
    internal_sigsys*: Siginfo_internal_sifields_t_internal_sigsys_t
  Siginfo_570426267 {.pure, inheritable, bycopy.} = object
    si_signo*: cint          ## Generated based on /usr/include/bits/types/siginfo_t.h:36:9
    si_errno*: cint
    si_code*: cint
    compiler_pad0*: cint
    internal_sifields*: Siginfo_internal_sifields_t
  compiler_loff_t_570426269 = compiler_off64_t_570426290 ## Generated based on /usr/include/bits/types.h:203:19
  compiler_ssize_t_570426271 = clong ## Generated based on /usr/include/bits/types.h:194:27
  Sigset_570426273 {.pure, inheritable, bycopy.} = object
    compiler_val*: array[16'i64, culong] ## Generated based on /usr/include/bits/types/__sigset_t.h:5:9
  compiler_cpu_mask_570426275 = culong ## Generated based on /usr/include/bits/cpu-set.h:32:25
  compiler_s64_570426277 = clonglong ## Generated based on /usr/include/asm-generic/int-ll64.h:30:44
  compiler_pid_t_570426279 = cint ## Generated based on /usr/include/bits/types.h:154:25
  compiler_uid_t_570426281 = cuint ## Generated based on /usr/include/bits/types.h:146:25
  compiler_sigval_t_570426283 = Sigval_570426292 ## Generated based on /usr/include/bits/types/__sigval_t.h:30:22
  compiler_clock_t_570426285 = clong ## Generated based on /usr/include/bits/types.h:156:27
  compiler_uint32_t_570426287 = cuint ## Generated based on /usr/include/bits/types.h:42:22
  compiler_off64_t_570426289 = clong ## Generated based on /usr/include/bits/types.h:153:27
  Sigval_570426291 {.union, bycopy.} = object
    sival_int*: cint         ## Generated based on /usr/include/bits/types/__sigval_t.h:24:7
    sival_ptr*: pointer
  IoUringRegisterRestrictionOp_570426143 = (when declared(
      IoUringRegisterRestrictionOp):
    when ownSizeof(IoUringRegisterRestrictionOp) !=
        ownSizeof(IoUringRegisterRestrictionOp_570426142):
      static :
        warning("Declaration of " & "IoUringRegisterRestrictionOp" &
            " exists but with different size")
    IoUringRegisterRestrictionOp
  else:
    IoUringRegisterRestrictionOp_570426142)
  compiler_u32_570426083 = (when declared(compiler_u32):
    when ownSizeof(compiler_u32) != ownSizeof(compiler_u32_570426082):
      static :
        warning("Declaration of " & "compiler_u32" &
            " exists but with different size")
    compiler_u32
  else:
    compiler_u32_570426082)
  IoUringSqeFlagsBit_570426089 = (when declared(IoUringSqeFlagsBit):
    when ownSizeof(IoUringSqeFlagsBit) != ownSizeof(IoUringSqeFlagsBit_570426088):
      static :
        warning("Declaration of " & "IoUringSqeFlagsBit" &
            " exists but with different size")
    IoUringSqeFlagsBit
  else:
    IoUringSqeFlagsBit_570426088)
  IoUringRegisterOp_570426103 = (when declared(IoUringRegisterOp):
    when ownSizeof(IoUringRegisterOp) != ownSizeof(IoUringRegisterOp_570426102):
      static :
        warning("Declaration of " & "IoUringRegisterOp" &
            " exists but with different size")
    IoUringRegisterOp
  else:
    IoUringRegisterOp_570426102)
  IoUringQueryScq_struct_570426198 = (when declared(IoUringQueryScq_struct):
    when ownSizeof(IoUringQueryScq_struct) != ownSizeof(IoUringQueryScq_struct_570426197):
      static :
        warning("Declaration of " & "IoUringQueryScq_struct" &
            " exists but with different size")
    IoUringQueryScq_struct
  else:
    IoUringQueryScq_struct_570426197)
  IoUring_570426210 = (when declared(IoUring):
    when ownSizeof(IoUring) != ownSizeof(IoUring_570426209):
      static :
        warning("Declaration of " & "IoUring" &
            " exists but with different size")
    IoUring
  else:
    IoUring_570426209)
  IoUringParams_570426101 = (when declared(IoUringParams):
    when ownSizeof(IoUringParams) != ownSizeof(IoUringParams_570426100):
      static :
        warning("Declaration of " & "IoUringParams" &
            " exists but with different size")
    IoUringParams
  else:
    IoUringParams_570426100)
  IoUringRsrcUpdate_570426115 = (when declared(IoUringRsrcUpdate):
    when ownSizeof(IoUringRsrcUpdate) != ownSizeof(IoUringRsrcUpdate_570426114):
      static :
        warning("Declaration of " & "IoUringRsrcUpdate" &
            " exists but with different size")
    IoUringRsrcUpdate
  else:
    IoUringRsrcUpdate_570426114)
  compiler_id_t_570426266 = (when declared(compiler_id_t):
    when ownSizeof(compiler_id_t) != ownSizeof(compiler_id_t_570426265):
      static :
        warning("Declaration of " & "compiler_id_t" &
            " exists but with different size")
    compiler_id_t
  else:
    compiler_id_t_570426265)
  compiler_cpu_mask_570426276 = (when declared(compiler_cpu_mask):
    when ownSizeof(compiler_cpu_mask) != ownSizeof(compiler_cpu_mask_570426275):
      static :
        warning("Declaration of " & "compiler_cpu_mask" &
            " exists but with different size")
    compiler_cpu_mask
  else:
    compiler_cpu_mask_570426275)
  mode_t_570426228 = (when declared(mode_t):
    when ownSizeof(mode_t) != ownSizeof(mode_t_570426227):
      static :
        warning("Declaration of " & "mode_t" & " exists but with different size")
    mode_t
  else:
    mode_t_570426227)
  idtype_t_570426238 = (when declared(idtype_t):
    when ownSizeof(idtype_t) != ownSizeof(idtype_t_570426237):
      static :
        warning("Declaration of " & "idtype_t" &
            " exists but with different size")
    idtype_t
  else:
    idtype_t_570426237)
  IoUringRecvmsgOut_570426155 = (when declared(IoUringRecvmsgOut):
    when ownSizeof(IoUringRecvmsgOut) != ownSizeof(IoUringRecvmsgOut_570426154):
      static :
        warning("Declaration of " & "IoUringRecvmsgOut" &
            " exists but with different size")
    IoUringRecvmsgOut
  else:
    IoUringRecvmsgOut_570426154)
  compiler_u8_570426075 = (when declared(compiler_u8):
    when ownSizeof(compiler_u8) != ownSizeof(compiler_u8_570426074):
      static :
        warning("Declaration of " & "compiler_u8" &
            " exists but with different size")
    compiler_u8
  else:
    compiler_u8_570426074)
  IoUringBufRing_570426133 = (when declared(IoUringBufRing):
    when ownSizeof(IoUringBufRing) != ownSizeof(IoUringBufRing_570426132):
      static :
        warning("Declaration of " & "IoUringBufRing" &
            " exists but with different size")
    IoUringBufRing
  else:
    IoUringBufRing_570426132)
  Statx_570426230 = (when declared(Statx):
    when ownSizeof(Statx) != ownSizeof(Statx_570426229):
      static :
        warning("Declaration of " & "Statx" & " exists but with different size")
    Statx
  else:
    Statx_570426229)
  IoUringZcrxRq_570426212 = (when declared(IoUringZcrxRq):
    when ownSizeof(IoUringZcrxRq) != ownSizeof(IoUringZcrxRq_570426211):
      static :
        warning("Declaration of " & "IoUringZcrxRq" &
            " exists but with different size")
    IoUringZcrxRq
  else:
    IoUringZcrxRq_570426211)
  Sigset_570426274 = (when declared(Sigset):
    when ownSizeof(Sigset) != ownSizeof(Sigset_570426273):
      static :
        warning("Declaration of " & "Sigset" & " exists but with different size")
    Sigset
  else:
    Sigset_570426273)
  IoUringTaskRestriction_570426125 = (when declared(IoUringTaskRestriction):
    when ownSizeof(IoUringTaskRestriction) != ownSizeof(IoUringTaskRestriction_570426124):
      static :
        warning("Declaration of " & "IoUringTaskRestriction" &
            " exists but with different size")
    IoUringTaskRestriction
  else:
    IoUringTaskRestriction_570426124)
  IoUringBuf_570426131 = (when declared(IoUringBuf):
    when ownSizeof(IoUringBuf) != ownSizeof(IoUringBuf_570426130):
      static :
        warning("Declaration of " & "IoUringBuf" &
            " exists but with different size")
    IoUringBuf
  else:
    IoUringBuf_570426130)
  IoUringRegisterPbufRingFlags_570426135 = (when declared(
      IoUringRegisterPbufRingFlags):
    when ownSizeof(IoUringRegisterPbufRingFlags) !=
        ownSizeof(IoUringRegisterPbufRingFlags_570426134):
      static :
        warning("Declaration of " & "IoUringRegisterPbufRingFlags" &
            " exists but with different size")
    IoUringRegisterPbufRingFlags
  else:
    IoUringRegisterPbufRingFlags_570426134)
  IoUringZcrxAreaReg_570426176 = (when declared(IoUringZcrxAreaReg):
    when ownSizeof(IoUringZcrxAreaReg) != ownSizeof(IoUringZcrxAreaReg_570426175):
      static :
        warning("Declaration of " & "IoUringZcrxAreaReg" &
            " exists but with different size")
    IoUringZcrxAreaReg
  else:
    IoUringZcrxAreaReg_570426175)
  IoUringBufReg_570426137 = (when declared(IoUringBufReg):
    when ownSizeof(IoUringBufReg) != ownSizeof(IoUringBufReg_570426136):
      static :
        warning("Declaration of " & "IoUringBufReg" &
            " exists but with different size")
    IoUringBufReg
  else:
    IoUringBufReg_570426136)
  StatxTimestamp_570426260 = (when declared(StatxTimestamp):
    when ownSizeof(StatxTimestamp) != ownSizeof(StatxTimestamp_570426259):
      static :
        warning("Declaration of " & "StatxTimestamp" &
            " exists but with different size")
    StatxTimestamp
  else:
    StatxTimestamp_570426259)
  compiler_off64_t_570426290 = (when declared(compiler_off64_t):
    when ownSizeof(compiler_off64_t) != ownSizeof(compiler_off64_t_570426289):
      static :
        warning("Declaration of " & "compiler_off64_t" &
            " exists but with different size")
    compiler_off64_t
  else:
    compiler_off64_t_570426289)
  IoUringProbeOp_570426119 = (when declared(IoUringProbeOp):
    when ownSizeof(IoUringProbeOp) != ownSizeof(IoUringProbeOp_570426118):
      static :
        warning("Declaration of " & "IoUringProbeOp" &
            " exists but with different size")
    IoUringProbeOp
  else:
    IoUringProbeOp_570426118)
  IoUringZcrxAreaFlags_570426174 = (when declared(IoUringZcrxAreaFlags):
    when ownSizeof(IoUringZcrxAreaFlags) != ownSizeof(IoUringZcrxAreaFlags_570426173):
      static :
        warning("Declaration of " & "IoUringZcrxAreaFlags" &
            " exists but with different size")
    IoUringZcrxAreaFlags
  else:
    IoUringZcrxAreaFlags_570426173)
  compiler_mode_t_570426258 = (when declared(compiler_mode_t):
    when ownSizeof(compiler_mode_t) != ownSizeof(compiler_mode_t_570426257):
      static :
        warning("Declaration of " & "compiler_mode_t" &
            " exists but with different size")
    compiler_mode_t
  else:
    compiler_mode_t_570426257)
  compiler_uid_t_570426282 = (when declared(compiler_uid_t):
    when ownSizeof(compiler_uid_t) != ownSizeof(compiler_uid_t_570426281):
      static :
        warning("Declaration of " & "compiler_uid_t" &
            " exists but with different size")
    compiler_uid_t
  else:
    compiler_uid_t_570426281)
  Sigval_570426292 = (when declared(Sigval):
    when ownSizeof(Sigval) != ownSizeof(Sigval_570426291):
      static :
        warning("Declaration of " & "Sigval" & " exists but with different size")
    Sigval
  else:
    Sigval_570426291)
  ZcrxCtrlFlushRq_570426186 = (when declared(ZcrxCtrlFlushRq):
    when ownSizeof(ZcrxCtrlFlushRq) != ownSizeof(ZcrxCtrlFlushRq_570426185):
      static :
        warning("Declaration of " & "ZcrxCtrlFlushRq" &
            " exists but with different size")
    ZcrxCtrlFlushRq
  else:
    ZcrxCtrlFlushRq_570426185)
  IoUringAttrPi_570426087 = (when declared(IoUringAttrPi):
    when ownSizeof(IoUringAttrPi) != ownSizeof(IoUringAttrPi_570426086):
      static :
        warning("Declaration of " & "IoUringAttrPi" &
            " exists but with different size")
    IoUringAttrPi
  else:
    IoUringAttrPi_570426086)
  IoUringZcrxRqe_570426168 = (when declared(IoUringZcrxRqe):
    when ownSizeof(IoUringZcrxRqe) != ownSizeof(IoUringZcrxRqe_570426167):
      static :
        warning("Declaration of " & "IoUringZcrxRqe" &
            " exists but with different size")
    IoUringZcrxRqe
  else:
    IoUringZcrxRqe_570426167)
  IoWqType_570426105 = (when declared(IoWqType):
    when ownSizeof(IoWqType) != ownSizeof(IoWqType_570426104):
      static :
        warning("Declaration of " & "IoWqType" &
            " exists but with different size")
    IoWqType
  else:
    IoWqType_570426104)
  compiler_clock_t_570426286 = (when declared(compiler_clock_t):
    when ownSizeof(compiler_clock_t) != ownSizeof(compiler_clock_t_570426285):
      static :
        warning("Declaration of " & "compiler_clock_t" &
            " exists but with different size")
    compiler_clock_t
  else:
    compiler_clock_t_570426285)
  IoUringSyncCancelReg_570426151 = (when declared(IoUringSyncCancelReg):
    when ownSizeof(IoUringSyncCancelReg) != ownSizeof(IoUringSyncCancelReg_570426150):
      static :
        warning("Declaration of " & "IoUringSyncCancelReg" &
            " exists but with different size")
    IoUringSyncCancelReg
  else:
    IoUringSyncCancelReg_570426150)
  Msghdr_570426222 = (when declared(Msghdr):
    when ownSizeof(Msghdr) != ownSizeof(Msghdr_570426221):
      static :
        warning("Declaration of " & "Msghdr" & " exists but with different size")
    Msghdr
  else:
    Msghdr_570426221)
  IoUringSq_570426206 = (when declared(IoUringSq):
    when ownSizeof(IoUringSq) != ownSizeof(IoUringSq_570426205):
      static :
        warning("Declaration of " & "IoUringSq" &
            " exists but with different size")
    IoUringSq
  else:
    IoUringSq_570426205)
  off_t_570426232 = (when declared(off_t):
    when ownSizeof(off_t) != ownSizeof(off_t_570426231):
      static :
        warning("Declaration of " & "off_t" & " exists but with different size")
    off_t
  else:
    off_t_570426231)
  IoUringProbe_570426121 = (when declared(IoUringProbe):
    when ownSizeof(IoUringProbe) != ownSizeof(IoUringProbe_570426120):
      static :
        warning("Declaration of " & "IoUringProbe" &
            " exists but with different size")
    IoUringProbe
  else:
    IoUringProbe_570426120)
  compiler_socklen_t_570426256 = (when declared(compiler_socklen_t):
    when ownSizeof(compiler_socklen_t) != ownSizeof(compiler_socklen_t_570426255):
      static :
        warning("Declaration of " & "compiler_socklen_t" &
            " exists but with different size")
    compiler_socklen_t
  else:
    compiler_socklen_t_570426255)
  IoUringGeteventsArg_570426149 = (when declared(IoUringGeteventsArg):
    when ownSizeof(IoUringGeteventsArg) != ownSizeof(IoUringGeteventsArg_570426148):
      static :
        warning("Declaration of " & "IoUringGeteventsArg" &
            " exists but with different size")
    IoUringGeteventsArg
  else:
    IoUringGeteventsArg_570426148)
  siginfo_t_570426242 = (when declared(siginfo_t):
    when ownSizeof(siginfo_t) != ownSizeof(siginfo_t_570426241):
      static :
        warning("Declaration of " & "siginfo_t" &
            " exists but with different size")
    siginfo_t
  else:
    siginfo_t_570426241)
  IoUringQueryZcrx_struct_570426196 = (when declared(IoUringQueryZcrx_struct):
    when ownSizeof(IoUringQueryZcrx_struct) !=
        ownSizeof(IoUringQueryZcrx_struct_570426195):
      static :
        warning("Declaration of " & "IoUringQueryZcrx_struct" &
            " exists but with different size")
    IoUringQueryZcrx_struct
  else:
    IoUringQueryZcrx_struct_570426195)
  IoUringQueryOpcode_570426194 = (when declared(IoUringQueryOpcode):
    when ownSizeof(IoUringQueryOpcode) != ownSizeof(IoUringQueryOpcode_570426193):
      static :
        warning("Declaration of " & "IoUringQueryOpcode" &
            " exists but with different size")
    IoUringQueryOpcode
  else:
    IoUringQueryOpcode_570426193)
  compiler_kernel_time64_t_570426248 = (when declared(compiler_kernel_time64_t):
    when ownSizeof(compiler_kernel_time64_t) !=
        ownSizeof(compiler_kernel_time64_t_570426247):
      static :
        warning("Declaration of " & "compiler_kernel_time64_t" &
            " exists but with different size")
    compiler_kernel_time64_t
  else:
    compiler_kernel_time64_t_570426247)
  compiler_u64_570426081 = (when declared(compiler_u64):
    when ownSizeof(compiler_u64) != ownSizeof(compiler_u64_570426080):
      static :
        warning("Declaration of " & "compiler_u64" &
            " exists but with different size")
    compiler_u64
  else:
    compiler_u64_570426080)
  OpenHow_570426236 = (when declared(OpenHow):
    when ownSizeof(OpenHow) != ownSizeof(OpenHow_570426235):
      static :
        warning("Declaration of " & "OpenHow" &
            " exists but with different size")
    OpenHow
  else:
    OpenHow_570426235)
  IoUringSqe_570426073 = (when declared(IoUringSqe):
    when ownSizeof(IoUringSqe) != ownSizeof(IoUringSqe_570426072):
      static :
        warning("Declaration of " & "IoUringSqe" &
            " exists but with different size")
    IoUringSqe
  else:
    IoUringSqe_570426072)
  ZcrxCtrl_570426190 = (when declared(ZcrxCtrl):
    when ownSizeof(ZcrxCtrl) != ownSizeof(ZcrxCtrl_570426189):
      static :
        warning("Declaration of " & "ZcrxCtrl" &
            " exists but with different size")
    ZcrxCtrl
  else:
    ZcrxCtrl_570426189)
  IoCqringOffsets_570426099 = (when declared(IoCqringOffsets):
    when ownSizeof(IoCqringOffsets) != ownSizeof(IoCqringOffsets_570426098):
      static :
        warning("Declaration of " & "IoCqringOffsets" &
            " exists but with different size")
    IoCqringOffsets
  else:
    IoCqringOffsets_570426098)
  compiler_sigval_t_570426284 = (when declared(compiler_sigval_t):
    when ownSizeof(compiler_sigval_t) != ownSizeof(compiler_sigval_t_570426283):
      static :
        warning("Declaration of " & "compiler_sigval_t" &
            " exists but with different size")
    compiler_sigval_t
  else:
    compiler_sigval_t_570426283)
  IoUringCq_570426208 = (when declared(IoUringCq):
    when ownSizeof(IoUringCq) != ownSizeof(IoUringCq_570426207):
      static :
        warning("Declaration of " & "IoUringCq" &
            " exists but with different size")
    IoUringCq
  else:
    IoUringCq_570426207)
  compiler_loff_t_570426270 = (when declared(compiler_loff_t):
    when ownSizeof(compiler_loff_t) != ownSizeof(compiler_loff_t_570426269):
      static :
        warning("Declaration of " & "compiler_loff_t" &
            " exists but with different size")
    compiler_loff_t
  else:
    compiler_loff_t_570426269)
  compiler_s64_570426278 = (when declared(compiler_s64):
    when ownSizeof(compiler_s64) != ownSizeof(compiler_s64_570426277):
      static :
        warning("Declaration of " & "compiler_s64" &
            " exists but with different size")
    compiler_s64
  else:
    compiler_s64_570426277)
  IoUringNapi_570426141 = (when declared(IoUringNapi):
    when ownSizeof(IoUringNapi) != ownSizeof(IoUringNapi_570426140):
      static :
        warning("Declaration of " & "IoUringNapi" &
            " exists but with different size")
    IoUringNapi
  else:
    IoUringNapi_570426140)
  ZcrxCtrlExport_570426188 = (when declared(ZcrxCtrlExport):
    when ownSizeof(ZcrxCtrlExport) != ownSizeof(ZcrxCtrlExport_570426187):
      static :
        warning("Declaration of " & "ZcrxCtrlExport" &
            " exists but with different size")
    ZcrxCtrlExport
  else:
    ZcrxCtrlExport_570426187)
  CpuSet_570426252 = (when declared(CpuSet):
    when ownSizeof(CpuSet) != ownSizeof(CpuSet_570426251):
      static :
        warning("Declaration of " & "CpuSet" & " exists but with different size")
    CpuSet
  else:
    CpuSet_570426251)
  IoUringQueryHdr_570426192 = (when declared(IoUringQueryHdr):
    when ownSizeof(IoUringQueryHdr) != ownSizeof(IoUringQueryHdr_570426191):
      static :
        warning("Declaration of " & "IoUringQueryHdr" &
            " exists but with different size")
    IoUringQueryHdr
  else:
    IoUringQueryHdr_570426191)
  IoUringBpfCtx_570426200 = (when declared(IoUringBpfCtx):
    when ownSizeof(IoUringBpfCtx) != ownSizeof(IoUringBpfCtx_570426199):
      static :
        warning("Declaration of " & "IoUringBpfCtx" &
            " exists but with different size")
    IoUringBpfCtx
  else:
    IoUringBpfCtx_570426199)
  IoUringCqe_570426095 = (when declared(IoUringCqe):
    when ownSizeof(IoUringCqe) != ownSizeof(IoUringCqe_570426094):
      static :
        warning("Declaration of " & "IoUringCqe" &
            " exists but with different size")
    IoUringCqe
  else:
    IoUringCqe_570426094)
  IoUringRegionDesc_570426109 = (when declared(IoUringRegionDesc):
    when ownSizeof(IoUringRegionDesc) != ownSizeof(IoUringRegionDesc_570426108):
      static :
        warning("Declaration of " & "IoUringRegionDesc" &
            " exists but with different size")
    IoUringRegionDesc
  else:
    IoUringRegionDesc_570426108)
  IoUringRsrcRegister_570426113 = (when declared(IoUringRsrcRegister):
    when ownSizeof(IoUringRsrcRegister) != ownSizeof(IoUringRsrcRegister_570426112):
      static :
        warning("Declaration of " & "IoUringRsrcRegister" &
            " exists but with different size")
    IoUringRsrcRegister
  else:
    IoUringRsrcRegister_570426112)
  id_t_570426240 = (when declared(id_t):
    when ownSizeof(id_t) != ownSizeof(id_t_570426239):
      static :
        warning("Declaration of " & "id_t" & " exists but with different size")
    id_t
  else:
    id_t_570426239)
  compiler_off_t_570426262 = (when declared(compiler_off_t):
    when ownSizeof(compiler_off_t) != ownSizeof(compiler_off_t_570426261):
      static :
        warning("Declaration of " & "compiler_off_t" &
            " exists but with different size")
    compiler_off_t
  else:
    compiler_off_t_570426261)
  IoUringCloneBuffers_570426129 = (when declared(IoUringCloneBuffers):
    when ownSizeof(IoUringCloneBuffers) != ownSizeof(IoUringCloneBuffers_570426128):
      static :
        warning("Declaration of " & "IoUringCloneBuffers" &
            " exists but with different size")
    IoUringCloneBuffers
  else:
    IoUringCloneBuffers_570426128)
  IoUringZcrxOffsets_570426172 = (when declared(IoUringZcrxOffsets):
    when ownSizeof(IoUringZcrxOffsets) != ownSizeof(IoUringZcrxOffsets_570426171):
      static :
        warning("Declaration of " & "IoUringZcrxOffsets" &
            " exists but with different size")
    IoUringZcrxOffsets
  else:
    IoUringZcrxOffsets_570426171)
  IoUringCqeIter_570426220 = (when declared(IoUringCqeIter):
    when ownSizeof(IoUringCqeIter) != ownSizeof(IoUringCqeIter_570426219):
      static :
        warning("Declaration of " & "IoUringCqeIter" &
            " exists but with different size")
    IoUringCqeIter
  else:
    IoUringCqeIter_570426219)
  IoUringMsgRingFlags_570426093 = (when declared(IoUringMsgRingFlags):
    when ownSizeof(IoUringMsgRingFlags) != ownSizeof(IoUringMsgRingFlags_570426092):
      static :
        warning("Declaration of " & "IoUringMsgRingFlags" &
            " exists but with different size")
    IoUringMsgRingFlags
  else:
    IoUringMsgRingFlags_570426092)
  compiler_s32_570426079 = (when declared(compiler_s32):
    when ownSizeof(compiler_s32) != ownSizeof(compiler_s32_570426078):
      static :
        warning("Declaration of " & "compiler_s32" &
            " exists but with different size")
    compiler_s32
  else:
    compiler_s32_570426078)
  socklen_t_570426226 = (when declared(socklen_t):
    when ownSizeof(socklen_t) != ownSizeof(socklen_t_570426225):
      static :
        warning("Declaration of " & "socklen_t" &
            " exists but with different size")
    socklen_t
  else:
    socklen_t_570426225)
  IoUringRsrcUpdate2_570426117 = (when declared(IoUringRsrcUpdate2):
    when ownSizeof(IoUringRsrcUpdate2) != ownSizeof(IoUringRsrcUpdate2_570426116):
      static :
        warning("Declaration of " & "IoUringRsrcUpdate2" &
            " exists but with different size")
    IoUringRsrcUpdate2
  else:
    IoUringRsrcUpdate2_570426116)
  IoUringOp_570426091 = (when declared(IoUringOp):
    when ownSizeof(IoUringOp) != ownSizeof(IoUringOp_570426090):
      static :
        warning("Declaration of " & "IoUringOp" &
            " exists but with different size")
    IoUringOp
  else:
    IoUringOp_570426090)
  compiler_sigset_t_570426250 = (when declared(compiler_sigset_t):
    when ownSizeof(compiler_sigset_t) != ownSizeof(compiler_sigset_t_570426249):
      static :
        warning("Declaration of " & "compiler_sigset_t" &
            " exists but with different size")
    compiler_sigset_t
  else:
    compiler_sigset_t_570426249)
  IoTimespec_570426159 = (when declared(IoTimespec):
    when ownSizeof(IoTimespec) != ownSizeof(IoTimespec_570426158):
      static :
        warning("Declaration of " & "IoTimespec" &
            " exists but with different size")
    IoTimespec
  else:
    IoTimespec_570426158)
  KernelTimespec_570426147 = (when declared(KernelTimespec):
    when ownSizeof(KernelTimespec) != ownSizeof(KernelTimespec_570426146):
      static :
        warning("Declaration of " & "KernelTimespec" &
            " exists but with different size")
    KernelTimespec
  else:
    KernelTimespec_570426146)
  IoUringFileIndexRange_570426153 = (when declared(IoUringFileIndexRange):
    when ownSizeof(IoUringFileIndexRange) != ownSizeof(IoUringFileIndexRange_570426152):
      static :
        warning("Declaration of " & "IoUringFileIndexRange" &
            " exists but with different size")
    IoUringFileIndexRange
  else:
    IoUringFileIndexRange_570426152)
  IoUringBpf_570426204 = (when declared(IoUringBpf):
    when ownSizeof(IoUringBpf) != ownSizeof(IoUringBpf_570426203):
      static :
        warning("Declaration of " & "IoUringBpf" &
            " exists but with different size")
    IoUringBpf
  else:
    IoUringBpf_570426203)
  Siginfo_570426268 = (when declared(Siginfo):
    when ownSizeof(Siginfo) != ownSizeof(Siginfo_570426267):
      static :
        warning("Declaration of " & "Siginfo" &
            " exists but with different size")
    Siginfo
  else:
    Siginfo_570426267)
  Iovec_570426216 = (when declared(Iovec):
    when ownSizeof(Iovec) != ownSizeof(Iovec_570426215):
      static :
        warning("Declaration of " & "Iovec" & " exists but with different size")
    Iovec
  else:
    Iovec_570426215)
  ZcrxCtrlOp_570426184 = (when declared(ZcrxCtrlOp):
    when ownSizeof(ZcrxCtrlOp) != ownSizeof(ZcrxCtrlOp_570426183):
      static :
        warning("Declaration of " & "ZcrxCtrlOp" &
            " exists but with different size")
    ZcrxCtrlOp
  else:
    ZcrxCtrlOp_570426183)
  IoUringBpfFilter_570426202 = (when declared(IoUringBpfFilter):
    when ownSizeof(IoUringBpfFilter) != ownSizeof(IoUringBpfFilter_570426201):
      static :
        warning("Declaration of " & "IoUringBpfFilter" &
            " exists but with different size")
    IoUringBpfFilter
  else:
    IoUringBpfFilter_570426201)
  IoUringZcrxCqe_570426170 = (when declared(IoUringZcrxCqe):
    when ownSizeof(IoUringZcrxCqe) != ownSizeof(IoUringZcrxCqe_570426169):
      static :
        warning("Declaration of " & "IoUringZcrxCqe" &
            " exists but with different size")
    IoUringZcrxCqe
  else:
    IoUringZcrxCqe_570426169)
  cpu_set_t_570426218 = (when declared(cpu_set_t):
    when ownSizeof(cpu_set_t) != ownSizeof(cpu_set_t_570426217):
      static :
        warning("Declaration of " & "cpu_set_t" &
            " exists but with different size")
    cpu_set_t
  else:
    cpu_set_t_570426217)
  compiler_ssize_t_570426272 = (when declared(compiler_ssize_t):
    when ownSizeof(compiler_ssize_t) != ownSizeof(compiler_ssize_t_570426271):
      static :
        warning("Declaration of " & "compiler_ssize_t" &
            " exists but with different size")
    compiler_ssize_t
  else:
    compiler_ssize_t_570426271)
  loff_t_570426244 = (when declared(loff_t):
    when ownSizeof(loff_t) != ownSizeof(loff_t_570426243):
      static :
        warning("Declaration of " & "loff_t" & " exists but with different size")
    loff_t
  else:
    loff_t_570426243)
  ZcrxFeatures_570426180 = (when declared(ZcrxFeatures):
    when ownSizeof(ZcrxFeatures) != ownSizeof(ZcrxFeatures_570426179):
      static :
        warning("Declaration of " & "ZcrxFeatures" &
            " exists but with different size")
    ZcrxFeatures
  else:
    ZcrxFeatures_570426179)
  IoUringRegWait_570426145 = (when declared(IoUringRegWait):
    when ownSizeof(IoUringRegWait) != ownSizeof(IoUringRegWait_570426144):
      static :
        warning("Declaration of " & "IoUringRegWait" &
            " exists but with different size")
    IoUringRegWait
  else:
    IoUringRegWait_570426144)
  Sockaddr_570426224 = (when declared(Sockaddr):
    when ownSizeof(Sockaddr) != ownSizeof(Sockaddr_570426223):
      static :
        warning("Declaration of " & "Sockaddr" &
            " exists but with different size")
    Sockaddr
  else:
    Sockaddr_570426223)
  ZcrxRegFlags_570426178 = (when declared(ZcrxRegFlags):
    when ownSizeof(ZcrxRegFlags) != ownSizeof(ZcrxRegFlags_570426177):
      static :
        warning("Declaration of " & "ZcrxRegFlags" &
            " exists but with different size")
    ZcrxRegFlags
  else:
    ZcrxRegFlags_570426177)
  compiler_kernel_rwf_t_570426085 = (when declared(compiler_kernel_rwf_t):
    when ownSizeof(compiler_kernel_rwf_t) != ownSizeof(compiler_kernel_rwf_t_570426084):
      static :
        warning("Declaration of " & "compiler_kernel_rwf_t" &
            " exists but with different size")
    compiler_kernel_rwf_t
  else:
    compiler_kernel_rwf_t_570426084)
  Cmsghdr_570426234 = (when declared(Cmsghdr):
    when ownSizeof(Cmsghdr) != ownSizeof(Cmsghdr_570426233):
      static :
        warning("Declaration of " & "Cmsghdr" &
            " exists but with different size")
    Cmsghdr
  else:
    Cmsghdr_570426233)
  IoUringZcrxIfqReg_570426182 = (when declared(IoUringZcrxIfqReg):
    when ownSizeof(IoUringZcrxIfqReg) != ownSizeof(IoUringZcrxIfqReg_570426181):
      static :
        warning("Declaration of " & "IoUringZcrxIfqReg" &
            " exists but with different size")
    IoUringZcrxIfqReg
  else:
    IoUringZcrxIfqReg_570426181)
  IoUringRestriction_570426123 = (when declared(IoUringRestriction):
    when ownSizeof(IoUringRestriction) != ownSizeof(IoUringRestriction_570426122):
      static :
        warning("Declaration of " & "IoUringRestriction" &
            " exists but with different size")
    IoUringRestriction
  else:
    IoUringRestriction_570426122)
  Idtype_570426264 = (when declared(Idtype):
    when ownSizeof(Idtype) != ownSizeof(Idtype_570426263):
      static :
        warning("Declaration of " & "Idtype" & " exists but with different size")
    Idtype
  else:
    Idtype_570426263)
  IoUringMemRegionReg_570426111 = (when declared(IoUringMemRegionReg):
    when ownSizeof(IoUringMemRegionReg) != ownSizeof(IoUringMemRegionReg_570426110):
      static :
        warning("Declaration of " & "IoUringMemRegionReg" &
            " exists but with different size")
    IoUringMemRegionReg
  else:
    IoUringMemRegionReg_570426110)
  IoUringClockRegister_570426127 = (when declared(IoUringClockRegister):
    when ownSizeof(IoUringClockRegister) != ownSizeof(IoUringClockRegister_570426126):
      static :
        warning("Declaration of " & "IoUringClockRegister" &
            " exists but with different size")
    IoUringClockRegister
  else:
    IoUringClockRegister_570426126)
  compiler_uint32_t_570426288 = (when declared(compiler_uint32_t):
    when ownSizeof(compiler_uint32_t) != ownSizeof(compiler_uint32_t_570426287):
      static :
        warning("Declaration of " & "compiler_uint32_t" &
            " exists but with different size")
    compiler_uint32_t
  else:
    compiler_uint32_t_570426287)
  compiler_u16_570426077 = (when declared(compiler_u16):
    when ownSizeof(compiler_u16) != ownSizeof(compiler_u16_570426076):
      static :
        warning("Declaration of " & "compiler_u16" &
            " exists but with different size")
    compiler_u16
  else:
    compiler_u16_570426076)
  IoUringBufStatus_570426139 = (when declared(IoUringBufStatus):
    when ownSizeof(IoUringBufStatus) != ownSizeof(IoUringBufStatus_570426138):
      static :
        warning("Declaration of " & "IoUringBufStatus" &
            " exists but with different size")
    IoUringBufStatus
  else:
    IoUringBufStatus_570426138)
  ssize_t_570426246 = (when declared(ssize_t):
    when ownSizeof(ssize_t) != ownSizeof(ssize_t_570426245):
      static :
        warning("Declaration of " & "ssize_t" &
            " exists but with different size")
    ssize_t
  else:
    ssize_t_570426245)
  IoSqringOffsets_570426097 = (when declared(IoSqringOffsets):
    when ownSizeof(IoSqringOffsets) != ownSizeof(IoSqringOffsets_570426096):
      static :
        warning("Declaration of " & "IoSqringOffsets" &
            " exists but with different size")
    IoSqringOffsets
  else:
    IoSqringOffsets_570426096)
  IoUringFilesUpdate_570426107 = (when declared(IoUringFilesUpdate):
    when ownSizeof(IoUringFilesUpdate) != ownSizeof(IoUringFilesUpdate_570426106):
      static :
        warning("Declaration of " & "IoUringFilesUpdate" &
            " exists but with different size")
    IoUringFilesUpdate
  else:
    IoUringFilesUpdate_570426106)
  compiler_pid_t_570426280 = (when declared(compiler_pid_t):
    when ownSizeof(compiler_pid_t) != ownSizeof(compiler_pid_t_570426279):
      static :
        warning("Declaration of " & "compiler_pid_t" &
            " exists but with different size")
    compiler_pid_t
  else:
    compiler_pid_t_570426279)
  sa_family_t_570426254 = (when declared(sa_family_t):
    when ownSizeof(sa_family_t) != ownSizeof(sa_family_t_570426253):
      static :
        warning("Declaration of " & "sa_family_t" &
            " exists but with different size")
    sa_family_t
  else:
    sa_family_t_570426253)
  sigset_t_570426214 = (when declared(sigset_t):
    when ownSizeof(sigset_t) != ownSizeof(sigset_t_570426213):
      static :
        warning("Declaration of " & "sigset_t" &
            " exists but with different size")
    sigset_t
  else:
    sigset_t_570426213)
  IoUringSocketOp_570426157 = (when declared(IoUringSocketOp):
    when ownSizeof(IoUringSocketOp) != ownSizeof(IoUringSocketOp_570426156):
      static :
        warning("Declaration of " & "IoUringSocketOp" &
            " exists but with different size")
    IoUringSocketOp
  else:
    IoUringSocketOp_570426156)
when not declared(IoUringRegisterRestrictionOp):
  type
    IoUringRegisterRestrictionOp* = IoUringRegisterRestrictionOp_570426142
else:
  static :
    hint("Declaration of " & "IoUringRegisterRestrictionOp" &
        " already exists, not redeclaring")
when not declared(compiler_u32):
  type
    compiler_u32* = compiler_u32_570426082
else:
  static :
    hint("Declaration of " & "compiler_u32" & " already exists, not redeclaring")
when not declared(IoUringSqeFlagsBit):
  type
    IoUringSqeFlagsBit* = IoUringSqeFlagsBit_570426088
else:
  static :
    hint("Declaration of " & "IoUringSqeFlagsBit" &
        " already exists, not redeclaring")
when not declared(IoUringRegisterOp):
  type
    IoUringRegisterOp* = IoUringRegisterOp_570426102
else:
  static :
    hint("Declaration of " & "IoUringRegisterOp" &
        " already exists, not redeclaring")
when not declared(IoUringQueryScq_struct):
  type
    IoUringQueryScq_struct* = IoUringQueryScq_struct_570426197
else:
  static :
    hint("Declaration of " & "IoUringQueryScq_struct" &
        " already exists, not redeclaring")
when not declared(IoUring):
  type
    IoUring* = IoUring_570426209
else:
  static :
    hint("Declaration of " & "IoUring" & " already exists, not redeclaring")
when not declared(IoUringParams):
  type
    IoUringParams* = IoUringParams_570426100
else:
  static :
    hint("Declaration of " & "IoUringParams" &
        " already exists, not redeclaring")
when not declared(IoUringRsrcUpdate):
  type
    IoUringRsrcUpdate* = IoUringRsrcUpdate_570426114
else:
  static :
    hint("Declaration of " & "IoUringRsrcUpdate" &
        " already exists, not redeclaring")
when not declared(compiler_id_t):
  type
    compiler_id_t* = compiler_id_t_570426265
else:
  static :
    hint("Declaration of " & "compiler_id_t" &
        " already exists, not redeclaring")
when not declared(compiler_cpu_mask):
  type
    compiler_cpu_mask* = compiler_cpu_mask_570426275
else:
  static :
    hint("Declaration of " & "compiler_cpu_mask" &
        " already exists, not redeclaring")
when not declared(mode_t):
  type
    mode_t* = mode_t_570426227
else:
  static :
    hint("Declaration of " & "mode_t" & " already exists, not redeclaring")
when not declared(idtype_t):
  type
    idtype_t* = idtype_t_570426237
else:
  static :
    hint("Declaration of " & "idtype_t" & " already exists, not redeclaring")
when not declared(IoUringRecvmsgOut):
  type
    IoUringRecvmsgOut* = IoUringRecvmsgOut_570426154
else:
  static :
    hint("Declaration of " & "IoUringRecvmsgOut" &
        " already exists, not redeclaring")
when not declared(compiler_u8):
  type
    compiler_u8* = compiler_u8_570426074
else:
  static :
    hint("Declaration of " & "compiler_u8" & " already exists, not redeclaring")
when not declared(IoUringBufRing):
  type
    IoUringBufRing* = IoUringBufRing_570426132
else:
  static :
    hint("Declaration of " & "IoUringBufRing" &
        " already exists, not redeclaring")
when not declared(Statx):
  type
    Statx* = Statx_570426229
else:
  static :
    hint("Declaration of " & "Statx" & " already exists, not redeclaring")
when not declared(IoUringZcrxRq):
  type
    IoUringZcrxRq* = IoUringZcrxRq_570426211
else:
  static :
    hint("Declaration of " & "IoUringZcrxRq" &
        " already exists, not redeclaring")
when not declared(Sigset):
  type
    Sigset* = Sigset_570426273
else:
  static :
    hint("Declaration of " & "Sigset" & " already exists, not redeclaring")
when not declared(IoUringTaskRestriction):
  type
    IoUringTaskRestriction* = IoUringTaskRestriction_570426124
else:
  static :
    hint("Declaration of " & "IoUringTaskRestriction" &
        " already exists, not redeclaring")
when not declared(IoUringBuf):
  type
    IoUringBuf* = IoUringBuf_570426130
else:
  static :
    hint("Declaration of " & "IoUringBuf" & " already exists, not redeclaring")
when not declared(IoUringRegisterPbufRingFlags):
  type
    IoUringRegisterPbufRingFlags* = IoUringRegisterPbufRingFlags_570426134
else:
  static :
    hint("Declaration of " & "IoUringRegisterPbufRingFlags" &
        " already exists, not redeclaring")
when not declared(IoUringZcrxAreaReg):
  type
    IoUringZcrxAreaReg* = IoUringZcrxAreaReg_570426175
else:
  static :
    hint("Declaration of " & "IoUringZcrxAreaReg" &
        " already exists, not redeclaring")
when not declared(IoUringBufReg):
  type
    IoUringBufReg* = IoUringBufReg_570426136
else:
  static :
    hint("Declaration of " & "IoUringBufReg" &
        " already exists, not redeclaring")
when not declared(StatxTimestamp):
  type
    StatxTimestamp* = StatxTimestamp_570426259
else:
  static :
    hint("Declaration of " & "StatxTimestamp" &
        " already exists, not redeclaring")
when not declared(compiler_off64_t):
  type
    compiler_off64_t* = compiler_off64_t_570426289
else:
  static :
    hint("Declaration of " & "compiler_off64_t" &
        " already exists, not redeclaring")
when not declared(IoUringProbeOp):
  type
    IoUringProbeOp* = IoUringProbeOp_570426118
else:
  static :
    hint("Declaration of " & "IoUringProbeOp" &
        " already exists, not redeclaring")
when not declared(IoUringZcrxAreaFlags):
  type
    IoUringZcrxAreaFlags* = IoUringZcrxAreaFlags_570426173
else:
  static :
    hint("Declaration of " & "IoUringZcrxAreaFlags" &
        " already exists, not redeclaring")
when not declared(compiler_mode_t):
  type
    compiler_mode_t* = compiler_mode_t_570426257
else:
  static :
    hint("Declaration of " & "compiler_mode_t" &
        " already exists, not redeclaring")
when not declared(compiler_uid_t):
  type
    compiler_uid_t* = compiler_uid_t_570426281
else:
  static :
    hint("Declaration of " & "compiler_uid_t" &
        " already exists, not redeclaring")
when not declared(Sigval):
  type
    Sigval* = Sigval_570426291
else:
  static :
    hint("Declaration of " & "Sigval" & " already exists, not redeclaring")
when not declared(ZcrxCtrlFlushRq):
  type
    ZcrxCtrlFlushRq* = ZcrxCtrlFlushRq_570426185
else:
  static :
    hint("Declaration of " & "ZcrxCtrlFlushRq" &
        " already exists, not redeclaring")
when not declared(IoUringAttrPi):
  type
    IoUringAttrPi* = IoUringAttrPi_570426086
else:
  static :
    hint("Declaration of " & "IoUringAttrPi" &
        " already exists, not redeclaring")
when not declared(IoUringZcrxRqe):
  type
    IoUringZcrxRqe* = IoUringZcrxRqe_570426167
else:
  static :
    hint("Declaration of " & "IoUringZcrxRqe" &
        " already exists, not redeclaring")
when not declared(IoWqType):
  type
    IoWqType* = IoWqType_570426104
else:
  static :
    hint("Declaration of " & "IoWqType" & " already exists, not redeclaring")
when not declared(compiler_clock_t):
  type
    compiler_clock_t* = compiler_clock_t_570426285
else:
  static :
    hint("Declaration of " & "compiler_clock_t" &
        " already exists, not redeclaring")
when not declared(IoUringSyncCancelReg):
  type
    IoUringSyncCancelReg* = IoUringSyncCancelReg_570426150
else:
  static :
    hint("Declaration of " & "IoUringSyncCancelReg" &
        " already exists, not redeclaring")
when not declared(Msghdr):
  type
    Msghdr* = Msghdr_570426221
else:
  static :
    hint("Declaration of " & "Msghdr" & " already exists, not redeclaring")
when not declared(IoUringSq):
  type
    IoUringSq* = IoUringSq_570426205
else:
  static :
    hint("Declaration of " & "IoUringSq" & " already exists, not redeclaring")
when not declared(off_t):
  type
    off_t* = off_t_570426231
else:
  static :
    hint("Declaration of " & "off_t" & " already exists, not redeclaring")
when not declared(IoUringProbe):
  type
    IoUringProbe* = IoUringProbe_570426120
else:
  static :
    hint("Declaration of " & "IoUringProbe" & " already exists, not redeclaring")
when not declared(compiler_socklen_t):
  type
    compiler_socklen_t* = compiler_socklen_t_570426255
else:
  static :
    hint("Declaration of " & "compiler_socklen_t" &
        " already exists, not redeclaring")
when not declared(IoUringGeteventsArg):
  type
    IoUringGeteventsArg* = IoUringGeteventsArg_570426148
else:
  static :
    hint("Declaration of " & "IoUringGeteventsArg" &
        " already exists, not redeclaring")
when not declared(siginfo_t):
  type
    siginfo_t* = siginfo_t_570426241
else:
  static :
    hint("Declaration of " & "siginfo_t" & " already exists, not redeclaring")
when not declared(IoUringQueryZcrx_struct):
  type
    IoUringQueryZcrx_struct* = IoUringQueryZcrx_struct_570426195
else:
  static :
    hint("Declaration of " & "IoUringQueryZcrx_struct" &
        " already exists, not redeclaring")
when not declared(IoUringQueryOpcode):
  type
    IoUringQueryOpcode* = IoUringQueryOpcode_570426193
else:
  static :
    hint("Declaration of " & "IoUringQueryOpcode" &
        " already exists, not redeclaring")
when not declared(compiler_kernel_time64_t):
  type
    compiler_kernel_time64_t* = compiler_kernel_time64_t_570426247
else:
  static :
    hint("Declaration of " & "compiler_kernel_time64_t" &
        " already exists, not redeclaring")
when not declared(compiler_u64):
  type
    compiler_u64* = compiler_u64_570426080
else:
  static :
    hint("Declaration of " & "compiler_u64" & " already exists, not redeclaring")
when not declared(OpenHow):
  type
    OpenHow* = OpenHow_570426235
else:
  static :
    hint("Declaration of " & "OpenHow" & " already exists, not redeclaring")
when not declared(IoUringSqe):
  type
    IoUringSqe* = IoUringSqe_570426072
else:
  static :
    hint("Declaration of " & "IoUringSqe" & " already exists, not redeclaring")
when not declared(ZcrxCtrl):
  type
    ZcrxCtrl* = ZcrxCtrl_570426189
else:
  static :
    hint("Declaration of " & "ZcrxCtrl" & " already exists, not redeclaring")
when not declared(IoCqringOffsets):
  type
    IoCqringOffsets* = IoCqringOffsets_570426098
else:
  static :
    hint("Declaration of " & "IoCqringOffsets" &
        " already exists, not redeclaring")
when not declared(compiler_sigval_t):
  type
    compiler_sigval_t* = compiler_sigval_t_570426283
else:
  static :
    hint("Declaration of " & "compiler_sigval_t" &
        " already exists, not redeclaring")
when not declared(IoUringCq):
  type
    IoUringCq* = IoUringCq_570426207
else:
  static :
    hint("Declaration of " & "IoUringCq" & " already exists, not redeclaring")
when not declared(compiler_loff_t):
  type
    compiler_loff_t* = compiler_loff_t_570426269
else:
  static :
    hint("Declaration of " & "compiler_loff_t" &
        " already exists, not redeclaring")
when not declared(compiler_s64):
  type
    compiler_s64* = compiler_s64_570426277
else:
  static :
    hint("Declaration of " & "compiler_s64" & " already exists, not redeclaring")
when not declared(IoUringNapi):
  type
    IoUringNapi* = IoUringNapi_570426140
else:
  static :
    hint("Declaration of " & "IoUringNapi" & " already exists, not redeclaring")
when not declared(ZcrxCtrlExport):
  type
    ZcrxCtrlExport* = ZcrxCtrlExport_570426187
else:
  static :
    hint("Declaration of " & "ZcrxCtrlExport" &
        " already exists, not redeclaring")
when not declared(CpuSet):
  type
    CpuSet* = CpuSet_570426251
else:
  static :
    hint("Declaration of " & "CpuSet" & " already exists, not redeclaring")
when not declared(IoUringQueryHdr):
  type
    IoUringQueryHdr* = IoUringQueryHdr_570426191
else:
  static :
    hint("Declaration of " & "IoUringQueryHdr" &
        " already exists, not redeclaring")
when not declared(IoUringBpfCtx):
  type
    IoUringBpfCtx* = IoUringBpfCtx_570426199
else:
  static :
    hint("Declaration of " & "IoUringBpfCtx" &
        " already exists, not redeclaring")
when not declared(IoUringCqe):
  type
    IoUringCqe* = IoUringCqe_570426094
else:
  static :
    hint("Declaration of " & "IoUringCqe" & " already exists, not redeclaring")
when not declared(IoUringRegionDesc):
  type
    IoUringRegionDesc* = IoUringRegionDesc_570426108
else:
  static :
    hint("Declaration of " & "IoUringRegionDesc" &
        " already exists, not redeclaring")
when not declared(IoUringRsrcRegister):
  type
    IoUringRsrcRegister* = IoUringRsrcRegister_570426112
else:
  static :
    hint("Declaration of " & "IoUringRsrcRegister" &
        " already exists, not redeclaring")
when not declared(id_t):
  type
    id_t* = id_t_570426239
else:
  static :
    hint("Declaration of " & "id_t" & " already exists, not redeclaring")
when not declared(compiler_off_t):
  type
    compiler_off_t* = compiler_off_t_570426261
else:
  static :
    hint("Declaration of " & "compiler_off_t" &
        " already exists, not redeclaring")
when not declared(IoUringCloneBuffers):
  type
    IoUringCloneBuffers* = IoUringCloneBuffers_570426128
else:
  static :
    hint("Declaration of " & "IoUringCloneBuffers" &
        " already exists, not redeclaring")
when not declared(IoUringZcrxOffsets):
  type
    IoUringZcrxOffsets* = IoUringZcrxOffsets_570426171
else:
  static :
    hint("Declaration of " & "IoUringZcrxOffsets" &
        " already exists, not redeclaring")
when not declared(IoUringCqeIter):
  type
    IoUringCqeIter* = IoUringCqeIter_570426219
else:
  static :
    hint("Declaration of " & "IoUringCqeIter" &
        " already exists, not redeclaring")
when not declared(IoUringMsgRingFlags):
  type
    IoUringMsgRingFlags* = IoUringMsgRingFlags_570426092
else:
  static :
    hint("Declaration of " & "IoUringMsgRingFlags" &
        " already exists, not redeclaring")
when not declared(compiler_s32):
  type
    compiler_s32* = compiler_s32_570426078
else:
  static :
    hint("Declaration of " & "compiler_s32" & " already exists, not redeclaring")
when not declared(socklen_t):
  type
    socklen_t* = socklen_t_570426225
else:
  static :
    hint("Declaration of " & "socklen_t" & " already exists, not redeclaring")
when not declared(IoUringRsrcUpdate2):
  type
    IoUringRsrcUpdate2* = IoUringRsrcUpdate2_570426116
else:
  static :
    hint("Declaration of " & "IoUringRsrcUpdate2" &
        " already exists, not redeclaring")
when not declared(IoUringOp):
  type
    IoUringOp* = IoUringOp_570426090
else:
  static :
    hint("Declaration of " & "IoUringOp" & " already exists, not redeclaring")
when not declared(compiler_sigset_t):
  type
    compiler_sigset_t* = compiler_sigset_t_570426249
else:
  static :
    hint("Declaration of " & "compiler_sigset_t" &
        " already exists, not redeclaring")
when not declared(IoTimespec):
  type
    IoTimespec* = IoTimespec_570426158
else:
  static :
    hint("Declaration of " & "IoTimespec" & " already exists, not redeclaring")
when not declared(KernelTimespec):
  type
    KernelTimespec* = KernelTimespec_570426146
else:
  static :
    hint("Declaration of " & "KernelTimespec" &
        " already exists, not redeclaring")
when not declared(IoUringFileIndexRange):
  type
    IoUringFileIndexRange* = IoUringFileIndexRange_570426152
else:
  static :
    hint("Declaration of " & "IoUringFileIndexRange" &
        " already exists, not redeclaring")
when not declared(IoUringBpf):
  type
    IoUringBpf* = IoUringBpf_570426203
else:
  static :
    hint("Declaration of " & "IoUringBpf" & " already exists, not redeclaring")
when not declared(Siginfo):
  type
    Siginfo* = Siginfo_570426267
else:
  static :
    hint("Declaration of " & "Siginfo" & " already exists, not redeclaring")
when not declared(Iovec):
  type
    Iovec* = Iovec_570426215
else:
  static :
    hint("Declaration of " & "Iovec" & " already exists, not redeclaring")
when not declared(ZcrxCtrlOp):
  type
    ZcrxCtrlOp* = ZcrxCtrlOp_570426183
else:
  static :
    hint("Declaration of " & "ZcrxCtrlOp" & " already exists, not redeclaring")
when not declared(IoUringBpfFilter):
  type
    IoUringBpfFilter* = IoUringBpfFilter_570426201
else:
  static :
    hint("Declaration of " & "IoUringBpfFilter" &
        " already exists, not redeclaring")
when not declared(IoUringZcrxCqe):
  type
    IoUringZcrxCqe* = IoUringZcrxCqe_570426169
else:
  static :
    hint("Declaration of " & "IoUringZcrxCqe" &
        " already exists, not redeclaring")
when not declared(cpu_set_t):
  type
    cpu_set_t* = cpu_set_t_570426217
else:
  static :
    hint("Declaration of " & "cpu_set_t" & " already exists, not redeclaring")
when not declared(compiler_ssize_t):
  type
    compiler_ssize_t* = compiler_ssize_t_570426271
else:
  static :
    hint("Declaration of " & "compiler_ssize_t" &
        " already exists, not redeclaring")
when not declared(loff_t):
  type
    loff_t* = loff_t_570426243
else:
  static :
    hint("Declaration of " & "loff_t" & " already exists, not redeclaring")
when not declared(ZcrxFeatures):
  type
    ZcrxFeatures* = ZcrxFeatures_570426179
else:
  static :
    hint("Declaration of " & "ZcrxFeatures" & " already exists, not redeclaring")
when not declared(IoUringRegWait):
  type
    IoUringRegWait* = IoUringRegWait_570426144
else:
  static :
    hint("Declaration of " & "IoUringRegWait" &
        " already exists, not redeclaring")
when not declared(Sockaddr):
  type
    Sockaddr* = Sockaddr_570426223
else:
  static :
    hint("Declaration of " & "Sockaddr" & " already exists, not redeclaring")
when not declared(ZcrxRegFlags):
  type
    ZcrxRegFlags* = ZcrxRegFlags_570426177
else:
  static :
    hint("Declaration of " & "ZcrxRegFlags" & " already exists, not redeclaring")
when not declared(compiler_kernel_rwf_t):
  type
    compiler_kernel_rwf_t* = compiler_kernel_rwf_t_570426084
else:
  static :
    hint("Declaration of " & "compiler_kernel_rwf_t" &
        " already exists, not redeclaring")
when not declared(Cmsghdr):
  type
    Cmsghdr* = Cmsghdr_570426233
else:
  static :
    hint("Declaration of " & "Cmsghdr" & " already exists, not redeclaring")
when not declared(IoUringZcrxIfqReg):
  type
    IoUringZcrxIfqReg* = IoUringZcrxIfqReg_570426181
else:
  static :
    hint("Declaration of " & "IoUringZcrxIfqReg" &
        " already exists, not redeclaring")
when not declared(IoUringRestriction):
  type
    IoUringRestriction* = IoUringRestriction_570426122
else:
  static :
    hint("Declaration of " & "IoUringRestriction" &
        " already exists, not redeclaring")
when not declared(Idtype):
  type
    Idtype* = Idtype_570426263
else:
  static :
    hint("Declaration of " & "Idtype" & " already exists, not redeclaring")
when not declared(IoUringMemRegionReg):
  type
    IoUringMemRegionReg* = IoUringMemRegionReg_570426110
else:
  static :
    hint("Declaration of " & "IoUringMemRegionReg" &
        " already exists, not redeclaring")
when not declared(IoUringClockRegister):
  type
    IoUringClockRegister* = IoUringClockRegister_570426126
else:
  static :
    hint("Declaration of " & "IoUringClockRegister" &
        " already exists, not redeclaring")
when not declared(compiler_uint32_t):
  type
    compiler_uint32_t* = compiler_uint32_t_570426287
else:
  static :
    hint("Declaration of " & "compiler_uint32_t" &
        " already exists, not redeclaring")
when not declared(compiler_u16):
  type
    compiler_u16* = compiler_u16_570426076
else:
  static :
    hint("Declaration of " & "compiler_u16" & " already exists, not redeclaring")
when not declared(IoUringBufStatus):
  type
    IoUringBufStatus* = IoUringBufStatus_570426138
else:
  static :
    hint("Declaration of " & "IoUringBufStatus" &
        " already exists, not redeclaring")
when not declared(ssize_t):
  type
    ssize_t* = ssize_t_570426245
else:
  static :
    hint("Declaration of " & "ssize_t" & " already exists, not redeclaring")
when not declared(IoSqringOffsets):
  type
    IoSqringOffsets* = IoSqringOffsets_570426096
else:
  static :
    hint("Declaration of " & "IoSqringOffsets" &
        " already exists, not redeclaring")
when not declared(IoUringFilesUpdate):
  type
    IoUringFilesUpdate* = IoUringFilesUpdate_570426106
else:
  static :
    hint("Declaration of " & "IoUringFilesUpdate" &
        " already exists, not redeclaring")
when not declared(compiler_pid_t):
  type
    compiler_pid_t* = compiler_pid_t_570426279
else:
  static :
    hint("Declaration of " & "compiler_pid_t" &
        " already exists, not redeclaring")
when not declared(sa_family_t):
  type
    sa_family_t* = sa_family_t_570426253
else:
  static :
    hint("Declaration of " & "sa_family_t" & " already exists, not redeclaring")
when not declared(sigset_t):
  type
    sigset_t* = sigset_t_570426213
else:
  static :
    hint("Declaration of " & "sigset_t" & " already exists, not redeclaring")
when not declared(IoUringSocketOp):
  type
    IoUringSocketOp* = IoUringSocketOp_570426156
else:
  static :
    hint("Declaration of " & "IoUringSocketOp" &
        " already exists, not redeclaring")
when not declared(UAPI_LINUX_IO_URING_H_SKIP_LINUX_TIME_TYPES_H):
  when 1 is static:
    const
      UAPI_LINUX_IO_URING_H_SKIP_LINUX_TIME_TYPES_H* = 1 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/compat.h:17:9
  else:
    let UAPI_LINUX_IO_URING_H_SKIP_LINUX_TIME_TYPES_H* = 1 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/compat.h:17:9
else:
  static :
    hint("Declaration of " & "UAPI_LINUX_IO_URING_H_SKIP_LINUX_TIME_TYPES_H" &
        " already exists, not redeclaring")
when not declared(IORING_URING_CMD_MASK):
  when IORING_URING_CMD_FIXED is typedesc:
    type
      IORING_URING_CMD_MASK* = IORING_URING_CMD_FIXED ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:326:9
  else:
    when IORING_URING_CMD_FIXED is static:
      const
        IORING_URING_CMD_MASK* = IORING_URING_CMD_FIXED ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:326:9
    else:
      let IORING_URING_CMD_MASK* = IORING_URING_CMD_FIXED ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:326:9
else:
  static :
    hint("Declaration of " & "IORING_URING_CMD_MASK" &
        " already exists, not redeclaring")
when not declared(IORING_CQE_BUFFER_SHIFT):
  when 16 is static:
    const
      IORING_CQE_BUFFER_SHIFT* = 16 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:532:9
  else:
    let IORING_CQE_BUFFER_SHIFT* = 16 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:532:9
else:
  static :
    hint("Declaration of " & "IORING_CQE_BUFFER_SHIFT" &
        " already exists, not redeclaring")
when not declared(IORING_OFF_SQ_RING):
  when cast[culonglong](0'i64) is static:
    const
      IORING_OFF_SQ_RING* = cast[culonglong](0'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:537:9
  else:
    let IORING_OFF_SQ_RING* = cast[culonglong](0'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:537:9
else:
  static :
    hint("Declaration of " & "IORING_OFF_SQ_RING" &
        " already exists, not redeclaring")
when not declared(IORING_OFF_CQ_RING):
  when cast[culonglong](134217728'i64) is static:
    const
      IORING_OFF_CQ_RING* = cast[culonglong](134217728'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:538:9
  else:
    let IORING_OFF_CQ_RING* = cast[culonglong](134217728'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:538:9
else:
  static :
    hint("Declaration of " & "IORING_OFF_CQ_RING" &
        " already exists, not redeclaring")
when not declared(IORING_OFF_SQES):
  when cast[culonglong](268435456'i64) is static:
    const
      IORING_OFF_SQES* = cast[culonglong](268435456'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:539:9
  else:
    let IORING_OFF_SQES* = cast[culonglong](268435456'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:539:9
else:
  static :
    hint("Declaration of " & "IORING_OFF_SQES" &
        " already exists, not redeclaring")
when not declared(IORING_OFF_PBUF_RING):
  when cast[culonglong](2147483648'i64) is static:
    const
      IORING_OFF_PBUF_RING* = cast[culonglong](2147483648'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:540:9
  else:
    let IORING_OFF_PBUF_RING* = cast[culonglong](2147483648'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:540:9
else:
  static :
    hint("Declaration of " & "IORING_OFF_PBUF_RING" &
        " already exists, not redeclaring")
when not declared(IORING_OFF_PBUF_SHIFT):
  when 16 is static:
    const
      IORING_OFF_PBUF_SHIFT* = 16 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:541:9
  else:
    let IORING_OFF_PBUF_SHIFT* = 16 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:541:9
else:
  static :
    hint("Declaration of " & "IORING_OFF_PBUF_SHIFT" &
        " already exists, not redeclaring")
when not declared(IORING_OFF_MMAP_MASK):
  when cast[culonglong](4160749568'i64) is static:
    const
      IORING_OFF_MMAP_MASK* = cast[culonglong](4160749568'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:542:9
  else:
    let IORING_OFF_MMAP_MASK* = cast[culonglong](4160749568'i64) ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:542:9
else:
  static :
    hint("Declaration of " & "IORING_OFF_MMAP_MASK" &
        " already exists, not redeclaring")
when not declared(IORING_REGISTER_FILES_SKIP):
  when -2 is static:
    const
      IORING_REGISTER_FILES_SKIP* = -2 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:787:9
  else:
    let IORING_REGISTER_FILES_SKIP* = -2 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:787:9
else:
  static :
    hint("Declaration of " & "IORING_REGISTER_FILES_SKIP" &
        " already exists, not redeclaring")
when not declared(IORING_TIMESTAMP_HW_SHIFT):
  when 16 is static:
    const
      IORING_TIMESTAMP_HW_SHIFT* = 16 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1008:9
  else:
    let IORING_TIMESTAMP_HW_SHIFT* = 16 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1008:9
else:
  static :
    hint("Declaration of " & "IORING_TIMESTAMP_HW_SHIFT" &
        " already exists, not redeclaring")
when not declared(IORING_ZCRX_AREA_SHIFT):
  when 48 is static:
    const
      IORING_ZCRX_AREA_SHIFT* = 48 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1032:9
  else:
    let IORING_ZCRX_AREA_SHIFT* = 48 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring.h:1032:9
else:
  static :
    hint("Declaration of " & "IORING_ZCRX_AREA_SHIFT" &
        " already exists, not redeclaring")
when not declared(IO_URING_VERSION_MAJOR):
  when 2 is static:
    const
      IO_URING_VERSION_MAJOR* = 2 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring_version.h:5:9
  else:
    let IO_URING_VERSION_MAJOR* = 2 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring_version.h:5:9
else:
  static :
    hint("Declaration of " & "IO_URING_VERSION_MAJOR" &
        " already exists, not redeclaring")
when not declared(IO_URING_VERSION_MINOR):
  when 15 is static:
    const
      IO_URING_VERSION_MINOR* = 15 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring_version.h:6:9
  else:
    let IO_URING_VERSION_MINOR* = 15 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing/io_uring_version.h:6:9
else:
  static :
    hint("Declaration of " & "IO_URING_VERSION_MINOR" &
        " already exists, not redeclaring")
when not declared(compiler_NR_io_uring_setup):
  when 425 is static:
    const
      compiler_NR_io_uring_setup* = 425 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:99:9
  else:
    let compiler_NR_io_uring_setup* = 425 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:99:9
else:
  static :
    hint("Declaration of " & "compiler_NR_io_uring_setup" &
        " already exists, not redeclaring")
when not declared(compiler_NR_io_uring_enter):
  when 426 is static:
    const
      compiler_NR_io_uring_enter* = 426 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:102:9
  else:
    let compiler_NR_io_uring_enter* = 426 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:102:9
else:
  static :
    hint("Declaration of " & "compiler_NR_io_uring_enter" &
        " already exists, not redeclaring")
when not declared(compiler_NR_io_uring_register):
  when 427 is static:
    const
      compiler_NR_io_uring_register* = 427 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:105:9
  else:
    let compiler_NR_io_uring_register* = 427 ## Generated based on /home/user/development/status-im/nim-uring/vendor/liburing/src/include/liburing.h:105:9
else:
  static :
    hint("Declaration of " & "compiler_NR_io_uring_register" &
        " already exists, not redeclaring")
when not declared(io_uring_get_probe_ring):
  proc io_uring_get_probe_ring*(ring: ptr IoUring_570426210): ptr IoUringProbe_570426121 {.
      cdecl, importc: "io_uring_get_probe_ring".}
else:
  static :
    hint("Declaration of " & "io_uring_get_probe_ring" &
        " already exists, not redeclaring")
when not declared(io_uring_get_probe):
  proc io_uring_get_probe*(): ptr IoUringProbe_570426121 {.cdecl,
      importc: "io_uring_get_probe".}
else:
  static :
    hint("Declaration of " & "io_uring_get_probe" &
        " already exists, not redeclaring")
when not declared(io_uring_free_probe):
  proc io_uring_free_probe*(probe: ptr IoUringProbe_570426121): void {.cdecl,
      importc: "io_uring_free_probe".}
else:
  static :
    hint("Declaration of " & "io_uring_free_probe" &
        " already exists, not redeclaring")
when not declared(io_uring_opcode_supported):
  proc io_uring_opcode_supported*(p: ptr IoUringProbe_570426121; op: cint): cint {.
      cdecl, importc: "io_uring_opcode_supported".}
else:
  static :
    hint("Declaration of " & "io_uring_opcode_supported" &
        " already exists, not redeclaring")
when not declared(io_uring_queue_init_mem):
  proc io_uring_queue_init_mem*(entries: cuint; ring: ptr IoUring_570426210;
                                p: ptr IoUringParams_570426101; buf: pointer;
                                buf_size: csize_t): cint {.cdecl,
      importc: "io_uring_queue_init_mem".}
else:
  static :
    hint("Declaration of " & "io_uring_queue_init_mem" &
        " already exists, not redeclaring")
when not declared(io_uring_queue_init_params):
  proc io_uring_queue_init_params*(entries: cuint; ring: ptr IoUring_570426210;
                                   p: ptr IoUringParams_570426101): cint {.
      cdecl, importc: "io_uring_queue_init_params".}
else:
  static :
    hint("Declaration of " & "io_uring_queue_init_params" &
        " already exists, not redeclaring")
when not declared(io_uring_queue_init):
  proc io_uring_queue_init*(entries: cuint; ring: ptr IoUring_570426210;
                            flags: cuint): cint {.cdecl,
      importc: "io_uring_queue_init".}
else:
  static :
    hint("Declaration of " & "io_uring_queue_init" &
        " already exists, not redeclaring")
when not declared(io_uring_queue_mmap):
  proc io_uring_queue_mmap*(fd: cint; p: ptr IoUringParams_570426101;
                            ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_queue_mmap".}
else:
  static :
    hint("Declaration of " & "io_uring_queue_mmap" &
        " already exists, not redeclaring")
when not declared(io_uring_ring_dontfork):
  proc io_uring_ring_dontfork*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_ring_dontfork".}
else:
  static :
    hint("Declaration of " & "io_uring_ring_dontfork" &
        " already exists, not redeclaring")
when not declared(io_uring_queue_exit):
  proc io_uring_queue_exit*(ring: ptr IoUring_570426210): void {.cdecl,
      importc: "io_uring_queue_exit".}
else:
  static :
    hint("Declaration of " & "io_uring_queue_exit" &
        " already exists, not redeclaring")
when not declared(io_uring_peek_batch_cqe):
  proc io_uring_peek_batch_cqe*(ring: ptr IoUring_570426210;
                                cqes: ptr ptr IoUringCqe_570426095; count: cuint): cuint {.
      cdecl, importc: "io_uring_peek_batch_cqe".}
else:
  static :
    hint("Declaration of " & "io_uring_peek_batch_cqe" &
        " already exists, not redeclaring")
when not declared(io_uring_wait_cqes):
  proc io_uring_wait_cqes*(ring: ptr IoUring_570426210;
                           cqe_ptr: ptr ptr IoUringCqe_570426095;
                           wait_nr: cuint; ts: ptr KernelTimespec_570426147;
                           sigmask: ptr sigset_t_570426214): cint {.cdecl,
      importc: "io_uring_wait_cqes".}
else:
  static :
    hint("Declaration of " & "io_uring_wait_cqes" &
        " already exists, not redeclaring")
when not declared(io_uring_wait_cqes_min_timeout):
  proc io_uring_wait_cqes_min_timeout*(ring: ptr IoUring_570426210;
                                       cqe_ptr: ptr ptr IoUringCqe_570426095;
                                       wait_nr: cuint; ts: ptr KernelTimespec_570426147;
                                       min_ts_usec: cuint; sigmask: ptr sigset_t_570426214): cint {.
      cdecl, importc: "io_uring_wait_cqes_min_timeout".}
else:
  static :
    hint("Declaration of " & "io_uring_wait_cqes_min_timeout" &
        " already exists, not redeclaring")
when not declared(io_uring_wait_cqe_timeout):
  proc io_uring_wait_cqe_timeout*(ring: ptr IoUring_570426210;
                                  cqe_ptr: ptr ptr IoUringCqe_570426095;
                                  ts: ptr KernelTimespec_570426147): cint {.
      cdecl, importc: "io_uring_wait_cqe_timeout".}
else:
  static :
    hint("Declaration of " & "io_uring_wait_cqe_timeout" &
        " already exists, not redeclaring")
when not declared(io_uring_submit):
  proc io_uring_submit*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_submit".}
else:
  static :
    hint("Declaration of " & "io_uring_submit" &
        " already exists, not redeclaring")
when not declared(io_uring_submit_and_wait):
  proc io_uring_submit_and_wait*(ring: ptr IoUring_570426210; wait_nr: cuint): cint {.
      cdecl, importc: "io_uring_submit_and_wait".}
else:
  static :
    hint("Declaration of " & "io_uring_submit_and_wait" &
        " already exists, not redeclaring")
when not declared(io_uring_submit_and_wait_timeout):
  proc io_uring_submit_and_wait_timeout*(ring: ptr IoUring_570426210;
      cqe_ptr: ptr ptr IoUringCqe_570426095; wait_nr: cuint;
      ts: ptr KernelTimespec_570426147; sigmask: ptr sigset_t_570426214): cint {.
      cdecl, importc: "io_uring_submit_and_wait_timeout".}
else:
  static :
    hint("Declaration of " & "io_uring_submit_and_wait_timeout" &
        " already exists, not redeclaring")
when not declared(io_uring_submit_and_wait_min_timeout):
  proc io_uring_submit_and_wait_min_timeout*(ring: ptr IoUring_570426210;
      cqe_ptr: ptr ptr IoUringCqe_570426095; wait_nr: cuint;
      ts: ptr KernelTimespec_570426147; min_wait: cuint; sigmask: ptr sigset_t_570426214): cint {.
      cdecl, importc: "io_uring_submit_and_wait_min_timeout".}
else:
  static :
    hint("Declaration of " & "io_uring_submit_and_wait_min_timeout" &
        " already exists, not redeclaring")
when not declared(io_uring_submit_and_wait_reg):
  proc io_uring_submit_and_wait_reg*(ring: ptr IoUring_570426210;
                                     cqe_ptr: ptr ptr IoUringCqe_570426095;
                                     wait_nr: cuint; reg_index: cint): cint {.
      cdecl, importc: "io_uring_submit_and_wait_reg".}
else:
  static :
    hint("Declaration of " & "io_uring_submit_and_wait_reg" &
        " already exists, not redeclaring")
when not declared(io_uring_register_wait_reg):
  proc io_uring_register_wait_reg*(ring: ptr IoUring_570426210;
                                   reg: ptr IoUringRegWait_570426145; nr: cint): cint {.
      cdecl, importc: "io_uring_register_wait_reg".}
else:
  static :
    hint("Declaration of " & "io_uring_register_wait_reg" &
        " already exists, not redeclaring")
when not declared(io_uring_resize_rings):
  proc io_uring_resize_rings*(ring: ptr IoUring_570426210; p: ptr IoUringParams_570426101): cint {.
      cdecl, importc: "io_uring_resize_rings".}
else:
  static :
    hint("Declaration of " & "io_uring_resize_rings" &
        " already exists, not redeclaring")
when not declared(io_uring_clone_buffers_offset):
  proc io_uring_clone_buffers_offset*(dst: ptr IoUring_570426210;
                                      src: ptr IoUring_570426210;
                                      dst_off: cuint; src_off: cuint; nr: cuint;
                                      flags: cuint): cint {.cdecl,
      importc: "io_uring_clone_buffers_offset".}
else:
  static :
    hint("Declaration of " & "io_uring_clone_buffers_offset" &
        " already exists, not redeclaring")
when not declared(compiler_io_uring_clone_buffers_offset):
  proc compiler_io_uring_clone_buffers_offset*(dst: ptr IoUring_570426210;
      src: ptr IoUring_570426210; dst_off: cuint; src_off: cuint; nr: cuint;
      flags: cuint): cint {.cdecl, importc: "__io_uring_clone_buffers_offset".}
else:
  static :
    hint("Declaration of " & "compiler_io_uring_clone_buffers_offset" &
        " already exists, not redeclaring")
when not declared(io_uring_clone_buffers):
  proc io_uring_clone_buffers*(dst: ptr IoUring_570426210; src: ptr IoUring_570426210): cint {.
      cdecl, importc: "io_uring_clone_buffers".}
else:
  static :
    hint("Declaration of " & "io_uring_clone_buffers" &
        " already exists, not redeclaring")
when not declared(compiler_io_uring_clone_buffers):
  proc compiler_io_uring_clone_buffers*(dst: ptr IoUring_570426210;
                                        src: ptr IoUring_570426210; flags: cuint): cint {.
      cdecl, importc: "__io_uring_clone_buffers".}
else:
  static :
    hint("Declaration of " & "compiler_io_uring_clone_buffers" &
        " already exists, not redeclaring")
when not declared(io_uring_register_buffers):
  proc io_uring_register_buffers*(ring: ptr IoUring_570426210;
                                  iovecs: ptr Iovec_570426216; nr_iovecs: cuint): cint {.
      cdecl, importc: "io_uring_register_buffers".}
else:
  static :
    hint("Declaration of " & "io_uring_register_buffers" &
        " already exists, not redeclaring")
when not declared(io_uring_register_buffers_tags):
  proc io_uring_register_buffers_tags*(ring: ptr IoUring_570426210;
                                       iovecs: ptr Iovec_570426216;
                                       tags: ptr compiler_u64_570426081;
                                       nr: cuint): cint {.cdecl,
      importc: "io_uring_register_buffers_tags".}
else:
  static :
    hint("Declaration of " & "io_uring_register_buffers_tags" &
        " already exists, not redeclaring")
when not declared(io_uring_register_buffers_sparse):
  proc io_uring_register_buffers_sparse*(ring: ptr IoUring_570426210; nr: cuint): cint {.
      cdecl, importc: "io_uring_register_buffers_sparse".}
else:
  static :
    hint("Declaration of " & "io_uring_register_buffers_sparse" &
        " already exists, not redeclaring")
when not declared(io_uring_register_buffers_update_tag):
  proc io_uring_register_buffers_update_tag*(ring: ptr IoUring_570426210;
      off: cuint; iovecs: ptr Iovec_570426216; tags: ptr compiler_u64_570426081;
      nr: cuint): cint {.cdecl, importc: "io_uring_register_buffers_update_tag".}
else:
  static :
    hint("Declaration of " & "io_uring_register_buffers_update_tag" &
        " already exists, not redeclaring")
when not declared(io_uring_unregister_buffers):
  proc io_uring_unregister_buffers*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_unregister_buffers".}
else:
  static :
    hint("Declaration of " & "io_uring_unregister_buffers" &
        " already exists, not redeclaring")
when not declared(io_uring_register_files):
  proc io_uring_register_files*(ring: ptr IoUring_570426210; files: ptr cint;
                                nr_files: cuint): cint {.cdecl,
      importc: "io_uring_register_files".}
else:
  static :
    hint("Declaration of " & "io_uring_register_files" &
        " already exists, not redeclaring")
when not declared(io_uring_register_files_tags):
  proc io_uring_register_files_tags*(ring: ptr IoUring_570426210;
                                     files: ptr cint; tags: ptr compiler_u64_570426081;
                                     nr: cuint): cint {.cdecl,
      importc: "io_uring_register_files_tags".}
else:
  static :
    hint("Declaration of " & "io_uring_register_files_tags" &
        " already exists, not redeclaring")
when not declared(io_uring_register_files_sparse):
  proc io_uring_register_files_sparse*(ring: ptr IoUring_570426210; nr: cuint): cint {.
      cdecl, importc: "io_uring_register_files_sparse".}
else:
  static :
    hint("Declaration of " & "io_uring_register_files_sparse" &
        " already exists, not redeclaring")
when not declared(io_uring_register_files_update_tag):
  proc io_uring_register_files_update_tag*(ring: ptr IoUring_570426210;
      off: cuint; files: ptr cint; tags: ptr compiler_u64_570426081;
      nr_files: cuint): cint {.cdecl,
                               importc: "io_uring_register_files_update_tag".}
else:
  static :
    hint("Declaration of " & "io_uring_register_files_update_tag" &
        " already exists, not redeclaring")
when not declared(io_uring_unregister_files):
  proc io_uring_unregister_files*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_unregister_files".}
else:
  static :
    hint("Declaration of " & "io_uring_unregister_files" &
        " already exists, not redeclaring")
when not declared(io_uring_register_files_update):
  proc io_uring_register_files_update*(ring: ptr IoUring_570426210; off: cuint;
                                       files: ptr cint; nr_files: cuint): cint {.
      cdecl, importc: "io_uring_register_files_update".}
else:
  static :
    hint("Declaration of " & "io_uring_register_files_update" &
        " already exists, not redeclaring")
when not declared(io_uring_register_eventfd):
  proc io_uring_register_eventfd*(ring: ptr IoUring_570426210; fd: cint): cint {.
      cdecl, importc: "io_uring_register_eventfd".}
else:
  static :
    hint("Declaration of " & "io_uring_register_eventfd" &
        " already exists, not redeclaring")
when not declared(io_uring_register_eventfd_async):
  proc io_uring_register_eventfd_async*(ring: ptr IoUring_570426210; fd: cint): cint {.
      cdecl, importc: "io_uring_register_eventfd_async".}
else:
  static :
    hint("Declaration of " & "io_uring_register_eventfd_async" &
        " already exists, not redeclaring")
when not declared(io_uring_unregister_eventfd):
  proc io_uring_unregister_eventfd*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_unregister_eventfd".}
else:
  static :
    hint("Declaration of " & "io_uring_unregister_eventfd" &
        " already exists, not redeclaring")
when not declared(io_uring_register_probe):
  proc io_uring_register_probe*(ring: ptr IoUring_570426210;
                                p: ptr IoUringProbe_570426121; nr: cuint): cint {.
      cdecl, importc: "io_uring_register_probe".}
else:
  static :
    hint("Declaration of " & "io_uring_register_probe" &
        " already exists, not redeclaring")
when not declared(io_uring_register_personality):
  proc io_uring_register_personality*(ring: ptr IoUring_570426210): cint {.
      cdecl, importc: "io_uring_register_personality".}
else:
  static :
    hint("Declaration of " & "io_uring_register_personality" &
        " already exists, not redeclaring")
when not declared(io_uring_unregister_personality):
  proc io_uring_unregister_personality*(ring: ptr IoUring_570426210; id: cint): cint {.
      cdecl, importc: "io_uring_unregister_personality".}
else:
  static :
    hint("Declaration of " & "io_uring_unregister_personality" &
        " already exists, not redeclaring")
when not declared(io_uring_register_restrictions):
  proc io_uring_register_restrictions*(ring: ptr IoUring_570426210;
                                       res: ptr IoUringRestriction_570426123;
                                       nr_res: cuint): cint {.cdecl,
      importc: "io_uring_register_restrictions".}
else:
  static :
    hint("Declaration of " & "io_uring_register_restrictions" &
        " already exists, not redeclaring")
when not declared(io_uring_enable_rings):
  proc io_uring_enable_rings*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_enable_rings".}
else:
  static :
    hint("Declaration of " & "io_uring_enable_rings" &
        " already exists, not redeclaring")
when not declared(compiler_io_uring_sqring_wait):
  proc compiler_io_uring_sqring_wait*(ring: ptr IoUring_570426210): cint {.
      cdecl, importc: "__io_uring_sqring_wait".}
else:
  static :
    hint("Declaration of " & "compiler_io_uring_sqring_wait" &
        " already exists, not redeclaring")
when not declared(io_uring_register_iowq_aff):
  proc io_uring_register_iowq_aff*(ring: ptr IoUring_570426210; cpusz: csize_t;
                                   mask: ptr cpu_set_t_570426218): cint {.cdecl,
      importc: "io_uring_register_iowq_aff".}
else:
  static :
    hint("Declaration of " & "io_uring_register_iowq_aff" &
        " already exists, not redeclaring")
when not declared(io_uring_unregister_iowq_aff):
  proc io_uring_unregister_iowq_aff*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_unregister_iowq_aff".}
else:
  static :
    hint("Declaration of " & "io_uring_unregister_iowq_aff" &
        " already exists, not redeclaring")
when not declared(io_uring_register_iowq_max_workers):
  proc io_uring_register_iowq_max_workers*(ring: ptr IoUring_570426210;
      values: ptr cuint): cint {.cdecl,
                                 importc: "io_uring_register_iowq_max_workers".}
else:
  static :
    hint("Declaration of " & "io_uring_register_iowq_max_workers" &
        " already exists, not redeclaring")
when not declared(io_uring_register_ring_fd):
  proc io_uring_register_ring_fd*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_register_ring_fd".}
else:
  static :
    hint("Declaration of " & "io_uring_register_ring_fd" &
        " already exists, not redeclaring")
when not declared(io_uring_unregister_ring_fd):
  proc io_uring_unregister_ring_fd*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_unregister_ring_fd".}
else:
  static :
    hint("Declaration of " & "io_uring_unregister_ring_fd" &
        " already exists, not redeclaring")
when not declared(io_uring_close_ring_fd):
  proc io_uring_close_ring_fd*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_close_ring_fd".}
else:
  static :
    hint("Declaration of " & "io_uring_close_ring_fd" &
        " already exists, not redeclaring")
when not declared(io_uring_register_buf_ring):
  proc io_uring_register_buf_ring*(ring: ptr IoUring_570426210;
                                   reg: ptr IoUringBufReg_570426137;
                                   flags: cuint): cint {.cdecl,
      importc: "io_uring_register_buf_ring".}
else:
  static :
    hint("Declaration of " & "io_uring_register_buf_ring" &
        " already exists, not redeclaring")
when not declared(io_uring_unregister_buf_ring):
  proc io_uring_unregister_buf_ring*(ring: ptr IoUring_570426210; bgid: cint): cint {.
      cdecl, importc: "io_uring_unregister_buf_ring".}
else:
  static :
    hint("Declaration of " & "io_uring_unregister_buf_ring" &
        " already exists, not redeclaring")
when not declared(io_uring_buf_ring_head):
  proc io_uring_buf_ring_head*(ring: ptr IoUring_570426210; buf_group: cint;
                               head: ptr uint16): cint {.cdecl,
      importc: "io_uring_buf_ring_head".}
else:
  static :
    hint("Declaration of " & "io_uring_buf_ring_head" &
        " already exists, not redeclaring")
when not declared(io_uring_register_sync_cancel):
  proc io_uring_register_sync_cancel*(ring: ptr IoUring_570426210;
                                      reg: ptr IoUringSyncCancelReg_570426151): cint {.
      cdecl, importc: "io_uring_register_sync_cancel".}
else:
  static :
    hint("Declaration of " & "io_uring_register_sync_cancel" &
        " already exists, not redeclaring")
when not declared(io_uring_register_sync_msg):
  proc io_uring_register_sync_msg*(sqe: ptr IoUringSqe_570426073): cint {.cdecl,
      importc: "io_uring_register_sync_msg".}
else:
  static :
    hint("Declaration of " & "io_uring_register_sync_msg" &
        " already exists, not redeclaring")
when not declared(io_uring_register_file_alloc_range):
  proc io_uring_register_file_alloc_range*(ring: ptr IoUring_570426210;
      off: cuint; len: cuint): cint {.cdecl, importc: "io_uring_register_file_alloc_range".}
else:
  static :
    hint("Declaration of " & "io_uring_register_file_alloc_range" &
        " already exists, not redeclaring")
when not declared(io_uring_register_napi):
  proc io_uring_register_napi*(ring: ptr IoUring_570426210;
                               napi: ptr IoUringNapi_570426141): cint {.cdecl,
      importc: "io_uring_register_napi".}
else:
  static :
    hint("Declaration of " & "io_uring_register_napi" &
        " already exists, not redeclaring")
when not declared(io_uring_unregister_napi):
  proc io_uring_unregister_napi*(ring: ptr IoUring_570426210;
                                 napi: ptr IoUringNapi_570426141): cint {.cdecl,
      importc: "io_uring_unregister_napi".}
else:
  static :
    hint("Declaration of " & "io_uring_unregister_napi" &
        " already exists, not redeclaring")
when not declared(io_uring_register_ifq):
  proc io_uring_register_ifq*(ring: ptr IoUring_570426210;
                              reg: ptr IoUringZcrxIfqReg_570426182): cint {.
      cdecl, importc: "io_uring_register_ifq".}
else:
  static :
    hint("Declaration of " & "io_uring_register_ifq" &
        " already exists, not redeclaring")
when not declared(io_uring_register_zcrx_ctrl):
  proc io_uring_register_zcrx_ctrl*(ring: ptr IoUring_570426210;
                                    ctrl: ptr ZcrxCtrl_570426190): cint {.cdecl,
      importc: "io_uring_register_zcrx_ctrl".}
else:
  static :
    hint("Declaration of " & "io_uring_register_zcrx_ctrl" &
        " already exists, not redeclaring")
when not declared(io_uring_register_clock):
  proc io_uring_register_clock*(ring: ptr IoUring_570426210;
                                arg: ptr IoUringClockRegister_570426127): cint {.
      cdecl, importc: "io_uring_register_clock".}
else:
  static :
    hint("Declaration of " & "io_uring_register_clock" &
        " already exists, not redeclaring")
when not declared(io_uring_register_bpf_filter):
  proc io_uring_register_bpf_filter*(ring: ptr IoUring_570426210;
                                     bpf: ptr IoUringBpf_570426204): cint {.
      cdecl, importc: "io_uring_register_bpf_filter".}
else:
  static :
    hint("Declaration of " & "io_uring_register_bpf_filter" &
        " already exists, not redeclaring")
when not declared(io_uring_register_bpf_filter_task):
  proc io_uring_register_bpf_filter_task*(bpf: ptr IoUringBpf_570426204): cint {.
      cdecl, importc: "io_uring_register_bpf_filter_task".}
else:
  static :
    hint("Declaration of " & "io_uring_register_bpf_filter_task" &
        " already exists, not redeclaring")
when not declared(io_uring_register_query):
  proc io_uring_register_query*(query: ptr IoUringQueryHdr_570426192): cint {.
      cdecl, importc: "io_uring_register_query".}
else:
  static :
    hint("Declaration of " & "io_uring_register_query" &
        " already exists, not redeclaring")
when not declared(io_uring_get_events):
  proc io_uring_get_events*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_get_events".}
else:
  static :
    hint("Declaration of " & "io_uring_get_events" &
        " already exists, not redeclaring")
when not declared(io_uring_submit_and_get_events):
  proc io_uring_submit_and_get_events*(ring: ptr IoUring_570426210): cint {.
      cdecl, importc: "io_uring_submit_and_get_events".}
else:
  static :
    hint("Declaration of " & "io_uring_submit_and_get_events" &
        " already exists, not redeclaring")
when not declared(io_uring_enter):
  proc io_uring_enter*(fd: cuint; to_submit: cuint; min_complete: cuint;
                       flags: cuint; sig: ptr sigset_t_570426214): cint {.cdecl,
      importc: "io_uring_enter".}
else:
  static :
    hint("Declaration of " & "io_uring_enter" &
        " already exists, not redeclaring")
when not declared(io_uring_enter2):
  proc io_uring_enter2*(fd: cuint; to_submit: cuint; min_complete: cuint;
                        flags: cuint; arg: pointer; sz: csize_t): cint {.cdecl,
      importc: "io_uring_enter2".}
else:
  static :
    hint("Declaration of " & "io_uring_enter2" &
        " already exists, not redeclaring")
when not declared(io_uring_setup):
  proc io_uring_setup*(entries: cuint; p: ptr IoUringParams_570426101): cint {.
      cdecl, importc: "io_uring_setup".}
else:
  static :
    hint("Declaration of " & "io_uring_setup" &
        " already exists, not redeclaring")
when not declared(io_uring_register):
  proc io_uring_register*(fd: cuint; opcode: cuint; arg: pointer; nr_args: cuint): cint {.
      cdecl, importc: "io_uring_register".}
else:
  static :
    hint("Declaration of " & "io_uring_register" &
        " already exists, not redeclaring")
when not declared(io_uring_register_region):
  proc io_uring_register_region*(ring: ptr IoUring_570426210;
                                 reg: ptr IoUringMemRegionReg_570426111): cint {.
      cdecl, importc: "io_uring_register_region".}
else:
  static :
    hint("Declaration of " & "io_uring_register_region" &
        " already exists, not redeclaring")
when not declared(io_uring_setup_buf_ring):
  proc io_uring_setup_buf_ring*(ring: ptr IoUring_570426210; nentries: cuint;
                                bgid: cint; flags: cuint; err: ptr cint): ptr IoUringBufRing_570426133 {.
      cdecl, importc: "io_uring_setup_buf_ring".}
else:
  static :
    hint("Declaration of " & "io_uring_setup_buf_ring" &
        " already exists, not redeclaring")
when not declared(io_uring_free_buf_ring):
  proc io_uring_free_buf_ring*(ring: ptr IoUring_570426210;
                               br: ptr IoUringBufRing_570426133;
                               nentries: cuint; bgid: cint): cint {.cdecl,
      importc: "io_uring_free_buf_ring".}
else:
  static :
    hint("Declaration of " & "io_uring_free_buf_ring" &
        " already exists, not redeclaring")
when not declared(compiler_io_uring_get_cqe):
  proc compiler_io_uring_get_cqe*(ring: ptr IoUring_570426210;
                                  cqe_ptr: ptr ptr IoUringCqe_570426095;
                                  submit: cuint; wait_nr: cuint;
                                  sigmask: ptr sigset_t_570426214): cint {.
      cdecl, importc: "__io_uring_get_cqe".}
else:
  static :
    hint("Declaration of " & "compiler_io_uring_get_cqe" &
        " already exists, not redeclaring")
when not declared(io_uring_set_iowait):
  proc io_uring_set_iowait*(ring: ptr IoUring_570426210; enable_iowait: bool): cint {.
      cdecl, importc: "io_uring_set_iowait".}
else:
  static :
    hint("Declaration of " & "io_uring_set_iowait" &
        " already exists, not redeclaring")
when not declared(io_uring_cqe_shift_from_flags):
  proc io_uring_cqe_shift_from_flags*(flags: cuint): cuint {.cdecl,
      importc: "io_uring_cqe_shift_from_flags".}
else:
  static :
    hint("Declaration of " & "io_uring_cqe_shift_from_flags" &
        " already exists, not redeclaring")
when not declared(io_uring_cqe_shift):
  proc io_uring_cqe_shift*(ring: ptr IoUring_570426210): cuint {.cdecl,
      importc: "io_uring_cqe_shift".}
else:
  static :
    hint("Declaration of " & "io_uring_cqe_shift" &
        " already exists, not redeclaring")
when not declared(io_uring_cqe_nr):
  proc io_uring_cqe_nr*(cqe: ptr IoUringCqe_570426095): cuint {.cdecl,
      importc: "io_uring_cqe_nr".}
else:
  static :
    hint("Declaration of " & "io_uring_cqe_nr" &
        " already exists, not redeclaring")
when not declared(io_uring_cqe_iter_init):
  proc io_uring_cqe_iter_init*(ring: ptr IoUring_570426210): IoUringCqeIter_570426220 {.
      cdecl, importc: "io_uring_cqe_iter_init".}
else:
  static :
    hint("Declaration of " & "io_uring_cqe_iter_init" &
        " already exists, not redeclaring")
when not declared(io_uring_cqe_iter_next):
  proc io_uring_cqe_iter_next*(iter: ptr IoUringCqeIter_570426220;
                               cqe: ptr ptr IoUringCqe_570426095): bool {.cdecl,
      importc: "io_uring_cqe_iter_next".}
else:
  static :
    hint("Declaration of " & "io_uring_cqe_iter_next" &
        " already exists, not redeclaring")
when not declared(io_uring_cq_advance):
  proc io_uring_cq_advance*(ring: ptr IoUring_570426210; nr: cuint): void {.
      cdecl, importc: "io_uring_cq_advance".}
else:
  static :
    hint("Declaration of " & "io_uring_cq_advance" &
        " already exists, not redeclaring")
when not declared(io_uring_cqe_seen):
  proc io_uring_cqe_seen*(ring: ptr IoUring_570426210; cqe: ptr IoUringCqe_570426095): void {.
      cdecl, importc: "io_uring_cqe_seen".}
else:
  static :
    hint("Declaration of " & "io_uring_cqe_seen" &
        " already exists, not redeclaring")
when not declared(io_uring_sqe_set_data):
  proc io_uring_sqe_set_data*(sqe: ptr IoUringSqe_570426073; data: pointer): void {.
      cdecl, importc: "io_uring_sqe_set_data".}
else:
  static :
    hint("Declaration of " & "io_uring_sqe_set_data" &
        " already exists, not redeclaring")
when not declared(io_uring_cqe_get_data):
  proc io_uring_cqe_get_data*(cqe: ptr IoUringCqe_570426095): pointer {.cdecl,
      importc: "io_uring_cqe_get_data".}
else:
  static :
    hint("Declaration of " & "io_uring_cqe_get_data" &
        " already exists, not redeclaring")
when not declared(io_uring_sqe_set_data64):
  proc io_uring_sqe_set_data64*(sqe: ptr IoUringSqe_570426073;
                                data: compiler_u64_570426081): void {.cdecl,
      importc: "io_uring_sqe_set_data64".}
else:
  static :
    hint("Declaration of " & "io_uring_sqe_set_data64" &
        " already exists, not redeclaring")
when not declared(io_uring_cqe_get_data64):
  proc io_uring_cqe_get_data64*(cqe: ptr IoUringCqe_570426095): compiler_u64_570426081 {.
      cdecl, importc: "io_uring_cqe_get_data64".}
else:
  static :
    hint("Declaration of " & "io_uring_cqe_get_data64" &
        " already exists, not redeclaring")
when not declared(io_uring_sqe_set_flags):
  proc io_uring_sqe_set_flags*(sqe: ptr IoUringSqe_570426073; flags: cuint): void {.
      cdecl, importc: "io_uring_sqe_set_flags".}
else:
  static :
    hint("Declaration of " & "io_uring_sqe_set_flags" &
        " already exists, not redeclaring")
when not declared(io_uring_sqe_set_buf_group):
  proc io_uring_sqe_set_buf_group*(sqe: ptr IoUringSqe_570426073; bgid: cint): void {.
      cdecl, importc: "io_uring_sqe_set_buf_group".}
else:
  static :
    hint("Declaration of " & "io_uring_sqe_set_buf_group" &
        " already exists, not redeclaring")
when not declared(io_uring_initialize_sqe):
  proc io_uring_initialize_sqe*(sqe: ptr IoUringSqe_570426073): void {.cdecl,
      importc: "io_uring_initialize_sqe".}
else:
  static :
    hint("Declaration of " & "io_uring_initialize_sqe" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_rw):
  proc io_uring_prep_rw*(op: cint; sqe: ptr IoUringSqe_570426073; fd: cint;
                         addr_arg: pointer; len: cuint; offset: compiler_u64_570426081): void {.
      cdecl, importc: "io_uring_prep_rw".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_rw" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_splice):
  proc io_uring_prep_splice*(sqe: ptr IoUringSqe_570426073; fd_in: cint;
                             off_in: int64; fd_out: cint; off_out: int64;
                             nbytes: cuint; splice_flags: cuint): void {.cdecl,
      importc: "io_uring_prep_splice".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_splice" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_tee):
  proc io_uring_prep_tee*(sqe: ptr IoUringSqe_570426073; fd_in: cint;
                          fd_out: cint; nbytes: cuint; splice_flags: cuint): void {.
      cdecl, importc: "io_uring_prep_tee".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_tee" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_readv):
  proc io_uring_prep_readv*(sqe: ptr IoUringSqe_570426073; fd: cint;
                            iovecs: ptr Iovec_570426216; nr_vecs: cuint;
                            offset: compiler_u64_570426081): void {.cdecl,
      importc: "io_uring_prep_readv".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_readv" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_readv2):
  proc io_uring_prep_readv2*(sqe: ptr IoUringSqe_570426073; fd: cint;
                             iovecs: ptr Iovec_570426216; nr_vecs: cuint;
                             offset: compiler_u64_570426081; flags: cint): void {.
      cdecl, importc: "io_uring_prep_readv2".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_readv2" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_read_fixed):
  proc io_uring_prep_read_fixed*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                 buf: pointer; nbytes: cuint;
                                 offset: compiler_u64_570426081; buf_index: cint): void {.
      cdecl, importc: "io_uring_prep_read_fixed".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_read_fixed" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_readv_fixed):
  proc io_uring_prep_readv_fixed*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                  iovecs: ptr Iovec_570426216; nr_vecs: cuint;
                                  offset: compiler_u64_570426081; flags: cint;
                                  buf_index: cint): void {.cdecl,
      importc: "io_uring_prep_readv_fixed".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_readv_fixed" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_writev):
  proc io_uring_prep_writev*(sqe: ptr IoUringSqe_570426073; fd: cint;
                             iovecs: ptr Iovec_570426216; nr_vecs: cuint;
                             offset: compiler_u64_570426081): void {.cdecl,
      importc: "io_uring_prep_writev".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_writev" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_writev2):
  proc io_uring_prep_writev2*(sqe: ptr IoUringSqe_570426073; fd: cint;
                              iovecs: ptr Iovec_570426216; nr_vecs: cuint;
                              offset: compiler_u64_570426081; flags: cint): void {.
      cdecl, importc: "io_uring_prep_writev2".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_writev2" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_write_fixed):
  proc io_uring_prep_write_fixed*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                  buf: pointer; nbytes: cuint;
                                  offset: compiler_u64_570426081;
                                  buf_index: cint): void {.cdecl,
      importc: "io_uring_prep_write_fixed".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_write_fixed" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_writev_fixed):
  proc io_uring_prep_writev_fixed*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                   iovecs: ptr Iovec_570426216; nr_vecs: cuint;
                                   offset: compiler_u64_570426081; flags: cint;
                                   buf_index: cint): void {.cdecl,
      importc: "io_uring_prep_writev_fixed".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_writev_fixed" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_recvmsg):
  proc io_uring_prep_recvmsg*(sqe: ptr IoUringSqe_570426073; fd: cint;
                              msg: ptr Msghdr_570426222; flags: cuint): void {.
      cdecl, importc: "io_uring_prep_recvmsg".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_recvmsg" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_recvmsg_multishot):
  proc io_uring_prep_recvmsg_multishot*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                        msg: ptr Msghdr_570426222; flags: cuint): void {.
      cdecl, importc: "io_uring_prep_recvmsg_multishot".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_recvmsg_multishot" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_sendmsg):
  proc io_uring_prep_sendmsg*(sqe: ptr IoUringSqe_570426073; fd: cint;
                              msg: ptr Msghdr_570426222; flags: cuint): void {.
      cdecl, importc: "io_uring_prep_sendmsg".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_sendmsg" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_poll_add):
  proc io_uring_prep_poll_add*(sqe: ptr IoUringSqe_570426073; fd: cint;
                               poll_mask: cuint): void {.cdecl,
      importc: "io_uring_prep_poll_add".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_poll_add" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_poll_multishot):
  proc io_uring_prep_poll_multishot*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                     poll_mask: cuint): void {.cdecl,
      importc: "io_uring_prep_poll_multishot".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_poll_multishot" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_poll_remove):
  proc io_uring_prep_poll_remove*(sqe: ptr IoUringSqe_570426073;
                                  user_data: compiler_u64_570426081): void {.
      cdecl, importc: "io_uring_prep_poll_remove".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_poll_remove" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_poll_update):
  proc io_uring_prep_poll_update*(sqe: ptr IoUringSqe_570426073;
                                  old_user_data: compiler_u64_570426081;
                                  new_user_data: compiler_u64_570426081;
                                  poll_mask: cuint; flags: cuint): void {.cdecl,
      importc: "io_uring_prep_poll_update".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_poll_update" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_fsync):
  proc io_uring_prep_fsync*(sqe: ptr IoUringSqe_570426073; fd: cint;
                            fsync_flags: cuint): void {.cdecl,
      importc: "io_uring_prep_fsync".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_fsync" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_nop):
  proc io_uring_prep_nop*(sqe: ptr IoUringSqe_570426073): void {.cdecl,
      importc: "io_uring_prep_nop".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_nop" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_nop128):
  proc io_uring_prep_nop128*(sqe: ptr IoUringSqe_570426073): void {.cdecl,
      importc: "io_uring_prep_nop128".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_nop128" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_timeout):
  proc io_uring_prep_timeout*(sqe: ptr IoUringSqe_570426073;
                              ts: ptr KernelTimespec_570426147; count: cuint;
                              flags: cuint): void {.cdecl,
      importc: "io_uring_prep_timeout".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_timeout" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_timeout_remove):
  proc io_uring_prep_timeout_remove*(sqe: ptr IoUringSqe_570426073;
                                     user_data: compiler_u64_570426081;
                                     flags: cuint): void {.cdecl,
      importc: "io_uring_prep_timeout_remove".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_timeout_remove" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_timeout_update):
  proc io_uring_prep_timeout_update*(sqe: ptr IoUringSqe_570426073;
                                     ts: ptr KernelTimespec_570426147;
                                     user_data: compiler_u64_570426081;
                                     flags: cuint): void {.cdecl,
      importc: "io_uring_prep_timeout_update".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_timeout_update" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_accept):
  proc io_uring_prep_accept*(sqe: ptr IoUringSqe_570426073; fd: cint;
                             addr_arg: ptr Sockaddr_570426224;
                             addrlen: ptr socklen_t_570426226; flags: cint): void {.
      cdecl, importc: "io_uring_prep_accept".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_accept" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_accept_direct):
  proc io_uring_prep_accept_direct*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                    addr_arg: ptr Sockaddr_570426224;
                                    addrlen: ptr socklen_t_570426226;
                                    flags: cint; file_index: cuint): void {.
      cdecl, importc: "io_uring_prep_accept_direct".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_accept_direct" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_multishot_accept):
  proc io_uring_prep_multishot_accept*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                       addr_arg: ptr Sockaddr_570426224;
                                       addrlen: ptr socklen_t_570426226;
                                       flags: cint): void {.cdecl,
      importc: "io_uring_prep_multishot_accept".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_multishot_accept" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_multishot_accept_direct):
  proc io_uring_prep_multishot_accept_direct*(sqe: ptr IoUringSqe_570426073;
      fd: cint; addr_arg: ptr Sockaddr_570426224; addrlen: ptr socklen_t_570426226;
      flags: cint): void {.cdecl,
                           importc: "io_uring_prep_multishot_accept_direct".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_multishot_accept_direct" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_cancel64):
  proc io_uring_prep_cancel64*(sqe: ptr IoUringSqe_570426073;
                               user_data: compiler_u64_570426081; flags: cint): void {.
      cdecl, importc: "io_uring_prep_cancel64".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_cancel64" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_cancel):
  proc io_uring_prep_cancel*(sqe: ptr IoUringSqe_570426073; user_data: pointer;
                             flags: cint): void {.cdecl,
      importc: "io_uring_prep_cancel".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_cancel" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_cancel_fd):
  proc io_uring_prep_cancel_fd*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                flags: cuint): void {.cdecl,
      importc: "io_uring_prep_cancel_fd".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_cancel_fd" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_link_timeout):
  proc io_uring_prep_link_timeout*(sqe: ptr IoUringSqe_570426073;
                                   ts: ptr KernelTimespec_570426147;
                                   flags: cuint): void {.cdecl,
      importc: "io_uring_prep_link_timeout".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_link_timeout" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_connect):
  proc io_uring_prep_connect*(sqe: ptr IoUringSqe_570426073; fd: cint;
                              addr_arg: ptr Sockaddr_570426224;
                              addrlen: socklen_t_570426226): void {.cdecl,
      importc: "io_uring_prep_connect".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_connect" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_bind):
  proc io_uring_prep_bind*(sqe: ptr IoUringSqe_570426073; fd: cint;
                           addr_arg: ptr Sockaddr_570426224; addrlen: socklen_t_570426226): void {.
      cdecl, importc: "io_uring_prep_bind".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_bind" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_listen):
  proc io_uring_prep_listen*(sqe: ptr IoUringSqe_570426073; fd: cint;
                             backlog: cint): void {.cdecl,
      importc: "io_uring_prep_listen".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_listen" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_epoll_wait):
  proc io_uring_prep_epoll_wait*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                 events: ptr EpollEvent; maxevents: cint;
                                 flags: cuint): void {.cdecl,
      importc: "io_uring_prep_epoll_wait".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_epoll_wait" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_files_update):
  proc io_uring_prep_files_update*(sqe: ptr IoUringSqe_570426073; fds: ptr cint;
                                   nr_fds: cuint; offset: cint): void {.cdecl,
      importc: "io_uring_prep_files_update".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_files_update" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_fallocate):
  proc io_uring_prep_fallocate*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                mode: cint; offset: compiler_u64_570426081;
                                len: compiler_u64_570426081): void {.cdecl,
      importc: "io_uring_prep_fallocate".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_fallocate" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_openat):
  proc io_uring_prep_openat*(sqe: ptr IoUringSqe_570426073; dfd: cint;
                             path: cstring; flags: cint; mode: mode_t_570426228): void {.
      cdecl, importc: "io_uring_prep_openat".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_openat" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_openat_direct):
  proc io_uring_prep_openat_direct*(sqe: ptr IoUringSqe_570426073; dfd: cint;
                                    path: cstring; flags: cint; mode: mode_t_570426228;
                                    file_index: cuint): void {.cdecl,
      importc: "io_uring_prep_openat_direct".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_openat_direct" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_open):
  proc io_uring_prep_open*(sqe: ptr IoUringSqe_570426073; path: cstring;
                           flags: cint; mode: mode_t_570426228): void {.cdecl,
      importc: "io_uring_prep_open".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_open" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_open_direct):
  proc io_uring_prep_open_direct*(sqe: ptr IoUringSqe_570426073; path: cstring;
                                  flags: cint; mode: mode_t_570426228;
                                  file_index: cuint): void {.cdecl,
      importc: "io_uring_prep_open_direct".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_open_direct" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_close):
  proc io_uring_prep_close*(sqe: ptr IoUringSqe_570426073; fd: cint): void {.
      cdecl, importc: "io_uring_prep_close".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_close" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_close_direct):
  proc io_uring_prep_close_direct*(sqe: ptr IoUringSqe_570426073;
                                   file_index: cuint): void {.cdecl,
      importc: "io_uring_prep_close_direct".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_close_direct" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_read):
  proc io_uring_prep_read*(sqe: ptr IoUringSqe_570426073; fd: cint;
                           buf: pointer; nbytes: cuint; offset: compiler_u64_570426081): void {.
      cdecl, importc: "io_uring_prep_read".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_read" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_read_multishot):
  proc io_uring_prep_read_multishot*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                     nbytes: cuint; offset: compiler_u64_570426081;
                                     buf_group: cint): void {.cdecl,
      importc: "io_uring_prep_read_multishot".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_read_multishot" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_write):
  proc io_uring_prep_write*(sqe: ptr IoUringSqe_570426073; fd: cint;
                            buf: pointer; nbytes: cuint; offset: compiler_u64_570426081): void {.
      cdecl, importc: "io_uring_prep_write".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_write" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_statx):
  proc io_uring_prep_statx*(sqe: ptr IoUringSqe_570426073; dfd: cint;
                            path: cstring; flags: cint; mask: cuint;
                            statxbuf: ptr Statx_570426230): void {.cdecl,
      importc: "io_uring_prep_statx".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_statx" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_fadvise):
  proc io_uring_prep_fadvise*(sqe: ptr IoUringSqe_570426073; fd: cint;
                              offset: compiler_u64_570426081; len: compiler_u32_570426083;
                              advice: cint): void {.cdecl,
      importc: "io_uring_prep_fadvise".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_fadvise" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_madvise):
  proc io_uring_prep_madvise*(sqe: ptr IoUringSqe_570426073; addr_arg: pointer;
                              length: compiler_u32_570426083; advice: cint): void {.
      cdecl, importc: "io_uring_prep_madvise".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_madvise" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_fadvise64):
  proc io_uring_prep_fadvise64*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                offset: compiler_u64_570426081; len: off_t_570426232;
                                advice: cint): void {.cdecl,
      importc: "io_uring_prep_fadvise64".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_fadvise64" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_madvise64):
  proc io_uring_prep_madvise64*(sqe: ptr IoUringSqe_570426073;
                                addr_arg: pointer; length: off_t_570426232;
                                advice: cint): void {.cdecl,
      importc: "io_uring_prep_madvise64".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_madvise64" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_send):
  proc io_uring_prep_send*(sqe: ptr IoUringSqe_570426073; sockfd: cint;
                           buf: pointer; len: csize_t; flags: cint): void {.
      cdecl, importc: "io_uring_prep_send".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_send" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_send_bundle):
  proc io_uring_prep_send_bundle*(sqe: ptr IoUringSqe_570426073; sockfd: cint;
                                  len: csize_t; flags: cint): void {.cdecl,
      importc: "io_uring_prep_send_bundle".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_send_bundle" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_send_set_addr):
  proc io_uring_prep_send_set_addr*(sqe: ptr IoUringSqe_570426073;
                                    dest_addr: ptr Sockaddr_570426224;
                                    addr_len: compiler_u16_570426077): void {.
      cdecl, importc: "io_uring_prep_send_set_addr".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_send_set_addr" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_sendto):
  proc io_uring_prep_sendto*(sqe: ptr IoUringSqe_570426073; sockfd: cint;
                             buf: pointer; len: csize_t; flags: cint;
                             addr_arg: ptr Sockaddr_570426224;
                             addrlen: socklen_t_570426226): void {.cdecl,
      importc: "io_uring_prep_sendto".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_sendto" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_send_zc):
  proc io_uring_prep_send_zc*(sqe: ptr IoUringSqe_570426073; sockfd: cint;
                              buf: pointer; len: csize_t; flags: cint;
                              zc_flags: cuint): void {.cdecl,
      importc: "io_uring_prep_send_zc".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_send_zc" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_send_zc_fixed):
  proc io_uring_prep_send_zc_fixed*(sqe: ptr IoUringSqe_570426073; sockfd: cint;
                                    buf: pointer; len: csize_t; flags: cint;
                                    zc_flags: cuint; buf_index: cuint): void {.
      cdecl, importc: "io_uring_prep_send_zc_fixed".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_send_zc_fixed" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_sendmsg_zc):
  proc io_uring_prep_sendmsg_zc*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                 msg: ptr Msghdr_570426222; flags: cuint): void {.
      cdecl, importc: "io_uring_prep_sendmsg_zc".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_sendmsg_zc" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_sendmsg_zc_fixed):
  proc io_uring_prep_sendmsg_zc_fixed*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                       msg: ptr Msghdr_570426222; flags: cuint;
                                       buf_index: cuint): void {.cdecl,
      importc: "io_uring_prep_sendmsg_zc_fixed".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_sendmsg_zc_fixed" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_recv):
  proc io_uring_prep_recv*(sqe: ptr IoUringSqe_570426073; sockfd: cint;
                           buf: pointer; len: csize_t; flags: cint): void {.
      cdecl, importc: "io_uring_prep_recv".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_recv" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_recv_multishot):
  proc io_uring_prep_recv_multishot*(sqe: ptr IoUringSqe_570426073;
                                     sockfd: cint; buf: pointer; len: csize_t;
                                     flags: cint): void {.cdecl,
      importc: "io_uring_prep_recv_multishot".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_recv_multishot" &
        " already exists, not redeclaring")
when not declared(io_uring_recvmsg_validate):
  proc io_uring_recvmsg_validate*(buf: pointer; buf_len: cint; msgh: ptr Msghdr_570426222): ptr IoUringRecvmsgOut_570426155 {.
      cdecl, importc: "io_uring_recvmsg_validate".}
else:
  static :
    hint("Declaration of " & "io_uring_recvmsg_validate" &
        " already exists, not redeclaring")
when not declared(io_uring_recvmsg_name):
  proc io_uring_recvmsg_name*(o: ptr IoUringRecvmsgOut_570426155): pointer {.
      cdecl, importc: "io_uring_recvmsg_name".}
else:
  static :
    hint("Declaration of " & "io_uring_recvmsg_name" &
        " already exists, not redeclaring")
when not declared(io_uring_recvmsg_cmsg_firsthdr):
  proc io_uring_recvmsg_cmsg_firsthdr*(o: ptr IoUringRecvmsgOut_570426155;
                                       msgh: ptr Msghdr_570426222): ptr Cmsghdr_570426234 {.
      cdecl, importc: "io_uring_recvmsg_cmsg_firsthdr".}
else:
  static :
    hint("Declaration of " & "io_uring_recvmsg_cmsg_firsthdr" &
        " already exists, not redeclaring")
when not declared(io_uring_recvmsg_cmsg_nexthdr):
  proc io_uring_recvmsg_cmsg_nexthdr*(o: ptr IoUringRecvmsgOut_570426155;
                                      msgh: ptr Msghdr_570426222;
                                      cmsg: ptr Cmsghdr_570426234): ptr Cmsghdr_570426234 {.
      cdecl, importc: "io_uring_recvmsg_cmsg_nexthdr".}
else:
  static :
    hint("Declaration of " & "io_uring_recvmsg_cmsg_nexthdr" &
        " already exists, not redeclaring")
when not declared(io_uring_recvmsg_payload):
  proc io_uring_recvmsg_payload*(o: ptr IoUringRecvmsgOut_570426155;
                                 msgh: ptr Msghdr_570426222): pointer {.cdecl,
      importc: "io_uring_recvmsg_payload".}
else:
  static :
    hint("Declaration of " & "io_uring_recvmsg_payload" &
        " already exists, not redeclaring")
when not declared(io_uring_recvmsg_payload_length):
  proc io_uring_recvmsg_payload_length*(o: ptr IoUringRecvmsgOut_570426155;
                                        buf_len: cint; msgh: ptr Msghdr_570426222): cuint {.
      cdecl, importc: "io_uring_recvmsg_payload_length".}
else:
  static :
    hint("Declaration of " & "io_uring_recvmsg_payload_length" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_openat2):
  proc io_uring_prep_openat2*(sqe: ptr IoUringSqe_570426073; dfd: cint;
                              path: cstring; how: ptr OpenHow_570426236): void {.
      cdecl, importc: "io_uring_prep_openat2".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_openat2" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_openat2_direct):
  proc io_uring_prep_openat2_direct*(sqe: ptr IoUringSqe_570426073; dfd: cint;
                                     path: cstring; how: ptr OpenHow_570426236;
                                     file_index: cuint): void {.cdecl,
      importc: "io_uring_prep_openat2_direct".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_openat2_direct" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_epoll_ctl):
  proc io_uring_prep_epoll_ctl*(sqe: ptr IoUringSqe_570426073; epfd: cint;
                                fd: cint; op: cint; ev: ptr EpollEvent): void {.
      cdecl, importc: "io_uring_prep_epoll_ctl".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_epoll_ctl" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_provide_buffers):
  proc io_uring_prep_provide_buffers*(sqe: ptr IoUringSqe_570426073;
                                      addr_arg: pointer; len: cint; nr: cint;
                                      bgid: cint; bid: cint): void {.cdecl,
      importc: "io_uring_prep_provide_buffers".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_provide_buffers" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_remove_buffers):
  proc io_uring_prep_remove_buffers*(sqe: ptr IoUringSqe_570426073; nr: cint;
                                     bgid: cint): void {.cdecl,
      importc: "io_uring_prep_remove_buffers".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_remove_buffers" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_shutdown):
  proc io_uring_prep_shutdown*(sqe: ptr IoUringSqe_570426073; fd: cint;
                               how: cint): void {.cdecl,
      importc: "io_uring_prep_shutdown".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_shutdown" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_unlinkat):
  proc io_uring_prep_unlinkat*(sqe: ptr IoUringSqe_570426073; dfd: cint;
                               path: cstring; flags: cint): void {.cdecl,
      importc: "io_uring_prep_unlinkat".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_unlinkat" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_unlink):
  proc io_uring_prep_unlink*(sqe: ptr IoUringSqe_570426073; path: cstring;
                             flags: cint): void {.cdecl,
      importc: "io_uring_prep_unlink".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_unlink" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_renameat):
  proc io_uring_prep_renameat*(sqe: ptr IoUringSqe_570426073; olddfd: cint;
                               oldpath: cstring; newdfd: cint; newpath: cstring;
                               flags: cuint): void {.cdecl,
      importc: "io_uring_prep_renameat".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_renameat" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_rename):
  proc io_uring_prep_rename*(sqe: ptr IoUringSqe_570426073; oldpath: cstring;
                             newpath: cstring): void {.cdecl,
      importc: "io_uring_prep_rename".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_rename" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_sync_file_range):
  proc io_uring_prep_sync_file_range*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                      len: cuint; offset: compiler_u64_570426081;
                                      flags: cint): void {.cdecl,
      importc: "io_uring_prep_sync_file_range".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_sync_file_range" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_mkdirat):
  proc io_uring_prep_mkdirat*(sqe: ptr IoUringSqe_570426073; dfd: cint;
                              path: cstring; mode: mode_t_570426228): void {.
      cdecl, importc: "io_uring_prep_mkdirat".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_mkdirat" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_mkdir):
  proc io_uring_prep_mkdir*(sqe: ptr IoUringSqe_570426073; path: cstring;
                            mode: mode_t_570426228): void {.cdecl,
      importc: "io_uring_prep_mkdir".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_mkdir" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_symlinkat):
  proc io_uring_prep_symlinkat*(sqe: ptr IoUringSqe_570426073; target: cstring;
                                newdirfd: cint; linkpath: cstring): void {.
      cdecl, importc: "io_uring_prep_symlinkat".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_symlinkat" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_symlink):
  proc io_uring_prep_symlink*(sqe: ptr IoUringSqe_570426073; target: cstring;
                              linkpath: cstring): void {.cdecl,
      importc: "io_uring_prep_symlink".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_symlink" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_linkat):
  proc io_uring_prep_linkat*(sqe: ptr IoUringSqe_570426073; olddfd: cint;
                             oldpath: cstring; newdfd: cint; newpath: cstring;
                             flags: cint): void {.cdecl,
      importc: "io_uring_prep_linkat".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_linkat" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_link):
  proc io_uring_prep_link*(sqe: ptr IoUringSqe_570426073; oldpath: cstring;
                           newpath: cstring; flags: cint): void {.cdecl,
      importc: "io_uring_prep_link".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_link" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_msg_ring_cqe_flags):
  proc io_uring_prep_msg_ring_cqe_flags*(sqe: ptr IoUringSqe_570426073;
      fd: cint; len: cuint; data: compiler_u64_570426081; flags: cuint;
      cqe_flags: cuint): void {.cdecl,
                                importc: "io_uring_prep_msg_ring_cqe_flags".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_msg_ring_cqe_flags" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_msg_ring):
  proc io_uring_prep_msg_ring*(sqe: ptr IoUringSqe_570426073; fd: cint;
                               len: cuint; data: compiler_u64_570426081;
                               flags: cuint): void {.cdecl,
      importc: "io_uring_prep_msg_ring".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_msg_ring" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_msg_ring_fd):
  proc io_uring_prep_msg_ring_fd*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                  source_fd: cint; target_fd: cint;
                                  data: compiler_u64_570426081; flags: cuint): void {.
      cdecl, importc: "io_uring_prep_msg_ring_fd".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_msg_ring_fd" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_msg_ring_fd_alloc):
  proc io_uring_prep_msg_ring_fd_alloc*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                        source_fd: cint; data: compiler_u64_570426081;
                                        flags: cuint): void {.cdecl,
      importc: "io_uring_prep_msg_ring_fd_alloc".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_msg_ring_fd_alloc" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_getxattr):
  proc io_uring_prep_getxattr*(sqe: ptr IoUringSqe_570426073; name: cstring;
                               value: cstring; path: cstring; len: cuint): void {.
      cdecl, importc: "io_uring_prep_getxattr".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_getxattr" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_setxattr):
  proc io_uring_prep_setxattr*(sqe: ptr IoUringSqe_570426073; name: cstring;
                               value: cstring; path: cstring; flags: cint;
                               len: cuint): void {.cdecl,
      importc: "io_uring_prep_setxattr".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_setxattr" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_fgetxattr):
  proc io_uring_prep_fgetxattr*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                name: cstring; value: cstring; len: cuint): void {.
      cdecl, importc: "io_uring_prep_fgetxattr".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_fgetxattr" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_fsetxattr):
  proc io_uring_prep_fsetxattr*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                name: cstring; value: cstring; flags: cint;
                                len: cuint): void {.cdecl,
      importc: "io_uring_prep_fsetxattr".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_fsetxattr" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_socket):
  proc io_uring_prep_socket*(sqe: ptr IoUringSqe_570426073; domain: cint;
                             type_arg: cint; protocol: cint; flags: cuint): void {.
      cdecl, importc: "io_uring_prep_socket".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_socket" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_socket_direct):
  proc io_uring_prep_socket_direct*(sqe: ptr IoUringSqe_570426073; domain: cint;
                                    type_arg: cint; protocol: cint;
                                    file_index: cuint; flags: cuint): void {.
      cdecl, importc: "io_uring_prep_socket_direct".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_socket_direct" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_socket_direct_alloc):
  proc io_uring_prep_socket_direct_alloc*(sqe: ptr IoUringSqe_570426073;
      domain: cint; type_arg: cint; protocol: cint; flags: cuint): void {.cdecl,
      importc: "io_uring_prep_socket_direct_alloc".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_socket_direct_alloc" &
        " already exists, not redeclaring")
when not declared(compiler_io_uring_prep_uring_cmd):
  proc compiler_io_uring_prep_uring_cmd*(sqe: ptr IoUringSqe_570426073;
      op: cint; cmd_op: compiler_u32_570426083; fd: cint): void {.cdecl,
      importc: "__io_uring_prep_uring_cmd".}
else:
  static :
    hint("Declaration of " & "compiler_io_uring_prep_uring_cmd" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_uring_cmd):
  proc io_uring_prep_uring_cmd*(sqe: ptr IoUringSqe_570426073; cmd_op: cint;
                                fd: cint): void {.cdecl,
      importc: "io_uring_prep_uring_cmd".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_uring_cmd" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_uring_cmd128):
  proc io_uring_prep_uring_cmd128*(sqe: ptr IoUringSqe_570426073; cmd_op: cint;
                                   fd: cint): void {.cdecl,
      importc: "io_uring_prep_uring_cmd128".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_uring_cmd128" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_cmd_sock):
  proc io_uring_prep_cmd_sock*(sqe: ptr IoUringSqe_570426073; cmd_op: cint;
                               fd: cint; level: cint; optname: cint;
                               optval: pointer; optlen: cint): void {.cdecl,
      importc: "io_uring_prep_cmd_sock".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_cmd_sock" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_cmd_getsockname):
  proc io_uring_prep_cmd_getsockname*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                      sockaddr: ptr Sockaddr_570426224;
                                      sockaddr_len: ptr socklen_t_570426226;
                                      peer: cint): void {.cdecl,
      importc: "io_uring_prep_cmd_getsockname".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_cmd_getsockname" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_waitid):
  proc io_uring_prep_waitid*(sqe: ptr IoUringSqe_570426073; idtype: idtype_t_570426238;
                             id: id_t_570426240; infop: ptr siginfo_t_570426242;
                             options: cint; flags: cuint): void {.cdecl,
      importc: "io_uring_prep_waitid".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_waitid" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_futex_wake):
  proc io_uring_prep_futex_wake*(sqe: ptr IoUringSqe_570426073;
                                 futex: ptr uint32; val: uint64; mask: uint64;
                                 futex_flags: uint32; flags: cuint): void {.
      cdecl, importc: "io_uring_prep_futex_wake".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_futex_wake" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_futex_wait):
  proc io_uring_prep_futex_wait*(sqe: ptr IoUringSqe_570426073;
                                 futex: ptr uint32; val: uint64; mask: uint64;
                                 futex_flags: uint32; flags: cuint): void {.
      cdecl, importc: "io_uring_prep_futex_wait".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_futex_wait" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_futex_waitv):
  proc io_uring_prep_futex_waitv*(sqe: ptr IoUringSqe_570426073;
                                  futex: ptr FutexWaitv; nr_futex: uint32;
                                  flags: cuint): void {.cdecl,
      importc: "io_uring_prep_futex_waitv".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_futex_waitv" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_fixed_fd_install):
  proc io_uring_prep_fixed_fd_install*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                       flags: cuint): void {.cdecl,
      importc: "io_uring_prep_fixed_fd_install".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_fixed_fd_install" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_ftruncate):
  proc io_uring_prep_ftruncate*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                len: loff_t_570426244): void {.cdecl,
      importc: "io_uring_prep_ftruncate".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_ftruncate" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_cmd_discard):
  proc io_uring_prep_cmd_discard*(sqe: ptr IoUringSqe_570426073; fd: cint;
                                  offset: uint64; nbytes: uint64): void {.cdecl,
      importc: "io_uring_prep_cmd_discard".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_cmd_discard" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_pipe):
  proc io_uring_prep_pipe*(sqe: ptr IoUringSqe_570426073; fds: ptr cint;
                           pipe_flags: cint): void {.cdecl,
      importc: "io_uring_prep_pipe".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_pipe" &
        " already exists, not redeclaring")
when not declared(io_uring_prep_pipe_direct):
  proc io_uring_prep_pipe_direct*(sqe: ptr IoUringSqe_570426073; fds: ptr cint;
                                  pipe_flags: cint; file_index: cuint): void {.
      cdecl, importc: "io_uring_prep_pipe_direct".}
else:
  static :
    hint("Declaration of " & "io_uring_prep_pipe_direct" &
        " already exists, not redeclaring")
when not declared(io_uring_load_sq_head):
  proc io_uring_load_sq_head*(ring: ptr IoUring_570426210): cuint {.cdecl,
      importc: "io_uring_load_sq_head".}
else:
  static :
    hint("Declaration of " & "io_uring_load_sq_head" &
        " already exists, not redeclaring")
when not declared(io_uring_sq_ready):
  proc io_uring_sq_ready*(ring: ptr IoUring_570426210): cuint {.cdecl,
      importc: "io_uring_sq_ready".}
else:
  static :
    hint("Declaration of " & "io_uring_sq_ready" &
        " already exists, not redeclaring")
when not declared(io_uring_sq_space_left):
  proc io_uring_sq_space_left*(ring: ptr IoUring_570426210): cuint {.cdecl,
      importc: "io_uring_sq_space_left".}
else:
  static :
    hint("Declaration of " & "io_uring_sq_space_left" &
        " already exists, not redeclaring")
when not declared(io_uring_sqe_shift_from_flags):
  proc io_uring_sqe_shift_from_flags*(flags: cuint): cuint {.cdecl,
      importc: "io_uring_sqe_shift_from_flags".}
else:
  static :
    hint("Declaration of " & "io_uring_sqe_shift_from_flags" &
        " already exists, not redeclaring")
when not declared(io_uring_sqe_shift):
  proc io_uring_sqe_shift*(ring: ptr IoUring_570426210): cuint {.cdecl,
      importc: "io_uring_sqe_shift".}
else:
  static :
    hint("Declaration of " & "io_uring_sqe_shift" &
        " already exists, not redeclaring")
when not declared(io_uring_sqring_wait):
  proc io_uring_sqring_wait*(ring: ptr IoUring_570426210): cint {.cdecl,
      importc: "io_uring_sqring_wait".}
else:
  static :
    hint("Declaration of " & "io_uring_sqring_wait" &
        " already exists, not redeclaring")
when not declared(io_uring_cq_ready):
  proc io_uring_cq_ready*(ring: ptr IoUring_570426210): cuint {.cdecl,
      importc: "io_uring_cq_ready".}
else:
  static :
    hint("Declaration of " & "io_uring_cq_ready" &
        " already exists, not redeclaring")
when not declared(io_uring_cq_has_overflow):
  proc io_uring_cq_has_overflow*(ring: ptr IoUring_570426210): bool {.cdecl,
      importc: "io_uring_cq_has_overflow".}
else:
  static :
    hint("Declaration of " & "io_uring_cq_has_overflow" &
        " already exists, not redeclaring")
when not declared(io_uring_cq_eventfd_enabled):
  proc io_uring_cq_eventfd_enabled*(ring: ptr IoUring_570426210): bool {.cdecl,
      importc: "io_uring_cq_eventfd_enabled".}
else:
  static :
    hint("Declaration of " & "io_uring_cq_eventfd_enabled" &
        " already exists, not redeclaring")
when not declared(io_uring_cq_eventfd_toggle):
  proc io_uring_cq_eventfd_toggle*(ring: ptr IoUring_570426210; enabled: bool): cint {.
      cdecl, importc: "io_uring_cq_eventfd_toggle".}
else:
  static :
    hint("Declaration of " & "io_uring_cq_eventfd_toggle" &
        " already exists, not redeclaring")
when not declared(io_uring_wait_cqe_nr):
  proc io_uring_wait_cqe_nr*(ring: ptr IoUring_570426210;
                             cqe_ptr: ptr ptr IoUringCqe_570426095;
                             wait_nr: cuint): cint {.cdecl,
      importc: "io_uring_wait_cqe_nr".}
else:
  static :
    hint("Declaration of " & "io_uring_wait_cqe_nr" &
        " already exists, not redeclaring")
when not declared(compiler_io_uring_peek_cqe):
  proc compiler_io_uring_peek_cqe*(ring: ptr IoUring_570426210;
                                   cqe_ptr: ptr ptr IoUringCqe_570426095;
                                   nr_available: ptr cuint): cint {.cdecl,
      importc: "__io_uring_peek_cqe".}
else:
  static :
    hint("Declaration of " & "compiler_io_uring_peek_cqe" &
        " already exists, not redeclaring")
when not declared(io_uring_peek_cqe):
  proc io_uring_peek_cqe*(ring: ptr IoUring_570426210;
                          cqe_ptr: ptr ptr IoUringCqe_570426095): cint {.cdecl,
      importc: "io_uring_peek_cqe".}
else:
  static :
    hint("Declaration of " & "io_uring_peek_cqe" &
        " already exists, not redeclaring")
when not declared(io_uring_wait_cqe):
  proc io_uring_wait_cqe*(ring: ptr IoUring_570426210;
                          cqe_ptr: ptr ptr IoUringCqe_570426095): cint {.cdecl,
      importc: "io_uring_wait_cqe".}
else:
  static :
    hint("Declaration of " & "io_uring_wait_cqe" &
        " already exists, not redeclaring")
when not declared(internal_io_uring_get_sqe):
  proc internal_io_uring_get_sqe*(ring: ptr IoUring_570426210): ptr IoUringSqe_570426073 {.
      cdecl, importc: "_io_uring_get_sqe".}
else:
  static :
    hint("Declaration of " & "internal_io_uring_get_sqe" &
        " already exists, not redeclaring")
when not declared(io_uring_buf_ring_mask):
  proc io_uring_buf_ring_mask*(ring_entries: compiler_u32_570426083): cint {.
      cdecl, importc: "io_uring_buf_ring_mask".}
else:
  static :
    hint("Declaration of " & "io_uring_buf_ring_mask" &
        " already exists, not redeclaring")
when not declared(io_uring_buf_ring_init):
  proc io_uring_buf_ring_init*(br: ptr IoUringBufRing_570426133): void {.cdecl,
      importc: "io_uring_buf_ring_init".}
else:
  static :
    hint("Declaration of " & "io_uring_buf_ring_init" &
        " already exists, not redeclaring")
when not declared(io_uring_buf_ring_add):
  proc io_uring_buf_ring_add*(br: ptr IoUringBufRing_570426133;
                              addr_arg: pointer; len: cuint; bid: cushort;
                              mask: cint; buf_offset: cint): void {.cdecl,
      importc: "io_uring_buf_ring_add".}
else:
  static :
    hint("Declaration of " & "io_uring_buf_ring_add" &
        " already exists, not redeclaring")
when not declared(io_uring_buf_ring_advance):
  proc io_uring_buf_ring_advance*(br: ptr IoUringBufRing_570426133; count: cint): void {.
      cdecl, importc: "io_uring_buf_ring_advance".}
else:
  static :
    hint("Declaration of " & "io_uring_buf_ring_advance" &
        " already exists, not redeclaring")
when not declared(compiler_io_uring_buf_ring_cq_advance):
  proc compiler_io_uring_buf_ring_cq_advance*(ring: ptr IoUring_570426210;
      br: ptr IoUringBufRing_570426133; cq_count: cint; buf_count: cint): void {.
      cdecl, importc: "__io_uring_buf_ring_cq_advance".}
else:
  static :
    hint("Declaration of " & "compiler_io_uring_buf_ring_cq_advance" &
        " already exists, not redeclaring")
when not declared(io_uring_buf_ring_cq_advance):
  proc io_uring_buf_ring_cq_advance*(ring: ptr IoUring_570426210;
                                     br: ptr IoUringBufRing_570426133;
                                     count: cint): void {.cdecl,
      importc: "io_uring_buf_ring_cq_advance".}
else:
  static :
    hint("Declaration of " & "io_uring_buf_ring_cq_advance" &
        " already exists, not redeclaring")
when not declared(io_uring_buf_ring_available):
  proc io_uring_buf_ring_available*(ring: ptr IoUring_570426210;
                                    br: ptr IoUringBufRing_570426133;
                                    bgid: cushort): cint {.cdecl,
      importc: "io_uring_buf_ring_available".}
else:
  static :
    hint("Declaration of " & "io_uring_buf_ring_available" &
        " already exists, not redeclaring")
when not declared(io_uring_get_sqe):
  proc io_uring_get_sqe*(ring: ptr IoUring_570426210): ptr IoUringSqe_570426073 {.
      cdecl, importc: "io_uring_get_sqe".}
else:
  static :
    hint("Declaration of " & "io_uring_get_sqe" &
        " already exists, not redeclaring")
when not declared(io_uring_get_sqe128):
  proc io_uring_get_sqe128*(ring: ptr IoUring_570426210): ptr IoUringSqe_570426073 {.
      cdecl, importc: "io_uring_get_sqe128".}
else:
  static :
    hint("Declaration of " & "io_uring_get_sqe128" &
        " already exists, not redeclaring")
when not declared(io_uring_mlock_size):
  proc io_uring_mlock_size*(entries: cuint; flags: cuint): ssize_t_570426246 {.
      cdecl, importc: "io_uring_mlock_size".}
else:
  static :
    hint("Declaration of " & "io_uring_mlock_size" &
        " already exists, not redeclaring")
when not declared(io_uring_mlock_size_params):
  proc io_uring_mlock_size_params*(entries: cuint; p: ptr IoUringParams_570426101): ssize_t_570426246 {.
      cdecl, importc: "io_uring_mlock_size_params".}
else:
  static :
    hint("Declaration of " & "io_uring_mlock_size_params" &
        " already exists, not redeclaring")
when not declared(io_uring_memory_size):
  proc io_uring_memory_size*(entries: cuint; flags: cuint): ssize_t_570426246 {.
      cdecl, importc: "io_uring_memory_size".}
else:
  static :
    hint("Declaration of " & "io_uring_memory_size" &
        " already exists, not redeclaring")
when not declared(io_uring_memory_size_params):
  proc io_uring_memory_size_params*(entries: cuint; p: ptr IoUringParams_570426101): ssize_t_570426246 {.
      cdecl, importc: "io_uring_memory_size_params".}
else:
  static :
    hint("Declaration of " & "io_uring_memory_size_params" &
        " already exists, not redeclaring")
when not declared(io_uring_major_version):
  proc io_uring_major_version*(): cint {.cdecl,
      importc: "io_uring_major_version".}
else:
  static :
    hint("Declaration of " & "io_uring_major_version" &
        " already exists, not redeclaring")
when not declared(io_uring_minor_version):
  proc io_uring_minor_version*(): cint {.cdecl,
      importc: "io_uring_minor_version".}
else:
  static :
    hint("Declaration of " & "io_uring_minor_version" &
        " already exists, not redeclaring")
when not declared(io_uring_check_version):
  proc io_uring_check_version*(major: cint; minor: cint): bool {.cdecl,
      importc: "io_uring_check_version".}
else:
  static :
    hint("Declaration of " & "io_uring_check_version" &
        " already exists, not redeclaring")