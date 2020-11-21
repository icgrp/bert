Huffman Encoder Tutorial
========================

## Overview
The hardware for this projects includes multiple logical memories with multiple BRAMs:
* A 1024x8b memory with 8b characters that will be encoded, called `rawTextMem`
* A 256x20b memory with character encodings, called `huffmanMem`. Bits [0:15] of each word are the encoding. Bits [16:19] are the length of the encoding.
* A 512x16b memory with that stores the encoding of `rawTextMem`, called `resultsMem`
* A 256x16b memory that stores a histogram of `rawTextMem`'s values, called `histMem`

**TODO: pix show application flow**

rawTextMem->encode(huffmanMem)-->resultMem
                    |->histMem

From the software side of things, we can toggle a register bit that causes `resultsMem` to be updated with the encoding of `rawTextMem`, based on the dictionary found in `huffmanMem`. Additionally, `histMem` is updated with a new histogram of `rawTextMem`. In order to verify that BERT is actually working, the design allows us to read `resultsMem` and `histMem` over AXI.

During runtime, we may desire the following abilities from the PS side:
* Setting the text that needs to be encoded
* Providing different Huffman dictionaries for the hardware encoder as needed
* Debugging by reading memories that wouldn't ordinarilly be exposed to AXI, like `histMem`

