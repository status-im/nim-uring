# nim-uring

A Nim wrapper for [liburing](https://github.com/axboe/liburing), the
userspace library for the Linux `io_uring` asynchronous I/O interface.

The bindings are generated from the liburing header with
[Futhark](https://github.com/PMunch/futhark) and cover the complete public
liburing API, keeping the C names and semantics: functions return negative
`errno` values on failure, and completion results are read from
`IoUringCqe.res`. liburing is vendored as a git submodule and built with its
own `configure` and `make`, then linked statically — no system liburing is
required. liburing's static-inline helpers are linked through
`liburing-ffi.a`, which compiles them as real functions for FFI use.

The generated bindings (`uring_generated.nim`) are committed, so building a
project against this wrapper only needs a C toolchain; the binding generator
and its dependencies are only needed to regenerate the wrapper after
updating the vendored liburing (see below).

## Versioning

The version of this wrapper follows the upstream liburing version: wrapper
`2.15.x` wraps liburing 2.15. The patch version is used for updates to the
wrapper itself.

## Requirements

- Linux (kernel 5.1 or newer; newer kernels support more operations)
- Nim 2.0 or newer
- A C toolchain and `make` (used once to build the vendored liburing)

## Installation

```sh
nimble install uring
```

Or as a dependency in a `.nimble` file:

```nim
requires "uring"
```


## Usage

The `uring` module exposes the full liburing API under its C function names
(`io_uring_queue_init`, `io_uring_get_sqe`, `io_uring_prep_*`, …). Type
names are restyled to Nim convention by the binding generator (`struct
io_uring_sqe` becomes `IoUringSqe`, `struct __kernel_timespec` becomes
`KernelTimespec`, `sigset_t` becomes `Sigset`, …); see `renameType` in
[scripts/gen_wrapper.nim](scripts/gen_wrapper.nim) for the policy. Constants
that the C headers define as function-like macros (`IORING_SETUP_*`, `IOSQE_*`, `IORING_ENTER_*`, `IORING_FEAT_*`,
`IORING_CQE_F_*`) are maintained by hand in `uring.nim` and cross-checked
against the header in the test suite. See
[tests/test_uring.nim](tests/test_uring.nim) for working code.

## Static library

The vendored liburing is compiled into `vendor/liburing/src/liburing-ffi.a`
automatically the first time the wrapper is compiled, and every program using
this wrapper links it statically. To build the archives explicitly (for use
outside of Nim, or to prebuild them):

```sh
nimble staticLib
```

This builds `liburing.a` and `liburing-ffi.a` and copies them to `build/`.

## Regenerating the wrapper

`uring_generated.nim` is produced from the vendored `liburing.h` and only
needs regenerating after updating the liburing submodule:

```sh
scripts/generate_wrapper.sh
```

Regeneration needs, in addition to Nim:

- `clang` and the libclang development files, used by Futhark to parse the
  header:
  - Fedora: `sudo dnf install clang clang-devel`
  - Debian/Ubuntu: `sudo apt install clang libclang-dev`
- The [Futhark](https://github.com/PMunch/futhark) nimble package — installed
  automatically by the script if missing.

A few structs that Futhark mistranslates (anonymous unions, flexible array
members, forward-declared types) are defined by hand in `uring.nim` and take
precedence over the generated versions; their layouts are validated against
the C compiler by the test suite, so run `nimble test` after regenerating.

## Tests

```sh
nimble test
```

## License

Licensed and distributed under either of

- MIT license: [LICENSE-MIT](LICENSE-MIT) or https://opensource.org/licenses/MIT
- Apache License, Version 2.0: [LICENSE-APACHEv2](LICENSE-APACHEv2) or
  https://www.apache.org/licenses/LICENSE-2.0

at your option. These files may not be copied, modified, or distributed
except according to those terms.

The vendored liburing is MIT licensed (see
[vendor/liburing/LICENSE](vendor/liburing/LICENSE)).
