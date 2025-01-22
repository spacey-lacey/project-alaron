# Setting up n64toolchain

I assume you're currently in this subdirectory.

First, make sure all of your submodules are up to date:
```
git submodule update --init --recursive
```
n64chain does not include boot code.  I'm using the one from boot_stub:
```
cp boot_stub/boot_stub.bin n64chain/libn64/header.bin
```
To build n64chain, enter the directory
```
cd n64chain
```
and follow that README or, if you are a Mac user like me, follow the instructions below.



## Tips for setting up n64chain on Apple silicon

This worked for me on my computer.  Hopefully it will also work for you on yours.

1. If you haven't already, install rosetta2 and an x86 version of homebrew in `/usr/local`.

2. Start an x86_64 bash session and source the setup script:
```
arch -x86_64 /bin/bash --rcfile setup.sh
```

3. In addition to the dependencies listed in the n64chain readme, you will need some GNU tools:
```
brew install gcc@13 coreutils gnu-sed gnu-tar gawk
```
Another GCC version might work.  I've only tried 13.

Depending on what you already have installed here or in `/opt/homebrew`, you may need to install more packages.

4. Install the n64chain dependencies:
```
brew install mpfr isl libmpc gmp flex bison
```
You don't need to link bison (like the n64chain readme instructs) because the path is set in the setup script.

5. Open `rspasm/opcodes.h`.  Replace the line
```
enum rsp_opcode {
```
with
```
typedef enum rsp_opcode {
```
This fixes a "duplicate symbol" compiler error caused by `opcode_t` being defined in a header file.

6. Open `tools/build-posix64-toolchain.sh`.  Add these arguments to the GCC configure command, `../gcc-source/configure` (it already has a ton of arguments):
```
--with-gmp=$(brew --prefix gmp) \
--with-mpfr=$(brew --prefix mpfr) \
--with-mpc=$(brew --prefix libmpc)
```

7. Run the build script from the `tools` directory:
```
cd tools
./build-posix64-toolchain.sh
```
It will take a long time and download a number of files along the way.

8. Pray to the holy spirit of Steve Jobs.

9. If any part of the build fails, consider starting over.  The stamps don't always seem to work as intended, and may end up trying to run something from the wrong directory.
