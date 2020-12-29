# Xilinx SDK 2018.3 Installation

This tutorial was written for SDK 2018.3.  Since that predates the distribution of xilfpga needed, the [2019.2 distribution of embeddedsw](https://github.com/Xilinx/embeddedsw/releases/tag/xilinx-v2019.2) must be manually added to the SDK installation. If Vitis (2019.2 or newer) is being used, this portion of the document can be skipped. 

## Automated Method
A script to add the needed files to 2018.3 has been provided for you.  It can be found at `.../bert/tutorials/huffman/downloadLibraries.sh` and you can get full usage instructions by doing:
```
.../bert/tutorials/huffman/downloadLibraries.sh 
```
where `.../bert` is the location of your bert repository.

The script uses `wget` to download the 2019.2 distribution from the link above, unzips it, and copies the files to their proper locations.  The parameter it requires is the location of the SDK install (the specific location required given by typing the command above and reading the usage message).

## Manual Method
Alternatively, you can download, unzip, and copy it yourself.

First, follow the above link and download and unzip or untar the 2019.2 distribution of embeddedsw.  Let's assume you extracted it to /tmp.  If we also assume  SDK below is the Xilinx installation SDK directory then you would want to copy like this:
```
cp -r /tmp/embeddedsw-xilinx-v2019.2/lib/sw_services/xilfpga SDK/2018.3/data/embeddedsw/lib/sw_services/xilfpga_v5_1
cp -r /tmp/embeddedsw-xilinx-v2019.2/lib/sw_services/xilsecure SDK/2018.3/data/embeddedsw/lib/sw_services/xilsecure_v4_1
cp -r /tmp/embeddedsw-xilinx-v2019.2/lib/bsp/standalone SDK/2018.3/data/embeddedsw/lib/bsp/standalone_v7_1
```

where 2018.3 can be replaced with the version you are using (only needed if your SDK is prior to 2019.2). 

Now that once these newer versions of these libraries have been added to the Xilinx installation (using either method), the new versions of xilfpga and xilsecure should show up in the drop down menu of a Board Support Package's settings window as will be shown later in this tutorial.

At this point you can return to the main tutorial to continue.
