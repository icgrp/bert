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

The tutorial also assumes you have the following installed:
* Xilinx SDK
* Python3


## The Overall Process
Using BERT is a 4-step process.  
1. You use Vivado to generate a design containing BRAMs and a PS.  Once you have generated a bitstream for the design you run a script to generate the needed data files for the remainder of the BERT process.  You do this on a "host" computer, meaning one that runs Vivado.
2. You then set up the Xilinx SDK environment with the right versions of the xilfpga program from Xilinx as well as the needed libraries for BERT.  You should only need to do this once. 
3. Once this is all in place, you will install the BERT source code itself and write your user application code, all of which will compile into a BERT executable that uses BERT to talk to the board after you have programmed it with a bitstream.  
4. You will finally test that application on hardware with a bitstream programmed onto the board.

NOTE: along the way you will be copying files into the SDK project directories.   As you do so you may see compile errors in the Project Explorer window on the left of the SDK.  Don't worry.  You will have such compile errors until right at the end of Step 3 below so don't worry about them until you get to that point!  The tutorial will tell you at what point you should not have compile errors any more.

# Step 1. Obtaining A Sample Design
As mentioned, you need to create your hardware design in Vivado and compile it to a bitstream and then write out the needed files for BERT to use your design.

For this tutorial, however, a complete set of such files are provided for you within the bert GIT repo for the Ultra96-V2 board to save time.  You can find those in this directory: `.../bert/docs/tutorials/huffman/hw_huffman` in the repo.  Copy the files in that directory into a directory where you intend to work through this tutorial.  We will refer to this directory as `WORK` for the rest of the tutorial.  Also, when we refer to paths like `.../bert/` we are referring to the location where you have checked out the github BERT repo into (an example would be `/home/steve/bert`).

# Step 2. Setup Xilinx SDK Environment With The Proper Libraries and Add Libraries to Your BSP
The next step is to set up the Xilinx SDK environment.  This tutorial was written for Vivado 2018.3 but the BERT tools require `xilfpga` libraries for 2019.2 and so there are a number of steps required to get the proper libraries and files set up.

* Step 2a - follow the instructions [here on SDK setup](../sdksetup.md).  This will set up your SDK environment.  You should only have to do this once.

* Step 2b - you next need to add some required libraries to your BSP.  The document [bsp.md](../../embedded/bsp.md) covers which libraries and versions you will need for BERT as well as other additional steps.  You should only have to do this once.  Complete those steps before proceeding.

* Step 2c - you now should check the project's link settings.  This is because adding a library to a BSP after a project has already been formulated sometimes causes an issue where the 'makefile' is not updated to link against the new libary. If you are getting compiler errors, you can check that the right flags are set by opening the application project's properties (right-click `huffman_demo` and choose C/C++ Build Settings).   Then, go to ARM v8 gcc linker -> Inferred Options -> Software Platform. The specific flags you are looking for as they relate to BERT include:

* `-Wl,--start-group,-lxilfpga,-lxil,-lxilsecure,-lgcc,-lc,--end-group`
*  `-Wl,--start-group,-lxilsecure,-lxil,-lgcc,-lc,--end-group`

NOTE: we have seen these get reset by the SDK when switching workspaces, among other things.  So. if at the end of the process you are getting compile errors, re-check these settings!

# 3. Integrating BERT into Your Project and Writing Your Source Code
Now that we have an application project and BSP established, we need to copy the actual BERT system's source files from `.../bert/embedded/src/bert`  into our application project's `src` directory (this would be `WORK/SDKWorkspace/huffman_demo/src`).  

However, this was already done for you by the `copyfiles.py` script you ran when you configured your BSP above.

Next, if you go into your applicaton's `src` directory you will see that a whole collection of new files were copied in as a part of that script.

You may also see that directory has a `helloworld.c` file (often automatically created by SDK when you create the application).  If so, remove that file.

