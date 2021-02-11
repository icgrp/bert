// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Jan  7 15:00:39 2021
// Host        : ubuntu running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/nelson/bert/docs/tutorials/huffman/huffmanVivadoProject/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_top_0_0/design_1_top_0_0_sim_netlist.v
// Design      : design_1_top_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_top_0_0,top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "top,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module design_1_top_0_0
   (clk,
    clr,
    done,
    psResultsAddr,
    psResultsDout,
    psHistAddr,
    psHistDout,
    psRawEna,
    psRawWE,
    psRawAddr,
    psRawDin,
    psHuffEna,
    psHuffWE,
    psHuffAddr,
    psHuffDin);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input clk;
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

  wire \<const0> ;
  wire clk;
  wire clr;
  wire done;
  wire [11:0]psHistAddr;
  wire [15:0]\^psHistDout ;
  wire [11:0]psHuffAddr;
  wire [31:0]psHuffDin;
  wire psHuffEna;
  wire [3:0]psHuffWE;
  wire [11:0]psRawAddr;
  wire [31:0]psRawDin;
  wire psRawEna;
  wire [3:0]psRawWE;
  wire [11:0]psResultsAddr;
  wire [15:0]\^psResultsDout ;

  assign psHistDout[31] = \<const0> ;
  assign psHistDout[30] = \<const0> ;
  assign psHistDout[29] = \<const0> ;
  assign psHistDout[28] = \<const0> ;
  assign psHistDout[27] = \<const0> ;
  assign psHistDout[26] = \<const0> ;
  assign psHistDout[25] = \<const0> ;
  assign psHistDout[24] = \<const0> ;
  assign psHistDout[23] = \<const0> ;
  assign psHistDout[22] = \<const0> ;
  assign psHistDout[21] = \<const0> ;
  assign psHistDout[20] = \<const0> ;
  assign psHistDout[19] = \<const0> ;
  assign psHistDout[18] = \<const0> ;
  assign psHistDout[17] = \<const0> ;
  assign psHistDout[16] = \<const0> ;
  assign psHistDout[15:0] = \^psHistDout [15:0];
  assign psResultsDout[31] = \<const0> ;
  assign psResultsDout[30] = \<const0> ;
  assign psResultsDout[29] = \<const0> ;
  assign psResultsDout[28] = \<const0> ;
  assign psResultsDout[27] = \<const0> ;
  assign psResultsDout[26] = \<const0> ;
  assign psResultsDout[25] = \<const0> ;
  assign psResultsDout[24] = \<const0> ;
  assign psResultsDout[23] = \<const0> ;
  assign psResultsDout[22] = \<const0> ;
  assign psResultsDout[21] = \<const0> ;
  assign psResultsDout[20] = \<const0> ;
  assign psResultsDout[19] = \<const0> ;
  assign psResultsDout[18] = \<const0> ;
  assign psResultsDout[17] = \<const0> ;
  assign psResultsDout[16] = \<const0> ;
  assign psResultsDout[15:0] = \^psResultsDout [15:0];
  GND GND
       (.G(\<const0> ));
  design_1_top_0_0_top inst
       (.clk(clk),
        .clr(clr),
        .done(done),
        .psHistAddr(psHistAddr[9:2]),
        .psHistDout(\^psHistDout ),
        .psHuffAddr(psHuffAddr[9:2]),
        .psHuffDin(psHuffDin[19:0]),
        .psHuffEna(psHuffEna),
        .psHuffWE(psHuffWE),
        .psRawAddr(psRawAddr[11:2]),
        .psRawDin(psRawDin[7:0]),
        .psRawEna(psRawEna),
        .psRawWE(psRawWE),
        .psResultsAddr(psResultsAddr[11:2]),
        .psResultsDout(\^psResultsDout ));
endmodule

