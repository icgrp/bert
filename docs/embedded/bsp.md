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

Now that these newer versions of these libraries have been added to the Xilinx installation, the new versions of xilfpga and xilsecure should show up in the drop down menu of a Board Support Package's settings window as will be shown below.

## BSP Configuration
Open the BSP and modify its settings.  To do this, you expand the BSP on the left of Project Explorer and then open `system.mss`.  From there you will see a "Modify This BSP Settings" button in the middle of the screen.  Click that.

BERT runs on the standalone platform (v7.1), xilfpga v5.1, and xilsecure v4.1 (see below and select as shown).

![Example of BSP configuration](../images/bspsettings.png)

On the left side of the screen under 'standalone' you will see 'xilfpga' and 'xilsecure' options.
 * Select `xilfpga` and make sure `secure_mode` is set to false.
 * Select `xilsecure` and make sure `secure_environment` is set to false.
 * Finally, you should click `standalone` and set the stdout setting to 'psu_uart_1' so print statements can be read over JTAG.

Then click OK and you will have configured your BSP.

## Over-write xilfpga API Library Source Code in BSP
Since BERT takes advantage of custom API calls, the xilfpga library source code must be overwritten in the BSP with the modified version found at `bert/embedded/libsrc/xilfpga_v5_1/src`. 

The files in that directory need to be copied to
`WORK/SDKWorkspace/huffman_demo_bsp/psu_cortexa53_0/libsrc/xilfpga_v5_1` (where WORK and SDKWorkspace are the directories you set up at the start of this tutorial - change these if you named things differently). The preferred method is to use your OS's graphical (GUI) File Explorer program to first copy the files, then go into the  SDK GUI and paste them into the correct directory since this will trigger the SDK to recompile the bsp libraries. You should see the cross compiler output in the 'Console' window as the BSP is regenerated.

The picture shows the part of the bsp directory structure being overwritten when you do the copy above.

![Example of BSP directory structure](../images/bspdirectory.png)

Alternatively, you can use a command shell to do the copy.  If you do this the SDK may not automatically recompile it.  But at any time, you can force a recompilation by right-clicking on the application in the SDK (`huffman_demo`) and selecting "Clean Project".  You will then see the cross compiler output in the 'Console' window.  You will see that it recompiles both the BSP and the application.

NOTE: If other bsp parameters are later changed in `system.mss` or the `Re-generate BSP Sources` button is clicked, the BSP code will be regenerated *and this modified version of xilfpga will be overwritten with the vanilla xilfpga version from the local SDK installation*, negating what you just did. Thus, it is best to completely configure the rest of the BSP before replacing the custom xilfpga library source code. 

Importantly, you shoud know that once configured, the same BSP can be used for multiple applications on a given board. The BSP is setup in this roundabout way is because: (a) SDK 2018.3 does not have a recent enough version of xilfpga and (b) overwriting xilfpga within the BSP does not tamper with the software included in the SDK installation. 

At this point you can return to the main tutorial to continue.
