# Huffman Encoder Tutorial
## Overview
This tutorial will lead you through using BERT to read and write memories in a hardware design.

The hardware for the project is a Huffman Encoder design where 4 memories are used:
* A 1024x8b memory with 8b characters that will be encoded, called `rawTextMem`
* A 256x20b memory with character encodings, called `huffmanMem`. Bits [0:15] of each word are the encoding. Bits [16:19] are the length of the encoding.
* A 512x16b memory with that stores the encoding of `rawTextMem`, called `resultsMem`
* A 256x16b memory that stores a histogram of `rawTextMem`'s values, called `histMem`

**TODO: pix show application flow**

rawTextMem->encode(huffmanMem)-->resultMem
                    |->histMem

In the design, the memories can be read and written by BERT.  However, we have also hooked some of the memories up to the AXI bus so we can also read and write them that way to verify that things are operating correctly.

When the design is running, if the sotware  toggles a register bit on the AXI bus that will cause the encoder to run and the  `resultsMem` to be updated with the encoding of `rawTextMem`, based on the dictionary found in `huffmanMem`. Additionally, `histMem` is updated with a new histogram of `rawTextMem`. In order to verify that BERT is actually working, the design allows us to read `resultsMem` and `histMem` over AXI.

During runtime, the software can also do the following by writing or reading the BRAMs in the hardware:
* Setting the text that needs to be encoded
* Providing different Huffman dictionaries for the hardware encoder as needed
* Debugging by reading memories that wouldn't ordinarilly be exposed to AXI, like `histMem`.

This tutorial will demonstrate performing these hypothetical scenarios with the BERT API. Additionally, this document serves to explain how to get BERT working with any hardware design. Every step is covered from start to finish, with links to documents providing further information. 

