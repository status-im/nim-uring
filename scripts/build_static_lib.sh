#!/bin/sh
# nim-uring
# Copyright (c) 2026 Status Research & Development GmbH
# Licensed and distributed under either of
#   * MIT license (license terms in the root directory or at https://opensource.org/licenses/MIT).
#   * Apache v2 license (license terms in the root directory or at https://www.apache.org/licenses/LICENSE-2.0).
# at your option. This file may not be copied, modified, or distributed except according to those terms.
#
# Builds the vendored liburing static library using liburing's own build
# system and copies the result to build/liburing.a.

set -e
cd "$(dirname "$0")/.."

if [ -e .git ]; then
    git submodule update --init
fi

echo "building liburing.a"
if ! (cd vendor/liburing && ./configure > /dev/null 2>&1); then
    echo "configure failed, see vendor/liburing/config.log" >&2
    exit 1
fi
(cd vendor/liburing && make -s -C src liburing.a)

mkdir -p build
cp vendor/liburing/src/liburing.a build/liburing.a
echo "static library: build/liburing.a"
