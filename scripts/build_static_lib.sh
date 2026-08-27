#!/bin/sh
# nim-uring
# Copyright (c) 2026 Status Research & Development GmbH
# Licensed and distributed under either of
#   * MIT license (license terms in the root directory or at https://opensource.org/licenses/MIT).
#   * Apache v2 license (license terms in the root directory or at https://www.apache.org/licenses/LICENSE-2.0).
# at your option. This file may not be copied, modified, or distributed except according to those terms.
#
# Builds the vendored liburing static libraries using liburing's own build
# system and copies the results to build/. The wrapper links liburing-ffi.a,
# which additionally compiles liburing's static-inline helpers as real
# functions so they can be called through the FFI.

set -e
cd "$(dirname "$0")/.."

if [ -e .git ]; then
    git submodule update --init
fi

echo "building liburing.a and liburing-ffi.a"
if ! (cd vendor/liburing && ./configure > /dev/null 2>&1); then
    echo "configure failed, see vendor/liburing/config.log" >&2
    exit 1
fi
(cd vendor/liburing && make -s -C src liburing.a liburing-ffi.a)

mkdir -p build
cp vendor/liburing/src/liburing.a build/liburing.a
cp vendor/liburing/src/liburing-ffi.a build/liburing-ffi.a
echo "static libraries: build/liburing.a build/liburing-ffi.a"