This tutorial will demonstrate performing these hypothetical scenarios with the BERT API. Additionally, this document serves to explain how to get BERT working with any hardware design. Every step is covered from start to finish, with links to documents providing further nuance. Finally, this tutorial is written with the Eclipse-based Xilinx SDK in mind. The [Xilinx article on migrating to Vitis](https://www.xilinx.com/html_docs/xilinx2020_1/vitis_doc/migratingtovitis.html) may help in adapting these instructions for newer versions of the Xilinx tools.

## Steps At-A-Glance
1. Use BERT host tools to generate the mydesign headers for your hardware design. [Information here](../../../host_tools/README.md)
     1. build BERT host tools for your platform; [see build instrutions](../../../host_tools/README.md)
     2. run BERT tools on your design to produce files needed for your BERT  application (minimal instructions below)
2. Set up Xilinx SDK environment ([general setup](../sdksetup.md), [bsp configuration](../../embedded/bsp.md), [adding BERT to project](../../embedded/bert.md)).
3. Write user code
4. Test on hardware

## 1. Generating mydesign.h with bert_gen
Once the hardware design has been compiled in Vivado, we need a hardware specification (.hdf file) and design checkpoint (.dcp file) to proceed. Both are provided within the repo for the Ultra96-V2 to save time. The design checkpoint is used by `bert_gen` to generate the header files BERT will use to map physical bits to logical, and vice versa.

**TODO: *JAMES* - review:**
* Create a .dcp file for the fully complete placed and routed design.
  Command below assumes this is called  `design.dcp`
* Run: `.gen.sh -gen design.dcp designHeaderName`
* For the one we provide in the repo....**TODO**
* This should create `deignHeaderName.h` and `designHeaderName.c` that will
  be used with BERT applications below. This is what is being referred to whenever the docs generically mention `mydesign.h`.

## 2. Integrating BERT into our project
A hardware specification (.hdf file) was mentioned earlier, because we need to establish a SDK workspace. In Vivado 2018.3, this file is created by going to File > Export > Export Hardware. The tutorial includes a precompiled version of the design for the U96 board, so there is already a hdf file provided in the repo. Steps to create a new application and board support package with the hdf is covered in detail [here](../sdksetup.md).

**TODO: say where to find the one in the repo?**

Now that we have an basic application project and board support package for our hardware design, we need to modify the bsp to support the expanded version of xilfpga. The detailed steps for doing this is found [here](../../embedded/bsp.md).

Now that we have an application project and bsp established, we can dump the BERT source files from `embedded/src/bert` into our application project. Or we copy the whole `bert` directory if we'd like to maintain some heirarchy within our `src` directory. Just adjust the `#include` directives to reflect this. The easiest way is to do this is to just copy and paste the files using your OS's file manager, but alternatively you could use the import feature since Xilinx SDK is Eclipse-based. After adding the files, our project should rebuild without error. Refer to [bert.md](../../embedded/bert.md) for more details about this step and the BERT API in general. If there are no compiler problems to sort out, the BERT API can now be used.

AMD: how compile --- Project > Build All ?

AMD: once you've copied over the bert.h, things won't compile without huffmanCycle.c (a mydesign.c) that defines logical_memories -- so should they be told to copy that over around here?

**TODO: Picture of application projects directory structure**

## 3. User code
We provide a sample application [hellobert.c](./sw_huffman/hellobert.c) that
* Reads the memories over AXI and BERT to verify BERT is working
* Uses a bzip2 implementation of Huffmann encoding to create a new dictionary on the PS side and transfer it via BERT.
* Writes ascending input to the `rawTextMem` and an identity encoding as the Huffman dictionary.

AMD: need to copy over everything in sw_huffman, not just hellobert.c -- include instructions here?

AMD: huffmanCycle.h defines MEM_0, MEM_1, MEM_2, MEM_3 -- I had to add definitions to bridge with hellobert.c
#define MEM_INPUT MEM_0
#define MEM_HUFFMAN MEM_1
#define MEM_HIST MEM_2
#define MEM_RESULT MEM_3


AMD: need to remove helloworld.c to avoid second main function? 

**TODO:**
* Make sure application works with new changes of BERT (readback_Init takes a IDCODE).
  * just replace U96_IDCODE with IDCODE?
  * IDCODE also defined somewhere in xilfpga?  so need to remove that definition of IDCODE?
* Create #ifdef macros so the code has the same functionality using bert_read/write or bert_transfuse
* Make sure code runs without buffers excessively sized like they are right now.
* Reduce amount of repeated code so its more easily understandable


## 4. Test on hardware

If the code compiles, we can attempt to run it on hardware. Start by opening "Debug Configurations."

![Opening debug configurations](../../images/huffmanlaunchalt.png)

Double clicking on "Xilinx C/C++ application (System Debugger) will create a new debug launch configuration. Here is an example of a configuration:

![Example debug configuration](../../images/huffmanlaunchconfig.png)

Notice the "Bitstream File" field. If you are developing different versions of the hardware design concurrently (the BRAMs do not change), one can just point to the different bitstream. This way, one can avoid establishing a new SDK workspace and generating a new BSP for every change to the hardware. From a practical standpoint, nothing prevents having two projects in the same SDK workspace for two different hardware designs (for the same part).

Before or during the launch of the debugger, open the serial port to the board so we can observe the program output. Clicking the green plus sign in the "SDK Terminal" window accomplishes this.

![Opening the serial port](../../images/openserialport.png)

AMD: when I run, it currently gets hung on AXI read in extractAXI 

### Common Problems Encountered When Debugging
* If the debugger cannot find the part, make sure the board is actually turned on. For example, the U96 board has a power button and reset button behind the USB ports. Also, make sure your board is set to boot from JTAG not SD card.
* If the program aborts, check that the heap size is set large enough in lscript.ld. BERT's calls to `malloc` may be failing. Memory usage is covered within [bert.md](../../embedded/bert.md).
* If there is no output in the SDK terminal, check that stdout is on the correct uart in the bsp settings. (Know that changing a bsp setting regenerates and recompiles it. This wipes out the custom xilfpga version.) 
* The debugger by default has a breakpoint at the start of the program. There is a resume button in the toolbar to start the program.
  * AMD don't think I've found this, yet.  Found a skip-all-breakpoints...
* Relaunching the debugger after a failed attempt is sometimes troublesome. Sometimes it is easier to just hit the reset button on the board before trying again.
  * AMD half the time (almost consistently every time I first restart) I get: XSDB Server ...SDK/2018.3/bin/loader ...Segmentation fault...; restarting from there usually works.
* As a tip, BERT can be drastically sped up by compiling it with `-O3`. You can selectively compile bert.c differently by right clicking on the file and adding `-O3` to the compiler flags.
* Appears to get stuck reading the AXI in extractAXI **TODO: ???**
* AMD: At some point, it seemed to forget the libraries (so could complain about XFpga_ stuff not being defined during linking);  I had to go in and tell it to use xil, xilfpga, and xilsecure.  Maybe this was after I told it to run a clean.