Finally, you need the `mydesign.c` and `mydesign.h` files you copied into `WORK` at the start of this tutorial in your `WORK/SDKWorkspace/huffman_demo/src` directory.  However, as with the BERT system's files, those were also copied for you by the `copyfiles.py` script earlier.
## Write User code
The next step is to write an actual application to use BERT to interact with your design.  We have provided a sample application `hellobert.c` that you can use for this.  It does the following:
* Reads the memories over AXI and BERT to verify BERT is working.
* Uses a bzip2 implementation of Huffmann encoding to create a new dictionary on the PS side and transfer it via BERT.
* Writes ascending input to the `rawTextMem` and an identity encoding as the Huffman dictionary.

As above, `hellobert.c` was already  copied over for you by the `copyfiles.py` script earlier when you configured the BSP.  For reference however, it was copied from `.../bert/docs/tutorials/huffman/sw_huffman` into `WORK/SDKWorkspace/huffman_demo/src`.

Finally, you need to tell the application how much memory to use.  Double-click the `WORK/SDKWorkspace/huffman_demo/src/lscript.ld` file and set stack and heap sizes to 200000 (2 followed by 5 zeros -- this is hex for 2 Megabytes).  [For discussion on how to size heap, see the Usage Overview->Dynamic Memory Usage section in [the BERT API documentation](../../embedded/bert.md).]

At this point you FINALLY have a complete application and it should show no compile  errors in Project Explorer!  As described above you may want to right-click the application (`huffman_demo`) in the Project Explorer and select 'Clean Project' to ensure that you now have a full, clean recompile.

A lot has happened to get the source files in place in the SDK project.  This can be a bit confusing.  In particular, in the BSP configuration step you ran a script called `copyfiles.py` which copied a variety of files as described above.  By examining the output printed out while running that script you should be able to figure out all the pieces of source code that were copied into your SDK project for both the BSP (`huffman_demo_bsp`) as well as the `huffman_demo` application (including the `hellobert.c` application program you are about to run).  You can use the output of `copyfileslpy` as a guide when you get ready to do your new design later.

## 4. Test on hardware

Once the code compiles, you are ready to run it on hardware. Start by opening "Run Configurations."  You can do this by right-clicking on the project application ('huffman_demo') and selecting 'Run As->Run Configurations'.  Then double-click the bottom option in the window that pops up ('Xilinx C/C++ application (System Debugger)').  

In the Target Setup pane to the right you will need to select a number of reset options like below:

![Setting Debug Target Setup Options](../../images/huffmandebugconfigurations.png)

In addition you will have to fill in the name of the bitfile to use.  You do this by clicking the Browse Button.
You want to select the file `WORK/top.bit`.
Once you have done so, click Apply and then Close.  At this point you have a new configuration you can use when you run with or without the debugger.

As shown below, to run, click the green circle with white triangle at the top center of the screen.  This will run what you just created.

![Starting a Run](../../images/RunDebug.png)

Alternatively, you can run the debugger using the debug icon just to the left of the run button (this icon looks like a bug).  This will run the debugger.  The debugger will start up with a breakpoint at main.  To resume execution, select Core 0 and press the `resume` button, which is shaped like a play button (rectangle followed by green arrow, two icons over from the run button).

*TODO: BEN - I can't get it work the same way twice in terms of setting up Run vs. Debug configurations.  Obviously I am not doing it the same way every time.  But we do need to get reliable instructions on how to get a non-debug run configuration created a run and then a debug configuration created and run.*

Before or during the launch of the program, open the serial port to the board so we can observe the program output. Clicking the green plus sign in the "SDK Terminal" window accomplishes this.  On Windows it wll be a COM port, on Linux it will be /dev/ttyUSB1.

![Opening the serial port](../../images/openserialportlinux.png)

If all goes well, the program will run and will print results to the SDK Terminal as shown below:

![Printout of successful run](../../images/finalresults.png)

Congratulations!  You have run a successful demo application.

Obvious next steps would be to experiment with making changes to the `hellobert.c` program and re-run it on the board to gain some experience with the board and the BERT API.  Then, work your way through the second BERT tutorial, [Preparing Needed Files for the Huffman Encoding Tutorial](fileprep.md), to learn how to generate the files needed from a Vivado design for the entire process (these are the files that were given to you at the start of this tutorial).


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