(* ORIG_REF_NAME = "consume" *) 
module design_1_top_0_0_consume
   (psResultsDout,
    cs,
    clk,
    psResultsAddr,
    Q,
    E,
    clrPCE2_out,
    clr,
    resultsMem_reg_bram_0_0);
  output [15:0]psResultsDout;
  output [0:0]cs;
  input clk;
  input [9:0]psResultsAddr;
  input [15:0]Q;
  input [0:0]E;
  input clrPCE2_out;
  input clr;
  input [2:0]resultsMem_reg_bram_0_0;

  wire [0:0]E;
  wire [15:0]Q;
  wire clk;
  wire clr;
  wire clrPCE2_out;
  wire [9:0]cnt_reg__0;
  wire [0:0]cs;
  wire p_0_in;
  wire [9:0]psResultsAddr;
  wire [15:0]psResultsDout;
  wire [2:0]resultsMem_reg_bram_0_0;
  wire resultsMem_reg_bram_0_i_10_n_0;
  wire resultsMem_reg_bram_0_i_11_n_0;
  wire resultsMem_reg_bram_0_i_13_n_0;
  wire resultsMem_reg_bram_0_i_2_n_0;
  wire resultsMem_reg_bram_0_i_3_n_0;
  wire resultsMem_reg_bram_0_i_4_n_0;
  wire resultsMem_reg_bram_0_i_5_n_0;
  wire resultsMem_reg_bram_0_i_6_n_0;
  wire resultsMem_reg_bram_0_i_7_n_0;
  wire resultsMem_reg_bram_0_i_8_n_0;
  wire resultsMem_reg_bram_0_i_9_n_0;
  wire [15:0]NLW_resultsMem_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_resultsMem_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_resultsMem_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_resultsMem_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_resultsMem_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [1:0]NLW_resultsMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_resultsMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  FDRE \cnt_reg[0] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_11_n_0),
        .Q(cnt_reg__0[0]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[1] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_10_n_0),
        .Q(cnt_reg__0[1]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[2] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_9_n_0),
        .Q(cnt_reg__0[2]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[3] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_8_n_0),
        .Q(cnt_reg__0[3]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[4] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_7_n_0),
        .Q(cnt_reg__0[4]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[5] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_6_n_0),
        .Q(cnt_reg__0[5]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[6] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_5_n_0),
        .Q(cnt_reg__0[6]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[7] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_4_n_0),
        .Q(cnt_reg__0[7]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[8] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_3_n_0),
        .Q(cnt_reg__0[8]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[9] 
       (.C(clk),
        .CE(E),
        .D(resultsMem_reg_bram_0_i_2_n_0),
        .Q(cnt_reg__0[9]),
        .R(clrPCE2_out));
  FDRE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(E),
        .Q(cs),
        .R(clrPCE2_out));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "16384" *) 
  (* RTL_RAM_NAME = "resultsMem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "15" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    resultsMem_reg_bram_0
       (.ADDRARDADDR({resultsMem_reg_bram_0_i_2_n_0,resultsMem_reg_bram_0_i_3_n_0,resultsMem_reg_bram_0_i_4_n_0,resultsMem_reg_bram_0_i_5_n_0,resultsMem_reg_bram_0_i_6_n_0,resultsMem_reg_bram_0_i_7_n_0,resultsMem_reg_bram_0_i_8_n_0,resultsMem_reg_bram_0_i_9_n_0,resultsMem_reg_bram_0_i_10_n_0,resultsMem_reg_bram_0_i_11_n_0,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({psResultsAddr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(NLW_resultsMem_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_resultsMem_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_resultsMem_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_resultsMem_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DINADIN(Q),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_resultsMem_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT(psResultsDout),
        .DOUTPADOUTP(NLW_resultsMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_resultsMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(p_0_in),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({E,E}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'hFFFE)) 
    resultsMem_reg_bram_0_i_1
       (.I0(clr),
        .I1(resultsMem_reg_bram_0_0[2]),
        .I2(resultsMem_reg_bram_0_0[1]),
        .I3(resultsMem_reg_bram_0_0[0]),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    resultsMem_reg_bram_0_i_10
       (.I0(cnt_reg__0[0]),
        .I1(cnt_reg__0[1]),
        .O(resultsMem_reg_bram_0_i_10_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    resultsMem_reg_bram_0_i_11
       (.I0(cnt_reg__0[0]),
        .O(resultsMem_reg_bram_0_i_11_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    resultsMem_reg_bram_0_i_13
       (.I0(cnt_reg__0[5]),
        .I1(cnt_reg__0[3]),
        .I2(cnt_reg__0[0]),
        .I3(cnt_reg__0[1]),
        .I4(cnt_reg__0[2]),
        .I5(cnt_reg__0[4]),
        .O(resultsMem_reg_bram_0_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    resultsMem_reg_bram_0_i_2
       (.I0(cnt_reg__0[9]),
        .I1(cnt_reg__0[7]),
        .I2(resultsMem_reg_bram_0_i_13_n_0),
        .I3(cnt_reg__0[6]),
        .I4(cnt_reg__0[8]),
        .O(resultsMem_reg_bram_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    resultsMem_reg_bram_0_i_3
       (.I0(cnt_reg__0[8]),
        .I1(cnt_reg__0[6]),
        .I2(resultsMem_reg_bram_0_i_13_n_0),
        .I3(cnt_reg__0[7]),
        .O(resultsMem_reg_bram_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    resultsMem_reg_bram_0_i_4
       (.I0(cnt_reg__0[7]),
        .I1(resultsMem_reg_bram_0_i_13_n_0),
        .I2(cnt_reg__0[6]),
        .O(resultsMem_reg_bram_0_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    resultsMem_reg_bram_0_i_5
       (.I0(cnt_reg__0[6]),
        .I1(resultsMem_reg_bram_0_i_13_n_0),
        .O(resultsMem_reg_bram_0_i_5_n_0));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    resultsMem_reg_bram_0_i_6
       (.I0(cnt_reg__0[5]),
        .I1(cnt_reg__0[3]),
        .I2(cnt_reg__0[0]),
        .I3(cnt_reg__0[1]),
        .I4(cnt_reg__0[2]),
        .I5(cnt_reg__0[4]),
        .O(resultsMem_reg_bram_0_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    resultsMem_reg_bram_0_i_7
       (.I0(cnt_reg__0[4]),
        .I1(cnt_reg__0[2]),
        .I2(cnt_reg__0[1]),
        .I3(cnt_reg__0[0]),
        .I4(cnt_reg__0[3]),
        .O(resultsMem_reg_bram_0_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    resultsMem_reg_bram_0_i_8
       (.I0(cnt_reg__0[3]),
        .I1(cnt_reg__0[0]),
        .I2(cnt_reg__0[1]),
        .I3(cnt_reg__0[2]),
        .O(resultsMem_reg_bram_0_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    resultsMem_reg_bram_0_i_9
       (.I0(cnt_reg__0[2]),
        .I1(cnt_reg__0[1]),
        .I2(cnt_reg__0[0]),
        .O(resultsMem_reg_bram_0_i_9_n_0));
endmodule

(* ORIG_REF_NAME = "encode" *) 
module design_1_top_0_0_encode
   (psHistDout,
    Q,
    D,
    \cs_reg[1]_0 ,
    E,
    clk,
    \FSM_sequential_cs_reg[0] ,
    \FSM_sequential_cs_reg[0]_0 ,
    cs,
    clr,
    in0_out,
    psHistAddr,
    clrPCE2_out,
    \cs_reg[1]_1 ,
    huffmanMem_reg_0,
    psHuffEna,
    psHuffWE,
    psHuffAddr,
    psHuffDin);
  output [15:0]psHistDout;
  output [15:0]Q;
  output [0:0]D;
  output \cs_reg[1]_0 ;
  output [0:0]E;
  input clk;
  input [2:0]\FSM_sequential_cs_reg[0] ;
  input \FSM_sequential_cs_reg[0]_0 ;
  input [0:0]cs;
  input clr;
  input [7:0]in0_out;
  input [7:0]psHistAddr;
  input clrPCE2_out;
  input [1:0]\cs_reg[1]_1 ;
  input huffmanMem_reg_0;
  input psHuffEna;
  input [3:0]psHuffWE;
  input [7:0]psHuffAddr;
  input [19:0]psHuffDin;

  wire [0:0]D;
  wire [0:0]E;
  wire [2:0]\FSM_sequential_cs_reg[0] ;
  wire \FSM_sequential_cs_reg[0]_0 ;
  wire HIST_n_16;
  wire HIST_n_17;
  wire HIST_n_18;
  wire HIST_n_19;
  wire HIST_n_20;
  wire HIST_n_21;
  wire HIST_n_22;
  wire HIST_n_23;
  wire HIST_n_24;
  wire HIST_n_25;
  wire HIST_n_26;
  wire HIST_n_27;
  wire HIST_n_28;
  wire HIST_n_29;
  wire HIST_n_30;
  wire HIST_n_31;
  wire [15:0]Q;
  wire clk;
  wire clr;
  wire clrPCE2_out;
  wire clrPtr;
  wire [19:0]code;
  wire [0:0]cs;
  wire \cs[0]_i_1__1_n_0 ;
  wire \cs[1]_i_1_n_0 ;
  wire \cs[2]_i_2_n_0 ;
  wire [2:0]cs_0;
  wire \cs_reg[1]_0 ;
  wire [1:0]\cs_reg[1]_1 ;
  wire huffmanMem_reg_0;
  wire [7:0]in0_out;
  wire [14:0]p_0_in;
  wire p_0_in2_out;
  wire [7:0]psHistAddr;
  wire [15:0]psHistDout;
  wire [7:0]psHuffAddr;
  wire [19:0]psHuffDin;
  wire psHuffEna;
  wire [3:0]psHuffWE;
  wire [4:0]ptr;
  wire [4:0]ptr_reg__0;
  wire [30:16]r;
  wire \r[10]_i_2_n_0 ;
  wire \r[11]_i_2_n_0 ;
  wire \r[12]_i_2_n_0 ;
  wire \r[13]_i_2_n_0 ;
  wire \r[14]_i_2_n_0 ;
  wire \r[14]_i_3_n_0 ;
  wire \r[15]_i_2_n_0 ;
  wire \r[15]_i_3_n_0 ;
  wire \r[16]_i_2_n_0 ;
  wire \r[16]_i_3_n_0 ;
  wire \r[16]_i_4_n_0 ;
  wire \r[17]_i_2_n_0 ;
  wire \r[17]_i_3_n_0 ;
  wire \r[18]_i_2_n_0 ;
  wire \r[18]_i_3_n_0 ;
  wire \r[19]_i_2_n_0 ;
  wire \r[19]_i_3_n_0 ;
  wire \r[20]_i_2_n_0 ;
  wire \r[20]_i_3_n_0 ;
  wire \r[21]_i_2_n_0 ;
  wire \r[21]_i_3_n_0 ;
  wire \r[22]_i_2_n_0 ;
  wire \r[22]_i_3_n_0 ;
  wire \r[23]_i_2_n_0 ;
  wire \r[24]_i_2_n_0 ;
  wire \r[24]_i_3_n_0 ;
  wire \r[25]_i_2_n_0 ;
  wire \r[25]_i_3_n_0 ;
  wire \r[26]_i_2_n_0 ;
  wire \r[26]_i_3_n_0 ;
  wire \r[27]_i_2_n_0 ;
  wire \r[28]_i_2_n_0 ;
  wire \r[29]_i_2_n_0 ;
  wire \r[30]_i_1_n_0 ;
  wire \r[30]_i_4_n_0 ;
  wire \r[3]_i_2_n_0 ;
  wire \r[8]_i_2_n_0 ;
  wire \r[9]_i_2_n_0 ;
  wire [15:0]NLW_huffmanMem_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_huffmanMem_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_huffmanMem_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_huffmanMem_reg_CASDOUTPB_UNCONNECTED;
  wire [15:4]NLW_huffmanMem_reg_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_huffmanMem_reg_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_huffmanMem_reg_DOUTPBDOUTP_UNCONNECTED;

  design_1_top_0_0_histogram HIST
       (.D({HIST_n_16,HIST_n_17,HIST_n_18,HIST_n_19,HIST_n_20,HIST_n_21,HIST_n_22,HIST_n_23,HIST_n_24,HIST_n_25,HIST_n_26,HIST_n_27,HIST_n_28,HIST_n_29,HIST_n_30,HIST_n_31,p_0_in}),
        .E(E),
        .\FSM_sequential_cs_reg[0] (\FSM_sequential_cs_reg[0] ),
        .\FSM_sequential_cs_reg[0]_0 (\FSM_sequential_cs_reg[0]_0 ),
        .\FSM_sequential_cs_reg[0]_1 (\cs_reg[1]_1 ),
        .\FSM_sequential_cs_reg[2] (D),
        .I2(\cs_reg[1]_0 ),
        .Q({r,Q}),
        .clk(clk),
        .clr(clr),
        .clrPtr(clrPtr),
        .code(code[19:16]),
        .cs(cs),
        .huffmanMem_reg(cs_0),
        .huffmanMem_reg_0(huffmanMem_reg_0),
        .in0_out(in0_out),
        .psHistAddr(psHistAddr),
        .psHistDout(psHistDout),
        .\ptr_reg[4] (ptr[4:1]),
        .\ptr_reg[4]_0 (ptr_reg__0),
        .\r_reg[0] (\r[8]_i_2_n_0 ),
        .\r_reg[11] (\r[11]_i_2_n_0 ),
        .\r_reg[15] (\r[15]_i_2_n_0 ),
        .\r_reg[15]_0 (\r[15]_i_3_n_0 ),
        .\r_reg[16] (\r[16]_i_2_n_0 ),
        .\r_reg[16]_0 (\r[16]_i_3_n_0 ),
        .\r_reg[17] (\r[17]_i_2_n_0 ),
        .\r_reg[18] (\r[18]_i_2_n_0 ),
        .\r_reg[19] (\r[19]_i_2_n_0 ),
        .\r_reg[1] (\r[9]_i_2_n_0 ),
        .\r_reg[20] (\r[20]_i_2_n_0 ),
        .\r_reg[21] (\r[21]_i_2_n_0 ),
        .\r_reg[22] (\r[22]_i_2_n_0 ),
        .\r_reg[23] (\r[23]_i_2_n_0 ),
        .\r_reg[24] (\r[24]_i_2_n_0 ),
        .\r_reg[24]_0 (\r[24]_i_3_n_0 ),
        .\r_reg[25] (\r[25]_i_2_n_0 ),
        .\r_reg[26] (\r[26]_i_2_n_0 ),
        .\r_reg[27] (\r[27]_i_2_n_0 ),
        .\r_reg[28] (\r[28]_i_2_n_0 ),
        .\r_reg[29] (\r[29]_i_2_n_0 ),
        .\r_reg[2] (\r[10]_i_2_n_0 ),
        .\r_reg[30] (\r[30]_i_4_n_0 ),
        .\r_reg[3] (\r[3]_i_2_n_0 ),
        .\r_reg[4] (\r[12]_i_2_n_0 ),
        .\r_reg[5] (\r[13]_i_2_n_0 ),
        .\r_reg[6] (\r[14]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \cs[0]_i_1__1 
       (.I0(cs_0[1]),
        .I1(cs_0[0]),
        .O(\cs[0]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000ABAA)) 
    \cs[1]_i_1 
       (.I0(cs_0[1]),
        .I1(clrPCE2_out),
        .I2(\cs_reg[1]_1 [1]),
        .I3(\cs_reg[1]_1 [0]),
        .I4(cs_0[0]),
        .I5(cs_0[2]),
        .O(\cs[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF88888)) 
    \cs[2]_i_2 
       (.I0(cs_0[0]),
        .I1(ptr_reg__0[4]),
        .I2(cs),
        .I3(clrPCE2_out),
        .I4(cs_0[2]),
        .O(\cs[2]_i_2_n_0 ));
  FDRE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\cs[0]_i_1__1_n_0 ),
        .Q(cs_0[0]),
        .R(clrPtr));
  FDRE \cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\cs[1]_i_1_n_0 ),
        .Q(cs_0[1]),
        .R(clrPtr));
  FDRE \cs_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\cs[2]_i_2_n_0 ),
        .Q(cs_0[2]),
        .R(clrPtr));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d20" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d20" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "5120" *) 
  (* RTL_RAM_NAME = "inst/HUFFMAN/ENCODER/huffmanMem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "511" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "19" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "511" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "19" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h000F7F33000F7F32000F7F31000F7F30000F7F2F000F7F2E000F7F2D000F7F2C),
    .INIT_01(256'h000F7F3A000F7F39000F7F38000F7F37000F7F3600040008000F7F35000F7F34),
    .INIT_02(256'h000F7F42000F7F41000F7F40000F7F3F000F7F3E000F7F3D000F7F3C000F7F3B),
    .INIT_03(256'h000F7F4A000F7F49000F7F48000F7F47000F7F46000F7F45000F7F44000F7F43),
    .INIT_04(256'h000F7F51000F7F50000F7F4F000F7F4E000F7F4D000F7F4C000F7F4B00020000),
    .INIT_05(256'h000F7F58000F7F57000F7F5600040009000F7F55000F7F54000F7F53000F7F52),
    .INIT_06(256'h00050019000500180006003C0006003B0006003A000600390006003800020001),
    .INIT_07(256'h000F7F5D000F7F5C000E3F80000F7F5B000F7F5A000F7F590006003D0004000A),
    .INIT_08(256'h000E3F83000F7F62000E3F82000F7F61000F7F60000F7F5F000E3F81000F7F5E),
    .INIT_09(256'h000E3F87000E3F86000E3F85000E3F84000F7F66000F7F65000F7F64000F7F63),
    .INIT_0A(256'h000F7F6C000F7F6B000E3F89000F7F6A000F7F69000E3F88000F7F68000F7F67),
    .INIT_0B(256'h000F7F72000F7F71000E3F8B000F7F70000E3F8A000F7F6F000F7F6E000F7F6D),
    .INIT_0C(256'h000E3F8C000800FD000800FC000800FB000800FA000800F9000800F8000F7F73),
    .INIT_0D(256'h000E3F91000F7F76000E3F90000E3F8F000F7F75000F7F74000E3F8E000E3F8D),
    .INIT_0E(256'h000F7F7B000F7F7A000F7F79000F7F78000E3F94000E3F93000F7F77000E3F92),
    .INIT_0F(256'h000F7F7F000F7F7E0004000B000F7F7D0005001B000F7F7C000E3F950005001A),
    .INIT_10(256'h000F7F87000F7F86000F7F85000F7F84000F7F83000F7F82000F7F81000F7F80),
    .INIT_11(256'h000F7F8F000F7F8E000F7F8D000F7F8C000F7F8B000F7F8A000F7F89000F7F88),
    .INIT_12(256'h000F7F97000F7F96000F7F95000F7F94000F7F93000F7F92000F7F91000F7F90),
    .INIT_13(256'h000F7F9F000F7F9E000F7F9D000F7F9C000F7F9B000F7F9A000F7F99000F7F98),
    .INIT_14(256'h000F7FA7000F7FA6000F7FA5000F7FA4000F7FA3000F7FA2000F7FA1000F7FA0),
    .INIT_15(256'h000F7FAF000F7FAE000F7FAD000F7FAC000F7FAB000F7FAA000F7FA9000F7FA8),
    .INIT_16(256'h000F7FB7000F7FB6000F7FB5000F7FB4000F7FB3000F7FB2000F7FB1000F7FB0),
    .INIT_17(256'h000F7FBF000F7FBE000F7FBD000F7FBC000F7FBB000F7FBA000F7FB9000F7FB8),
    .INIT_18(256'h000F7FC7000F7FC6000F7FC5000F7FC4000F7FC3000F7FC2000F7FC1000F7FC0),
    .INIT_19(256'h000F7FCF000F7FCE000F7FCD000F7FCC000F7FCB000F7FCA000F7FC9000F7FC8),
    .INIT_1A(256'h000F7FD7000F7FD6000F7FD5000F7FD4000F7FD3000F7FD2000F7FD1000F7FD0),
    .INIT_1B(256'h000F7FDF000F7FDE000F7FDD000F7FDC000F7FDB000F7FDA000F7FD9000F7FD8),
    .INIT_1C(256'h000F7FE7000F7FE6000F7FE5000F7FE4000F7FE3000F7FE2000F7FE1000F7FE0),
    .INIT_1D(256'h000F7FEF000F7FEE000F7FED000F7FEC000F7FEB000F7FEA000F7FE9000F7FE8),
    .INIT_1E(256'h000F7FF7000F7FF6000F7FF5000F7FF4000F7FF3000F7FF2000F7FF1000F7FF0),
    .INIT_1F(256'h000F7FFF000F7FFE000F7FFD000F7FFC000F7FFB000F7FFA000F7FF9000F7FF8),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(0),
    .WRITE_WIDTH_B(36)) 
    huffmanMem_reg
       (.ADDRARDADDR({1'b0,in0_out,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,psHuffAddr,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_huffmanMem_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_huffmanMem_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_huffmanMem_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_huffmanMem_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DINADIN(psHuffDin[15:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,psHuffDin[19:16]}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(code[15:0]),
        .DOUTBDOUT({NLW_huffmanMem_reg_DOUTBDOUT_UNCONNECTED[15:4],code[19:16]}),
        .DOUTPADOUTP(NLW_huffmanMem_reg_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_huffmanMem_reg_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(\cs_reg[1]_0 ),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({p_0_in2_out,p_0_in2_out,p_0_in2_out,p_0_in2_out}));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \p_0_in_inferred__0/i_ 
       (.I0(psHuffEna),
        .I1(psHuffWE[1]),
        .I2(psHuffWE[0]),
        .I3(psHuffWE[2]),
        .I4(psHuffWE[3]),
        .O(p_0_in2_out));
  LUT4 #(
    .INIT(16'h9AAA)) 
    \ptr[0]_i_1 
       (.I0(ptr_reg__0[0]),
        .I1(cs_0[2]),
        .I2(cs_0[1]),
        .I3(code[16]),
        .O(ptr[0]));
  FDRE \ptr_reg[0] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(ptr[0]),
        .Q(ptr_reg__0[0]),
        .R(clrPtr));
  FDRE \ptr_reg[1] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(ptr[1]),
        .Q(ptr_reg__0[1]),
        .R(clrPtr));
  FDRE \ptr_reg[2] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(ptr[2]),
        .Q(ptr_reg__0[2]),
        .R(clrPtr));
  FDRE \ptr_reg[3] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(ptr[3]),
        .Q(ptr_reg__0[3]),
        .R(clrPtr));
  FDRE \ptr_reg[4] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(ptr[4]),
        .Q(ptr_reg__0[4]),
        .R(clrPtr));
  LUT6 #(
    .INIT(64'h0000000033E200E2)) 
    \r[10]_i_2 
       (.I0(code[2]),
        .I1(ptr_reg__0[0]),
        .I2(code[1]),
        .I3(ptr_reg__0[1]),
        .I4(code[0]),
        .I5(ptr_reg__0[2]),
        .O(\r[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \r[11]_i_2 
       (.I0(\r[3]_i_2_n_0 ),
        .I1(ptr_reg__0[2]),
        .O(\r[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    \r[12]_i_2 
       (.I0(ptr_reg__0[0]),
        .I1(code[0]),
        .I2(ptr_reg__0[1]),
        .I3(ptr_reg__0[2]),
        .I4(\r[16]_i_4_n_0 ),
        .O(\r[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \r[13]_i_2 
       (.I0(code[1]),
        .I1(ptr_reg__0[0]),
        .I2(code[0]),
        .I3(ptr_reg__0[1]),
        .I4(ptr_reg__0[2]),
        .I5(\r[17]_i_3_n_0 ),
        .O(\r[13]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[14]_i_2 
       (.I0(\r[14]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[18]_i_3_n_0 ),
        .O(\r[14]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \r[14]_i_3 
       (.I0(code[0]),
        .I1(ptr_reg__0[1]),
        .I2(code[1]),
        .I3(ptr_reg__0[0]),
        .I4(code[2]),
        .O(\r[14]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[15]_i_2 
       (.I0(\r[3]_i_2_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[19]_i_3_n_0 ),
        .O(\r[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[15]_i_3 
       (.I0(\r[23]_i_2_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[27]_i_2_n_0 ),
        .O(\r[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[16]_i_2 
       (.I0(\r[16]_i_4_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[20]_i_3_n_0 ),
        .O(\r[16]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[16]_i_3 
       (.I0(\r[24]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[24]_i_2_n_0 ),
        .O(\r[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[16]_i_4 
       (.I0(code[1]),
        .I1(code[2]),
        .I2(ptr_reg__0[1]),
        .I3(code[3]),
        .I4(ptr_reg__0[0]),
        .I5(code[4]),
        .O(\r[16]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[17]_i_2 
       (.I0(\r[17]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[21]_i_3_n_0 ),
        .O(\r[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[17]_i_3 
       (.I0(code[2]),
        .I1(code[3]),
        .I2(ptr_reg__0[1]),
        .I3(code[4]),
        .I4(ptr_reg__0[0]),
        .I5(code[5]),
        .O(\r[17]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[18]_i_2 
       (.I0(\r[18]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[22]_i_3_n_0 ),
        .O(\r[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[18]_i_3 
       (.I0(code[3]),
        .I1(code[4]),
        .I2(ptr_reg__0[1]),
        .I3(code[5]),
        .I4(ptr_reg__0[0]),
        .I5(code[6]),
        .O(\r[18]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[19]_i_2 
       (.I0(\r[19]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[23]_i_2_n_0 ),
        .O(\r[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[19]_i_3 
       (.I0(code[4]),
        .I1(code[5]),
        .I2(ptr_reg__0[1]),
        .I3(code[6]),
        .I4(ptr_reg__0[0]),
        .I5(code[7]),
        .O(\r[19]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[20]_i_2 
       (.I0(\r[20]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[24]_i_3_n_0 ),
        .O(\r[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[20]_i_3 
       (.I0(code[5]),
        .I1(code[6]),
        .I2(ptr_reg__0[1]),
        .I3(code[7]),
        .I4(ptr_reg__0[0]),
        .I5(code[8]),
        .O(\r[20]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[21]_i_2 
       (.I0(\r[21]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[25]_i_3_n_0 ),
        .O(\r[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[21]_i_3 
       (.I0(code[6]),
        .I1(code[7]),
        .I2(ptr_reg__0[1]),
        .I3(code[8]),
        .I4(ptr_reg__0[0]),
        .I5(code[9]),
        .O(\r[21]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r[22]_i_2 
       (.I0(\r[22]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(\r[26]_i_3_n_0 ),
        .O(\r[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[22]_i_3 
       (.I0(code[7]),
        .I1(code[8]),
        .I2(ptr_reg__0[1]),
        .I3(code[9]),
        .I4(ptr_reg__0[0]),
        .I5(code[10]),
        .O(\r[22]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[23]_i_2 
       (.I0(code[8]),
        .I1(code[9]),
        .I2(ptr_reg__0[1]),
        .I3(code[10]),
        .I4(ptr_reg__0[0]),
        .I5(code[11]),
        .O(\r[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAFC0A0C0)) 
    \r[24]_i_2 
       (.I0(code[13]),
        .I1(code[14]),
        .I2(ptr_reg__0[1]),
        .I3(ptr_reg__0[0]),
        .I4(code[15]),
        .O(\r[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[24]_i_3 
       (.I0(code[9]),
        .I1(code[10]),
        .I2(ptr_reg__0[1]),
        .I3(code[11]),
        .I4(ptr_reg__0[0]),
        .I5(code[12]),
        .O(\r[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hBBB888B888888888)) 
    \r[25]_i_2 
       (.I0(\r[25]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(code[15]),
        .I3(ptr_reg__0[0]),
        .I4(code[14]),
        .I5(ptr_reg__0[1]),
        .O(\r[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[25]_i_3 
       (.I0(code[10]),
        .I1(code[11]),
        .I2(ptr_reg__0[1]),
        .I3(code[12]),
        .I4(ptr_reg__0[0]),
        .I5(code[13]),
        .O(\r[25]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8888888)) 
    \r[26]_i_2 
       (.I0(\r[26]_i_3_n_0 ),
        .I1(ptr_reg__0[2]),
        .I2(code[15]),
        .I3(ptr_reg__0[0]),
        .I4(ptr_reg__0[1]),
        .O(\r[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[26]_i_3 
       (.I0(code[11]),
        .I1(code[12]),
        .I2(ptr_reg__0[1]),
        .I3(code[13]),
        .I4(ptr_reg__0[0]),
        .I5(code[14]),
        .O(\r[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[27]_i_2 
       (.I0(code[12]),
        .I1(code[13]),
        .I2(ptr_reg__0[1]),
        .I3(code[14]),
        .I4(ptr_reg__0[0]),
        .I5(code[15]),
        .O(\r[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h557F5F7FF57FFF7F)) 
    \r[28]_i_2 
       (.I0(ptr_reg__0[2]),
        .I1(code[15]),
        .I2(ptr_reg__0[0]),
        .I3(ptr_reg__0[1]),
        .I4(code[14]),
        .I5(code[13]),
        .O(\r[28]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h7F777FFF)) 
    \r[29]_i_2 
       (.I0(ptr_reg__0[2]),
        .I1(ptr_reg__0[1]),
        .I2(code[14]),
        .I3(ptr_reg__0[0]),
        .I4(code[15]),
        .O(\r[29]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0304)) 
    \r[30]_i_1 
       (.I0(cs),
        .I1(cs_0[2]),
        .I2(cs_0[0]),
        .I3(cs_0[1]),
        .O(\r[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \r[30]_i_4 
       (.I0(ptr_reg__0[2]),
        .I1(ptr_reg__0[1]),
        .I2(ptr_reg__0[0]),
        .I3(code[15]),
        .O(\r[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \r[3]_i_2 
       (.I0(code[0]),
        .I1(code[1]),
        .I2(ptr_reg__0[1]),
        .I3(code[2]),
        .I4(ptr_reg__0[0]),
        .I5(code[3]),
        .O(\r[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \r[8]_i_2 
       (.I0(ptr_reg__0[1]),
        .I1(code[0]),
        .I2(ptr_reg__0[0]),
        .I3(ptr_reg__0[2]),
        .O(\r[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00004540)) 
    \r[9]_i_2 
       (.I0(ptr_reg__0[1]),
        .I1(code[0]),
        .I2(ptr_reg__0[0]),
        .I3(code[1]),
        .I4(ptr_reg__0[2]),
        .O(\r[9]_i_2_n_0 ));
  FDRE \r_reg[0] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[0]),
        .Q(Q[0]),
        .R(clrPtr));
  FDRE \r_reg[10] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[10]),
        .Q(Q[10]),
        .R(clrPtr));
  FDRE \r_reg[11] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[11]),
        .Q(Q[11]),
        .R(clrPtr));
  FDRE \r_reg[12] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[12]),
        .Q(Q[12]),
        .R(clrPtr));
  FDRE \r_reg[13] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[13]),
        .Q(Q[13]),
        .R(clrPtr));
  FDRE \r_reg[14] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[14]),
        .Q(Q[14]),
        .R(clrPtr));
  FDRE \r_reg[15] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_31),
        .Q(Q[15]),
        .R(clrPtr));
  FDRE \r_reg[16] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_30),
        .Q(r[16]),
        .R(clrPtr));
  FDRE \r_reg[17] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_29),
        .Q(r[17]),
        .R(clrPtr));
  FDRE \r_reg[18] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_28),
        .Q(r[18]),
        .R(clrPtr));
  FDRE \r_reg[19] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_27),
        .Q(r[19]),
        .R(clrPtr));
  FDRE \r_reg[1] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[1]),
        .Q(Q[1]),
        .R(clrPtr));
  FDRE \r_reg[20] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_26),
        .Q(r[20]),
        .R(clrPtr));
  FDRE \r_reg[21] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_25),
        .Q(r[21]),
        .R(clrPtr));
  FDRE \r_reg[22] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_24),
        .Q(r[22]),
        .R(clrPtr));
  FDRE \r_reg[23] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_23),
        .Q(r[23]),
        .R(clrPtr));
  FDRE \r_reg[24] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_22),
        .Q(r[24]),
        .R(clrPtr));
  FDRE \r_reg[25] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_21),
        .Q(r[25]),
        .R(clrPtr));
  FDRE \r_reg[26] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_20),
        .Q(r[26]),
        .R(clrPtr));
  FDRE \r_reg[27] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_19),
        .Q(r[27]),
        .R(clrPtr));
  FDRE \r_reg[28] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_18),
        .Q(r[28]),
        .R(clrPtr));
  FDRE \r_reg[29] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_17),
        .Q(r[29]),
        .R(clrPtr));
  FDRE \r_reg[2] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[2]),
        .Q(Q[2]),
        .R(clrPtr));
  FDRE \r_reg[30] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(HIST_n_16),
        .Q(r[30]),
        .R(clrPtr));
  FDRE \r_reg[3] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[3]),
        .Q(Q[3]),
        .R(clrPtr));
  FDRE \r_reg[4] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[4]),
        .Q(Q[4]),
        .R(clrPtr));
  FDRE \r_reg[5] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[5]),
        .Q(Q[5]),
        .R(clrPtr));
  FDRE \r_reg[6] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[6]),
        .Q(Q[6]),
        .R(clrPtr));
  FDRE \r_reg[7] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[7]),
        .Q(Q[7]),
        .R(clrPtr));
  FDRE \r_reg[8] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[8]),
        .Q(Q[8]),
        .R(clrPtr));
  FDRE \r_reg[9] 
       (.C(clk),
        .CE(\r[30]_i_1_n_0 ),
        .D(p_0_in[9]),
        .Q(Q[9]),
        .R(clrPtr));
endmodule

(* ORIG_REF_NAME = "histogram" *) 
module design_1_top_0_0_histogram
   (psHistDout,
    D,
    \FSM_sequential_cs_reg[2] ,
    I2,
    clrPtr,
    E,
    \ptr_reg[4] ,
    clk,
    Q,
    \r_reg[30] ,
    \ptr_reg[4]_0 ,
    \r_reg[29] ,
    \r_reg[28] ,
    \r_reg[27] ,
    \r_reg[26] ,
    \r_reg[25] ,
    \r_reg[24] ,
    \r_reg[24]_0 ,
    \r_reg[23] ,
    \r_reg[22] ,
    \r_reg[21] ,
    \r_reg[20] ,
    \r_reg[19] ,
    \r_reg[18] ,
    \r_reg[17] ,
    \r_reg[16] ,
    \r_reg[16]_0 ,
    \r_reg[15] ,
    \r_reg[15]_0 ,
    \FSM_sequential_cs_reg[0] ,
    \FSM_sequential_cs_reg[0]_0 ,
    clr,
    in0_out,
    psHistAddr,
    huffmanMem_reg,
    huffmanMem_reg_0,
    \FSM_sequential_cs_reg[0]_1 ,
    cs,
    code,
    \r_reg[0] ,
    \r_reg[1] ,
    \r_reg[2] ,
    \r_reg[3] ,
    \r_reg[4] ,
    \r_reg[5] ,
    \r_reg[6] ,
    \r_reg[11] );
  output [15:0]psHistDout;
  output [30:0]D;
  output [0:0]\FSM_sequential_cs_reg[2] ;
  output I2;
  output clrPtr;
  output [0:0]E;
  output [3:0]\ptr_reg[4] ;
  input clk;
  input [30:0]Q;
  input \r_reg[30] ;
  input [4:0]\ptr_reg[4]_0 ;
  input \r_reg[29] ;
  input \r_reg[28] ;
  input \r_reg[27] ;
  input \r_reg[26] ;
  input \r_reg[25] ;
  input \r_reg[24] ;
  input \r_reg[24]_0 ;
  input \r_reg[23] ;
  input \r_reg[22] ;
  input \r_reg[21] ;
  input \r_reg[20] ;
  input \r_reg[19] ;
  input \r_reg[18] ;
  input \r_reg[17] ;
  input \r_reg[16] ;
  input \r_reg[16]_0 ;
  input \r_reg[15] ;
  input \r_reg[15]_0 ;
  input [2:0]\FSM_sequential_cs_reg[0] ;
  input \FSM_sequential_cs_reg[0]_0 ;
  input clr;
  input [7:0]in0_out;
  input [7:0]psHistAddr;
  input [2:0]huffmanMem_reg;
  input huffmanMem_reg_0;
  input [1:0]\FSM_sequential_cs_reg[0]_1 ;
  input [0:0]cs;
  input [3:0]code;
  input \r_reg[0] ;
  input \r_reg[1] ;
  input \r_reg[2] ;
  input \r_reg[3] ;
  input \r_reg[4] ;
  input \r_reg[5] ;
  input \r_reg[6] ;
  input \r_reg[11] ;

  wire [30:0]D;
  wire [0:0]E;
  wire \FSM_sequential_cs[0]_i_2_n_0 ;
  wire [2:0]\FSM_sequential_cs_reg[0] ;
  wire \FSM_sequential_cs_reg[0]_0 ;
  wire [1:0]\FSM_sequential_cs_reg[0]_1 ;
  wire [0:0]\FSM_sequential_cs_reg[2] ;
  wire I2;
  wire [30:0]Q;
  wire clearcount;
  wire clk;
  wire clr;
  wire clrPtr;
  wire [3:0]code;
  wire [7:0]count_reg__0;
  wire [0:0]cs;
  wire \cs[1]_i_2__0_n_0 ;
  wire [1:0]cs_0;
  wire [7:0]histAddr;
  wire histMem_reg_bram_0_i_34_n_0;
  wire histMem_reg_bram_0_i_35_n_0;
  wire histMem_reg_bram_0_i_36_n_0;
  wire histMem_reg_bram_0_i_37_n_0;
  wire histMem_reg_bram_0_i_38_n_0;
  wire histMem_reg_bram_0_i_39_n_0;
  wire [2:0]huffmanMem_reg;
  wire huffmanMem_reg_0;
  wire [7:0]in0_out;
  wire [7:0]memAddr;
  wire [15:0]memDin;
  wire memWE;
  wire [1:0]ns;
  wire [7:0]p_0_in__0;
  wire [7:0]psHistAddr;
  wire [15:0]psHistDout;
  wire \ptr[2]_i_2_n_0 ;
  wire \ptr[3]_i_2_n_0 ;
  wire \ptr[4]_i_2_n_0 ;
  wire [3:0]\ptr_reg[4] ;
  wire [4:0]\ptr_reg[4]_0 ;
  wire \r[30]_i_3_n_0 ;
  wire \r_reg[0] ;
  wire \r_reg[11] ;
  wire \r_reg[15] ;
  wire \r_reg[15]_0 ;
  wire \r_reg[16] ;
  wire \r_reg[16]_0 ;
  wire \r_reg[17] ;
  wire \r_reg[18] ;
  wire \r_reg[19] ;
  wire \r_reg[1] ;
  wire \r_reg[20] ;
  wire \r_reg[21] ;
  wire \r_reg[22] ;
  wire \r_reg[23] ;
  wire \r_reg[24] ;
  wire \r_reg[24]_0 ;
  wire \r_reg[25] ;
  wire \r_reg[26] ;
  wire \r_reg[27] ;
  wire \r_reg[28] ;
  wire \r_reg[29] ;
  wire \r_reg[2] ;
  wire \r_reg[30] ;
  wire \r_reg[3] ;
  wire \r_reg[4] ;
  wire \r_reg[5] ;
  wire \r_reg[6] ;
  wire [15:0]NLW_histMem_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_histMem_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_histMem_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_histMem_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_histMem_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [1:0]NLW_histMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_histMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  LUT5 #(
    .INIT(32'h45444444)) 
    \FSM_sequential_cs[0]_i_1 
       (.I0(\FSM_sequential_cs_reg[0] [2]),
        .I1(\FSM_sequential_cs[0]_i_2_n_0 ),
        .I2(\FSM_sequential_cs_reg[0]_0 ),
        .I3(\FSM_sequential_cs_reg[0] [0]),
        .I4(\FSM_sequential_cs_reg[0] [1]),
        .O(\FSM_sequential_cs_reg[2] ));
  LUT6 #(
    .INIT(64'h00000D0D0F000D0D)) 
    \FSM_sequential_cs[0]_i_2 
       (.I0(cs_0[1]),
        .I1(cs_0[0]),
        .I2(\FSM_sequential_cs_reg[0] [0]),
        .I3(\FSM_sequential_cs_reg[0]_1 [1]),
        .I4(\FSM_sequential_cs_reg[0] [1]),
        .I5(\FSM_sequential_cs_reg[0]_1 [0]),
        .O(\FSM_sequential_cs[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(count_reg__0[0]),
        .I1(count_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[2]_i_1 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \count[3]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \count[4]_i_1 
       (.I0(count_reg__0[4]),
        .I1(count_reg__0[2]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[3]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \count[5]_i_1 
       (.I0(count_reg__0[5]),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[2]),
        .I5(count_reg__0[4]),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[6]_i_1 
       (.I0(count_reg__0[6]),
        .I1(\cs[1]_i_2__0_n_0 ),
        .O(p_0_in__0[6]));
  LUT2 #(
    .INIT(4'hB)) 
    \count[7]_i_1 
       (.I0(clr),
        .I1(cs_0[1]),
        .O(clearcount));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[7]_i_2 
       (.I0(count_reg__0[7]),
        .I1(\cs[1]_i_2__0_n_0 ),
        .I2(count_reg__0[6]),
        .O(p_0_in__0[7]));
  FDRE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[0]),
        .Q(count_reg__0[0]),
        .R(clearcount));
  FDRE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[1]),
        .Q(count_reg__0[1]),
        .R(clearcount));
  FDRE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[2]),
        .Q(count_reg__0[2]),
        .R(clearcount));
  FDRE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[3]),
        .Q(count_reg__0[3]),
        .R(clearcount));
  FDRE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[4]),
        .Q(count_reg__0[4]),
        .R(clearcount));
  FDRE \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[5]),
        .Q(count_reg__0[5]),
        .R(clearcount));
  FDRE \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[6]),
        .Q(count_reg__0[6]),
        .R(clearcount));
  FDRE \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__0[7]),
        .Q(count_reg__0[7]),
        .R(clearcount));
  LUT2 #(
    .INIT(4'h2)) 
    \cs[0]_i_1__0 
       (.I0(I2),
        .I1(cs_0[0]),
        .O(ns[0]));
  LUT4 #(
    .INIT(16'h2AAA)) 
    \cs[1]_i_1__1 
       (.I0(cs_0[1]),
        .I1(count_reg__0[6]),
        .I2(\cs[1]_i_2__0_n_0 ),
        .I3(count_reg__0[7]),
        .O(ns[1]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cs[1]_i_2__0 
       (.I0(count_reg__0[5]),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[0]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[2]),
        .I5(count_reg__0[4]),
        .O(\cs[1]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h0001FFFF00010001)) 
    \cs[2]_i_1 
       (.I0(clr),
        .I1(\FSM_sequential_cs_reg[0] [2]),
        .I2(\FSM_sequential_cs_reg[0] [1]),
        .I3(\FSM_sequential_cs_reg[0] [0]),
        .I4(cs_0[0]),
        .I5(cs_0[1]),
        .O(clrPtr));
  FDRE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(ns[0]),
        .Q(cs_0[0]),
        .R(clr));
  FDSE \cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(ns[1]),
        .Q(cs_0[1]),
        .S(clr));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "4096" *) 
  (* RTL_RAM_NAME = "histMem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "255" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "15" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "255" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    histMem_reg_bram_0
       (.ADDRARDADDR({1'b1,1'b1,memAddr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,histAddr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(NLW_histMem_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_histMem_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_histMem_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_histMem_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DINADIN(memDin),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_histMem_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT(psHistDout),
        .DOUTPADOUTP(NLW_histMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_histMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({memWE,memWE}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    histMem_reg_bram_0_i_1
       (.I0(in0_out[7]),
        .I1(cs_0[0]),
        .I2(clr),
        .I3(cs_0[1]),
        .I4(count_reg__0[7]),
        .O(memAddr[7]));
  LUT6 #(
    .INIT(64'hFFFFFCFD03020000)) 
    histMem_reg_bram_0_i_10
       (.I0(cs_0[0]),
        .I1(cs_0[1]),
        .I2(clr),
        .I3(I2),
        .I4(in0_out[6]),
        .I5(psHistAddr[6]),
        .O(histAddr[6]));
  LUT6 #(
    .INIT(64'hFFFFFCFD03020000)) 
    histMem_reg_bram_0_i_11
       (.I0(cs_0[0]),
        .I1(cs_0[1]),
        .I2(clr),
        .I3(I2),
        .I4(in0_out[5]),
        .I5(psHistAddr[5]),
        .O(histAddr[5]));
  LUT6 #(
    .INIT(64'hFFFFFCFD03020000)) 
    histMem_reg_bram_0_i_12
       (.I0(cs_0[0]),
        .I1(cs_0[1]),
        .I2(clr),
        .I3(I2),
        .I4(in0_out[4]),
        .I5(psHistAddr[4]),
        .O(histAddr[4]));
  LUT6 #(
    .INIT(64'hFFFFFCFD03020000)) 
    histMem_reg_bram_0_i_13
       (.I0(cs_0[0]),
        .I1(cs_0[1]),
        .I2(clr),
        .I3(I2),
        .I4(in0_out[3]),
        .I5(psHistAddr[3]),
        .O(histAddr[3]));
  LUT6 #(
    .INIT(64'hFFFFFCFD03020000)) 
    histMem_reg_bram_0_i_14
       (.I0(cs_0[0]),
        .I1(cs_0[1]),
        .I2(clr),
        .I3(I2),
        .I4(in0_out[2]),
        .I5(psHistAddr[2]),
        .O(histAddr[2]));
  LUT6 #(
    .INIT(64'hFFFFFCFD03020000)) 
    histMem_reg_bram_0_i_15
       (.I0(cs_0[0]),
        .I1(cs_0[1]),
        .I2(clr),
        .I3(I2),
        .I4(in0_out[1]),
        .I5(psHistAddr[1]),
        .O(histAddr[1]));
  LUT6 #(
    .INIT(64'hFFFFFCFD03020000)) 
    histMem_reg_bram_0_i_16
       (.I0(cs_0[0]),
        .I1(cs_0[1]),
        .I2(clr),
        .I3(I2),
        .I4(in0_out[0]),
        .I5(psHistAddr[0]),
        .O(histAddr[0]));
  LUT6 #(
    .INIT(64'h0010101010000000)) 
    histMem_reg_bram_0_i_17
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(psHistDout[14]),
        .I4(histMem_reg_bram_0_i_34_n_0),
        .I5(psHistDout[15]),
        .O(memDin[15]));
  LUT6 #(
    .INIT(64'hAA2AAAAA00800000)) 
    histMem_reg_bram_0_i_18
       (.I0(histMem_reg_bram_0_i_35_n_0),
        .I1(psHistDout[13]),
        .I2(psHistDout[12]),
        .I3(histMem_reg_bram_0_i_36_n_0),
        .I4(psHistDout[11]),
        .I5(psHistDout[14]),
        .O(memDin[14]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hA2AA0800)) 
    histMem_reg_bram_0_i_19
       (.I0(histMem_reg_bram_0_i_35_n_0),
        .I1(psHistDout[11]),
        .I2(histMem_reg_bram_0_i_36_n_0),
        .I3(psHistDout[12]),
        .I4(psHistDout[13]),
        .O(memDin[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    histMem_reg_bram_0_i_2
       (.I0(in0_out[6]),
        .I1(cs_0[0]),
        .I2(clr),
        .I3(cs_0[1]),
        .I4(count_reg__0[6]),
        .O(memAddr[6]));
  LUT6 #(
    .INIT(64'h1000101000100000)) 
    histMem_reg_bram_0_i_20
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(histMem_reg_bram_0_i_36_n_0),
        .I4(psHistDout[11]),
        .I5(psHistDout[12]),
        .O(memDin[12]));
  LUT5 #(
    .INIT(32'h10000010)) 
    histMem_reg_bram_0_i_21
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(histMem_reg_bram_0_i_36_n_0),
        .I4(psHistDout[11]),
        .O(memDin[11]));
  LUT5 #(
    .INIT(32'h10000010)) 
    histMem_reg_bram_0_i_22
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(histMem_reg_bram_0_i_37_n_0),
        .I4(psHistDout[10]),
        .O(memDin[10]));
  LUT6 #(
    .INIT(64'hA2AAAAAA08000000)) 
    histMem_reg_bram_0_i_23
       (.I0(histMem_reg_bram_0_i_35_n_0),
        .I1(psHistDout[7]),
        .I2(histMem_reg_bram_0_i_38_n_0),
        .I3(psHistDout[6]),
        .I4(psHistDout[8]),
        .I5(psHistDout[9]),
        .O(memDin[9]));
  LUT5 #(
    .INIT(32'hA2AA0800)) 
    histMem_reg_bram_0_i_24
       (.I0(histMem_reg_bram_0_i_35_n_0),
        .I1(psHistDout[6]),
        .I2(histMem_reg_bram_0_i_38_n_0),
        .I3(psHistDout[7]),
        .I4(psHistDout[8]),
        .O(memDin[8]));
  LUT6 #(
    .INIT(64'h1000101000100000)) 
    histMem_reg_bram_0_i_25
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(histMem_reg_bram_0_i_38_n_0),
        .I4(psHistDout[6]),
        .I5(psHistDout[7]),
        .O(memDin[7]));
  LUT5 #(
    .INIT(32'h10000010)) 
    histMem_reg_bram_0_i_26
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(histMem_reg_bram_0_i_38_n_0),
        .I4(psHistDout[6]),
        .O(memDin[6]));
  LUT5 #(
    .INIT(32'h10000010)) 
    histMem_reg_bram_0_i_27
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(histMem_reg_bram_0_i_39_n_0),
        .I4(psHistDout[5]),
        .O(memDin[5]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    histMem_reg_bram_0_i_28
       (.I0(histMem_reg_bram_0_i_35_n_0),
        .I1(psHistDout[2]),
        .I2(psHistDout[0]),
        .I3(psHistDout[1]),
        .I4(psHistDout[3]),
        .I5(psHistDout[4]),
        .O(memDin[4]));
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    histMem_reg_bram_0_i_29
       (.I0(histMem_reg_bram_0_i_35_n_0),
        .I1(psHistDout[1]),
        .I2(psHistDout[0]),
        .I3(psHistDout[2]),
        .I4(psHistDout[3]),
        .O(memDin[3]));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    histMem_reg_bram_0_i_3
       (.I0(in0_out[5]),
        .I1(cs_0[0]),
        .I2(clr),
        .I3(cs_0[1]),
        .I4(count_reg__0[5]),
        .O(memAddr[5]));
  LUT6 #(
    .INIT(64'h0010101010000000)) 
    histMem_reg_bram_0_i_30
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(psHistDout[0]),
        .I4(psHistDout[1]),
        .I5(psHistDout[2]),
        .O(memDin[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00101000)) 
    histMem_reg_bram_0_i_31
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(psHistDout[1]),
        .I4(psHistDout[0]),
        .O(memDin[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    histMem_reg_bram_0_i_32
       (.I0(cs_0[1]),
        .I1(clr),
        .I2(cs_0[0]),
        .I3(psHistDout[0]),
        .O(memDin[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h14)) 
    histMem_reg_bram_0_i_33
       (.I0(clr),
        .I1(cs_0[1]),
        .I2(cs_0[0]),
        .O(memWE));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    histMem_reg_bram_0_i_34
       (.I0(psHistDout[13]),
        .I1(psHistDout[12]),
        .I2(histMem_reg_bram_0_i_36_n_0),
        .I3(psHistDout[11]),
        .O(histMem_reg_bram_0_i_34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h02)) 
    histMem_reg_bram_0_i_35
       (.I0(cs_0[0]),
        .I1(clr),
        .I2(cs_0[1]),
        .O(histMem_reg_bram_0_i_35_n_0));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    histMem_reg_bram_0_i_36
       (.I0(psHistDout[9]),
        .I1(psHistDout[7]),
        .I2(histMem_reg_bram_0_i_38_n_0),
        .I3(psHistDout[6]),
        .I4(psHistDout[8]),
        .I5(psHistDout[10]),
        .O(histMem_reg_bram_0_i_36_n_0));
  LUT5 #(
    .INIT(32'hF7FFFFFF)) 
    histMem_reg_bram_0_i_37
       (.I0(psHistDout[8]),
        .I1(psHistDout[6]),
        .I2(histMem_reg_bram_0_i_38_n_0),
        .I3(psHistDout[7]),
        .I4(psHistDout[9]),
        .O(histMem_reg_bram_0_i_37_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    histMem_reg_bram_0_i_38
       (.I0(psHistDout[4]),
        .I1(psHistDout[2]),
        .I2(psHistDout[0]),
        .I3(psHistDout[1]),
        .I4(psHistDout[3]),
        .I5(psHistDout[5]),
        .O(histMem_reg_bram_0_i_38_n_0));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    histMem_reg_bram_0_i_39
       (.I0(psHistDout[3]),
        .I1(psHistDout[1]),
        .I2(psHistDout[0]),
        .I3(psHistDout[2]),
        .I4(psHistDout[4]),
        .O(histMem_reg_bram_0_i_39_n_0));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    histMem_reg_bram_0_i_4
       (.I0(in0_out[4]),
        .I1(cs_0[0]),
        .I2(clr),
        .I3(cs_0[1]),
        .I4(count_reg__0[4]),
        .O(memAddr[4]));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    histMem_reg_bram_0_i_5
       (.I0(in0_out[3]),
        .I1(cs_0[0]),
        .I2(clr),
        .I3(cs_0[1]),
        .I4(count_reg__0[3]),
        .O(memAddr[3]));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    histMem_reg_bram_0_i_6
       (.I0(in0_out[2]),
        .I1(cs_0[0]),
        .I2(clr),
        .I3(cs_0[1]),
        .I4(count_reg__0[2]),
        .O(memAddr[2]));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    histMem_reg_bram_0_i_7
       (.I0(in0_out[1]),
        .I1(cs_0[0]),
        .I2(clr),
        .I3(cs_0[1]),
        .I4(count_reg__0[1]),
        .O(memAddr[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    histMem_reg_bram_0_i_8
       (.I0(in0_out[0]),
        .I1(cs_0[0]),
        .I2(clr),
        .I3(cs_0[1]),
        .I4(count_reg__0[0]),
        .O(memAddr[0]));
  LUT6 #(
    .INIT(64'hFFFFFCFD03020000)) 
    histMem_reg_bram_0_i_9
       (.I0(cs_0[0]),
        .I1(cs_0[1]),
        .I2(clr),
        .I3(I2),
        .I4(in0_out[7]),
        .I5(psHistAddr[7]),
        .O(histAddr[7]));
  LUT6 #(
    .INIT(64'h0000000000000100)) 
    huffmanMem_reg_i_1
       (.I0(clrPtr),
        .I1(huffmanMem_reg[1]),
        .I2(huffmanMem_reg_0),
        .I3(\FSM_sequential_cs_reg[0]_1 [0]),
        .I4(huffmanMem_reg[0]),
        .I5(huffmanMem_reg[2]),
        .O(I2));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFF870078)) 
    \ptr[1]_i_1 
       (.I0(\ptr_reg[4]_0 [0]),
        .I1(code[0]),
        .I2(code[1]),
        .I3(\r[30]_i_3_n_0 ),
        .I4(\ptr_reg[4]_0 [1]),
        .O(\ptr_reg[4] [0]));
  LUT6 #(
    .INIT(64'hDDDDB24D22224DB2)) 
    \ptr[2]_i_1 
       (.I0(\ptr_reg[4]_0 [1]),
        .I1(\ptr[2]_i_2_n_0 ),
        .I2(code[1]),
        .I3(code[2]),
        .I4(\r[30]_i_3_n_0 ),
        .I5(\ptr_reg[4]_0 [2]),
        .O(\ptr_reg[4] [1]));
  LUT6 #(
    .INIT(64'hFFFFFFDFFFFFFFFF)) 
    \ptr[2]_i_2 
       (.I0(code[0]),
        .I1(clrPtr),
        .I2(huffmanMem_reg[1]),
        .I3(huffmanMem_reg[0]),
        .I4(huffmanMem_reg[2]),
        .I5(\ptr_reg[4]_0 [0]),
        .O(\ptr[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDDDDB24D22224DB2)) 
    \ptr[3]_i_1 
       (.I0(\ptr_reg[4]_0 [2]),
        .I1(\ptr[3]_i_2_n_0 ),
        .I2(code[2]),
        .I3(code[3]),
        .I4(\r[30]_i_3_n_0 ),
        .I5(\ptr_reg[4]_0 [3]),
        .O(\ptr_reg[4] [2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hF1F5F7FF)) 
    \ptr[3]_i_2 
       (.I0(code[1]),
        .I1(code[0]),
        .I2(\r[30]_i_3_n_0 ),
        .I3(\ptr_reg[4]_0 [0]),
        .I4(\ptr_reg[4]_0 [1]),
        .O(\ptr[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h56669956)) 
    \ptr[4]_i_1 
       (.I0(\ptr_reg[4]_0 [4]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(code[3]),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\ptr[4]_i_2_n_0 ),
        .O(\ptr_reg[4] [3]));
  LUT6 #(
    .INIT(64'hF100F5F1F7F5FFF7)) 
    \ptr[4]_i_2 
       (.I0(code[2]),
        .I1(code[1]),
        .I2(\r[30]_i_3_n_0 ),
        .I3(\ptr[2]_i_2_n_0 ),
        .I4(\ptr_reg[4]_0 [1]),
        .I5(\ptr_reg[4]_0 [2]),
        .O(\ptr[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB8B8)) 
    \r[0]_i_1 
       (.I0(Q[16]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[0]),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[0] ),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hBBBBBBB8B8B8BBB8)) 
    \r[10]_i_1 
       (.I0(Q[26]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[10]),
        .I3(\r_reg[18] ),
        .I4(\ptr_reg[4]_0 [3]),
        .I5(\r_reg[2] ),
        .O(D[10]));
  LUT6 #(
    .INIT(64'hBBBBBBB8B8B8BBB8)) 
    \r[11]_i_1 
       (.I0(Q[27]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[11]),
        .I3(\r_reg[19] ),
        .I4(\ptr_reg[4]_0 [3]),
        .I5(\r_reg[11] ),
        .O(D[11]));
  LUT6 #(
    .INIT(64'hBBBBBBB8B8B8BBB8)) 
    \r[12]_i_1 
       (.I0(Q[28]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[12]),
        .I3(\r_reg[20] ),
        .I4(\ptr_reg[4]_0 [3]),
        .I5(\r_reg[4] ),
        .O(D[12]));
  LUT6 #(
    .INIT(64'hBBBBBBB8B8B8BBB8)) 
    \r[13]_i_1 
       (.I0(Q[29]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[13]),
        .I3(\r_reg[21] ),
        .I4(\ptr_reg[4]_0 [3]),
        .I5(\r_reg[5] ),
        .O(D[13]));
  LUT6 #(
    .INIT(64'hBBB8BBBBBBB8B8B8)) 
    \r[14]_i_1 
       (.I0(Q[30]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[14]),
        .I3(\r_reg[6] ),
        .I4(\ptr_reg[4]_0 [3]),
        .I5(\r_reg[22] ),
        .O(D[14]));
  LUT5 #(
    .INIT(32'h55554540)) 
    \r[15]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(\r_reg[15] ),
        .I2(\ptr_reg[4]_0 [3]),
        .I3(\r_reg[15]_0 ),
        .I4(Q[15]),
        .O(D[15]));
  LUT5 #(
    .INIT(32'h55554540)) 
    \r[16]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(\r_reg[16] ),
        .I2(\ptr_reg[4]_0 [3]),
        .I3(\r_reg[16]_0 ),
        .I4(Q[16]),
        .O(D[16]));
  LUT5 #(
    .INIT(32'h55554540)) 
    \r[17]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(\r_reg[17] ),
        .I2(\ptr_reg[4]_0 [3]),
        .I3(\r_reg[25] ),
        .I4(Q[17]),
        .O(D[17]));
  LUT5 #(
    .INIT(32'h55554540)) 
    \r[18]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(\r_reg[18] ),
        .I2(\ptr_reg[4]_0 [3]),
        .I3(\r_reg[26] ),
        .I4(Q[18]),
        .O(D[18]));
  LUT6 #(
    .INIT(64'h5555544444445444)) 
    \r[19]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[19]),
        .I2(\ptr_reg[4]_0 [2]),
        .I3(\r_reg[27] ),
        .I4(\ptr_reg[4]_0 [3]),
        .I5(\r_reg[19] ),
        .O(D[19]));
  LUT5 #(
    .INIT(32'hB8BBB8B8)) 
    \r[1]_i_1 
       (.I0(Q[17]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[1]),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[1] ),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h55454445)) 
    \r[20]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[20]),
        .I2(\r_reg[28] ),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[20] ),
        .O(D[20]));
  LUT5 #(
    .INIT(32'h55454445)) 
    \r[21]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[21]),
        .I2(\r_reg[29] ),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[21] ),
        .O(D[21]));
  LUT5 #(
    .INIT(32'h55454445)) 
    \r[22]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[22]),
        .I2(\r_reg[30] ),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[22] ),
        .O(D[22]));
  LUT6 #(
    .INIT(64'h5454544444445444)) 
    \r[23]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[23]),
        .I2(\ptr_reg[4]_0 [3]),
        .I3(\r_reg[27] ),
        .I4(\ptr_reg[4]_0 [2]),
        .I5(\r_reg[23] ),
        .O(D[23]));
  LUT6 #(
    .INIT(64'h5454544444445444)) 
    \r[24]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[24]),
        .I2(\ptr_reg[4]_0 [3]),
        .I3(\r_reg[24] ),
        .I4(\ptr_reg[4]_0 [2]),
        .I5(\r_reg[24]_0 ),
        .O(D[24]));
  LUT4 #(
    .INIT(16'h5444)) 
    \r[25]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[25]),
        .I2(\ptr_reg[4]_0 [3]),
        .I3(\r_reg[25] ),
        .O(D[25]));
  LUT4 #(
    .INIT(16'h5444)) 
    \r[26]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[26]),
        .I2(\ptr_reg[4]_0 [3]),
        .I3(\r_reg[26] ),
        .O(D[26]));
  LUT5 #(
    .INIT(32'h54444444)) 
    \r[27]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[27]),
        .I2(\r_reg[27] ),
        .I3(\ptr_reg[4]_0 [2]),
        .I4(\ptr_reg[4]_0 [3]),
        .O(D[27]));
  LUT4 #(
    .INIT(16'h4544)) 
    \r[28]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[28]),
        .I2(\r_reg[28] ),
        .I3(\ptr_reg[4]_0 [3]),
        .O(D[28]));
  LUT4 #(
    .INIT(16'h4544)) 
    \r[29]_i_1 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[29]),
        .I2(\r_reg[29] ),
        .I3(\ptr_reg[4]_0 [3]),
        .O(D[29]));
  LUT5 #(
    .INIT(32'hB8BBB8B8)) 
    \r[2]_i_1 
       (.I0(Q[18]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[2]),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[2] ),
        .O(D[2]));
  LUT4 #(
    .INIT(16'h4544)) 
    \r[30]_i_2 
       (.I0(\r[30]_i_3_n_0 ),
        .I1(Q[30]),
        .I2(\r_reg[30] ),
        .I3(\ptr_reg[4]_0 [3]),
        .O(D[30]));
  LUT4 #(
    .INIT(16'hFFFB)) 
    \r[30]_i_3 
       (.I0(clrPtr),
        .I1(huffmanMem_reg[1]),
        .I2(huffmanMem_reg[0]),
        .I3(huffmanMem_reg[2]),
        .O(\r[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8B8BBB8B8)) 
    \r[3]_i_1 
       (.I0(Q[19]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[3]),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[3] ),
        .I5(\ptr_reg[4]_0 [2]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hB8BBB8B8)) 
    \r[4]_i_1 
       (.I0(Q[20]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[4]),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[4] ),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hB8BBB8B8)) 
    \r[5]_i_1 
       (.I0(Q[21]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[5]),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[5] ),
        .O(D[5]));
  LUT5 #(
    .INIT(32'hB8BBB8B8)) 
    \r[6]_i_1 
       (.I0(Q[22]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[6]),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[6] ),
        .O(D[6]));
  LUT5 #(
    .INIT(32'hB8BBB8B8)) 
    \r[7]_i_1 
       (.I0(Q[23]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[7]),
        .I3(\ptr_reg[4]_0 [3]),
        .I4(\r_reg[15] ),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hBBBBBBB8B8B8BBB8)) 
    \r[8]_i_1 
       (.I0(Q[24]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[8]),
        .I3(\r_reg[16] ),
        .I4(\ptr_reg[4]_0 [3]),
        .I5(\r_reg[0] ),
        .O(D[8]));
  LUT6 #(
    .INIT(64'hBBBBBBB8B8B8BBB8)) 
    \r[9]_i_1 
       (.I0(Q[25]),
        .I1(\r[30]_i_3_n_0 ),
        .I2(Q[9]),
        .I3(\r_reg[17] ),
        .I4(\ptr_reg[4]_0 [3]),
        .I5(\r_reg[1] ),
        .O(D[9]));
  LUT5 #(
    .INIT(32'h00000100)) 
    resultsMem_reg_bram_0_i_12
       (.I0(clrPtr),
        .I1(huffmanMem_reg[1]),
        .I2(huffmanMem_reg[0]),
        .I3(huffmanMem_reg[2]),
        .I4(cs),
        .O(E));
endmodule

(* ORIG_REF_NAME = "huffman" *) 
module design_1_top_0_0_huffman
   (psHistDout,
    psResultsDout,
    done,
    clr,
    psHistAddr,
    clk,
    psResultsAddr,
    psRawEna,
    psRawWE,
    psRawAddr,
    psRawDin,
    psHuffEna,
    psHuffWE,
    psHuffAddr,
    psHuffDin);
  output [15:0]psHistDout;
  output [15:0]psResultsDout;
  output done;
  input clr;
  input [7:0]psHistAddr;
  input clk;
  input [9:0]psResultsAddr;
  input psRawEna;
  input [3:0]psRawWE;
  input [9:0]psRawAddr;
  input [7:0]psRawDin;
  input psHuffEna;
  input [3:0]psHuffWE;
  input [7:0]psHuffAddr;
  input [19:0]psHuffDin;

  wire ENCODER_n_32;
  wire ENCODER_n_33;
  wire \FSM_sequential_cs[2]_i_2_n_0 ;
  wire PRODUCER_n_3;
  wire [15:0]ccodeIn;
  wire clk;
  wire clr;
  wire clrPCE2_out;
  wire crdyIn;
  wire [2:0]cs;
  wire [0:0]cs_0;
  wire [1:0]cs_1;
  wire \dla[4]_i_1_n_0 ;
  wire [4:0]dla_reg__0;
  wire done;
  wire [7:0]in;
  wire [2:1]ns;
  wire [4:0]p_0_in__1;
  wire [7:0]psHistAddr;
  wire [15:0]psHistDout;
  wire [7:0]psHuffAddr;
  wire [19:0]psHuffDin;
  wire psHuffEna;
  wire [3:0]psHuffWE;
  wire [9:0]psRawAddr;
  wire [7:0]psRawDin;
  wire psRawEna;
  wire [3:0]psRawWE;
  wire [9:0]psResultsAddr;
  wire [15:0]psResultsDout;

  design_1_top_0_0_consume CONSUMER
       (.E(crdyIn),
        .Q(ccodeIn),
        .clk(clk),
        .clr(clr),
        .clrPCE2_out(clrPCE2_out),
        .cs(cs_0),
        .psResultsAddr(psResultsAddr),
        .psResultsDout(psResultsDout),
        .resultsMem_reg_bram_0_0(cs));
  design_1_top_0_0_encode ENCODER
       (.D(ENCODER_n_32),
        .E(crdyIn),
        .\FSM_sequential_cs_reg[0] (cs),
        .\FSM_sequential_cs_reg[0]_0 (\FSM_sequential_cs[2]_i_2_n_0 ),
        .Q(ccodeIn),
        .clk(clk),
        .clr(clr),
        .clrPCE2_out(clrPCE2_out),
        .cs(cs_0),
        .\cs_reg[1]_0 (ENCODER_n_33),
        .\cs_reg[1]_1 (cs_1),
        .huffmanMem_reg_0(PRODUCER_n_3),
        .in0_out(in),
        .psHistAddr(psHistAddr),
        .psHistDout(psHistDout),
        .psHuffAddr(psHuffAddr),
        .psHuffDin(psHuffDin),
        .psHuffEna(psHuffEna),
        .psHuffWE(psHuffWE));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h1550)) 
    \FSM_sequential_cs[1]_i_1 
       (.I0(cs[2]),
        .I1(\FSM_sequential_cs[2]_i_2_n_0 ),
        .I2(cs[0]),
        .I3(cs[1]),
        .O(ns[1]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h400A)) 
    \FSM_sequential_cs[2]_i_1 
       (.I0(cs[2]),
        .I1(\FSM_sequential_cs[2]_i_2_n_0 ),
        .I2(cs[0]),
        .I3(cs[1]),
        .O(ns[2]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \FSM_sequential_cs[2]_i_2 
       (.I0(dla_reg__0[4]),
        .I1(dla_reg__0[2]),
        .I2(dla_reg__0[1]),
        .I3(dla_reg__0[0]),
        .I4(dla_reg__0[3]),
        .O(\FSM_sequential_cs[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "histPrep:000,huffPrep:001,huffRun:010,huffDla:011,huffFinal:100" *) 
  FDRE \FSM_sequential_cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(ENCODER_n_32),
        .Q(cs[0]),
        .R(clr));
  (* FSM_ENCODED_STATES = "histPrep:000,huffPrep:001,huffRun:010,huffDla:011,huffFinal:100" *) 
  FDRE \FSM_sequential_cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(ns[1]),
        .Q(cs[1]),
        .R(clr));
  (* FSM_ENCODED_STATES = "histPrep:000,huffPrep:001,huffRun:010,huffDla:011,huffFinal:100" *) 
  FDRE \FSM_sequential_cs_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(ns[2]),
        .Q(cs[2]),
        .R(clr));
  design_1_top_0_0_produce PRODUCER
       (.Q(cs_1),
        .clk(clk),
        .clr(clr),
        .clrPCE2_out(clrPCE2_out),
        .\cs_reg[1]_0 (PRODUCER_n_3),
        .\cs_reg[1]_1 (ENCODER_n_33),
        .in(in),
        .psRawAddr(psRawAddr),
        .psRawDin(psRawDin),
        .psRawEna(psRawEna),
        .psRawWE(psRawWE),
        .rawTextMem_reg_bram_0_0(cs));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \dla[0]_i_1 
       (.I0(dla_reg__0[0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \dla[1]_i_1 
       (.I0(dla_reg__0[0]),
        .I1(dla_reg__0[1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \dla[2]_i_1 
       (.I0(dla_reg__0[2]),
        .I1(dla_reg__0[1]),
        .I2(dla_reg__0[0]),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \dla[3]_i_1 
       (.I0(dla_reg__0[3]),
        .I1(dla_reg__0[0]),
        .I2(dla_reg__0[1]),
        .I3(dla_reg__0[2]),
        .O(p_0_in__1[3]));
  LUT4 #(
    .INIT(16'hFF17)) 
    \dla[4]_i_1 
       (.I0(cs[2]),
        .I1(cs[1]),
        .I2(cs[0]),
        .I3(clr),
        .O(\dla[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \dla[4]_i_2 
       (.I0(dla_reg__0[4]),
        .I1(dla_reg__0[2]),
        .I2(dla_reg__0[1]),
        .I3(dla_reg__0[0]),
        .I4(dla_reg__0[3]),
        .O(p_0_in__1[4]));
  FDRE \dla_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__1[0]),
        .Q(dla_reg__0[0]),
        .R(\dla[4]_i_1_n_0 ));
  FDRE \dla_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__1[1]),
        .Q(dla_reg__0[1]),
        .R(\dla[4]_i_1_n_0 ));
  FDRE \dla_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__1[2]),
        .Q(dla_reg__0[2]),
        .R(\dla[4]_i_1_n_0 ));
  FDRE \dla_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__1[3]),
        .Q(dla_reg__0[3]),
        .R(\dla[4]_i_1_n_0 ));
  FDRE \dla_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in__1[4]),
        .Q(dla_reg__0[4]),
        .R(\dla[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    done_INST_0
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(clr),
        .O(done));
endmodule

(* ORIG_REF_NAME = "produce" *) 
module design_1_top_0_0_produce
   (clrPCE2_out,
    Q,
    \cs_reg[1]_0 ,
    in,
    clk,
    rawTextMem_reg_bram_0_0,
    clr,
    \cs_reg[1]_1 ,
    psRawEna,
    psRawWE,
    psRawAddr,
    psRawDin);
  output clrPCE2_out;
  output [1:0]Q;
  output \cs_reg[1]_0 ;
  output [7:0]in;
  input clk;
  input [2:0]rawTextMem_reg_bram_0_0;
  input clr;
  input \cs_reg[1]_1 ;
  input psRawEna;
  input [3:0]psRawWE;
  input [9:0]psRawAddr;
  input [7:0]psRawDin;

  wire [1:0]Q;
  wire clk;
  wire clr;
  wire clrPCE2_out;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[1]_i_1_n_0 ;
  wire \cnt[2]_i_1_n_0 ;
  wire \cnt[3]_i_1_n_0 ;
  wire \cnt[4]_i_1_n_0 ;
  wire \cnt[5]_i_1_n_0 ;
  wire \cnt[6]_i_1_n_0 ;
  wire \cnt[6]_i_2_n_0 ;
  wire \cnt[7]_i_1_n_0 ;
  wire \cnt[8]_i_1_n_0 ;
  wire \cnt[9]_i_1_n_0 ;
  wire [9:0]cnt_reg;
  wire \cs[1]_i_3_n_0 ;
  wire \cs_reg[1]_0 ;
  wire \cs_reg[1]_1 ;
  wire [7:0]in;
  wire [1:0]ns;
  wire p_0_in4_out;
  wire [9:0]psRawAddr;
  wire [7:0]psRawDin;
  wire psRawEna;
  wire [3:0]psRawWE;
  wire [2:0]rawTextMem_reg_bram_0_0;
  wire rawTextMem_reg_bram_0_i_1_n_0;
  wire [15:0]NLW_rawTextMem_reg_bram_0_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_rawTextMem_reg_bram_0_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_rawTextMem_reg_bram_0_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_rawTextMem_reg_bram_0_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_rawTextMem_reg_bram_0_DOUTADOUT_UNCONNECTED;
  wire [15:8]NLW_rawTextMem_reg_bram_0_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_rawTextMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_rawTextMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt_reg[0]),
        .O(\cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[1]_i_1 
       (.I0(cnt_reg[0]),
        .I1(cnt_reg[1]),
        .O(\cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \cnt[2]_i_1 
       (.I0(cnt_reg[2]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[0]),
        .O(\cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \cnt[3]_i_1 
       (.I0(cnt_reg[3]),
        .I1(cnt_reg[0]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[2]),
        .O(\cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \cnt[4]_i_1 
       (.I0(cnt_reg[4]),
        .I1(cnt_reg[2]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[0]),
        .I4(cnt_reg[3]),
        .O(\cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \cnt[5]_i_1 
       (.I0(cnt_reg[5]),
        .I1(cnt_reg[3]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[1]),
        .I4(cnt_reg[2]),
        .I5(cnt_reg[4]),
        .O(\cnt[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[6]_i_1 
       (.I0(cnt_reg[6]),
        .I1(\cnt[6]_i_2_n_0 ),
        .O(\cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt[6]_i_2 
       (.I0(cnt_reg[5]),
        .I1(cnt_reg[3]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[1]),
        .I4(cnt_reg[2]),
        .I5(cnt_reg[4]),
        .O(\cnt[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \cnt[7]_i_1 
       (.I0(cnt_reg[7]),
        .I1(\cnt[6]_i_2_n_0 ),
        .I2(cnt_reg[6]),
        .O(\cnt[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \cnt[8]_i_1 
       (.I0(cnt_reg[8]),
        .I1(cnt_reg[6]),
        .I2(\cnt[6]_i_2_n_0 ),
        .I3(cnt_reg[7]),
        .O(\cnt[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \cnt[9]_i_1 
       (.I0(cnt_reg[9]),
        .I1(cnt_reg[7]),
        .I2(\cnt[6]_i_2_n_0 ),
        .I3(cnt_reg[6]),
        .I4(cnt_reg[8]),
        .O(\cnt[9]_i_1_n_0 ));
  FDRE \cnt_reg[0] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[0]_i_1_n_0 ),
        .Q(cnt_reg[0]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[1] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[1]_i_1_n_0 ),
        .Q(cnt_reg[1]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[2] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[2]_i_1_n_0 ),
        .Q(cnt_reg[2]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[3] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[3]_i_1_n_0 ),
        .Q(cnt_reg[3]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[4] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[4]_i_1_n_0 ),
        .Q(cnt_reg[4]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[5] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[5]_i_1_n_0 ),
        .Q(cnt_reg[5]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[6] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[6]_i_1_n_0 ),
        .Q(cnt_reg[6]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[7] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[7]_i_1_n_0 ),
        .Q(cnt_reg[7]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[8] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[8]_i_1_n_0 ),
        .Q(cnt_reg[8]),
        .R(clrPCE2_out));
  FDRE \cnt_reg[9] 
       (.C(clk),
        .CE(rawTextMem_reg_bram_0_i_1_n_0),
        .D(\cnt[9]_i_1_n_0 ),
        .Q(cnt_reg[9]),
        .R(clrPCE2_out));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \cs[0]_i_1 
       (.I0(Q[1]),
        .I1(\cs_reg[1]_1 ),
        .O(ns[0]));
  LUT4 #(
    .INIT(16'h0001)) 
    \cs[1]_i_1__0 
       (.I0(rawTextMem_reg_bram_0_0[0]),
        .I1(rawTextMem_reg_bram_0_0[1]),
        .I2(rawTextMem_reg_bram_0_0[2]),
        .I3(clr),
        .O(clrPCE2_out));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    \cs[1]_i_2 
       (.I0(Q[1]),
        .I1(cnt_reg[9]),
        .I2(\cs_reg[1]_1 ),
        .I3(\cs[1]_i_3_n_0 ),
        .O(ns[1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \cs[1]_i_3 
       (.I0(cnt_reg[8]),
        .I1(cnt_reg[6]),
        .I2(\cnt[6]_i_2_n_0 ),
        .I3(cnt_reg[7]),
        .O(\cs[1]_i_3_n_0 ));
  FDRE \cs_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(ns[0]),
        .Q(Q[0]),
        .R(clrPCE2_out));
  FDRE \cs_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(ns[1]),
        .Q(Q[1]),
        .R(clrPCE2_out));
  LUT5 #(
    .INIT(32'hAAAAAAAB)) 
    huffmanMem_reg_i_2
       (.I0(Q[1]),
        .I1(clr),
        .I2(rawTextMem_reg_bram_0_0[2]),
        .I3(rawTextMem_reg_bram_0_0[1]),
        .I4(rawTextMem_reg_bram_0_0[0]),
        .O(\cs_reg[1]_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \p_0_in_inferred__0/i_ 
       (.I0(psRawEna),
        .I1(psRawWE[1]),
        .I2(psRawWE[0]),
        .I3(psRawWE[2]),
        .I4(psRawWE[3]),
        .O(p_0_in4_out));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "8192" *) 
  (* RTL_RAM_NAME = "inst/HUFFMAN/PRODUCER/rawTextMem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0065007800650020003A006300720068007300610062002E002F007E00200023),
    .INIT_01(256'h0029003100280068007300610062002000790062002000640065007400750063),
    .INIT_02(256'h00730020006E00690067006F006C002D006E006F006E00200072006F00660020),
    .INIT_03(256'h00730075002F002000650065007300200023000A002E0073006C006C00650068),
    .INIT_04(256'h0068007300610062002F0063006F0064002F00650072006100680073002F0072),
    .INIT_05(256'h007500740072006100740073002F00730065006C0070006D006100780065002F),
    .INIT_06(256'h00200065006800740020006E00690028002000730065006C00690066002D0070),
    .INIT_07(256'h0063006F0064002D00680073006100620020006500670061006B006300610070),
    .INIT_08(256'h00730065006C0070006D00610078006500200072006F006600200023000A0029),
    .INIT_09(256'h0069006E006E0075007200200074006F006E00200066004900200023000A000A),
    .INIT_0A(256'h0079006C006500760069007400630061007200650074006E006900200067006E),
    .INIT_0B(256'h006800740079006E00610020006F0064002000740027006E006F00640020002C),
    .INIT_0C(256'h0020000A006E00690020002D002400200065007300610063000A0067006E0069),
    .INIT_0D(256'h00200020002000200020000A003B003B00200029002A0069002A002000200020),
    .INIT_0E(256'h006100730065000A003B003B006E0072007500740065007200200029002A0020),
    .INIT_0F(256'h00640020007400750070002000740027006E006F006400200023000A000A0063),
    .INIT_10(256'h006F002000730065006E0069006C002000650074006100630069006C00700075),
    .INIT_11(256'h0067006E006900740072006100740073002000730065006E0069006C00200072),
    .INIT_12(256'h00740020006E0069002000650063006100700073002000680074006900770020),
    .INIT_13(256'h0065005300200023000A002E00790072006F0074007300690068002000650068),
    .INIT_14(256'h006F006D00200072006F00660020002900310028006800730061006200200065),
    .INIT_15(256'h00430054005300490048000A0073006E006F006900740070006F002000650072),
    .INIT_16(256'h0074006F006200650072006F006E00670069003D004C004F00520054004E004F),
    .INIT_17(256'h00740020006F007400200064006E006500700070006100200023000A000A0068),
    .INIT_18(256'h002C0065006C00690066002000790072006F0074007300690068002000650068),
    .INIT_19(256'h00650074006900720077007200650076006F002000740027006E006F00640020),
    .INIT_1A(256'h00730069006800200073002D002000740070006F00680073000A007400690020),
    .INIT_1B(256'h007300200072006F006600200023000A000A0064006E00650070007000610074),
    .INIT_1C(256'h006C002000790072006F007400730069006800200067006E0069007400740065),
    .INIT_1D(256'h00490053005400530049004800200065006500730020006800740067006E0065),
    .INIT_1E(256'h00530045004C00490046005400530049004800200064006E006100200045005A),
    .INIT_1F(256'h0048000A00290031002800680073006100620020006E006900200045005A0049),
    .INIT_20(256'h005300490048000A0030003000300031003D0045005A00490053005400530049),
    .INIT_21(256'h000A000A0030003000300032003D0045005A004900530045004C004900460054),
    .INIT_22(256'h0064006E0069007700200065006800740020006B006300650068006300200023),
    .INIT_23(256'h0061006500200072006500740066006100200065007A0069007300200077006F),
    .INIT_24(256'h0020002C0064006E006100200064006E0061006D006D006F0063002000680063),
    .INIT_25(256'h00200023000A002C00790072006100730073006500630065006E002000660069),
    .INIT_26(256'h00650075006C0061007600200065006800740020006500740061006400700075),
    .INIT_27(256'h004300200064006E0061002000530045004E0049004C00200066006F00200073),
    .INIT_28(256'h0073002D002000740070006F00680073000A002E0053004E004D0055004C004F),
    .INIT_29(256'h0023000A000A0065007A00690073006E00690077006B00630065006800630020),
    .INIT_2A(256'h00740061007000200065006800740020002C0074006500730020006600490020),
    .INIT_2B(256'h00690020006400650073007500200022002A002A00220020006E007200650074),
    .INIT_2C(256'h00700078006500200065006D0061006E0068007400610070002000610020006E),
    .INIT_2D(256'h007700200074007800650074006E006F00630020006E006F00690073006E0061),
    .INIT_2E(256'h0020006C006C006100200068006300740061006D00200023000A006C006C0069),
    .INIT_2F(256'h006F0020006F00720065007A00200064006E0061002000730065006C00690066),
    .INIT_30(256'h00690072006F007400630065007200690064002000650072006F006D00200072),
    .INIT_31(256'h00740063006500720069006400620075007300200064006E0061002000730065),
    .INIT_32(256'h0073002D002000740070006F006800730023000A002E0073006500690072006F),
    .INIT_33(256'h006B0061006D00200023000A000A00720061007400730062006F006C00670020),
    .INIT_34(256'h0065006900720066002000650072006F006D0020007300730065006C00200065),
    .INIT_35(256'h007800650074002D006E006F006E00200072006F006600200079006C0064006E),
    .INIT_36(256'h00730020002C00730065006C006900660020007400750070006E006900200074),
    .INIT_37(256'h005B000A0029003100280065007000690070007300730065006C002000650065),
    .INIT_38(256'h00730065006C002F006E00690062002F007200730075002F00200078002D0020),
    .INIT_39(256'h0020006C0061007600650020002600260020005D002000650070006900700073),
    .INIT_3A(256'h00680073002F006E00690062002F003D004C004C004500480053002800240022),
    .INIT_3B(256'h007300200023000A000A002200290065007000690070007300730065006C0020),
    .INIT_3C(256'h006E00650064006900200065006C006200610069007200610076002000740065),
    .INIT_3D(256'h006F007200680063002000650068007400200067006E00690079006600690074),
    .INIT_3E(256'h00280020006E00690020006B0072006F007700200075006F007900200074006F),
    .INIT_3F(256'h006D006F0072007000200065006800740020006E006900200064006500730075),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    rawTextMem_reg_bram_0
       (.ADDRARDADDR({psRawAddr,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({cnt_reg,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b0),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(NLW_rawTextMem_reg_bram_0_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_rawTextMem_reg_bram_0_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_rawTextMem_reg_bram_0_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_rawTextMem_reg_bram_0_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b0),
        .CASOREGIMUXEN_B(1'b0),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,psRawDin}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0}),
        .DOUTADOUT(NLW_rawTextMem_reg_bram_0_DOUTADOUT_UNCONNECTED[15:0]),
        .DOUTBDOUT({NLW_rawTextMem_reg_bram_0_DOUTBDOUT_UNCONNECTED[15:8],in}),
        .DOUTPADOUTP(NLW_rawTextMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_rawTextMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(1'b1),
        .ENBWREN(rawTextMem_reg_bram_0_i_1_n_0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({p_0_in4_out,p_0_in4_out}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h0000000055555554)) 
    rawTextMem_reg_bram_0_i_1
       (.I0(Q[0]),
        .I1(rawTextMem_reg_bram_0_0[0]),
        .I2(rawTextMem_reg_bram_0_0[1]),
        .I3(rawTextMem_reg_bram_0_0[2]),
        .I4(clr),
        .I5(Q[1]),
        .O(rawTextMem_reg_bram_0_i_1_n_0));
endmodule

(* ORIG_REF_NAME = "top" *) 
module design_1_top_0_0_top
   (psHistDout,
    psResultsDout,
    done,
    clr,
    psHistAddr,
    clk,
    psResultsAddr,
    psRawEna,
    psRawWE,
    psRawAddr,
    psRawDin,
    psHuffEna,
    psHuffWE,
    psHuffAddr,
    psHuffDin);
  output [15:0]psHistDout;
  output [15:0]psResultsDout;
  output done;
  input clr;
  input [7:0]psHistAddr;
  input clk;
  input [9:0]psResultsAddr;
  input psRawEna;
  input [3:0]psRawWE;
  input [9:0]psRawAddr;
  input [7:0]psRawDin;
  input psHuffEna;
  input [3:0]psHuffWE;
  input [7:0]psHuffAddr;
  input [19:0]psHuffDin;

  wire clk;
  wire clr;
  wire done;
  wire [7:0]psHistAddr;
  wire [15:0]psHistDout;
  wire [7:0]psHuffAddr;
  wire [19:0]psHuffDin;
  wire psHuffEna;
  wire [3:0]psHuffWE;
  wire [9:0]psRawAddr;
  wire [7:0]psRawDin;
  wire psRawEna;
  wire [3:0]psRawWE;
  wire [9:0]psResultsAddr;
  wire [15:0]psResultsDout;

  design_1_top_0_0_huffman HUFFMAN
       (.clk(clk),
        .clr(clr),
        .done(done),
        .psHistAddr(psHistAddr),
        .psHistDout(psHistDout),
        .psHuffAddr(psHuffAddr),
        .psHuffDin(psHuffDin),
        .psHuffEna(psHuffEna),
        .psHuffWE(psHuffWE),
        .psRawAddr(psRawAddr),
        .psRawDin(psRawDin),
        .psRawEna(psRawEna),
        .psRawWE(psRawWE),
        .psResultsAddr(psResultsAddr),
        .psResultsDout(psResultsDout));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
