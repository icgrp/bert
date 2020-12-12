# Setting Up Xilinx SDK Environment
There are two ways to accomplish getting a design into the SDK so you can test it.  Normally, you would create a design yourself in Vivado and then do a `File->Export->Export Hardware` followed by a `File->Launch SDK`.  These will generate a hardware description (.hdf) file and a .bit file.

However, in this tutorial the instructions will have you use a precompiled design that is provided by you.  For this tutorial, a .hdf and .dcp file are provided foryou within the bert GIT repo for the Ultra96-V2 board to save time.  You can find those in this directory: `.../bert/docs/tutorials/huffman/hw_huffman` in the repo.  Copy the files in that directory into a directory where you intend to work through this tutorial.

## 1. Launch SDK
Open the SDK and establish a new workspace in a directory of your choosing (if you already have a workspace open (you have previously run SDK), choose `File->Switch Workspace->Other`).  Earlier in the tutorial you were asked to copy a set of files into a directory we are calling `WORK`.  For this tutorial, use `WORK/SDKWorkspace` as your workspace.

## 2. Create application project alongside Platform and BSP
Create a new application by clicking the "Create Application Project" link as shown below.
![Example of new workspace](../images/newworkspace.png)

Give the project a name such as `huffman_demo`. Next, before clicking okay, next to 'Hardware Platform' click the 'New...' button.

![Example of new application project](../images/newproject.png)

Then, browse to the .hdf file in your working directory (you copied above)
in the 'Target Hardware Specification' field.  It will then fill in the
hardware project name based on that.  Now click finish.

![Example of new application project](../images/newplatform.png)

Now click finish again and you are brought back to the Project Explorer.  At this point you should have three items in the SDK left-side Project Explorer pane:
- One will be `top_hw_platform_0` and is the hardware for the project.  
- One will be `huffman_demo` which is the software application for the project.
- One will be `huffman_demo_bsp` and is the board support package.

At this point you can click Back to return to the main tutorial.
