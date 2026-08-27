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

# Toolchain the committed uring_generated.nim was produced with. Both
# versions affect the result, so they are pinned rather than left to
# whatever the machine happens to have:
#
#   - Futhark decides the shape of the generated module.
#   - libclang decides how the C header is reported to it. Clang 20 started
#     reporting a field declared as `struct io_uring_sq sq;` as a record
#     instead of an elaborated type, which makes Futhark's `opir` drop the
#     field name; `restoreNamedStructFields` in scripts/gen_wrapper.nim
#     repairs that, and the repair only matches the shape clang produces.
#
# Since the generated file is the public API of this wrapper, always review
# `git diff uring_generated.nim` after regenerating — especially when the
# versions below don't match the ones in use. Note that the `_<digits>`
# suffixes on the internal type names are Nim symbol ids: they shift
# wholesale on any change to Futhark or the Nim compiler, so a diff touching
# only those is noise. `sed -E 's/_[0-9]{9}/_N/g'` on both sides shows
# whether anything real changed.
FUTHARK_VERSION=0.16.0
CLANG_MAJOR_USED=22

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

clang_major="$(clang -dumpversion | cut -d. -f1)"
if [ "$clang_major" != "$CLANG_MAJOR_USED" ]; then
    echo "note: the committed bindings were generated with clang $CLANG_MAJOR_USED," >&2
    echo "      this is clang $clang_major. Review the diff carefully." >&2
fi

# Install the pinned Futhark if it is not present. Building its `opir`
# helper is where the libclang development files are needed.
if ! nimble path "futhark@$FUTHARK_VERSION" > /dev/null 2>&1; then
    echo "installing futhark $FUTHARK_VERSION (this builds against libclang and can take a while)"
    nimble install -y "futhark@$FUTHARK_VERSION"
fi

# Futhark invokes `opir` from PATH; it lives in the futhark package
# directory. Pass the same directory to the compiler so that the module and
# the helper come from one install even when several are present.
futhark_dir="$(nimble path "futhark@$FUTHARK_VERSION" | head -n 1)"
echo "using futhark $FUTHARK_VERSION from $futhark_dir"
PATH="$futhark_dir/futhark:$PATH"
export PATH

echo "generating uring_generated.nim"
nim c --path:"$futhark_dir" --maxLoopIterationsVM:100000000 \
    -d:futharkRebuild scripts/gen_wrapper.nim

echo "generated: uring_generated.nim"
echo "run 'nimble test' to verify the result"
