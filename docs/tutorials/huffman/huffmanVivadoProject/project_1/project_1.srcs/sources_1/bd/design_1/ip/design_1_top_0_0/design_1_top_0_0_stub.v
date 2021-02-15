// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Jan  7 15:00:39 2021
// Host        : ubuntu running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/nelson/bert/docs/tutorials/huffman/huffmanVivadoProject/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_top_0_0/design_1_top_0_0_stub.v
// Design      : design_1_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "top,Vivado 2018.3" *)
module design_1_top_0_0(clk, clr, done, psResultsAddr, psResultsDout, 
  psHistAddr, psHistDout, psRawEna, psRawWE, psRawAddr, psRawDin, psHuffEna, psHuffWE, psHuffAddr, 
  psHuffDin)
/* synthesis syn_black_box black_box_pad_pin="clk,clr,done,psResultsAddr[11:0],psResultsDout[31:0],psHistAddr[11:0],psHistDout[31:0],psRawEna,psRawWE[3:0],psRawAddr[11:0],psRawDin[31:0],psHuffEna,psHuffWE[3:0],psHuffAddr[11:0],psHuffDin[31:0]" */;
  input clk;
  input clr;
  output done;
  input [11:0]psResultsAddr;
  output [31:0]psResultsDout;
  input [11:0]psHistAddr;
  output [31:0]psHistDout;
  input psRawEna;
  input [3:0]psRawWE;
  input [11:0]psRawAddr;
  input [31:0]psRawDin;
  input psHuffEna;
  input [3:0]psHuffWE;
  input [11:0]psHuffAddr;
  input [31:0]psHuffDin;
endmodule
