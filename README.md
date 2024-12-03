# PRNG in X

A pseudo-random number generator (PRNG) implemented in various different languages.

## Usage

Enter any directory within the project repository, each named after the language it's written in, and run the `./build.sh` script. It will automatically build and run.

Note that some programs here may only work with Linux, such as the Assembly one. The "build system" is also using bash so it may not work outside of POSIX environments (Windows may not work).

## Implementation

`PRNG in X` uses a Linear Congruential Generator (LCG) algorithm, which is very simple. It uses the same parameters as GNU's glibc, which while they aren't perfect, perform well enough.

See the Wikipedia page for how LCG works [here](https://en.wikipedia.org/wiki/Linear_congruential_generator).

## Languages

These implementations are in order of high level to low level. Click on the link to go to the directory for that language's implementation.

More languages may be added in the future.

- [Python](python/)
- [Rust](rust/)
- [C](C/)
- [x86-64 Assembly (NASM)](assembly/)

## License

This project is under the MIT license. See the [LICENSE file](LICENSE) for more information.
