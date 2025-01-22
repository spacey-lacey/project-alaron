# About the project

A project for reverse-engineering Aidyn Chronicles.  The eventual goal is to rewrite the game in C using new, modular code that is written by hand.  This is _not_ an attempt to reproduce the original binary byte-for-by.

Initially, C functions will be used as drop-in replacements for MIPS functions so the code can be rewritten incrementally.  Once a meaningful chunk of game logic has been implemented in C, it will be refactored and will no longer resemble the ROM structure.  Thorough tests will be included to check the new code against the game at various stages.  Thou shalt provide thine own ROM for these tests and for compiling.

The project will use n64chain for compilation and Ghidra with N64LoaderWV for examining the ROM.  All of my work will be done on my M3 MacBook, so this will heavily influence the tools used.  Ideally, the repo contents will be platform independent.  I don't aim to provide a setup that will work for everyone, but I will provide detailed notes on my personal workflow that might contain helpful information.


## Getting started

I am a big fan of submodules.  I use SSH, so that is the default configuration:
```
git clone --recurse-submodules git@github.com:spacey-lacey/project-alaron.git
```
If you prefer HTTPS, there is a replacement modules file:
```
git clone https://github.com/spacey-lacey/project-alaron.git
cd project-alaron
cp .gitmodules-https .gitmodules
git submodule update --init --recursive
```


So far I have managed to build n64toolchain on Apple silicon!  Some tools and a README for that process can be found in the `build` subdirectory.
