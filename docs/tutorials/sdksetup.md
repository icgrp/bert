Setting Up Xilinx SDK Environment
=======================

TODOs:

## 1. Export hdf from Vivado

To export the hdf from Vivado, go to File -> Export -> Export Hardware. 

![Where to click export hardware](../images/exporthardware.png)

## 2. Launch SDK
If you wrote the hdf to the default location (a subdirectory of the working directory), you can click File -> Launch SDK.

If you are using an hdf provided (as in the tutorials), first open the SDK and establish a new workspace in a directory of your choosing.

## 2. Create application project alongside Platform and BSP
Create a new application.
![Example of new workspace](../images/newworkspace.png)

Give the project a name. Before clicking okay, next to 'Hardware Platform' click the 'New...' button.

![Example of new application project](../images/newproject.png)

To create the platform, point to the hdf file in the 'Target Hardware Specification' field.

![Example of new application project](../images/newplatform.png)

We can click finish in the platform window and the project window. Now we have a project and BSP generated.

## 3. Adding libraries to BSP
Libraries are added by opening the system.mss file within the bsp directory. Click 'Modify this BSP's Settings.' In this window, there is a dropdown to change the standalone OS version. In the overview tab, there are checkboxes for including a library of your choosing. [bsp.md](../docs/bsp.md) covers which libraries and versions you will need for BERT as well as other additional steps.

While in this window, you should change stdout to 'psu_uart_1' in the standalone OS tab so print statements can be read over JTAG.


## If Necessary: Compiler flags
Adding a library to a bsp after a project has already been formulated sometimes causes an issue where the makefile is not updated to link against the new libary. If you are getting compiler errors, you can check that the right flags are set by opening the projects properties. Once there, go to C/C++ Build -> Settings -> ARM v8 gcc linker -> Inferred Options -> Software Platform. The specific flags you are looking for as they relate to BERT is coverted in [bert.md](../docs/bsp.md).
