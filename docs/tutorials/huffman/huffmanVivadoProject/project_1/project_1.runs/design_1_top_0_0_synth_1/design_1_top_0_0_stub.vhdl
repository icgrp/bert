-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Thu Jan  7 15:00:39 2021
-- Host        : ubuntu running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_top_0_0_stub.vhdl
-- Design      : design_1_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sbva484-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    clk : in STD_LOGIC;
    clr : in STD_LOGIC;
    done : out STD_LOGIC;
    psResultsAddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    psResultsDout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    psHistAddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    psHistDout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    psRawEna : in STD_LOGIC;
    psRawWE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    psRawAddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    psRawDin : in STD_LOGIC_VECTOR ( 31 downto 0 );
    psHuffEna : in STD_LOGIC;
    psHuffWE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    psHuffAddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    psHuffDin : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,clr,done,psResultsAddr[11:0],psResultsDout[31:0],psHistAddr[11:0],psHistDout[31:0],psRawEna,psRawWE[3:0],psRawAddr[11:0],psRawDin[31:0],psHuffEna,psHuffWE[3:0],psHuffAddr[11:0],psHuffDin[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "top,Vivado 2018.3";
begin
end;
