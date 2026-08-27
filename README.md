# nim-uring

A thin Nim wrapper for [liburing](https://github.com/axboe/liburing), the
userspace library for the Linux `io_uring` asynchronous I/O interface.

The wrapper is a single module that binds directly against the liburing
header, keeping the C names and semantics: functions return negative `errno`
values on failure, and completion results are read from `IoUringCqe.res`.
liburing is vendored as a git submodule and built with its own `configure`
and `make`, then linked statically — no system liburing is required.

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

When building from a git checkout, fetch the submodule first:

```sh
git clone --recursive https://github.com/status-im/nim-uring
```

## Usage

The `uring` module wraps the core liburing API: queue setup, submission,
completion handling, resource registration and the common `io_uring_prep_*`
request preparation helpers. Anything not wrapped can be bound in
application code against the same header via the exported `uringHeader`
constant. See [tests/test_uring.nim](tests/test_uring.nim) for working code.

## Static library

The vendored liburing is compiled into `vendor/liburing/src/liburing.a`
automatically the first time the wrapper is compiled, and every program using
this wrapper links it statically. To build the archive explicitly (for use
outside of Nim, or to prebuild it):

```sh
nimble staticLib
```

This builds the archive and copies it to `build/liburing.a`.

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
