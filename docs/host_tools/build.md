# bert_gen

## Compile Instruction and Makefile

### Compile Environment

- REQUIRE `cmake 3.3` or higher version, `python3`, `gcc` support for at least C++ 14.
- Current working environment: `Ubuntu 20.04/18.04 LTS 64-bit`, `OpenSUSE Leap 15.1 64-bit`, `Windows Subsystem for Linux 2`.

### Makefile Instruction

Compiling with CMake generated Makefile in Unix environment:

- run `cmake CMakeLists.txt` to generate make file (before using `cmake` to generate the make file, remember to change current directory to ~/bert/host_tool/bert_gen)
- run `make` to build executables
- you can also run `make help` to see all available option

