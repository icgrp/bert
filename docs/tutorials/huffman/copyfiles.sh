#!/bin/bash

# Set the following variables
# SDK/Eclipse Workspace Directory
sdkWorkspace=/home/matth2k/demo
# Name of Application Project within the workspace
prjName=huffman_demo
# Name of BSP within the workspace
bspName=huffman_demo_bsp
# Location of BERT repo root directory. Default value is correct if working directory is tutorials/huffman.
bertEmbeddedDir=../../../embedded

echo "Checking paths are valid"
bertEmbeddedPath=$(realpath -se $bertEmbeddedDir)
if [ $? -ne 0 ]; then
    echo "BERT repo path not found. Try running from docs/tutorial/huffman"
    exit 1
fi

sdkPath=$(realpath -se $sdkWorkspace)
if [ $? -ne 0 ]; then
    echo "SDK workspace path not found (1 directory up from SDK project directory)."
    exit 1
fi

prjsrcPath=$(realpath -se "$sdkPath/$prjName/src")
if [ $? -ne 0 ]; then
    echo "SDK project not found. Check the project name and that the SDK workspace directory is correct."
    exit 1
fi

xilsrcPath=$(realpath -se "$sdkPath/$bspName/psu_cortexa53_0/libsrc/xilfpga_v5_1/src")
if [ $? -ne 0 ]; then
    echo "SDK BSP not found. Check that you are using xilfpga version 5.1 specifically. Also, check the bsp name and that the SDK workspace directory is correct."
    exit 1
fi

echo "Copying BERT API to project..."
cp --verbose $bertEmbeddedPath/src/bert/* $prjsrcPath
echo "Copying expanded xilfpga to BSP..."
cp --verbose $bertEmbeddedPath/libsrc/xilfpga_v5_1/src/* $xilsrcPath

echo "Copied over expanded xilfpga and bert code into project."
echo "Make sure the BSP and Application are recompiled. This usually happens automatically."
