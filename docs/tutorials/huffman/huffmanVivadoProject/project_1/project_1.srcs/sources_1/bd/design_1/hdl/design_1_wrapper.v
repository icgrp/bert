//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Thu Jan  7 14:58:58 2021
//Host        : ubuntu running 64-bit Ubuntu 16.04.6 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (huffClr_0);
  output huffClr_0;

  wire huffClr_0;

  design_1 design_1_i
       (.huffClr_0(huffClr_0));
endmodule
