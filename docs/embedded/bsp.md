# Configuring Your Board Support Package (BSP) for xilfpga (v5.1) library

## BSP Configuration
Open the BSP and modify its settings.  To do this, you expand the BSP (`huffman_demo_bsp`) on the left of Project Explorer and then open `system.mss`.  From there you will see a "Modify This BSP Settings" button in the middle of the screen.  Click that.

BERT runs on the standalone platform (v7.1), xilfpga v5.1, and xilsecure v4.1 (see below and select as shown).

![Example of BSP configuration](../images/bspsettings.png)

On the left side of the screen under 'standalone' you will see 'xilfpga' and 'xilsecure' options.
 * Select `xilfpga` and make sure `secure_mode` is set to false.
 * Select `xilsecure` and make sure `secure_environment` is set to false.
 * Finally, you should click `standalone` and set the `stdout` setting to 'psu_uart_1' so print statements can be read over JTAG.

Then click OK and you will have configured your BSP.

## Over-write xilfpga API Library Source Code in BSP
Since BERT takes advantage of custom API calls, the xilfpga library source code must be overwritten in the BSP with modified versions.  These are found at `bert/embedded/libsrc/xilfpga_v5_1/src` and are to be copied to 
`WORK/SDKWorkspace/huffman_demo_bsp/psu_cortexa53_0/libsrc/xilfpga_v5_1` (where WORK and SDKWorkspace are the directories you set up at the start of this tutorial - change these if you named things differently). 

To help you do this, however, a script has been created which will do this copying for you (as well as copying BERT sources over).    This script can be run as:
```
python3 BERT/docs/tutorials/huffman/copybspfiles.py WORK
```
where BERT is where your BERT repo lives and WORK is the directory you copied the provided files into at the start of this tutorial.

NOTE: If other bsp parameters are later changed in `system.mss` or the `Re-generate BSP Sources` button is clicked, the BSP code will be regenerated *and this modified version of xilfpga will be overwritten with the vanilla xilfpga version from the local SDK installation*, negating what you just did. Thus, it is best to completely configure the rest of the BSP before replacing the custom xilfpga library source code. 

Also, realize that the output of the above script tells you just what it is doing so you can go back and just re-copy the needed BSP files if needed.

<!--
Importantly, you should know that once configured, the same BSP can be used for multiple applications on a given board. The BSP is setup in this roundabout way is because: (a) SDK 2018.3 does not have a recent enough version of xilfpga and (b) overwriting xilfpga within the BSP does not tamper with the software included in the SDK installation. 
-->

At this point you can return to the main tutorial to continue.
