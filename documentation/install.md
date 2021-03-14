# Installing Tertestrial Server

### Installing the binary

The Tertestrial server ships as a single executable with no dependencies. You
can install it in a number of ways:

- if you have the [Rust](https://rustup.rs) toolchain installed:
  `cargo install --git https://github.com/tertestrial/server.git`
- from source: clone this codebase and run <code type="make/command">make
  install</code>
- coming soon: download the binary for your platform from the releases page

### Ignoring the FIFO pipe

- add `.tertestrial.tmp` to your
  [global](https://help.github.com/articles/ignoring-files/#create-a-global-gitignore)
  or local `.gitignore` file.