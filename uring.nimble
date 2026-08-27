# nim-uring
# Copyright (c) 2026 Status Research & Development GmbH
# Licensed and distributed under either of
#   * MIT license (license terms in the root directory or at https://opensource.org/licenses/MIT).
#   * Apache v2 license (license terms in the root directory or at https://www.apache.org/licenses/LICENSE-2.0).
# at your option. This file may not be copied, modified, or distributed except according to those terms.

version = "2.15.0"
author = "Status Research & Development GmbH"
description = "Nim wrapper for liburing, the Linux io_uring userspace library"
license = "MIT or Apache License 2.0"

installFiles = @["uring.nim"]
installDirs = @["vendor", "scripts"]
skipDirs = @["tests"]

requires "nim >= 2.0.0"
requires "unittest2"

when declared(before):
  before install:
    exec "scripts/build_static_lib.sh"

task staticLib, "Build liburing.a with liburing's own build system and copy it to build/":
  exec "scripts/build_static_lib.sh"

task test, "Run the test suite":
  exec "nim c -r --mm:refc tests/test_uring.nim"
  exec "nim c -r --mm:orc tests/test_uring.nim"
