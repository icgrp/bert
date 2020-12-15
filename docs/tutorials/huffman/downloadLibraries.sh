#!/bin/bash
tempdir=temp

if [ -z "$XIL_SDK_DIR" ]
then
    echo "XIL_SDK_DIR is not set"
    echo "It is the path to to the SDK installation. Ends with 2018.3"
    echo "Example: export XIL_SDK_DIR=Xilinx/SDX/SDK/2018.3"
else
    echo "$XIL_SDK_DIR is the directory"
    path=$(realpath -se $XIL_SDK_DIR)
    if [ $? -ne 0 ]; then
        exit 1
    fi
    wget https://github.com/Xilinx/embeddedsw/archive/xilinx-v2019.2.tar.gz
    mkdir $tempdir
    tar -xf xilinx-v2019.2.tar.gz -C "temp"
    path=$(realpath -se $XIL_SDK_DIR)
    cp -r $tempdir/embeddedsw-xilinx-v2019.2/lib/sw_services/xilfpga $path/data/embeddedsw/lib/sw_services/xilfpga_v5_1
    cp -r $tempdir/embeddedsw-xilinx-v2019.2/lib/sw_services/xilsecure $path/data/embeddedsw/lib/sw_services/xilsecure_v4_1
    cp -r $tempdir/embeddedsw-xilinx-v2019.2/lib/bsp/standalone $path/data/embeddedsw/lib/bsp/standalone_v7_1

    echo "Done copying files."
    echo "Restart your SDK now."
fi
