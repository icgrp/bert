# Configuring Your Board Support Package (BSP) for xilfpga (v5.1) library
## Xilinx SDK 2018.3 Installation

This tutorial was written for SDK 2018.3.  Since that predates the distribution of xilfpga needed, the [2019.2 distribution of embeddedsw](https://github.com/Xilinx/embeddedsw/releases/tag/xilinx-v2019.2) must be manually added to the SDK installation. If Vitis (2019.2 or newer) is being used, this portion of the document can be skipped. Extract the .zip archive.  

First, follow the above link and download and unzip or untar the 2019.2 distribution of embeddedws.  Let's assume you extracted it to /tmp.  If we also assume  SDK below is the Xilinx installation SDK directory then you would want to copy:
```
cp -r /tmp/embeddedsw-xilinx-v2019.2/lib/sw_services/xilfpga SDK/2018.3/data/embeddedsw/lib/sw_services/xilfpga_v5_1
cp -r /tmp/embeddedsw-xilinx-v2019.2/lib/sw_services/xilsecure SDK/2018.3/data/embeddedsw/lib/sw_services/xilsecure_v4_1
cp -r /tmp/embeddedsw-xilinx-v2019.2/lib/bsp/standalone SDK/2018.3/data/embeddedsw/lib/bsp/standalone_v7_1
```

where 2018.3 can be replaced with the version you are using (only needed if your SDK is prior to 2019.2). 

Now that these newer versions of these libraries have been added to the Xilinx installation, the new versions of xilfpga and xilsecure should show up in the drop down menu of a Board Support Package's settings window. 

## BSP Configuration
So, once again open the BSP and modify its settings.  BERT runs on the standalone platform (v7.1) (see below) and xilfpga v5.1 and xilsecure v4.1 will show up as options to be selected in the figure below.

Next, `secure_mode` should be set to `false`.  On the left of the screen you will see 'xilfpga' and 'xilsecure' optons.  Select both and ensure that the 'secure_environment' value is set to false.

Finally, you should be sure that under "standalone
the stdout setting is 'psu_uart_1' so print statements can be read over JTAG.

![Example of BSP configuration](../images/bspsettings.png)

![Example of xilfpga configuration](../images/xilfpgasettings.png)

## Over-write xilfpga API Library Source Code in BSP
Since BERT takes advantage of custom API calls, the xilfpga library source codemust be overwritten in the BSP with the modified version found at `bert/embedded/libsrc/xilfpga_v5_1/src`. 

The files in that directory need to be copied to `xxx_bsp/psu_xxxx_x/libsrc/xilfpga_v5_1`. The preferred method is to use your OS's GUI to first copy the files, then go into the  SDK GUI and paste them into the right directory since this will trigger the SDK to recompile the bsp libraries. **IF NOT, DO WHAT?**  You will see cross compiler output in the 'Console' window as the BSP is regenerated. 

NOTE: If other bsp parameters are later changed in `system.mss` or the `Re-generate BSP Sources` button is clicked, the BSP code will be regenerated *and this modified version of xilfpga will be overwritten with the vanilla xilfpga version from the local SDK installation*, negating what you just did. Thus, it is best to completely configure the rest of the BSP before replacing the custom xilfpga library source code. 

Once configured, the same bsp can be used for multiple applications. The BSP is setup in this roundabout way is because: (a) SDK 2018.3 does not have a recent enough version of xilfpga and (b) overwriting xilfpga within the BSP does not tamper with the software included in the SDK installation. 

The picture shows the part of the bsp directory structure being overwritten.

![Example of BSP directory structure](../images/bspdirectory.png)

At this point you can return to the main tutorial to continue.
# Stuff That Not Sure What to Do With But Don't Want To Delete


Some additional tweaking may be required for C++ code. Since xilfpga and Xilinx bsp libraries in general are written in C, `extern "C"` blocks need to be used to ensure the code compiles. Xilinx libraries have these `extern "C"` blocks, but with typos that prevent compilation. For C++ code to compile, you must manually fix these typos within the xilsecure library: [Extern "C" closure should not include "extern c", but only the curly brackets](https://github.com/Xilinx/embeddedsw/pull/115). C code should compile fine without any of these concerns.

Now we are fully prepared to launch the debug session. Launch the debugger and wait for the program and bitstream to load over JTAG. By default, the program breaks at the start. Press the 'play' button and observe the hopefully correct output in the SDK Terminal.

Once the BSP is set up, it can be used for all application projects in the SDK workspace. The next step is to integrate BERT into an application. Instructions for doing so can be found [here](bert.md).