Finally, this tutorial is written with the Eclipse-based Xilinx SDK in mind. The [Xilinx article on migrating to Vitis](https://www.xilinx.com/html_docs/xilinx2020_1/vitis_doc/migratingtovitis.html) may help in adapting these instructions for newer versions of the Xilinx tools.

## Prerequisites
This tutorial assumes the user has some experience with using the Xilinx SDK tool to create, configure, edit, compile, and run designs consisting of hardware and software on an FPGA board.

TODO: could we point them at some introductory materials to use?  Can we articulate the level of expertise they might need?  A number of the problems BEN and AMD had with the tutorial as written was due to what looked to us to be omited details on the SDK operation that we were not familiar with.

## The Overall Process
Using BERT is a 5-step process.  
1. You use Vivado to generate a design containing BRAMs and a PS.  Once you have generated a bitstream for the design you run a script to generate the needed data files for the remainder of the BERT process.  You do this on a "host" computer, meaning one that runs Vivado.
2. You then set up the Xilinx SDK environment with the right versions of the xilfpga program from Xilinx as well as the needed libraries for BERT.  You should only need to do this once. 
3. Once this is all in place, you will install the BERT source code itself and write your user application code, all of which will compile into a BERT executable that uses BERT to talk to the board after you have programmed it with a bitstream.  
4. You will finally test that application on hardware with a bitstream programmed onto the board.

NOTE: along the way you will be copying files into the SDK project directories.   As you do so you may see compile errors in the Project Explorer window on the left of the SDK.  Don't worry.  You will have such compile errors until right at the end of Step 3 below so don't worry about them until you get to that point!  The tutorial will tell you at what point you should not have compile errors any more.

# Step 1. Obtaining A Sample Design
As mentioned, you need to create your hardware design in Vivado and compile it to a bitstream and then write out the needed files for BERT to use your design.

For this tutorial, however, a complete set of such files are provided for you within the bert GIT repo for the Ultra96-V2 board to save time.  You can find those in this directory: `.../bert/docs/tutorials/huffman/hw_huffman` in the repo.  Copy the files in that directory into a directory where you intend to work through this tutorial.  We will refer to this directory as `WORK` for the rest of the tutorial.  Also, when we refer to paths like `.../bert/` we are referring to the location where you have checked out the github BERT repo into.

# Step 2. Setup Xilinx SDK Environment With The Proper Libraries and Add Libraries to Your BSP
The next step is to set up the Xilinx SDK environment.  This tutorial was written for Vivado 2018.3 but the BERT tools require `xilfpga` libraries for 2019.2 and so there are a number of steps required to get the proper libraries and files set up.

* Step 2a - follow the instructions [here on SDK setup](../sdksetup.md).  This will set up your SDK environment.  You should only have to do this once.

* Step 2b - you next need to add some required libraries to your BSP.  The document [bsp.md](../../embedded/bsp.md) covers which libraries and versions you will need for BERT as well as other additional steps.  You should only have to do this once.  Complete those steps before proceeding.

* Step 2c - you now should check the project's link settings.  This is because adding a library to a BSP after a project has already been formulated sometimes causes an issue where the 'makefile' is not updated to link against the new libary. If you are getting compiler errors, you can check that the right flags are set by opening the application project's properties (right-click `huffman_demo` and choose C/C++ Build Settings).   Then, go to ARM v8 gcc linker -> Inferred Options -> Software Platform. The specific flags you are looking for as they relate to BERT include:

* `-Wl,--start-group,-lxilfpga,-lxil,-lxilsecure,-lgcc,-lc,--end-group`
*  `-Wl,--start-group,-lxilsecure,-lxil,-lgcc,-lc,--end-group`

NOTE: we have seen these get reset by the SDK when switching workspaces, among other things.  So. if at the end of the process you are getting compile errors, re-check these settings!

# 3. Integrating BERT into Your Project and Writing Your Source Code
1. Now that we have an application project and BSP established, we need to copy the actual BERT system's source files from `.../bert/embedded/src/bert`  into our application project's `src` directory (this would be `WORK/SDKWorkspace/huffman_demo/src`).  To get to this in the SDK, on the left side of the SDK, open the application (huffman_demo), and then open the src directory under that.
2. The easiest way is to do the copy is to (a) copy the files using your OS's file manager, and then (b) paste them into the src directory you just opened in the SDK GUI.
   * Alternatively you could use the import feature since Xilinx SDK is Eclipse-based.   
   * Regardless. if a recompile does not occur automatically you can force a recompile as previously described.
3. Next, you may see that your `src` directory has a `helloworld.c` file (often automatically created by SDK when you create the application).  If so, remove that file.
4. Finally, copy the `mydesign.c` and `mydesign.h` files you copied into `WORK` at the start of this tutorial into `WORK/SDKWorkspace/huffman_demo/src` (your directory names may differ if you named them differently).

## Write User code
The next step is to write an actual application to use BERT to interact with your design.  We have provided a sample application `hellobert.c` that you can use for this.  It does the following:
* Reads the memories over AXI and BERT to verify BERT is working.
* Uses a bzip2 implementation of Huffmann encoding to create a new dictionary on the PS side and transfer it via BERT.
* Writes ascending input to the `rawTextMem` and an identity encoding as the Huffman dictionary.

So now, copy over all the code in `.../bert/docs/tutorials/huffman/sw_huffman` into `WORK/SDKWorkspace/huffman_demo/src`.

This code includes:
* bzlib.h, bzlib_min.c, bzlib_private.h, huffman.c, spec.c, spec.h - this is code from bzip2 for Huffman encoding on the PS
* hellobert.c - this is code that tests the BERT operations on the Huffman encoder memories

Finally, you need to tell the application how much memory to use.  Double-click the `WORK/SDKWorkspace/huffman_demo/src/ldscript.ld` file and increase the stack and heap sizes (currently done by adding two 0's to their values). 

TODO: We should specify the minimum size needed for this tutorial along with maybe a discussion
of how to determine it for your own program (or that could into the 2nd tutorial where they learn how to do their own app).

At this point you FINALLY have a complete application and it should show no compile  errors in Project Explorer!  As described above you may want to right-click the application in the Project Explorer (`huffman_demo`) and select 'Clean Project' to ensure that you now have a full, clean recompile.

## 4. Test on hardware

Once the code compiles, you are ready to run it on hardware. Start by opening "Run Configurations."  You can do this by right-clicking on the project application ('huffman_demo') and selecting 'Run As->Run Configurations'.  Then double-click the bottom option in the window that pops up ('Xilinx C/C++ application (System Debugger)').  

In the Target Setup pane to the right you will need to select a number of reset options like below:

![Setting Debug Target Setup Options](../../images/huffmandebugconfigurations.png)

In addition you will have to fill in the name of the bitfile to use.  You do this by clicking the Browse 
Once you have done so, click Apply and then Close.  At this point you have a new configuration you can use when you run with or without the debugger.

As shown below, to run, click the green circle with white triangle at the top center of the screen.  This will run what you just created.

![Starting a Run](../../images/RunDebug.png)

Alternatively, you can run the debugger using the debug icon just to the left of the run button (this icon looks like a bug).  This will run the debugger.  The debugger will start up with a breakpoint at main.  To resume execution, select Core 0 and press the `resume` button, which is shaped like a play button (rectangle followed by green arrow, two icons over from the run button).

Before or during the launch of the program, open the serial port to the board so we can observe the program output. Clicking the green plus sign in the "SDK Terminal" window accomplishes this.  On Windows it wll be a COM port, on Linux it will be /dev/ttyUSB1.

![Opening the serial port](../../images/openserialportlinux.png)

If all goes well, the program will run and will print results to the SDK Terminal as shown below:

![Printout of successful run](../../images/finalresults.png)

Congratulations!  You have run a successful demo application.

Obvious next steps would be to experiment with making changes to the `hellobert.c` program and re-run it on the board to gain some experience with the board and the BERT API.  Then, work your way through the second BERT tutorial to learn how to generate the files needed from a Vivado design for the entire process (these are the files that were given to you at the start of this tutorial).


---

---

---
# Stuff That May Not Necessarily Belong Here in the Tutorial But Which We Don't Want to Lose
TODO: *JAMES* - review:
* Create a .dcp file for the fully complete placed and routed design.
  Command below assumes this is called  `design.dcp`
* Run: `.gen.sh -gen design.dcp designHeaderName`
* This should create `deignHeaderName.h` and `designHeaderName.c` that will
  be used with BERT applications below. This is what is being referred to whenever the docs generically mention `mydesign.h`.

---

You can now refer to [the BERT API document](../../embedded/bert.md) for more details about BERT API in general. 

TODO: Explain how to #define the different memories since the memories are indexed differently each time they are produced by bert_gen




**TODO: Picture of application projects directory structure**

---

**TODO:**
* Make sure application works with new changes of BERT (readback_Init takes a IDCODE).
  * just replace U96_IDCODE with IDCODE?
  * IDCODE also defined somewhere in xilfpga?  so need to remove that definition of IDCODE?
* Create #ifdef macros so the code has the same functionality using bert_read/write or bert_transfuse
* Make sure code runs without buffers excessively sized like they are right now.
* Reduce amount of repeated code so its more easily understandable

---




![Opening debug configurations](../../images/huffmanlaunchalt.png)

Double clicking on "Xilinx C/C++ application (System Debugger) will create a new Run/Debug launch configuration. Here is an example of a configuration:

![Example debug configuration](../../images/huffmanlaunchconfig.png)

Notice the "Bitstream File" field. If you are developing different versions of the hardware design concurrently (the BRAMs do not change), one can just point to the different bitstream. This way, one can avoid establishing a new SDK workspace and generating a new BSP for every change to the hardware. From a practical standpoint, nothing prevents having two projects in the same SDK workspace for two different hardware designs (for the same part).

---

TODO:
* Mention the on button and reset button on board
* Mention compiling BERT with -O3 (Perhaps find a way for SDK to only compile BERT -O3)
* Section on how to Debug

