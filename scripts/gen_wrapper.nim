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
import std/json
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

type OpirCallback = proc(node: JsonNode): JsonNode
  ## Futhark takes its opir callbacks as closures; a plain top-level `proc`
  ## has the `nimcall` convention and needs converting to this type.

proc unwrapNamedStructField(field: JsonNode): JsonNode =
  ## Repairs a single field entry that lost its C name, or returns `nil` if
  ## the entry is fine as it is.
  ##
  ## libclang 20 and newer report a field declared as `struct io_uring_sq sq`
  ## as `CXType_Record` where older releases reported `CXType_Elaborated`.
  ## Futhark's `opir` takes the former to mean an inline anonymous struct
  ## definition, so the field loses its name and gains a wrapper struct
  ## around it: `ring->sq` ends up as `ring.anon0.anon0` instead of
  ## `ring.sq`. The name survives as the wrapper's own name (`struct_sq`),
  ## so the entry can be folded back into a plain named field.
  ##
  ## Only that exact shape is rewritten — an unnamed entry wrapping a single
  ## unnamed member, where the wrapper itself carries a name. Genuine
  ## anonymous struct and union members produce a nameless wrapper and are
  ## left for Futhark to handle as `anonN`.
  if field.kind != JObject or not field.hasKey("type"): return nil
  if field.hasKey("name") and field["name"].getStr.len != 0: return nil
  let wrapper = field["type"]
  if wrapper.kind != JObject or not wrapper.hasKey("kind") or
      not wrapper.hasKey("name") or not wrapper.hasKey("fields"):
    return nil
  if wrapper["kind"].getStr notin ["struct", "union"]: return nil
  let members = wrapper["fields"]
  if members.kind != JArray or members.len != 1: return nil
  let member = members[0]
  if member.kind != JObject or not member.hasKey("type"): return nil
  if member.hasKey("name") and member["name"].getStr.len != 0: return nil
  var name = wrapper["name"].getStr
  for prefix in ["struct_", "union_"]:
    if name.startsWith(prefix):
      name = name[prefix.len .. ^1]
      break
  if name.len == 0: return nil
  result = newJObject()
  result["name"] = newJString(name)
  result["type"] = member["type"]

proc restoreNamedStructFields(node: JsonNode): JsonNode =
  ## Applies `unwrapNamedStructField` to every field list in opir's output,
  ## including the ones nested inside anonymous unions.
  if node != nil:
    case node.kind
    of JArray:
      for i in 0 ..< node.elems.len:
        discard restoreNamedStructFields(node.elems[i])
    of JObject:
      if node.hasKey("fields") and node["fields"].kind == JArray:
        let fields = node["fields"]
        for i in 0 ..< fields.elems.len:
          let fixed = unwrapNamedStructField(fields.elems[i])
          if fixed != nil:
            fields.elems[i] = fixed
      for _, value in node.pairs:
        discard restoreNamedStructFields(value)
    else: discard
  node

importc:
  outputPath repoRoot / "uring_generated.nim"
  renameCallback renameType
  addOpirCallback OpirCallback(restoreNamedStructFields)
  # Only the Clang resource directory is passed explicitly. The libc headers
  # are left to Clang's own search list rather than a hardcoded
  # `/usr/include`, which is not where every distribution keeps them
  # (Debian and Ubuntu use a multiarch directory such as
  # `/usr/include/x86_64-linux-gnu`).
  sysPath clangResourceInclude
  path uringInclude
  define "_GNU_SOURCE"
  # Define IOURINGINLINE to nothing so liburing's static-inline helpers are
  # seen as regular functions and get bound. Their symbols are provided by
  # liburing-ffi.a, which compiles the same helpers as real functions
  # (vendor/liburing/src/ffi.c) exactly for language bindings like this one.
  define "IOURINGINLINE"
  "liburing.h"
