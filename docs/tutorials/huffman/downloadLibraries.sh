    #!/bin/bash
tempdir=temp

if [ -z "$XIL_SDK_DIR" ] && [ -z "$1" ]; then
    echo "Usage: ./downloadLibraries.sh <dir>"
    echo "Xilinx installation directory is not set. Set it by passing an argument or setting the environment variable 'XIL_SDK_DIR'."
    echo "It is the path to to the SDK installation. Ends with 2018.3"
    echo "Example: ./downloadLibraries.sh Xilinx/SDK/2018.3"
    echo "Example: export XIL_SDK_DIR=Xilinx/SDK/2018.3; ./downloadLibraries.sh"
else
    if [ -n "$1" ]; then
        XIL_SDK_DIR=$1
    fi
    echo "Checking dir $XIL_SDK_DIR"
    path=$(realpath -se $XIL_SDK_DIR)
    if [ $? -ne 0 ]; then
        echo "Check Xilinx installation path is correct."
        exit 1
    fi
    
    temppath=$(realpath -se $tempdir)
    if [ $? -ne 0 ]; then
        echo "Creating temp directory $tempdir."
        mkdir $tempdir
        temppath=$(realpath -se $tempdir)
    fi
    echo "Downloading Xilinx 2019.2 Embedded Software..."
    wget https://github.com/Xilinx/embeddedsw/archive/xilinx-v2019.2.tar.gz -P $temppath
    echo "Extracting into $temppath"
    tar -xf $temppath/xilinx-v2019.2.tar.gz -C "$temppath"
    cp --verbose -r $temppath/embeddedsw-xilinx-v2019.2/lib/sw_services/xilfpga $path/data/embeddedsw/lib/sw_services/xilfpga_v5_1 | tail -n 1
    cp --verbose -r $temppath/embeddedsw-xilinx-v2019.2/lib/sw_services/xilsecure $path/data/embeddedsw/lib/sw_services/xilsecure_v4_1 | tail -n 1
    cp --verbose -r $temppath/embeddedsw-xilinx-v2019.2/lib/bsp/standalone $path/data/embeddedsw/lib/bsp/standalone_v7_1 | tail -n 1

    echo "Done copying files."
    echo "Restart your SDK now."
    read -p "Okay to delete download temp dir? $temppath [Y/N] " -n 1 -r resp
    if [[ $resp =~ ^[Yy]$ ]]; then
        rm -rf $temppath
    fi
    echo
fi
