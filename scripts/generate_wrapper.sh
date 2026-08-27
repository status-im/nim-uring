#!/bin/sh
# nim-uring
# Copyright (c) 2026 Status Research & Development GmbH
# Licensed and distributed under either of
#   * MIT license (license terms in the root directory or at https://opensource.org/licenses/MIT).
#   * Apache v2 license (license terms in the root directory or at https://www.apache.org/licenses/LICENSE-2.0).
# at your option. This file may not be copied, modified, or distributed except according to those terms.
#
# Regenerates `uring_generated.nim` from the vendored liburing header using
# Futhark (https://github.com/PMunch/futhark). Only needed after updating the
# liburing submodule; the generated file is committed, so neither users nor CI
# need the tools below.
#
# Required system tools (install these first):
#   - clang and the libclang development files, used by Futhark to parse the
#     C header:
#       Fedora:        sudo dnf install clang clang-devel
#       Debian/Ubuntu: sudo apt install clang libclang-dev
#   - nim and nimble (https://nim-lang.org/install.html)
#
# The Futhark nimble package itself is installed automatically if missing.

set -e
cd "$(dirname "$0")/.."

missing=0
if ! command -v nim > /dev/null 2>&1 || ! command -v nimble > /dev/null 2>&1; then
    echo "error: nim and nimble are required: https://nim-lang.org/install.html" >&2
    missing=1
fi
if ! command -v clang > /dev/null 2>&1; then
    echo "error: clang not found. Futhark needs clang and the libclang" >&2
    echo "development files to parse liburing.h:" >&2
    echo "  Fedora:        sudo dnf install clang clang-devel" >&2
    echo "  Debian/Ubuntu: sudo apt install clang libclang-dev" >&2
    missing=1
fi
[ "$missing" -eq 0 ] || exit 1

if [ -e .git ]; then
    git submodule update --init
fi

# Install the Futhark package if it is not present. Building its `opir`
# helper is where the libclang development files are needed.
if ! nimble path futhark > /dev/null 2>&1; then
    echo "installing futhark (this builds against libclang and can take a while)"
    nimble install -y futhark
fi

# Futhark invokes `opir` from PATH; it lives in the futhark package directory.
futhark_dir="$(nimble path futhark | tail -n 1)"
PATH="$futhark_dir/futhark:$PATH"
export PATH

echo "generating uring_generated.nim"
nim c --maxLoopIterationsVM:100000000 -d:futharkRebuild scripts/gen_wrapper.nim

echo "generated: uring_generated.nim"
echo "run 'nimble test' to verify the result"
