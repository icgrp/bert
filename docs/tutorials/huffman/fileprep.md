# Preparing Files from a Vivado Design for BERT Use

## Overview
This tutorial will show you how to generate the needed files to run your own design with BERT.  In the first part you will open the Huffman project in Vivado and run a TCL script to pull the needed information from the design and place it into a directory.  In the second part, you will run a program called `bert_gen` to process those files into what is needed for BERT.

## Fist Steps: Vivado
1. If you don't have the board support package for the `xczu3eg-sbva484-1-i` board already insrtalled you must do so before proceeding.

TODO: do we need to point them to the installation package?  They wouldn't be running these tutorials if they didn't already know about this.

2. From the BERT repository, use Vivado 2018.3 to open the project in `.../bert/dos/tutorials/huffman/huffmanVivadoProject`.
3. To ensure that your design is complete (synthesized, placed, routed, and ready for bitstream generation) select "Run Implementation" in Vivado.  If Vivado thinks the project is not out of date it will say "A completed implementation run exists?  Re-run anyway?".  You do not need to if that is the case but if it is not, you will have to wait while it re-runs the implementation steps.
4. Next, click "Open Implemented Design" to load all the information needed for the following steps.

BN: There is a Tcl command to do the above but it requires a run number.  While it is usually 'impl_1' it may not be, depending on what the user has done (while it might be rare for them to have created a new run, Vivado does allow it).  So, the user is going to have to 'Open Implemented Design' to ensure we don't open the wrong one.

5. In the Vivado Tcl Console, do `source .../bert/host_tools/file_gen/file_gen.tcl` where `.../bert` refers to the location where you cloned the BERT github repo to.  
6. Then in the Tcl Console do `filegen dirName` where `dirName` is a directory where you want the files deposited.

The last step will do a number of things:
- It will generate a .hdf file which you use to set up an SDK project.  This .hdf file contains inside of it the bitfile that will be used.
- It will also generate a stand-alone .bit file along with a .ll file which provides bitstream mapping information.
- It will generate a .mdd file which is a description of the memories in your design, where they are located, and what HDL variables they correspond to. 
- It will create a Vivado checkpoint (.dcp) file of the design.

Once the last step above finishes it will confirm where it put the files, what the files generated were, and indicate next steps.

## Next Steps: Run bert_gen
The `bert_gen` program will process the above-generated files and create a `mydesign.c` file and a `mydesign.h` file which you saw in the previous tutorial are a part of the application source code.  Specifically, they contain all the mapping information for your memories so BERT can access them.

You run `bert_gen` by going to the directory `.../bert/host_tools/bert_gen` and executing:
```
./gen.sh -gen dirName
```
where `dirName` is the same directory you specified above in file_gen.

Note: you must be in the above directory to execute the script since it relies on other files in that directory.  

The result of running this command is a `mydesign.c` file and a `mydesign.h` file placed into `dirName`.

## Running the Original Huffman Tutorial
If you return to the original Huffman Tutorial you can now redo the tutorial, substituting the following generated files in `dirName` for those originally provided:
- `top.hdf`
- `mydesign.c`
- `mydesign.h`

All other files you worked with in that tutorial are not design-specific and therefore are to be used just like they were in the tutorial.

Using these files you should be able to replicate your results in that original tutorial.

## Moving On
Once you create your own design you would follow the steps in the two tutorials to run your design using BERT. 

A few things you will need to address as you do so include:

TODO: add things to address here for the general case where they create their own design.
