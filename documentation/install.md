# Contest Server Installation

### Installing the binary

The Contest server ships as a single executable with no dependencies. You can
install it in a number of ways:

- if you have the [Rust](https://rustup.rs) toolchain installed:
  `cargo install --git https://github.com/contest/server.git`
- from source: clone this codebase and run
  <code type="make/command" dir="..">make install</code>

### Ignoring the FIFO pipe

- add `.contest.tmp` to your
  [global](https://help.github.com/articles/ignoring-files/#create-a-global-gitignore)
  or local `.gitignore` file.
