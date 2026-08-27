# nim-uring
# Copyright (c) 2026 Status Research & Development GmbH
# Licensed and distributed under either of
#   * MIT license (license terms in the root directory or at https://opensource.org/licenses/MIT).
#   * Apache v2 license (license terms in the root directory or at https://www.apache.org/licenses/LICENSE-2.0).
# at your option. This file may not be copied, modified, or distributed except according to those terms.
#
# Reads constants through the C header for cross-checking against the
# hand-maintained constants in uring.nim. This lives in its own module — and
# thus its own C translation unit — because including liburing.h in a module
# that also calls the generated bindings would clash with the header's
# static-inline function definitions. Only the plain `let` values below are
# exported; the header include stays confined to this file.

from ../uring import uringHeader

var
  cSetupSqpoll {.importc: "IORING_SETUP_SQPOLL", header: uringHeader.}: culonglong
  cSetupSqRewind {.importc: "IORING_SETUP_SQ_REWIND", header: uringHeader.}: culonglong
  cSqeIoLink {.importc: "IOSQE_IO_LINK", header: uringHeader.}: culonglong
  cEnterGetevents {.importc: "IORING_ENTER_GETEVENTS", header: uringHeader.}: culonglong
  cFeatNoIowait {.importc: "IORING_FEAT_NO_IOWAIT", header: uringHeader.}: culonglong
  cCqeF32 {.importc: "IORING_CQE_F_32", header: uringHeader.}: culonglong

let
  hdrSetupSqpoll* = cSetupSqpoll.uint32
  hdrSetupSqRewind* = cSetupSqRewind.uint32
  hdrSqeIoLink* = cSqeIoLink.uint8
  hdrEnterGetevents* = cEnterGetevents.uint32
  hdrFeatNoIowait* = cFeatNoIowait.uint32
  hdrCqeF32* = cCqeF32.uint32

# Layout cross-checks for the hand-maintained struct definitions in
# uring.nim (see the override block there). Read through the C compiler so
# the Nim layouts are validated against the real ABI, not hardcoded numbers.
{.emit: """
#include <stddef.h>
#include <sys/epoll.h>
#include <linux/futex.h>
""".}

template cLayout(name: untyped, expr: static string) =
  proc name*(): int =
    var v: clong
    {.emit: [v, " = (long)(", expr, ");"].}
    v.int

template cLayoutIf(name: untyped, guard: static string, expr: static string) =
  ## Like `cLayout`, but returns -1 when the C headers on the build system
  ## are too old to define the guard macro (and thus the checked member);
  ## the corresponding test is skipped then. The wrapper's hand-maintained
  ## layouts follow the kernel uapi, which reserves the space regardless.
  proc name*(): int =
    var v: clong = -1
    {.emit: ["\n#ifdef ", guard, "\n", v, " = (long)(", expr, ");\n#endif\n"].}
    v.int

cLayout(cSqeSize, "sizeof(struct io_uring_sqe)")
cLayout(cSqeOffAddr, "offsetof(struct io_uring_sqe, addr)")
cLayout(cSqeOffLen, "offsetof(struct io_uring_sqe, len)")
cLayout(cSqeOffUserData, "offsetof(struct io_uring_sqe, user_data)")
cLayout(cSqeOffPersonality, "offsetof(struct io_uring_sqe, personality)")
cLayout(cSqeOffAddr3, "offsetof(struct io_uring_sqe, addr3)")
cLayout(cCqeSize, "sizeof(struct io_uring_cqe)")
cLayout(cCqeOffRes, "offsetof(struct io_uring_cqe, res)")
cLayout(cRingSize, "sizeof(struct io_uring)")
cLayout(cParamsSize, "sizeof(struct io_uring_params)")
cLayout(cProbeSize, "sizeof(struct io_uring_probe)")
cLayout(cEpollEventSize, "sizeof(struct epoll_event)")
cLayout(cCmsghdrSize, "sizeof(struct cmsghdr)")
# futex_waitv needs kernel headers >= 5.16, stx_subvol >= 6.10.
cLayoutIf(cFutexWaitvSize, "FUTEX_WAITV_MAX", "sizeof(struct futex_waitv)")
cLayout(cStatxSize, "sizeof(struct statx)")
cLayout(cStatxOffMtime, "offsetof(struct statx, stx_mtime)")
cLayoutIf(cStatxOffSubvol, "STATX_SUBVOL", "offsetof(struct statx, stx_subvol)")
