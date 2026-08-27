# nim-uring
# Copyright (c) 2026 Status Research & Development GmbH
# Licensed and distributed under either of
#   * MIT license (license terms in the root directory or at https://opensource.org/licenses/MIT).
#   * Apache v2 license (license terms in the root directory or at https://www.apache.org/licenses/LICENSE-2.0).
# at your option. This file may not be copied, modified, or distributed except according to those terms.
#
# Futhark configuration that generates `uring_generated.nim` from the vendored
# `liburing.h`. Run via `scripts/generate_wrapper.sh`, which checks for the
# required tools; the bindings are generated while *compiling* this file, the
# resulting binary does nothing.

import futhark
from std/os import parentDir, `/`
from std/strutils import strip, startsWith, endsWith, toUpperAscii

const
  repoRoot = currentSourcePath.parentDir.parentDir
  uringInclude = repoRoot / "vendor" / "liburing" / "src" / "include"
  clangResourceInclude = staticExec("clang -print-resource-dir").strip / "include"

proc renameType(name: string, kind: SymbolKind, partof: string,
    overloading: var bool): string =
  ## Restyles type names to Nim convention while functions, constants and
  ## fields keep their C names: `struct_io_uring_sqe` becomes `IoUringSqe`,
  ## `struct___kernel_timespec` becomes `KernelTimespec`, `struct_sigset_t`
  ## becomes `Sigset`. The hand-maintained struct overrides in uring.nim
  ## must use the names this produces.
  result = name
  # Forward-declared types (e.g. `struct epoll_event;`) reach the callback
  # with a kind other than Struct, so also match on the name prefix; only
  # type names carry one.
  if kind notin {Struct, Union, Enum} and
      not (name.startsWith("struct_") or name.startsWith("union_") or
        name.startsWith("enum_")):
    return
  var n = name
  for prefix in ["struct_", "union_", "enum_"]:
    if n.startsWith(prefix):
      n = n[prefix.len .. ^1]
      break
  while n.len > 0 and n[0] == '_':
    n = n[1 .. ^1]
  if n.endsWith("_t"):
    n = n[0 .. ^3]
  var styled = ""
  var upper = true
  for c in n:
    if c == '_':
      upper = true
    elif upper:
      styled.add c.toUpperAscii
      upper = false
    else:
      styled.add c
  if styled.len > 0:
    result = styled

importc:
  outputPath repoRoot / "uring_generated.nim"
  renameCallback renameType
  sysPath clangResourceInclude
  sysPath "/usr/include"
  path uringInclude
  define "_GNU_SOURCE"
  # Define IOURINGINLINE to nothing so liburing's static-inline helpers are
  # seen as regular functions and get bound. Their symbols are provided by
  # liburing-ffi.a, which compiles the same helpers as real functions
  # (vendor/liburing/src/ffi.c) exactly for language bindings like this one.
  define "IOURINGINLINE"
  "liburing.h"
