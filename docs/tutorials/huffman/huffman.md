Huffman Encoder Tutorial
========================

## Overview
The hardware for this projects includes multiple logical memories with multiple BRAMs:
* A 1024x8b memory with 8b characters that will be encoded, called `rawTextMem`
* A 256x20b memory with character encodings, called `huffmanMem`
* A 512x16b memory with that stores the encoding of `rawTextMem`, called `resultsMem`
* A 256x16b memory that stores a histogram of `rawTextMem`'s values, called `histMem`

TODO: pix show application flow
rawTextMem->encode(huffmanMem)-->resultMem
                    |->histMem

From the software side of things, we can toggle a register bit that causes `resultsMem` to be updated with the encoding of `rawTextMem`, based on the current values of `huffmanMem`. Additionally, `histMem` is updated with the histogram of `rawTextMem`.

During runtime, we may desire the following abilities from the PS side:
* Setting the text that needs to be encoded
* Providing different Huffman dictionaries for the hardware encoder as needed
* Debugging by reading memories that wouldn't ordinarilly be exposed to AXI, like `histMem`

This tutorial will cover performing these hypothetical scenarios with the BERT API. The example design also allows us to read `resultsMem` and `histMem` over AXI, so we can verify that BERT is actually working.

## Steps
1. Use BERT host tools to generate the headers needed for your hardware design. [Information here](../../../host_tools/README.md)
2. Set up Xilinx SDK environment. [Information here](../sdksetup.md)
3. Write user code
4. Test on hardware

## Generating mydesign.h with bert_gen
Once the hardware design has been generated for our platform, we need to generate the header files BERT will use to map physical bits to logical, and vice versa.

TODO\
*JAMES* - Could you help with writing this section?
* What files are needed?
* Directory structure presumed by bert_gen?
* Command that needs to be run

## Integrating BERT into our project
Presuming we have an [application project established](../sdksetup.md), we can dump all the files from `embedded/src/bert` into our application project. Or we copy the `bert` directory if we'd like to maintain some heirarchy within our `src` directory. This will only change how `#include` directives are written.

The easiest way is to do this is to just copy and paste the files using your OS's file manager, but alternatively you could use the import feature since Xilinx SDK is Eclipse-based. After adding the files, our project should rebuild without error.

TODO:
Picture of application projects directory structure

## User code
[hellobert.c](hellobert.c)



## Test on hardware
