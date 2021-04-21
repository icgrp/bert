# Preparing Files from a Vivado Design for BERT Use

## Overview
This tutorial will show you how to generate the needed files to run your own design with BERT.  To do so we will use the project that the Huffman Tutorial was based on.  Before proceeding, you will need to download that project.  It is a submodule of the BERT repo that you have already downloaded.  To download it do the following after changing into the BERT directory on your computer:
```
git submodule update --init --recursive
```
This will download the project and put it into the directory: `.../bert/docs/tutorials/huffman/huffmanVivadoProject`.

## First Steps: Vivado
1. If you don't have the board support package for the `xczu3eg-sbva484-1-i` board already installed you must do so before proceeding.   You can obtain the needed file at [https://github.com/Avnet/bdf](https://github.com/Avnet/bdf).  There are instructions at that location as well.
2. From the BERT repository, use your version of Vivado to open the project in `.../bert/docs/tutorials/huffman/huffmanVivadoProject`.
3. To ensure that your design is complete (synthesized, placed, routed, and a bitstream has been generated) select "Generate Bitstream" in Vivado.  If Vivado thinks the project is not out of date it will say "A completed implementation run exists?  Re-run anyway?".  You do not need to if that is the case but if it is not, you will have to wait while it re-runs the implementation steps.  We have found that sometimes it takes multiple implementation runs to get all the out of context IP modules to synthesize correctly (possibly due to out of memory on our machine?).  When this happens, re-running synthesis until they all succeed has solved this for us.
4. Next, click "Open Implemented Design" to load all the information needed for the following steps.
5. In the Vivado Tcl Console, do `source .../bert/host_tools/file_gen/file_gen_TOOL.tcl` where `.../bert` refers to the location where you cloned the BERT github repo to and `TOOL` is either `sdk` or `vitis`.  
6. Then in the Tcl Console do `file_gen dirName` where `dirName` is a directory where you want the files deposited.

The last step will do a number of things:
- It will generate a .hdf (SDK) or .xsa (Vitis) file which you use to set up an SDK/Vitis project.  This  file contains inside of it the bitfile that will be used.
- It will also generate a stand-alone .bit file along with a .ll file which provides bitstream mapping information.
- It will generate a .mdd file which is a description of the memories in your design, where they are located, and what HDL variables they correspond to. 
- It will create a Vivado checkpoint (.dcp) file of the design.

Once the last step above finishes it will confirm where it put the files, what the files generated were, and indicate next steps.

## Next Steps: Run bert_gen
The `bert_gen` program will process the above-generated files and create a `mydesign.c` file and a `mydesign.h` file which you saw in the previous tutorial are a part of the application source code.  Specifically, they contain all the mapping information for your memories so BERT can access them.

Before running `bert_gen`, you need to build the executable.
Follow the instructions [for building `bert_gen`](../../host_tools/build.md). 

You run `bert_gen` by going to the directory `.../bert/host_tools/bert_gen` and executing:
```
./gen.sh -gen dirName
```
where `dirName` is the same directory you specified above in file_gen.


Note: you must be in the above directory to execute the script since it relies on other files in that directory.  

The result of running this command is a `mydesign.c` file and a `mydesign.h` file placed into `dirName`.

The default running the above is to generated an accelerated design.  To generate a non-accelerated design:
```
./gen.sh -na -gen dirName
```


## Running the Original Huffman Tutorial
If you return to the original Huffman Tutorial you can now redo the tutorial, substituting the following generated files in `dirName` for those originally provided:
- `top.hdf` or `top.xsa`
- `mydesign.c`
- `mydesign.h`

All other files you worked with in that tutorial are not design-specific and therefore are to be used just like they were in the tutorial.

Using these files you should be able to replicate your results in that original tutorial.

## Moving On
Once you create your own design you would follow the steps in the two tutorials to run your design using BERT. 

