#!/bin/bash

sdkWorkspace=/home/matth2k/demo
prjName=huffman_demo
bspName=huffman_demo_bsp
bertRootDir=../../..

echo "Checking paths are valid"
bertPath=$(realpath -se $bertRootDir)
if [ $? -ne 0 ]; then
    exit 1
fi

sdkPath=$(realpath -se $sdkWorkspace)
if [ $? -ne 0 ]; then
    exit 1
fi

prjsrcPath=$(realpath -se "$sdkPath/$prjName/src")
if [ $? -ne 0 ]; then
    exit 1
fi

xilsrcPath=$(realpath -se "$sdkPath/$bspName/psu_cortexa53_0/libsrc/xilfpga_v5_1/src")
if [ $? -ne 0 ]; then
    exit 1
fi

cp $bertPath/embedded/src/bert/* $prjsrcPath
cp $bertPath/embedded/libsrc/xilfpga_v5_1/src/* $xilsrcPath

echo "Copied over expanded xilfpga and bert code into project."
