-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Thu Jan  7 15:00:40 2021
-- Host        : ubuntu running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/nelson/bert/docs/tutorials/huffman/huffmanVivadoProject/project_1/project_1.srcs/sources_1/bd/design_1/ip/design_1_top_0_0/design_1_top_0_0_sim_netlist.vhdl
-- Design      : design_1_top_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sbva484-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0_consume is
  port (
    psResultsDout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cs : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    psResultsAddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 15 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    clrPCE2_out : in STD_LOGIC;
    clr : in STD_LOGIC;
    resultsMem_reg_bram_0_0 : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_0_0_consume : entity is "consume";
end design_1_top_0_0_consume;

architecture STRUCTURE of design_1_top_0_0_consume is
  signal \cnt_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_10_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_11_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_13_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_2_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_3_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_4_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_5_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_6_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_7_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_8_n_0 : STD_LOGIC;
  signal resultsMem_reg_bram_0_i_9_n_0 : STD_LOGIC;
  signal NLW_resultsMem_reg_bram_0_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_resultsMem_reg_bram_0_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_resultsMem_reg_bram_0_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_resultsMem_reg_bram_0_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_resultsMem_reg_bram_0_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_resultsMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_resultsMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of resultsMem_reg_bram_0 : label is "p0_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of resultsMem_reg_bram_0 : label is "p0_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of resultsMem_reg_bram_0 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of resultsMem_reg_bram_0 : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of resultsMem_reg_bram_0 : label is 16384;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of resultsMem_reg_bram_0 : label is "resultsMem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of resultsMem_reg_bram_0 : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of resultsMem_reg_bram_0 : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of resultsMem_reg_bram_0 : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of resultsMem_reg_bram_0 : label is 15;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of resultsMem_reg_bram_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of resultsMem_reg_bram_0 : label is 1023;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of resultsMem_reg_bram_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of resultsMem_reg_bram_0 : label is 15;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of resultsMem_reg_bram_0_i_10 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of resultsMem_reg_bram_0_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of resultsMem_reg_bram_0_i_3 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of resultsMem_reg_bram_0_i_4 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of resultsMem_reg_bram_0_i_5 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of resultsMem_reg_bram_0_i_7 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of resultsMem_reg_bram_0_i_8 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of resultsMem_reg_bram_0_i_9 : label is "soft_lutpair2";
begin
\cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_11_n_0,
      Q => \cnt_reg__0\(0),
      R => clrPCE2_out
    );
\cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_10_n_0,
      Q => \cnt_reg__0\(1),
      R => clrPCE2_out
    );
\cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_9_n_0,
      Q => \cnt_reg__0\(2),
      R => clrPCE2_out
    );
\cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_8_n_0,
      Q => \cnt_reg__0\(3),
      R => clrPCE2_out
    );
\cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_7_n_0,
      Q => \cnt_reg__0\(4),
      R => clrPCE2_out
    );
\cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_6_n_0,
      Q => \cnt_reg__0\(5),
      R => clrPCE2_out
    );
\cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_5_n_0,
      Q => \cnt_reg__0\(6),
      R => clrPCE2_out
    );
\cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_4_n_0,
      Q => \cnt_reg__0\(7),
      R => clrPCE2_out
    );
\cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_3_n_0,
      Q => \cnt_reg__0\(8),
      R => clrPCE2_out
    );
\cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => E(0),
      D => resultsMem_reg_bram_0_i_2_n_0,
      Q => \cnt_reg__0\(9),
      R => clrPCE2_out
    );
\cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => E(0),
      Q => cs(0),
      R => clrPCE2_out
    );
resultsMem_reg_bram_0: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INIT_A => B"00" & X"0000",
      INIT_B => B"00" & X"0000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => B"00" & X"0000",
      SRVAL_B => B"00" & X"0000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13) => resultsMem_reg_bram_0_i_2_n_0,
      ADDRARDADDR(12) => resultsMem_reg_bram_0_i_3_n_0,
      ADDRARDADDR(11) => resultsMem_reg_bram_0_i_4_n_0,
      ADDRARDADDR(10) => resultsMem_reg_bram_0_i_5_n_0,
      ADDRARDADDR(9) => resultsMem_reg_bram_0_i_6_n_0,
      ADDRARDADDR(8) => resultsMem_reg_bram_0_i_7_n_0,
      ADDRARDADDR(7) => resultsMem_reg_bram_0_i_8_n_0,
      ADDRARDADDR(6) => resultsMem_reg_bram_0_i_9_n_0,
      ADDRARDADDR(5) => resultsMem_reg_bram_0_i_10_n_0,
      ADDRARDADDR(4) => resultsMem_reg_bram_0_i_11_n_0,
      ADDRARDADDR(3 downto 0) => B"1111",
      ADDRBWRADDR(13 downto 4) => psResultsAddr(9 downto 0),
      ADDRBWRADDR(3 downto 0) => B"1111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(15 downto 0) => B"0000000000000000",
      CASDINB(15 downto 0) => B"0000000000000000",
      CASDINPA(1 downto 0) => B"00",
      CASDINPB(1 downto 0) => B"00",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '0',
      CASDOMUXEN_B => '0',
      CASDOUTA(15 downto 0) => NLW_resultsMem_reg_bram_0_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_resultsMem_reg_bram_0_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_resultsMem_reg_bram_0_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_resultsMem_reg_bram_0_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '0',
      CASOREGIMUXEN_B => '0',
      CLKARDCLK => clk,
      CLKBWRCLK => clk,
      DINADIN(15 downto 0) => Q(15 downto 0),
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"00",
      DINPBDINP(1 downto 0) => B"00",
      DOUTADOUT(15 downto 0) => NLW_resultsMem_reg_bram_0_DOUTADOUT_UNCONNECTED(15 downto 0),
      DOUTBDOUT(15 downto 0) => psResultsDout(15 downto 0),
      DOUTPADOUTP(1 downto 0) => NLW_resultsMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED(1 downto 0),
      DOUTPBDOUTP(1 downto 0) => NLW_resultsMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED(1 downto 0),
      ENARDEN => p_0_in,
      ENBWREN => '1',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1) => E(0),
      WEA(0) => E(0),
      WEBWE(3 downto 0) => B"0000"
    );
resultsMem_reg_bram_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clr,
      I1 => resultsMem_reg_bram_0_0(2),
      I2 => resultsMem_reg_bram_0_0(1),
      I3 => resultsMem_reg_bram_0_0(0),
      O => p_0_in
    );
resultsMem_reg_bram_0_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \cnt_reg__0\(0),
      I1 => \cnt_reg__0\(1),
      O => resultsMem_reg_bram_0_i_10_n_0
    );
resultsMem_reg_bram_0_i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \cnt_reg__0\(0),
      O => resultsMem_reg_bram_0_i_11_n_0
    );
resultsMem_reg_bram_0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \cnt_reg__0\(5),
      I1 => \cnt_reg__0\(3),
      I2 => \cnt_reg__0\(0),
      I3 => \cnt_reg__0\(1),
      I4 => \cnt_reg__0\(2),
      I5 => \cnt_reg__0\(4),
      O => resultsMem_reg_bram_0_i_13_n_0
    );
resultsMem_reg_bram_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \cnt_reg__0\(9),
      I1 => \cnt_reg__0\(7),
      I2 => resultsMem_reg_bram_0_i_13_n_0,
      I3 => \cnt_reg__0\(6),
      I4 => \cnt_reg__0\(8),
      O => resultsMem_reg_bram_0_i_2_n_0
    );
resultsMem_reg_bram_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \cnt_reg__0\(8),
      I1 => \cnt_reg__0\(6),
      I2 => resultsMem_reg_bram_0_i_13_n_0,
      I3 => \cnt_reg__0\(7),
      O => resultsMem_reg_bram_0_i_3_n_0
    );
resultsMem_reg_bram_0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \cnt_reg__0\(7),
      I1 => resultsMem_reg_bram_0_i_13_n_0,
      I2 => \cnt_reg__0\(6),
      O => resultsMem_reg_bram_0_i_4_n_0
    );
resultsMem_reg_bram_0_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \cnt_reg__0\(6),
      I1 => resultsMem_reg_bram_0_i_13_n_0,
      O => resultsMem_reg_bram_0_i_5_n_0
    );
resultsMem_reg_bram_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \cnt_reg__0\(5),
      I1 => \cnt_reg__0\(3),
      I2 => \cnt_reg__0\(0),
      I3 => \cnt_reg__0\(1),
      I4 => \cnt_reg__0\(2),
      I5 => \cnt_reg__0\(4),
      O => resultsMem_reg_bram_0_i_6_n_0
    );
resultsMem_reg_bram_0_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \cnt_reg__0\(4),
      I1 => \cnt_reg__0\(2),
      I2 => \cnt_reg__0\(1),
      I3 => \cnt_reg__0\(0),
      I4 => \cnt_reg__0\(3),
      O => resultsMem_reg_bram_0_i_7_n_0
    );
resultsMem_reg_bram_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \cnt_reg__0\(3),
      I1 => \cnt_reg__0\(0),
      I2 => \cnt_reg__0\(1),
      I3 => \cnt_reg__0\(2),
      O => resultsMem_reg_bram_0_i_8_n_0
    );
resultsMem_reg_bram_0_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \cnt_reg__0\(2),
      I1 => \cnt_reg__0\(1),
      I2 => \cnt_reg__0\(0),
      O => resultsMem_reg_bram_0_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0_histogram is
  port (
    psHistDout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    D : out STD_LOGIC_VECTOR ( 30 downto 0 );
    \FSM_sequential_cs_reg[2]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    I2 : out STD_LOGIC;
    clrPtr : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \ptr_reg[4]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 30 downto 0 );
    \r_reg[30]\ : in STD_LOGIC;
    \ptr_reg[4]_0\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    \r_reg[29]\ : in STD_LOGIC;
    \r_reg[28]\ : in STD_LOGIC;
    \r_reg[27]\ : in STD_LOGIC;
    \r_reg[26]\ : in STD_LOGIC;
    \r_reg[25]\ : in STD_LOGIC;
    \r_reg[24]\ : in STD_LOGIC;
    \r_reg[24]_0\ : in STD_LOGIC;
    \r_reg[23]\ : in STD_LOGIC;
    \r_reg[22]\ : in STD_LOGIC;
    \r_reg[21]\ : in STD_LOGIC;
    \r_reg[20]\ : in STD_LOGIC;
    \r_reg[19]\ : in STD_LOGIC;
    \r_reg[18]\ : in STD_LOGIC;
    \r_reg[17]\ : in STD_LOGIC;
    \r_reg[16]\ : in STD_LOGIC;
    \r_reg[16]_0\ : in STD_LOGIC;
    \r_reg[15]\ : in STD_LOGIC;
    \r_reg[15]_0\ : in STD_LOGIC;
    \FSM_sequential_cs_reg[0]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \FSM_sequential_cs_reg[0]_0\ : in STD_LOGIC;
    clr : in STD_LOGIC;
    in0_out : in STD_LOGIC_VECTOR ( 7 downto 0 );
    psHistAddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    huffmanMem_reg : in STD_LOGIC_VECTOR ( 2 downto 0 );
    huffmanMem_reg_0 : in STD_LOGIC;
    \FSM_sequential_cs_reg[0]_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cs : in STD_LOGIC_VECTOR ( 0 to 0 );
    code : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \r_reg[0]\ : in STD_LOGIC;
    \r_reg[1]\ : in STD_LOGIC;
    \r_reg[2]\ : in STD_LOGIC;
    \r_reg[3]\ : in STD_LOGIC;
    \r_reg[4]\ : in STD_LOGIC;
    \r_reg[5]\ : in STD_LOGIC;
    \r_reg[6]\ : in STD_LOGIC;
    \r_reg[11]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_0_0_histogram : entity is "histogram";
end design_1_top_0_0_histogram;

architecture STRUCTURE of design_1_top_0_0_histogram is
  signal \FSM_sequential_cs[0]_i_2_n_0\ : STD_LOGIC;
  signal \^i2\ : STD_LOGIC;
  signal clearcount : STD_LOGIC;
  signal \^clrptr\ : STD_LOGIC;
  signal \count_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \cs[1]_i_2__0_n_0\ : STD_LOGIC;
  signal cs_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal histAddr : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal histMem_reg_bram_0_i_34_n_0 : STD_LOGIC;
  signal histMem_reg_bram_0_i_35_n_0 : STD_LOGIC;
  signal histMem_reg_bram_0_i_36_n_0 : STD_LOGIC;
  signal histMem_reg_bram_0_i_37_n_0 : STD_LOGIC;
  signal histMem_reg_bram_0_i_38_n_0 : STD_LOGIC;
  signal histMem_reg_bram_0_i_39_n_0 : STD_LOGIC;
  signal memAddr : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal memDin : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal memWE : STD_LOGIC;
  signal ns : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^pshistdout\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \ptr[2]_i_2_n_0\ : STD_LOGIC;
  signal \ptr[3]_i_2_n_0\ : STD_LOGIC;
  signal \ptr[4]_i_2_n_0\ : STD_LOGIC;
  signal \r[30]_i_3_n_0\ : STD_LOGIC;
  signal NLW_histMem_reg_bram_0_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_histMem_reg_bram_0_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_histMem_reg_bram_0_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_histMem_reg_bram_0_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_histMem_reg_bram_0_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_histMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_histMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count[6]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \count[7]_i_2\ : label is "soft_lutpair12";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of histMem_reg_bram_0 : label is "p0_d16";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of histMem_reg_bram_0 : label is "p0_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of histMem_reg_bram_0 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of histMem_reg_bram_0 : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of histMem_reg_bram_0 : label is 4096;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of histMem_reg_bram_0 : label is "histMem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of histMem_reg_bram_0 : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of histMem_reg_bram_0 : label is 255;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of histMem_reg_bram_0 : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of histMem_reg_bram_0 : label is 15;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of histMem_reg_bram_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of histMem_reg_bram_0 : label is 255;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of histMem_reg_bram_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of histMem_reg_bram_0 : label is 15;
  attribute SOFT_HLUTNM of histMem_reg_bram_0_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of histMem_reg_bram_0_i_19 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of histMem_reg_bram_0_i_2 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of histMem_reg_bram_0_i_31 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of histMem_reg_bram_0_i_32 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of histMem_reg_bram_0_i_33 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of histMem_reg_bram_0_i_34 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of histMem_reg_bram_0_i_35 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of histMem_reg_bram_0_i_8 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \ptr[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \ptr[3]_i_2\ : label is "soft_lutpair6";
begin
  I2 <= \^i2\;
  clrPtr <= \^clrptr\;
  psHistDout(15 downto 0) <= \^pshistdout\(15 downto 0);
\FSM_sequential_cs[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45444444"
    )
        port map (
      I0 => \FSM_sequential_cs_reg[0]\(2),
      I1 => \FSM_sequential_cs[0]_i_2_n_0\,
      I2 => \FSM_sequential_cs_reg[0]_0\,
      I3 => \FSM_sequential_cs_reg[0]\(0),
      I4 => \FSM_sequential_cs_reg[0]\(1),
      O => \FSM_sequential_cs_reg[2]\(0)
    );
\FSM_sequential_cs[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000D0D0F000D0D"
    )
        port map (
      I0 => cs_0(1),
      I1 => cs_0(0),
      I2 => \FSM_sequential_cs_reg[0]\(0),
      I3 => \FSM_sequential_cs_reg[0]_1\(1),
      I4 => \FSM_sequential_cs_reg[0]\(1),
      I5 => \FSM_sequential_cs_reg[0]_1\(0),
      O => \FSM_sequential_cs[0]_i_2_n_0\
    );
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \count_reg__0\(0),
      I1 => \count_reg__0\(1),
      O => \p_0_in__0\(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \count_reg__0\(2),
      I1 => \count_reg__0\(1),
      I2 => \count_reg__0\(0),
      O => \p_0_in__0\(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \count_reg__0\(3),
      I1 => \count_reg__0\(0),
      I2 => \count_reg__0\(1),
      I3 => \count_reg__0\(2),
      O => \p_0_in__0\(3)
    );
\count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \count_reg__0\(4),
      I1 => \count_reg__0\(2),
      I2 => \count_reg__0\(1),
      I3 => \count_reg__0\(0),
      I4 => \count_reg__0\(3),
      O => \p_0_in__0\(4)
    );
\count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \count_reg__0\(5),
      I1 => \count_reg__0\(3),
      I2 => \count_reg__0\(0),
      I3 => \count_reg__0\(1),
      I4 => \count_reg__0\(2),
      I5 => \count_reg__0\(4),
      O => \p_0_in__0\(5)
    );
\count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \count_reg__0\(6),
      I1 => \cs[1]_i_2__0_n_0\,
      O => \p_0_in__0\(6)
    );
\count[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => clr,
      I1 => cs_0(1),
      O => clearcount
    );
\count[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \count_reg__0\(7),
      I1 => \cs[1]_i_2__0_n_0\,
      I2 => \count_reg__0\(6),
      O => \p_0_in__0\(7)
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(0),
      Q => \count_reg__0\(0),
      R => clearcount
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(1),
      Q => \count_reg__0\(1),
      R => clearcount
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(2),
      Q => \count_reg__0\(2),
      R => clearcount
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(3),
      Q => \count_reg__0\(3),
      R => clearcount
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(4),
      Q => \count_reg__0\(4),
      R => clearcount
    );
\count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(5),
      Q => \count_reg__0\(5),
      R => clearcount
    );
\count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(6),
      Q => \count_reg__0\(6),
      R => clearcount
    );
\count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__0\(7),
      Q => \count_reg__0\(7),
      R => clearcount
    );
\cs[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^i2\,
      I1 => cs_0(0),
      O => ns(0)
    );
\cs[1]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2AAA"
    )
        port map (
      I0 => cs_0(1),
      I1 => \count_reg__0\(6),
      I2 => \cs[1]_i_2__0_n_0\,
      I3 => \count_reg__0\(7),
      O => ns(1)
    );
\cs[1]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \count_reg__0\(5),
      I1 => \count_reg__0\(3),
      I2 => \count_reg__0\(0),
      I3 => \count_reg__0\(1),
      I4 => \count_reg__0\(2),
      I5 => \count_reg__0\(4),
      O => \cs[1]_i_2__0_n_0\
    );
\cs[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFF00010001"
    )
        port map (
      I0 => clr,
      I1 => \FSM_sequential_cs_reg[0]\(2),
      I2 => \FSM_sequential_cs_reg[0]\(1),
      I3 => \FSM_sequential_cs_reg[0]\(0),
      I4 => cs_0(0),
      I5 => cs_0(1),
      O => \^clrptr\
    );
\cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ns(0),
      Q => cs_0(0),
      R => clr
    );
\cs_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => clk,
      CE => '1',
      D => ns(1),
      Q => cs_0(1),
      S => clr
    );
histMem_reg_bram_0: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INIT_A => B"00" & X"0000",
      INIT_B => B"00" & X"0000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => B"00" & X"0000",
      SRVAL_B => B"00" & X"0000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"11",
      ADDRARDADDR(11 downto 4) => memAddr(7 downto 0),
      ADDRARDADDR(3 downto 0) => B"1111",
      ADDRBWRADDR(13 downto 12) => B"11",
      ADDRBWRADDR(11 downto 4) => histAddr(7 downto 0),
      ADDRBWRADDR(3 downto 0) => B"1111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(15 downto 0) => B"0000000000000000",
      CASDINB(15 downto 0) => B"0000000000000000",
      CASDINPA(1 downto 0) => B"00",
      CASDINPB(1 downto 0) => B"00",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '0',
      CASDOMUXEN_B => '0',
      CASDOUTA(15 downto 0) => NLW_histMem_reg_bram_0_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_histMem_reg_bram_0_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_histMem_reg_bram_0_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_histMem_reg_bram_0_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '0',
      CASOREGIMUXEN_B => '0',
      CLKARDCLK => clk,
      CLKBWRCLK => clk,
      DINADIN(15 downto 0) => memDin(15 downto 0),
      DINBDIN(15 downto 0) => B"1111111111111111",
      DINPADINP(1 downto 0) => B"00",
      DINPBDINP(1 downto 0) => B"00",
      DOUTADOUT(15 downto 0) => NLW_histMem_reg_bram_0_DOUTADOUT_UNCONNECTED(15 downto 0),
      DOUTBDOUT(15 downto 0) => \^pshistdout\(15 downto 0),
      DOUTPADOUTP(1 downto 0) => NLW_histMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED(1 downto 0),
      DOUTPBDOUTP(1 downto 0) => NLW_histMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED(1 downto 0),
      ENARDEN => '1',
      ENBWREN => '1',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1) => memWE,
      WEA(0) => memWE,
      WEBWE(3 downto 0) => B"0000"
    );
histMem_reg_bram_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => in0_out(7),
      I1 => cs_0(0),
      I2 => clr,
      I3 => cs_0(1),
      I4 => \count_reg__0\(7),
      O => memAddr(7)
    );
histMem_reg_bram_0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFD03020000"
    )
        port map (
      I0 => cs_0(0),
      I1 => cs_0(1),
      I2 => clr,
      I3 => \^i2\,
      I4 => in0_out(6),
      I5 => psHistAddr(6),
      O => histAddr(6)
    );
histMem_reg_bram_0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFD03020000"
    )
        port map (
      I0 => cs_0(0),
      I1 => cs_0(1),
      I2 => clr,
      I3 => \^i2\,
      I4 => in0_out(5),
      I5 => psHistAddr(5),
      O => histAddr(5)
    );
histMem_reg_bram_0_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFD03020000"
    )
        port map (
      I0 => cs_0(0),
      I1 => cs_0(1),
      I2 => clr,
      I3 => \^i2\,
      I4 => in0_out(4),
      I5 => psHistAddr(4),
      O => histAddr(4)
    );
histMem_reg_bram_0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFD03020000"
    )
        port map (
      I0 => cs_0(0),
      I1 => cs_0(1),
      I2 => clr,
      I3 => \^i2\,
      I4 => in0_out(3),
      I5 => psHistAddr(3),
      O => histAddr(3)
    );
histMem_reg_bram_0_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFD03020000"
    )
        port map (
      I0 => cs_0(0),
      I1 => cs_0(1),
      I2 => clr,
      I3 => \^i2\,
      I4 => in0_out(2),
      I5 => psHistAddr(2),
      O => histAddr(2)
    );
histMem_reg_bram_0_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFD03020000"
    )
        port map (
      I0 => cs_0(0),
      I1 => cs_0(1),
      I2 => clr,
      I3 => \^i2\,
      I4 => in0_out(1),
      I5 => psHistAddr(1),
      O => histAddr(1)
    );
histMem_reg_bram_0_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFD03020000"
    )
        port map (
      I0 => cs_0(0),
      I1 => cs_0(1),
      I2 => clr,
      I3 => \^i2\,
      I4 => in0_out(0),
      I5 => psHistAddr(0),
      O => histAddr(0)
    );
histMem_reg_bram_0_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010101010000000"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => \^pshistdout\(14),
      I4 => histMem_reg_bram_0_i_34_n_0,
      I5 => \^pshistdout\(15),
      O => memDin(15)
    );
histMem_reg_bram_0_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA2AAAAA00800000"
    )
        port map (
      I0 => histMem_reg_bram_0_i_35_n_0,
      I1 => \^pshistdout\(13),
      I2 => \^pshistdout\(12),
      I3 => histMem_reg_bram_0_i_36_n_0,
      I4 => \^pshistdout\(11),
      I5 => \^pshistdout\(14),
      O => memDin(14)
    );
histMem_reg_bram_0_i_19: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2AA0800"
    )
        port map (
      I0 => histMem_reg_bram_0_i_35_n_0,
      I1 => \^pshistdout\(11),
      I2 => histMem_reg_bram_0_i_36_n_0,
      I3 => \^pshistdout\(12),
      I4 => \^pshistdout\(13),
      O => memDin(13)
    );
histMem_reg_bram_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => in0_out(6),
      I1 => cs_0(0),
      I2 => clr,
      I3 => cs_0(1),
      I4 => \count_reg__0\(6),
      O => memAddr(6)
    );
histMem_reg_bram_0_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000101000100000"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => histMem_reg_bram_0_i_36_n_0,
      I4 => \^pshistdout\(11),
      I5 => \^pshistdout\(12),
      O => memDin(12)
    );
histMem_reg_bram_0_i_21: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000010"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => histMem_reg_bram_0_i_36_n_0,
      I4 => \^pshistdout\(11),
      O => memDin(11)
    );
histMem_reg_bram_0_i_22: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000010"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => histMem_reg_bram_0_i_37_n_0,
      I4 => \^pshistdout\(10),
      O => memDin(10)
    );
histMem_reg_bram_0_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A2AAAAAA08000000"
    )
        port map (
      I0 => histMem_reg_bram_0_i_35_n_0,
      I1 => \^pshistdout\(7),
      I2 => histMem_reg_bram_0_i_38_n_0,
      I3 => \^pshistdout\(6),
      I4 => \^pshistdout\(8),
      I5 => \^pshistdout\(9),
      O => memDin(9)
    );
histMem_reg_bram_0_i_24: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2AA0800"
    )
        port map (
      I0 => histMem_reg_bram_0_i_35_n_0,
      I1 => \^pshistdout\(6),
      I2 => histMem_reg_bram_0_i_38_n_0,
      I3 => \^pshistdout\(7),
      I4 => \^pshistdout\(8),
      O => memDin(8)
    );
histMem_reg_bram_0_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000101000100000"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => histMem_reg_bram_0_i_38_n_0,
      I4 => \^pshistdout\(6),
      I5 => \^pshistdout\(7),
      O => memDin(7)
    );
histMem_reg_bram_0_i_26: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000010"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => histMem_reg_bram_0_i_38_n_0,
      I4 => \^pshistdout\(6),
      O => memDin(6)
    );
histMem_reg_bram_0_i_27: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000010"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => histMem_reg_bram_0_i_39_n_0,
      I4 => \^pshistdout\(5),
      O => memDin(5)
    );
histMem_reg_bram_0_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => histMem_reg_bram_0_i_35_n_0,
      I1 => \^pshistdout\(2),
      I2 => \^pshistdout\(0),
      I3 => \^pshistdout\(1),
      I4 => \^pshistdout\(3),
      I5 => \^pshistdout\(4),
      O => memDin(4)
    );
histMem_reg_bram_0_i_29: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => histMem_reg_bram_0_i_35_n_0,
      I1 => \^pshistdout\(1),
      I2 => \^pshistdout\(0),
      I3 => \^pshistdout\(2),
      I4 => \^pshistdout\(3),
      O => memDin(3)
    );
histMem_reg_bram_0_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => in0_out(5),
      I1 => cs_0(0),
      I2 => clr,
      I3 => cs_0(1),
      I4 => \count_reg__0\(5),
      O => memAddr(5)
    );
histMem_reg_bram_0_i_30: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010101010000000"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => \^pshistdout\(0),
      I4 => \^pshistdout\(1),
      I5 => \^pshistdout\(2),
      O => memDin(2)
    );
histMem_reg_bram_0_i_31: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00101000"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => \^pshistdout\(1),
      I4 => \^pshistdout\(0),
      O => memDin(1)
    );
histMem_reg_bram_0_i_32: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => cs_0(1),
      I1 => clr,
      I2 => cs_0(0),
      I3 => \^pshistdout\(0),
      O => memDin(0)
    );
histMem_reg_bram_0_i_33: unisim.vcomponents.LUT3
    generic map(
      INIT => X"14"
    )
        port map (
      I0 => clr,
      I1 => cs_0(1),
      I2 => cs_0(0),
      O => memWE
    );
histMem_reg_bram_0_i_34: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \^pshistdout\(13),
      I1 => \^pshistdout\(12),
      I2 => histMem_reg_bram_0_i_36_n_0,
      I3 => \^pshistdout\(11),
      O => histMem_reg_bram_0_i_34_n_0
    );
histMem_reg_bram_0_i_35: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => cs_0(0),
      I1 => clr,
      I2 => cs_0(1),
      O => histMem_reg_bram_0_i_35_n_0
    );
histMem_reg_bram_0_i_36: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^pshistdout\(9),
      I1 => \^pshistdout\(7),
      I2 => histMem_reg_bram_0_i_38_n_0,
      I3 => \^pshistdout\(6),
      I4 => \^pshistdout\(8),
      I5 => \^pshistdout\(10),
      O => histMem_reg_bram_0_i_36_n_0
    );
histMem_reg_bram_0_i_37: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FFFFFF"
    )
        port map (
      I0 => \^pshistdout\(8),
      I1 => \^pshistdout\(6),
      I2 => histMem_reg_bram_0_i_38_n_0,
      I3 => \^pshistdout\(7),
      I4 => \^pshistdout\(9),
      O => histMem_reg_bram_0_i_37_n_0
    );
histMem_reg_bram_0_i_38: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^pshistdout\(4),
      I1 => \^pshistdout\(2),
      I2 => \^pshistdout\(0),
      I3 => \^pshistdout\(1),
      I4 => \^pshistdout\(3),
      I5 => \^pshistdout\(5),
      O => histMem_reg_bram_0_i_38_n_0
    );
histMem_reg_bram_0_i_39: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \^pshistdout\(3),
      I1 => \^pshistdout\(1),
      I2 => \^pshistdout\(0),
      I3 => \^pshistdout\(2),
      I4 => \^pshistdout\(4),
      O => histMem_reg_bram_0_i_39_n_0
    );
histMem_reg_bram_0_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => in0_out(4),
      I1 => cs_0(0),
      I2 => clr,
      I3 => cs_0(1),
      I4 => \count_reg__0\(4),
      O => memAddr(4)
    );
histMem_reg_bram_0_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => in0_out(3),
      I1 => cs_0(0),
      I2 => clr,
      I3 => cs_0(1),
      I4 => \count_reg__0\(3),
      O => memAddr(3)
    );
histMem_reg_bram_0_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => in0_out(2),
      I1 => cs_0(0),
      I2 => clr,
      I3 => cs_0(1),
      I4 => \count_reg__0\(2),
      O => memAddr(2)
    );
histMem_reg_bram_0_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => in0_out(1),
      I1 => cs_0(0),
      I2 => clr,
      I3 => cs_0(1),
      I4 => \count_reg__0\(1),
      O => memAddr(1)
    );
histMem_reg_bram_0_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => in0_out(0),
      I1 => cs_0(0),
      I2 => clr,
      I3 => cs_0(1),
      I4 => \count_reg__0\(0),
      O => memAddr(0)
    );
histMem_reg_bram_0_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFD03020000"
    )
        port map (
      I0 => cs_0(0),
      I1 => cs_0(1),
      I2 => clr,
      I3 => \^i2\,
      I4 => in0_out(7),
      I5 => psHistAddr(7),
      O => histAddr(7)
    );
huffmanMem_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => \^clrptr\,
      I1 => huffmanMem_reg(1),
      I2 => huffmanMem_reg_0,
      I3 => \FSM_sequential_cs_reg[0]_1\(0),
      I4 => huffmanMem_reg(0),
      I5 => huffmanMem_reg(2),
      O => \^i2\
    );
\ptr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF870078"
    )
        port map (
      I0 => \ptr_reg[4]_0\(0),
      I1 => code(0),
      I2 => code(1),
      I3 => \r[30]_i_3_n_0\,
      I4 => \ptr_reg[4]_0\(1),
      O => \ptr_reg[4]\(0)
    );
\ptr[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDDB24D22224DB2"
    )
        port map (
      I0 => \ptr_reg[4]_0\(1),
      I1 => \ptr[2]_i_2_n_0\,
      I2 => code(1),
      I3 => code(2),
      I4 => \r[30]_i_3_n_0\,
      I5 => \ptr_reg[4]_0\(2),
      O => \ptr_reg[4]\(1)
    );
\ptr[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFDFFFFFFFFF"
    )
        port map (
      I0 => code(0),
      I1 => \^clrptr\,
      I2 => huffmanMem_reg(1),
      I3 => huffmanMem_reg(0),
      I4 => huffmanMem_reg(2),
      I5 => \ptr_reg[4]_0\(0),
      O => \ptr[2]_i_2_n_0\
    );
\ptr[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDDDB24D22224DB2"
    )
        port map (
      I0 => \ptr_reg[4]_0\(2),
      I1 => \ptr[3]_i_2_n_0\,
      I2 => code(2),
      I3 => code(3),
      I4 => \r[30]_i_3_n_0\,
      I5 => \ptr_reg[4]_0\(3),
      O => \ptr_reg[4]\(2)
    );
\ptr[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F1F5F7FF"
    )
        port map (
      I0 => code(1),
      I1 => code(0),
      I2 => \r[30]_i_3_n_0\,
      I3 => \ptr_reg[4]_0\(0),
      I4 => \ptr_reg[4]_0\(1),
      O => \ptr[3]_i_2_n_0\
    );
\ptr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"56669956"
    )
        port map (
      I0 => \ptr_reg[4]_0\(4),
      I1 => \r[30]_i_3_n_0\,
      I2 => code(3),
      I3 => \ptr_reg[4]_0\(3),
      I4 => \ptr[4]_i_2_n_0\,
      O => \ptr_reg[4]\(3)
    );
\ptr[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F100F5F1F7F5FFF7"
    )
        port map (
      I0 => code(2),
      I1 => code(1),
      I2 => \r[30]_i_3_n_0\,
      I3 => \ptr[2]_i_2_n_0\,
      I4 => \ptr_reg[4]_0\(1),
      I5 => \ptr_reg[4]_0\(2),
      O => \ptr[4]_i_2_n_0\
    );
\r[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB8B8"
    )
        port map (
      I0 => Q(16),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(0),
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[0]\,
      O => D(0)
    );
\r[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB8B8B8BBB8"
    )
        port map (
      I0 => Q(26),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(10),
      I3 => \r_reg[18]\,
      I4 => \ptr_reg[4]_0\(3),
      I5 => \r_reg[2]\,
      O => D(10)
    );
\r[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB8B8B8BBB8"
    )
        port map (
      I0 => Q(27),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(11),
      I3 => \r_reg[19]\,
      I4 => \ptr_reg[4]_0\(3),
      I5 => \r_reg[11]\,
      O => D(11)
    );
\r[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB8B8B8BBB8"
    )
        port map (
      I0 => Q(28),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(12),
      I3 => \r_reg[20]\,
      I4 => \ptr_reg[4]_0\(3),
      I5 => \r_reg[4]\,
      O => D(12)
    );
\r[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB8B8B8BBB8"
    )
        port map (
      I0 => Q(29),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(13),
      I3 => \r_reg[21]\,
      I4 => \ptr_reg[4]_0\(3),
      I5 => \r_reg[5]\,
      O => D(13)
    );
\r[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB8BBBBBBB8B8B8"
    )
        port map (
      I0 => Q(30),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(14),
      I3 => \r_reg[6]\,
      I4 => \ptr_reg[4]_0\(3),
      I5 => \r_reg[22]\,
      O => D(14)
    );
\r[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55554540"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => \r_reg[15]\,
      I2 => \ptr_reg[4]_0\(3),
      I3 => \r_reg[15]_0\,
      I4 => Q(15),
      O => D(15)
    );
\r[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55554540"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => \r_reg[16]\,
      I2 => \ptr_reg[4]_0\(3),
      I3 => \r_reg[16]_0\,
      I4 => Q(16),
      O => D(16)
    );
\r[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55554540"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => \r_reg[17]\,
      I2 => \ptr_reg[4]_0\(3),
      I3 => \r_reg[25]\,
      I4 => Q(17),
      O => D(17)
    );
\r[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55554540"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => \r_reg[18]\,
      I2 => \ptr_reg[4]_0\(3),
      I3 => \r_reg[26]\,
      I4 => Q(18),
      O => D(18)
    );
\r[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555544444445444"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(19),
      I2 => \ptr_reg[4]_0\(2),
      I3 => \r_reg[27]\,
      I4 => \ptr_reg[4]_0\(3),
      I5 => \r_reg[19]\,
      O => D(19)
    );
\r[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB8B8"
    )
        port map (
      I0 => Q(17),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(1),
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[1]\,
      O => D(1)
    );
\r[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55454445"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(20),
      I2 => \r_reg[28]\,
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[20]\,
      O => D(20)
    );
\r[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55454445"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(21),
      I2 => \r_reg[29]\,
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[21]\,
      O => D(21)
    );
\r[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55454445"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(22),
      I2 => \r_reg[30]\,
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[22]\,
      O => D(22)
    );
\r[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5454544444445444"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(23),
      I2 => \ptr_reg[4]_0\(3),
      I3 => \r_reg[27]\,
      I4 => \ptr_reg[4]_0\(2),
      I5 => \r_reg[23]\,
      O => D(23)
    );
\r[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5454544444445444"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(24),
      I2 => \ptr_reg[4]_0\(3),
      I3 => \r_reg[24]\,
      I4 => \ptr_reg[4]_0\(2),
      I5 => \r_reg[24]_0\,
      O => D(24)
    );
\r[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5444"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(25),
      I2 => \ptr_reg[4]_0\(3),
      I3 => \r_reg[25]\,
      O => D(25)
    );
\r[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5444"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(26),
      I2 => \ptr_reg[4]_0\(3),
      I3 => \r_reg[26]\,
      O => D(26)
    );
\r[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54444444"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(27),
      I2 => \r_reg[27]\,
      I3 => \ptr_reg[4]_0\(2),
      I4 => \ptr_reg[4]_0\(3),
      O => D(27)
    );
\r[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4544"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(28),
      I2 => \r_reg[28]\,
      I3 => \ptr_reg[4]_0\(3),
      O => D(28)
    );
\r[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4544"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(29),
      I2 => \r_reg[29]\,
      I3 => \ptr_reg[4]_0\(3),
      O => D(29)
    );
\r[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB8B8"
    )
        port map (
      I0 => Q(18),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(2),
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[2]\,
      O => D(2)
    );
\r[30]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4544"
    )
        port map (
      I0 => \r[30]_i_3_n_0\,
      I1 => Q(30),
      I2 => \r_reg[30]\,
      I3 => \ptr_reg[4]_0\(3),
      O => D(30)
    );
\r[30]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFB"
    )
        port map (
      I0 => \^clrptr\,
      I1 => huffmanMem_reg(1),
      I2 => huffmanMem_reg(0),
      I3 => huffmanMem_reg(2),
      O => \r[30]_i_3_n_0\
    );
\r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8BBB8B8"
    )
        port map (
      I0 => Q(19),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(3),
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[3]\,
      I5 => \ptr_reg[4]_0\(2),
      O => D(3)
    );
\r[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB8B8"
    )
        port map (
      I0 => Q(20),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(4),
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[4]\,
      O => D(4)
    );
\r[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB8B8"
    )
        port map (
      I0 => Q(21),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(5),
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[5]\,
      O => D(5)
    );
\r[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB8B8"
    )
        port map (
      I0 => Q(22),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(6),
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[6]\,
      O => D(6)
    );
\r[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB8B8"
    )
        port map (
      I0 => Q(23),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(7),
      I3 => \ptr_reg[4]_0\(3),
      I4 => \r_reg[15]\,
      O => D(7)
    );
\r[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB8B8B8BBB8"
    )
        port map (
      I0 => Q(24),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(8),
      I3 => \r_reg[16]\,
      I4 => \ptr_reg[4]_0\(3),
      I5 => \r_reg[0]\,
      O => D(8)
    );
\r[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB8B8B8BBB8"
    )
        port map (
      I0 => Q(25),
      I1 => \r[30]_i_3_n_0\,
      I2 => Q(9),
      I3 => \r_reg[17]\,
      I4 => \ptr_reg[4]_0\(3),
      I5 => \r_reg[1]\,
      O => D(9)
    );
resultsMem_reg_bram_0_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \^clrptr\,
      I1 => huffmanMem_reg(1),
      I2 => huffmanMem_reg(0),
      I3 => huffmanMem_reg(2),
      I4 => cs(0),
      O => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0_produce is
  port (
    clrPCE2_out : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \cs_reg[1]_0\ : out STD_LOGIC;
    \in\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    rawTextMem_reg_bram_0_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    clr : in STD_LOGIC;
    \cs_reg[1]_1\ : in STD_LOGIC;
    psRawEna : in STD_LOGIC;
    psRawWE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    psRawAddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    psRawDin : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_0_0_produce : entity is "produce";
end design_1_top_0_0_produce;

architecture STRUCTURE of design_1_top_0_0_produce is
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^clrpce2_out\ : STD_LOGIC;
  signal \cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[6]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[6]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[9]_i_1_n_0\ : STD_LOGIC;
  signal cnt_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \cs[1]_i_3_n_0\ : STD_LOGIC;
  signal ns : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in4_out : STD_LOGIC;
  signal rawTextMem_reg_bram_0_i_1_n_0 : STD_LOGIC;
  signal NLW_rawTextMem_reg_bram_0_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_rawTextMem_reg_bram_0_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_rawTextMem_reg_bram_0_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_rawTextMem_reg_bram_0_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_rawTextMem_reg_bram_0_DOUTADOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_rawTextMem_reg_bram_0_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal NLW_rawTextMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_rawTextMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt[1]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \cnt[2]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \cnt[3]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \cnt[4]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \cnt[7]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \cnt[8]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \cnt[9]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \cs[0]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \cs[1]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \cs[1]_i_3\ : label is "soft_lutpair24";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of rawTextMem_reg_bram_0 : label is "p0_d8";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of rawTextMem_reg_bram_0 : label is "p0_d8";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of rawTextMem_reg_bram_0 : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of rawTextMem_reg_bram_0 : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of rawTextMem_reg_bram_0 : label is 8192;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of rawTextMem_reg_bram_0 : label is "inst/HUFFMAN/PRODUCER/rawTextMem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of rawTextMem_reg_bram_0 : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of rawTextMem_reg_bram_0 : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of rawTextMem_reg_bram_0 : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of rawTextMem_reg_bram_0 : label is 7;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of rawTextMem_reg_bram_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of rawTextMem_reg_bram_0 : label is 1023;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of rawTextMem_reg_bram_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of rawTextMem_reg_bram_0 : label is 7;
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
  clrPCE2_out <= \^clrpce2_out\;
\cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt_reg(0),
      O => \cnt[0]_i_1_n_0\
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt_reg(0),
      I1 => cnt_reg(1),
      O => \cnt[1]_i_1_n_0\
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => cnt_reg(2),
      I1 => cnt_reg(1),
      I2 => cnt_reg(0),
      O => \cnt[2]_i_1_n_0\
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => cnt_reg(3),
      I1 => cnt_reg(0),
      I2 => cnt_reg(1),
      I3 => cnt_reg(2),
      O => \cnt[3]_i_1_n_0\
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => cnt_reg(4),
      I1 => cnt_reg(2),
      I2 => cnt_reg(1),
      I3 => cnt_reg(0),
      I4 => cnt_reg(3),
      O => \cnt[4]_i_1_n_0\
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => cnt_reg(5),
      I1 => cnt_reg(3),
      I2 => cnt_reg(0),
      I3 => cnt_reg(1),
      I4 => cnt_reg(2),
      I5 => cnt_reg(4),
      O => \cnt[5]_i_1_n_0\
    );
\cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt_reg(6),
      I1 => \cnt[6]_i_2_n_0\,
      O => \cnt[6]_i_1_n_0\
    );
\cnt[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => cnt_reg(5),
      I1 => cnt_reg(3),
      I2 => cnt_reg(0),
      I3 => cnt_reg(1),
      I4 => cnt_reg(2),
      I5 => cnt_reg(4),
      O => \cnt[6]_i_2_n_0\
    );
\cnt[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => cnt_reg(7),
      I1 => \cnt[6]_i_2_n_0\,
      I2 => cnt_reg(6),
      O => \cnt[7]_i_1_n_0\
    );
\cnt[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => cnt_reg(8),
      I1 => cnt_reg(6),
      I2 => \cnt[6]_i_2_n_0\,
      I3 => cnt_reg(7),
      O => \cnt[8]_i_1_n_0\
    );
\cnt[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => cnt_reg(9),
      I1 => cnt_reg(7),
      I2 => \cnt[6]_i_2_n_0\,
      I3 => cnt_reg(6),
      I4 => cnt_reg(8),
      O => \cnt[9]_i_1_n_0\
    );
\cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[0]_i_1_n_0\,
      Q => cnt_reg(0),
      R => \^clrpce2_out\
    );
\cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[1]_i_1_n_0\,
      Q => cnt_reg(1),
      R => \^clrpce2_out\
    );
\cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[2]_i_1_n_0\,
      Q => cnt_reg(2),
      R => \^clrpce2_out\
    );
\cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[3]_i_1_n_0\,
      Q => cnt_reg(3),
      R => \^clrpce2_out\
    );
\cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[4]_i_1_n_0\,
      Q => cnt_reg(4),
      R => \^clrpce2_out\
    );
\cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[5]_i_1_n_0\,
      Q => cnt_reg(5),
      R => \^clrpce2_out\
    );
\cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[6]_i_1_n_0\,
      Q => cnt_reg(6),
      R => \^clrpce2_out\
    );
\cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[7]_i_1_n_0\,
      Q => cnt_reg(7),
      R => \^clrpce2_out\
    );
\cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[8]_i_1_n_0\,
      Q => cnt_reg(8),
      R => \^clrpce2_out\
    );
\cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => rawTextMem_reg_bram_0_i_1_n_0,
      D => \cnt[9]_i_1_n_0\,
      Q => cnt_reg(9),
      R => \^clrpce2_out\
    );
\cs[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(1),
      I1 => \cs_reg[1]_1\,
      O => ns(0)
    );
\cs[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => rawTextMem_reg_bram_0_0(0),
      I1 => rawTextMem_reg_bram_0_0(1),
      I2 => rawTextMem_reg_bram_0_0(2),
      I3 => clr,
      O => \^clrpce2_out\
    );
\cs[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAA"
    )
        port map (
      I0 => \^q\(1),
      I1 => cnt_reg(9),
      I2 => \cs_reg[1]_1\,
      I3 => \cs[1]_i_3_n_0\,
      O => ns(1)
    );
\cs[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => cnt_reg(8),
      I1 => cnt_reg(6),
      I2 => \cnt[6]_i_2_n_0\,
      I3 => cnt_reg(7),
      O => \cs[1]_i_3_n_0\
    );
\cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ns(0),
      Q => \^q\(0),
      R => \^clrpce2_out\
    );
\cs_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ns(1),
      Q => \^q\(1),
      R => \^clrpce2_out\
    );
huffmanMem_reg_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAAB"
    )
        port map (
      I0 => \^q\(1),
      I1 => clr,
      I2 => rawTextMem_reg_bram_0_0(2),
      I3 => rawTextMem_reg_bram_0_0(1),
      I4 => rawTextMem_reg_bram_0_0(0),
      O => \cs_reg[1]_0\
    );
\p_0_in_inferred__0/i_\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => psRawEna,
      I1 => psRawWE(1),
      I2 => psRawWE(0),
      I3 => psRawWE(2),
      I4 => psRawWE(3),
      O => p_0_in4_out
    );
rawTextMem_reg_bram_0: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0065007800650020003A006300720068007300610062002E002F007E00200023",
      INIT_01 => X"0029003100280068007300610062002000790062002000640065007400750063",
      INIT_02 => X"00730020006E00690067006F006C002D006E006F006E00200072006F00660020",
      INIT_03 => X"00730075002F002000650065007300200023000A002E0073006C006C00650068",
      INIT_04 => X"0068007300610062002F0063006F0064002F00650072006100680073002F0072",
      INIT_05 => X"007500740072006100740073002F00730065006C0070006D006100780065002F",
      INIT_06 => X"00200065006800740020006E00690028002000730065006C00690066002D0070",
      INIT_07 => X"0063006F0064002D00680073006100620020006500670061006B006300610070",
      INIT_08 => X"00730065006C0070006D00610078006500200072006F006600200023000A0029",
      INIT_09 => X"0069006E006E0075007200200074006F006E00200066004900200023000A000A",
      INIT_0A => X"0079006C006500760069007400630061007200650074006E006900200067006E",
      INIT_0B => X"006800740079006E00610020006F0064002000740027006E006F00640020002C",
      INIT_0C => X"0020000A006E00690020002D002400200065007300610063000A0067006E0069",
      INIT_0D => X"00200020002000200020000A003B003B00200029002A0069002A002000200020",
      INIT_0E => X"006100730065000A003B003B006E0072007500740065007200200029002A0020",
      INIT_0F => X"00640020007400750070002000740027006E006F006400200023000A000A0063",
      INIT_10 => X"006F002000730065006E0069006C002000650074006100630069006C00700075",
      INIT_11 => X"0067006E006900740072006100740073002000730065006E0069006C00200072",
      INIT_12 => X"00740020006E0069002000650063006100700073002000680074006900770020",
      INIT_13 => X"0065005300200023000A002E00790072006F0074007300690068002000650068",
      INIT_14 => X"006F006D00200072006F00660020002900310028006800730061006200200065",
      INIT_15 => X"00430054005300490048000A0073006E006F006900740070006F002000650072",
      INIT_16 => X"0074006F006200650072006F006E00670069003D004C004F00520054004E004F",
      INIT_17 => X"00740020006F007400200064006E006500700070006100200023000A000A0068",
      INIT_18 => X"002C0065006C00690066002000790072006F0074007300690068002000650068",
      INIT_19 => X"00650074006900720077007200650076006F002000740027006E006F00640020",
      INIT_1A => X"00730069006800200073002D002000740070006F00680073000A007400690020",
      INIT_1B => X"007300200072006F006600200023000A000A0064006E00650070007000610074",
      INIT_1C => X"006C002000790072006F007400730069006800200067006E0069007400740065",
      INIT_1D => X"00490053005400530049004800200065006500730020006800740067006E0065",
      INIT_1E => X"00530045004C00490046005400530049004800200064006E006100200045005A",
      INIT_1F => X"0048000A00290031002800680073006100620020006E006900200045005A0049",
      INIT_20 => X"005300490048000A0030003000300031003D0045005A00490053005400530049",
      INIT_21 => X"000A000A0030003000300032003D0045005A004900530045004C004900460054",
      INIT_22 => X"0064006E0069007700200065006800740020006B006300650068006300200023",
      INIT_23 => X"0061006500200072006500740066006100200065007A0069007300200077006F",
      INIT_24 => X"0020002C0064006E006100200064006E0061006D006D006F0063002000680063",
      INIT_25 => X"00200023000A002C00790072006100730073006500630065006E002000660069",
      INIT_26 => X"00650075006C0061007600200065006800740020006500740061006400700075",
      INIT_27 => X"004300200064006E0061002000530045004E0049004C00200066006F00200073",
      INIT_28 => X"0073002D002000740070006F00680073000A002E0053004E004D0055004C004F",
      INIT_29 => X"0023000A000A0065007A00690073006E00690077006B00630065006800630020",
      INIT_2A => X"00740061007000200065006800740020002C0074006500730020006600490020",
      INIT_2B => X"00690020006400650073007500200022002A002A00220020006E007200650074",
      INIT_2C => X"00700078006500200065006D0061006E0068007400610070002000610020006E",
      INIT_2D => X"007700200074007800650074006E006F00630020006E006F00690073006E0061",
      INIT_2E => X"0020006C006C006100200068006300740061006D00200023000A006C006C0069",
      INIT_2F => X"006F0020006F00720065007A00200064006E0061002000730065006C00690066",
      INIT_30 => X"00690072006F007400630065007200690064002000650072006F006D00200072",
      INIT_31 => X"00740063006500720069006400620075007300200064006E0061002000730065",
      INIT_32 => X"0073002D002000740070006F006800730023000A002E0073006500690072006F",
      INIT_33 => X"006B0061006D00200023000A000A00720061007400730062006F006C00670020",
      INIT_34 => X"0065006900720066002000650072006F006D0020007300730065006C00200065",
      INIT_35 => X"007800650074002D006E006F006E00200072006F006600200079006C0064006E",
      INIT_36 => X"00730020002C00730065006C006900660020007400750070006E006900200074",
      INIT_37 => X"005B000A0029003100280065007000690070007300730065006C002000650065",
      INIT_38 => X"00730065006C002F006E00690062002F007200730075002F00200078002D0020",
      INIT_39 => X"0020006C0061007600650020002600260020005D002000650070006900700073",
      INIT_3A => X"00680073002F006E00690062002F003D004C004C004500480053002800240022",
      INIT_3B => X"007300200023000A000A002200290065007000690070007300730065006C0020",
      INIT_3C => X"006E00650064006900200065006C006200610069007200610076002000740065",
      INIT_3D => X"006F007200680063002000650068007400200067006E00690079006600690074",
      INIT_3E => X"00280020006E00690020006B0072006F007700200075006F007900200074006F",
      INIT_3F => X"006D006F0072007000200065006800740020006E006900200064006500730075",
      INIT_A => B"00" & X"0000",
      INIT_B => B"00" & X"0000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => B"00" & X"0000",
      SRVAL_B => B"00" & X"0000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 4) => psRawAddr(9 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 4) => cnt_reg(9 downto 0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(15 downto 0) => B"0000000000000000",
      CASDINB(15 downto 0) => B"0000000000000000",
      CASDINPA(1 downto 0) => B"00",
      CASDINPB(1 downto 0) => B"00",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '0',
      CASDOMUXEN_B => '0',
      CASDOUTA(15 downto 0) => NLW_rawTextMem_reg_bram_0_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_rawTextMem_reg_bram_0_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_rawTextMem_reg_bram_0_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_rawTextMem_reg_bram_0_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '0',
      CASOREGIMUXEN_B => '0',
      CLKARDCLK => clk,
      CLKBWRCLK => clk,
      DINADIN(15 downto 8) => B"00000000",
      DINADIN(7 downto 0) => psRawDin(7 downto 0),
      DINBDIN(15 downto 0) => B"0000000011111111",
      DINPADINP(1 downto 0) => B"00",
      DINPBDINP(1 downto 0) => B"00",
      DOUTADOUT(15 downto 0) => NLW_rawTextMem_reg_bram_0_DOUTADOUT_UNCONNECTED(15 downto 0),
      DOUTBDOUT(15 downto 8) => NLW_rawTextMem_reg_bram_0_DOUTBDOUT_UNCONNECTED(15 downto 8),
      DOUTBDOUT(7 downto 0) => \in\(7 downto 0),
      DOUTPADOUTP(1 downto 0) => NLW_rawTextMem_reg_bram_0_DOUTPADOUTP_UNCONNECTED(1 downto 0),
      DOUTPBDOUTP(1 downto 0) => NLW_rawTextMem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED(1 downto 0),
      ENARDEN => '1',
      ENBWREN => rawTextMem_reg_bram_0_i_1_n_0,
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1) => p_0_in4_out,
      WEA(0) => p_0_in4_out,
      WEBWE(3 downto 0) => B"0000"
    );
rawTextMem_reg_bram_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000055555554"
    )
        port map (
      I0 => \^q\(0),
      I1 => rawTextMem_reg_bram_0_0(0),
      I2 => rawTextMem_reg_bram_0_0(1),
      I3 => rawTextMem_reg_bram_0_0(2),
      I4 => clr,
      I5 => \^q\(1),
      O => rawTextMem_reg_bram_0_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0_encode is
  port (
    psHistDout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \cs_reg[1]_0\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    \FSM_sequential_cs_reg[0]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \FSM_sequential_cs_reg[0]_0\ : in STD_LOGIC;
    cs : in STD_LOGIC_VECTOR ( 0 to 0 );
    clr : in STD_LOGIC;
    in0_out : in STD_LOGIC_VECTOR ( 7 downto 0 );
    psHistAddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clrPCE2_out : in STD_LOGIC;
    \cs_reg[1]_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    huffmanMem_reg_0 : in STD_LOGIC;
    psHuffEna : in STD_LOGIC;
    psHuffWE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    psHuffAddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    psHuffDin : in STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_0_0_encode : entity is "encode";
end design_1_top_0_0_encode;

architecture STRUCTURE of design_1_top_0_0_encode is
  signal HIST_n_16 : STD_LOGIC;
  signal HIST_n_17 : STD_LOGIC;
  signal HIST_n_18 : STD_LOGIC;
  signal HIST_n_19 : STD_LOGIC;
  signal HIST_n_20 : STD_LOGIC;
  signal HIST_n_21 : STD_LOGIC;
  signal HIST_n_22 : STD_LOGIC;
  signal HIST_n_23 : STD_LOGIC;
  signal HIST_n_24 : STD_LOGIC;
  signal HIST_n_25 : STD_LOGIC;
  signal HIST_n_26 : STD_LOGIC;
  signal HIST_n_27 : STD_LOGIC;
  signal HIST_n_28 : STD_LOGIC;
  signal HIST_n_29 : STD_LOGIC;
  signal HIST_n_30 : STD_LOGIC;
  signal HIST_n_31 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal clrPtr : STD_LOGIC;
  signal code : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \cs[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \cs[1]_i_1_n_0\ : STD_LOGIC;
  signal \cs[2]_i_2_n_0\ : STD_LOGIC;
  signal cs_0 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^cs_reg[1]_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal p_0_in2_out : STD_LOGIC;
  signal ptr : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \ptr_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal r : STD_LOGIC_VECTOR ( 30 downto 16 );
  signal \r[10]_i_2_n_0\ : STD_LOGIC;
  signal \r[11]_i_2_n_0\ : STD_LOGIC;
  signal \r[12]_i_2_n_0\ : STD_LOGIC;
  signal \r[13]_i_2_n_0\ : STD_LOGIC;
  signal \r[14]_i_2_n_0\ : STD_LOGIC;
  signal \r[14]_i_3_n_0\ : STD_LOGIC;
  signal \r[15]_i_2_n_0\ : STD_LOGIC;
  signal \r[15]_i_3_n_0\ : STD_LOGIC;
  signal \r[16]_i_2_n_0\ : STD_LOGIC;
  signal \r[16]_i_3_n_0\ : STD_LOGIC;
  signal \r[16]_i_4_n_0\ : STD_LOGIC;
  signal \r[17]_i_2_n_0\ : STD_LOGIC;
  signal \r[17]_i_3_n_0\ : STD_LOGIC;
  signal \r[18]_i_2_n_0\ : STD_LOGIC;
  signal \r[18]_i_3_n_0\ : STD_LOGIC;
  signal \r[19]_i_2_n_0\ : STD_LOGIC;
  signal \r[19]_i_3_n_0\ : STD_LOGIC;
  signal \r[20]_i_2_n_0\ : STD_LOGIC;
  signal \r[20]_i_3_n_0\ : STD_LOGIC;
  signal \r[21]_i_2_n_0\ : STD_LOGIC;
  signal \r[21]_i_3_n_0\ : STD_LOGIC;
  signal \r[22]_i_2_n_0\ : STD_LOGIC;
  signal \r[22]_i_3_n_0\ : STD_LOGIC;
  signal \r[23]_i_2_n_0\ : STD_LOGIC;
  signal \r[24]_i_2_n_0\ : STD_LOGIC;
  signal \r[24]_i_3_n_0\ : STD_LOGIC;
  signal \r[25]_i_2_n_0\ : STD_LOGIC;
  signal \r[25]_i_3_n_0\ : STD_LOGIC;
  signal \r[26]_i_2_n_0\ : STD_LOGIC;
  signal \r[26]_i_3_n_0\ : STD_LOGIC;
  signal \r[27]_i_2_n_0\ : STD_LOGIC;
  signal \r[28]_i_2_n_0\ : STD_LOGIC;
  signal \r[29]_i_2_n_0\ : STD_LOGIC;
  signal \r[30]_i_1_n_0\ : STD_LOGIC;
  signal \r[30]_i_4_n_0\ : STD_LOGIC;
  signal \r[3]_i_2_n_0\ : STD_LOGIC;
  signal \r[8]_i_2_n_0\ : STD_LOGIC;
  signal \r[9]_i_2_n_0\ : STD_LOGIC;
  signal NLW_huffmanMem_reg_CASDOUTA_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_huffmanMem_reg_CASDOUTB_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_huffmanMem_reg_CASDOUTPA_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_huffmanMem_reg_CASDOUTPB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_huffmanMem_reg_DOUTBDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 4 );
  signal NLW_huffmanMem_reg_DOUTPADOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_huffmanMem_reg_DOUTPBDOUTP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of huffmanMem_reg : label is "p0_d20";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of huffmanMem_reg : label is "p0_d20";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of huffmanMem_reg : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of huffmanMem_reg : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of huffmanMem_reg : label is 5120;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of huffmanMem_reg : label is "inst/HUFFMAN/ENCODER/huffmanMem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of huffmanMem_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of huffmanMem_reg : label is 511;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of huffmanMem_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of huffmanMem_reg : label is 19;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of huffmanMem_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of huffmanMem_reg : label is 511;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of huffmanMem_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of huffmanMem_reg : label is 19;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \r[11]_i_2\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \r[14]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \r[15]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \r[15]_i_3\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \r[16]_i_2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \r[16]_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \r[17]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \r[18]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \r[19]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \r[20]_i_2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \r[21]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \r[22]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \r[29]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \r[30]_i_4\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \r[8]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \r[9]_i_2\ : label is "soft_lutpair14";
begin
  Q(15 downto 0) <= \^q\(15 downto 0);
  \cs_reg[1]_0\ <= \^cs_reg[1]_0\;
HIST: entity work.design_1_top_0_0_histogram
     port map (
      D(30) => HIST_n_16,
      D(29) => HIST_n_17,
      D(28) => HIST_n_18,
      D(27) => HIST_n_19,
      D(26) => HIST_n_20,
      D(25) => HIST_n_21,
      D(24) => HIST_n_22,
      D(23) => HIST_n_23,
      D(22) => HIST_n_24,
      D(21) => HIST_n_25,
      D(20) => HIST_n_26,
      D(19) => HIST_n_27,
      D(18) => HIST_n_28,
      D(17) => HIST_n_29,
      D(16) => HIST_n_30,
      D(15) => HIST_n_31,
      D(14 downto 0) => p_0_in(14 downto 0),
      E(0) => E(0),
      \FSM_sequential_cs_reg[0]\(2 downto 0) => \FSM_sequential_cs_reg[0]\(2 downto 0),
      \FSM_sequential_cs_reg[0]_0\ => \FSM_sequential_cs_reg[0]_0\,
      \FSM_sequential_cs_reg[0]_1\(1 downto 0) => \cs_reg[1]_1\(1 downto 0),
      \FSM_sequential_cs_reg[2]\(0) => D(0),
      I2 => \^cs_reg[1]_0\,
      Q(30 downto 16) => r(30 downto 16),
      Q(15 downto 0) => \^q\(15 downto 0),
      clk => clk,
      clr => clr,
      clrPtr => clrPtr,
      code(3 downto 0) => code(19 downto 16),
      cs(0) => cs(0),
      huffmanMem_reg(2 downto 0) => cs_0(2 downto 0),
      huffmanMem_reg_0 => huffmanMem_reg_0,
      in0_out(7 downto 0) => in0_out(7 downto 0),
      psHistAddr(7 downto 0) => psHistAddr(7 downto 0),
      psHistDout(15 downto 0) => psHistDout(15 downto 0),
      \ptr_reg[4]\(3 downto 0) => ptr(4 downto 1),
      \ptr_reg[4]_0\(4 downto 0) => \ptr_reg__0\(4 downto 0),
      \r_reg[0]\ => \r[8]_i_2_n_0\,
      \r_reg[11]\ => \r[11]_i_2_n_0\,
      \r_reg[15]\ => \r[15]_i_2_n_0\,
      \r_reg[15]_0\ => \r[15]_i_3_n_0\,
      \r_reg[16]\ => \r[16]_i_2_n_0\,
      \r_reg[16]_0\ => \r[16]_i_3_n_0\,
      \r_reg[17]\ => \r[17]_i_2_n_0\,
      \r_reg[18]\ => \r[18]_i_2_n_0\,
      \r_reg[19]\ => \r[19]_i_2_n_0\,
      \r_reg[1]\ => \r[9]_i_2_n_0\,
      \r_reg[20]\ => \r[20]_i_2_n_0\,
      \r_reg[21]\ => \r[21]_i_2_n_0\,
      \r_reg[22]\ => \r[22]_i_2_n_0\,
      \r_reg[23]\ => \r[23]_i_2_n_0\,
      \r_reg[24]\ => \r[24]_i_2_n_0\,
      \r_reg[24]_0\ => \r[24]_i_3_n_0\,
      \r_reg[25]\ => \r[25]_i_2_n_0\,
      \r_reg[26]\ => \r[26]_i_2_n_0\,
      \r_reg[27]\ => \r[27]_i_2_n_0\,
      \r_reg[28]\ => \r[28]_i_2_n_0\,
      \r_reg[29]\ => \r[29]_i_2_n_0\,
      \r_reg[2]\ => \r[10]_i_2_n_0\,
      \r_reg[30]\ => \r[30]_i_4_n_0\,
      \r_reg[3]\ => \r[3]_i_2_n_0\,
      \r_reg[4]\ => \r[12]_i_2_n_0\,
      \r_reg[5]\ => \r[13]_i_2_n_0\,
      \r_reg[6]\ => \r[14]_i_2_n_0\
    );
\cs[0]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cs_0(1),
      I1 => cs_0(0),
      O => \cs[0]_i_1__1_n_0\
    );
\cs[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000ABAA"
    )
        port map (
      I0 => cs_0(1),
      I1 => clrPCE2_out,
      I2 => \cs_reg[1]_1\(1),
      I3 => \cs_reg[1]_1\(0),
      I4 => cs_0(0),
      I5 => cs_0(2),
      O => \cs[1]_i_1_n_0\
    );
\cs[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF88888"
    )
        port map (
      I0 => cs_0(0),
      I1 => \ptr_reg__0\(4),
      I2 => cs(0),
      I3 => clrPCE2_out,
      I4 => cs_0(2),
      O => \cs[2]_i_2_n_0\
    );
\cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \cs[0]_i_1__1_n_0\,
      Q => cs_0(0),
      R => clrPtr
    );
\cs_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \cs[1]_i_1_n_0\,
      Q => cs_0(1),
      R => clrPtr
    );
\cs_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \cs[2]_i_2_n_0\,
      Q => cs_0(2),
      R => clrPtr
    );
huffmanMem_reg: unisim.vcomponents.RAMB18E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"000F7F33000F7F32000F7F31000F7F30000F7F2F000F7F2E000F7F2D000F7F2C",
      INIT_01 => X"000F7F3A000F7F39000F7F38000F7F37000F7F3600040008000F7F35000F7F34",
      INIT_02 => X"000F7F42000F7F41000F7F40000F7F3F000F7F3E000F7F3D000F7F3C000F7F3B",
      INIT_03 => X"000F7F4A000F7F49000F7F48000F7F47000F7F46000F7F45000F7F44000F7F43",
      INIT_04 => X"000F7F51000F7F50000F7F4F000F7F4E000F7F4D000F7F4C000F7F4B00020000",
      INIT_05 => X"000F7F58000F7F57000F7F5600040009000F7F55000F7F54000F7F53000F7F52",
      INIT_06 => X"00050019000500180006003C0006003B0006003A000600390006003800020001",
      INIT_07 => X"000F7F5D000F7F5C000E3F80000F7F5B000F7F5A000F7F590006003D0004000A",
      INIT_08 => X"000E3F83000F7F62000E3F82000F7F61000F7F60000F7F5F000E3F81000F7F5E",
      INIT_09 => X"000E3F87000E3F86000E3F85000E3F84000F7F66000F7F65000F7F64000F7F63",
      INIT_0A => X"000F7F6C000F7F6B000E3F89000F7F6A000F7F69000E3F88000F7F68000F7F67",
      INIT_0B => X"000F7F72000F7F71000E3F8B000F7F70000E3F8A000F7F6F000F7F6E000F7F6D",
      INIT_0C => X"000E3F8C000800FD000800FC000800FB000800FA000800F9000800F8000F7F73",
      INIT_0D => X"000E3F91000F7F76000E3F90000E3F8F000F7F75000F7F74000E3F8E000E3F8D",
      INIT_0E => X"000F7F7B000F7F7A000F7F79000F7F78000E3F94000E3F93000F7F77000E3F92",
      INIT_0F => X"000F7F7F000F7F7E0004000B000F7F7D0005001B000F7F7C000E3F950005001A",
      INIT_10 => X"000F7F87000F7F86000F7F85000F7F84000F7F83000F7F82000F7F81000F7F80",
      INIT_11 => X"000F7F8F000F7F8E000F7F8D000F7F8C000F7F8B000F7F8A000F7F89000F7F88",
      INIT_12 => X"000F7F97000F7F96000F7F95000F7F94000F7F93000F7F92000F7F91000F7F90",
      INIT_13 => X"000F7F9F000F7F9E000F7F9D000F7F9C000F7F9B000F7F9A000F7F99000F7F98",
      INIT_14 => X"000F7FA7000F7FA6000F7FA5000F7FA4000F7FA3000F7FA2000F7FA1000F7FA0",
      INIT_15 => X"000F7FAF000F7FAE000F7FAD000F7FAC000F7FAB000F7FAA000F7FA9000F7FA8",
      INIT_16 => X"000F7FB7000F7FB6000F7FB5000F7FB4000F7FB3000F7FB2000F7FB1000F7FB0",
      INIT_17 => X"000F7FBF000F7FBE000F7FBD000F7FBC000F7FBB000F7FBA000F7FB9000F7FB8",
      INIT_18 => X"000F7FC7000F7FC6000F7FC5000F7FC4000F7FC3000F7FC2000F7FC1000F7FC0",
      INIT_19 => X"000F7FCF000F7FCE000F7FCD000F7FCC000F7FCB000F7FCA000F7FC9000F7FC8",
      INIT_1A => X"000F7FD7000F7FD6000F7FD5000F7FD4000F7FD3000F7FD2000F7FD1000F7FD0",
      INIT_1B => X"000F7FDF000F7FDE000F7FDD000F7FDC000F7FDB000F7FDA000F7FD9000F7FD8",
      INIT_1C => X"000F7FE7000F7FE6000F7FE5000F7FE4000F7FE3000F7FE2000F7FE1000F7FE0",
      INIT_1D => X"000F7FEF000F7FEE000F7FED000F7FEC000F7FEB000F7FEA000F7FE9000F7FE8",
      INIT_1E => X"000F7FF7000F7FF6000F7FF5000F7FF4000F7FF3000F7FF2000F7FF1000F7FF0",
      INIT_1F => X"000F7FFF000F7FFE000F7FFD000F7FFC000F7FFB000F7FFA000F7FF9000F7FF8",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => B"00" & X"0000",
      INIT_B => B"00" & X"0000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => B"00" & X"0000",
      SRVAL_B => B"00" & X"0000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "READ_FIRST",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(13) => '0',
      ADDRARDADDR(12 downto 5) => in0_out(7 downto 0),
      ADDRARDADDR(4 downto 0) => B"11111",
      ADDRBWRADDR(13) => '0',
      ADDRBWRADDR(12 downto 5) => psHuffAddr(7 downto 0),
      ADDRBWRADDR(4 downto 0) => B"11111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(15 downto 0) => B"0000000000000000",
      CASDINB(15 downto 0) => B"0000000000000000",
      CASDINPA(1 downto 0) => B"00",
      CASDINPB(1 downto 0) => B"00",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(15 downto 0) => NLW_huffmanMem_reg_CASDOUTA_UNCONNECTED(15 downto 0),
      CASDOUTB(15 downto 0) => NLW_huffmanMem_reg_CASDOUTB_UNCONNECTED(15 downto 0),
      CASDOUTPA(1 downto 0) => NLW_huffmanMem_reg_CASDOUTPA_UNCONNECTED(1 downto 0),
      CASDOUTPB(1 downto 0) => NLW_huffmanMem_reg_CASDOUTPB_UNCONNECTED(1 downto 0),
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '0',
      CASOREGIMUXEN_B => '0',
      CLKARDCLK => clk,
      CLKBWRCLK => clk,
      DINADIN(15 downto 0) => psHuffDin(15 downto 0),
      DINBDIN(15 downto 4) => B"111111111111",
      DINBDIN(3 downto 0) => psHuffDin(19 downto 16),
      DINPADINP(1 downto 0) => B"11",
      DINPBDINP(1 downto 0) => B"11",
      DOUTADOUT(15 downto 0) => code(15 downto 0),
      DOUTBDOUT(15 downto 4) => NLW_huffmanMem_reg_DOUTBDOUT_UNCONNECTED(15 downto 4),
      DOUTBDOUT(3 downto 0) => code(19 downto 16),
      DOUTPADOUTP(1 downto 0) => NLW_huffmanMem_reg_DOUTPADOUTP_UNCONNECTED(1 downto 0),
      DOUTPBDOUTP(1 downto 0) => NLW_huffmanMem_reg_DOUTPBDOUTP_UNCONNECTED(1 downto 0),
      ENARDEN => \^cs_reg[1]_0\,
      ENBWREN => '1',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SLEEP => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3) => p_0_in2_out,
      WEBWE(2) => p_0_in2_out,
      WEBWE(1) => p_0_in2_out,
      WEBWE(0) => p_0_in2_out
    );
\p_0_in_inferred__0/i_\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => psHuffEna,
      I1 => psHuffWE(1),
      I2 => psHuffWE(0),
      I3 => psHuffWE(2),
      I4 => psHuffWE(3),
      O => p_0_in2_out
    );
\ptr[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => \ptr_reg__0\(0),
      I1 => cs_0(2),
      I2 => cs_0(1),
      I3 => code(16),
      O => ptr(0)
    );
\ptr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => ptr(0),
      Q => \ptr_reg__0\(0),
      R => clrPtr
    );
\ptr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => ptr(1),
      Q => \ptr_reg__0\(1),
      R => clrPtr
    );
\ptr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => ptr(2),
      Q => \ptr_reg__0\(2),
      R => clrPtr
    );
\ptr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => ptr(3),
      Q => \ptr_reg__0\(3),
      R => clrPtr
    );
\ptr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => ptr(4),
      Q => \ptr_reg__0\(4),
      R => clrPtr
    );
\r[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000033E200E2"
    )
        port map (
      I0 => code(2),
      I1 => \ptr_reg__0\(0),
      I2 => code(1),
      I3 => \ptr_reg__0\(1),
      I4 => code(0),
      I5 => \ptr_reg__0\(2),
      O => \r[10]_i_2_n_0\
    );
\r[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \r[3]_i_2_n_0\,
      I1 => \ptr_reg__0\(2),
      O => \r[11]_i_2_n_0\
    );
\r[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04FF0400"
    )
        port map (
      I0 => \ptr_reg__0\(0),
      I1 => code(0),
      I2 => \ptr_reg__0\(1),
      I3 => \ptr_reg__0\(2),
      I4 => \r[16]_i_4_n_0\,
      O => \r[12]_i_2_n_0\
    );
\r[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => code(1),
      I1 => \ptr_reg__0\(0),
      I2 => code(0),
      I3 => \ptr_reg__0\(1),
      I4 => \ptr_reg__0\(2),
      I5 => \r[17]_i_3_n_0\,
      O => \r[13]_i_2_n_0\
    );
\r[14]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[14]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[18]_i_3_n_0\,
      O => \r[14]_i_2_n_0\
    );
\r[14]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => code(0),
      I1 => \ptr_reg__0\(1),
      I2 => code(1),
      I3 => \ptr_reg__0\(0),
      I4 => code(2),
      O => \r[14]_i_3_n_0\
    );
\r[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[3]_i_2_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[19]_i_3_n_0\,
      O => \r[15]_i_2_n_0\
    );
\r[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[23]_i_2_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[27]_i_2_n_0\,
      O => \r[15]_i_3_n_0\
    );
\r[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[16]_i_4_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[20]_i_3_n_0\,
      O => \r[16]_i_2_n_0\
    );
\r[16]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[24]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[24]_i_2_n_0\,
      O => \r[16]_i_3_n_0\
    );
\r[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(1),
      I1 => code(2),
      I2 => \ptr_reg__0\(1),
      I3 => code(3),
      I4 => \ptr_reg__0\(0),
      I5 => code(4),
      O => \r[16]_i_4_n_0\
    );
\r[17]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[17]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[21]_i_3_n_0\,
      O => \r[17]_i_2_n_0\
    );
\r[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(2),
      I1 => code(3),
      I2 => \ptr_reg__0\(1),
      I3 => code(4),
      I4 => \ptr_reg__0\(0),
      I5 => code(5),
      O => \r[17]_i_3_n_0\
    );
\r[18]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[18]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[22]_i_3_n_0\,
      O => \r[18]_i_2_n_0\
    );
\r[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(3),
      I1 => code(4),
      I2 => \ptr_reg__0\(1),
      I3 => code(5),
      I4 => \ptr_reg__0\(0),
      I5 => code(6),
      O => \r[18]_i_3_n_0\
    );
\r[19]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[19]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[23]_i_2_n_0\,
      O => \r[19]_i_2_n_0\
    );
\r[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(4),
      I1 => code(5),
      I2 => \ptr_reg__0\(1),
      I3 => code(6),
      I4 => \ptr_reg__0\(0),
      I5 => code(7),
      O => \r[19]_i_3_n_0\
    );
\r[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[20]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[24]_i_3_n_0\,
      O => \r[20]_i_2_n_0\
    );
\r[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(5),
      I1 => code(6),
      I2 => \ptr_reg__0\(1),
      I3 => code(7),
      I4 => \ptr_reg__0\(0),
      I5 => code(8),
      O => \r[20]_i_3_n_0\
    );
\r[21]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[21]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[25]_i_3_n_0\,
      O => \r[21]_i_2_n_0\
    );
\r[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(6),
      I1 => code(7),
      I2 => \ptr_reg__0\(1),
      I3 => code(8),
      I4 => \ptr_reg__0\(0),
      I5 => code(9),
      O => \r[21]_i_3_n_0\
    );
\r[22]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r[22]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => \r[26]_i_3_n_0\,
      O => \r[22]_i_2_n_0\
    );
\r[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(7),
      I1 => code(8),
      I2 => \ptr_reg__0\(1),
      I3 => code(9),
      I4 => \ptr_reg__0\(0),
      I5 => code(10),
      O => \r[22]_i_3_n_0\
    );
\r[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(8),
      I1 => code(9),
      I2 => \ptr_reg__0\(1),
      I3 => code(10),
      I4 => \ptr_reg__0\(0),
      I5 => code(11),
      O => \r[23]_i_2_n_0\
    );
\r[24]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => code(13),
      I1 => code(14),
      I2 => \ptr_reg__0\(1),
      I3 => \ptr_reg__0\(0),
      I4 => code(15),
      O => \r[24]_i_2_n_0\
    );
\r[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(9),
      I1 => code(10),
      I2 => \ptr_reg__0\(1),
      I3 => code(11),
      I4 => \ptr_reg__0\(0),
      I5 => code(12),
      O => \r[24]_i_3_n_0\
    );
\r[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB888B888888888"
    )
        port map (
      I0 => \r[25]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => code(15),
      I3 => \ptr_reg__0\(0),
      I4 => code(14),
      I5 => \ptr_reg__0\(1),
      O => \r[25]_i_2_n_0\
    );
\r[25]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(10),
      I1 => code(11),
      I2 => \ptr_reg__0\(1),
      I3 => code(12),
      I4 => \ptr_reg__0\(0),
      I5 => code(13),
      O => \r[25]_i_3_n_0\
    );
\r[26]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8888888"
    )
        port map (
      I0 => \r[26]_i_3_n_0\,
      I1 => \ptr_reg__0\(2),
      I2 => code(15),
      I3 => \ptr_reg__0\(0),
      I4 => \ptr_reg__0\(1),
      O => \r[26]_i_2_n_0\
    );
\r[26]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(11),
      I1 => code(12),
      I2 => \ptr_reg__0\(1),
      I3 => code(13),
      I4 => \ptr_reg__0\(0),
      I5 => code(14),
      O => \r[26]_i_3_n_0\
    );
\r[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(12),
      I1 => code(13),
      I2 => \ptr_reg__0\(1),
      I3 => code(14),
      I4 => \ptr_reg__0\(0),
      I5 => code(15),
      O => \r[27]_i_2_n_0\
    );
\r[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"557F5F7FF57FFF7F"
    )
        port map (
      I0 => \ptr_reg__0\(2),
      I1 => code(15),
      I2 => \ptr_reg__0\(0),
      I3 => \ptr_reg__0\(1),
      I4 => code(14),
      I5 => code(13),
      O => \r[28]_i_2_n_0\
    );
\r[29]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F777FFF"
    )
        port map (
      I0 => \ptr_reg__0\(2),
      I1 => \ptr_reg__0\(1),
      I2 => code(14),
      I3 => \ptr_reg__0\(0),
      I4 => code(15),
      O => \r[29]_i_2_n_0\
    );
\r[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0304"
    )
        port map (
      I0 => cs(0),
      I1 => cs_0(2),
      I2 => cs_0(0),
      I3 => cs_0(1),
      O => \r[30]_i_1_n_0\
    );
\r[30]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \ptr_reg__0\(2),
      I1 => \ptr_reg__0\(1),
      I2 => \ptr_reg__0\(0),
      I3 => code(15),
      O => \r[30]_i_4_n_0\
    );
\r[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => code(0),
      I1 => code(1),
      I2 => \ptr_reg__0\(1),
      I3 => code(2),
      I4 => \ptr_reg__0\(0),
      I5 => code(3),
      O => \r[3]_i_2_n_0\
    );
\r[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \ptr_reg__0\(1),
      I1 => code(0),
      I2 => \ptr_reg__0\(0),
      I3 => \ptr_reg__0\(2),
      O => \r[8]_i_2_n_0\
    );
\r[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004540"
    )
        port map (
      I0 => \ptr_reg__0\(1),
      I1 => code(0),
      I2 => \ptr_reg__0\(0),
      I3 => code(1),
      I4 => \ptr_reg__0\(2),
      O => \r[9]_i_2_n_0\
    );
\r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(0),
      Q => \^q\(0),
      R => clrPtr
    );
\r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(10),
      Q => \^q\(10),
      R => clrPtr
    );
\r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(11),
      Q => \^q\(11),
      R => clrPtr
    );
\r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(12),
      Q => \^q\(12),
      R => clrPtr
    );
\r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(13),
      Q => \^q\(13),
      R => clrPtr
    );
\r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(14),
      Q => \^q\(14),
      R => clrPtr
    );
\r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_31,
      Q => \^q\(15),
      R => clrPtr
    );
\r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_30,
      Q => r(16),
      R => clrPtr
    );
\r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_29,
      Q => r(17),
      R => clrPtr
    );
\r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_28,
      Q => r(18),
      R => clrPtr
    );
\r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_27,
      Q => r(19),
      R => clrPtr
    );
\r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(1),
      Q => \^q\(1),
      R => clrPtr
    );
\r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_26,
      Q => r(20),
      R => clrPtr
    );
\r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_25,
      Q => r(21),
      R => clrPtr
    );
\r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_24,
      Q => r(22),
      R => clrPtr
    );
\r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_23,
      Q => r(23),
      R => clrPtr
    );
\r_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_22,
      Q => r(24),
      R => clrPtr
    );
\r_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_21,
      Q => r(25),
      R => clrPtr
    );
\r_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_20,
      Q => r(26),
      R => clrPtr
    );
\r_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_19,
      Q => r(27),
      R => clrPtr
    );
\r_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_18,
      Q => r(28),
      R => clrPtr
    );
\r_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_17,
      Q => r(29),
      R => clrPtr
    );
\r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(2),
      Q => \^q\(2),
      R => clrPtr
    );
\r_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => HIST_n_16,
      Q => r(30),
      R => clrPtr
    );
\r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(3),
      Q => \^q\(3),
      R => clrPtr
    );
\r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(4),
      Q => \^q\(4),
      R => clrPtr
    );
\r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(5),
      Q => \^q\(5),
      R => clrPtr
    );
\r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(6),
      Q => \^q\(6),
      R => clrPtr
    );
\r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(7),
      Q => \^q\(7),
      R => clrPtr
    );
\r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(8),
      Q => \^q\(8),
      R => clrPtr
    );
\r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \r[30]_i_1_n_0\,
      D => p_0_in(9),
      Q => \^q\(9),
      R => clrPtr
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0_huffman is
  port (
    psHistDout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    psResultsDout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    done : out STD_LOGIC;
    clr : in STD_LOGIC;
    psHistAddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    psResultsAddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    psRawEna : in STD_LOGIC;
    psRawWE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    psRawAddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    psRawDin : in STD_LOGIC_VECTOR ( 7 downto 0 );
    psHuffEna : in STD_LOGIC;
    psHuffWE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    psHuffAddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    psHuffDin : in STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_0_0_huffman : entity is "huffman";
end design_1_top_0_0_huffman;

architecture STRUCTURE of design_1_top_0_0_huffman is
  signal ENCODER_n_32 : STD_LOGIC;
  signal ENCODER_n_33 : STD_LOGIC;
  signal \FSM_sequential_cs[2]_i_2_n_0\ : STD_LOGIC;
  signal PRODUCER_n_3 : STD_LOGIC;
  signal ccodeIn : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal clrPCE2_out : STD_LOGIC;
  signal crdyIn : STD_LOGIC;
  signal cs : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal cs_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cs_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \dla[4]_i_1_n_0\ : STD_LOGIC;
  signal \dla_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \in\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal ns : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_cs[1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \FSM_sequential_cs[2]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \FSM_sequential_cs[2]_i_2\ : label is "soft_lutpair26";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_cs_reg[0]\ : label is "histPrep:000,huffPrep:001,huffRun:010,huffDla:011,huffFinal:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_cs_reg[1]\ : label is "histPrep:000,huffPrep:001,huffRun:010,huffDla:011,huffFinal:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_cs_reg[2]\ : label is "histPrep:000,huffPrep:001,huffRun:010,huffDla:011,huffFinal:100";
  attribute SOFT_HLUTNM of \dla[0]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \dla[1]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \dla[2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \dla[3]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \dla[4]_i_2\ : label is "soft_lutpair26";
begin
CONSUMER: entity work.design_1_top_0_0_consume
     port map (
      E(0) => crdyIn,
      Q(15 downto 0) => ccodeIn(15 downto 0),
      clk => clk,
      clr => clr,
      clrPCE2_out => clrPCE2_out,
      cs(0) => cs_0(0),
      psResultsAddr(9 downto 0) => psResultsAddr(9 downto 0),
      psResultsDout(15 downto 0) => psResultsDout(15 downto 0),
      resultsMem_reg_bram_0_0(2 downto 0) => cs(2 downto 0)
    );
ENCODER: entity work.design_1_top_0_0_encode
     port map (
      D(0) => ENCODER_n_32,
      E(0) => crdyIn,
      \FSM_sequential_cs_reg[0]\(2 downto 0) => cs(2 downto 0),
      \FSM_sequential_cs_reg[0]_0\ => \FSM_sequential_cs[2]_i_2_n_0\,
      Q(15 downto 0) => ccodeIn(15 downto 0),
      clk => clk,
      clr => clr,
      clrPCE2_out => clrPCE2_out,
      cs(0) => cs_0(0),
      \cs_reg[1]_0\ => ENCODER_n_33,
      \cs_reg[1]_1\(1 downto 0) => cs_1(1 downto 0),
      huffmanMem_reg_0 => PRODUCER_n_3,
      in0_out(7 downto 0) => \in\(7 downto 0),
      psHistAddr(7 downto 0) => psHistAddr(7 downto 0),
      psHistDout(15 downto 0) => psHistDout(15 downto 0),
      psHuffAddr(7 downto 0) => psHuffAddr(7 downto 0),
      psHuffDin(19 downto 0) => psHuffDin(19 downto 0),
      psHuffEna => psHuffEna,
      psHuffWE(3 downto 0) => psHuffWE(3 downto 0)
    );
\FSM_sequential_cs[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1550"
    )
        port map (
      I0 => cs(2),
      I1 => \FSM_sequential_cs[2]_i_2_n_0\,
      I2 => cs(0),
      I3 => cs(1),
      O => ns(1)
    );
\FSM_sequential_cs[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"400A"
    )
        port map (
      I0 => cs(2),
      I1 => \FSM_sequential_cs[2]_i_2_n_0\,
      I2 => cs(0),
      I3 => cs(1),
      O => ns(2)
    );
\FSM_sequential_cs[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \dla_reg__0\(4),
      I1 => \dla_reg__0\(2),
      I2 => \dla_reg__0\(1),
      I3 => \dla_reg__0\(0),
      I4 => \dla_reg__0\(3),
      O => \FSM_sequential_cs[2]_i_2_n_0\
    );
\FSM_sequential_cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ENCODER_n_32,
      Q => cs(0),
      R => clr
    );
\FSM_sequential_cs_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ns(1),
      Q => cs(1),
      R => clr
    );
\FSM_sequential_cs_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ns(2),
      Q => cs(2),
      R => clr
    );
PRODUCER: entity work.design_1_top_0_0_produce
     port map (
      Q(1 downto 0) => cs_1(1 downto 0),
      clk => clk,
      clr => clr,
      clrPCE2_out => clrPCE2_out,
      \cs_reg[1]_0\ => PRODUCER_n_3,
      \cs_reg[1]_1\ => ENCODER_n_33,
      \in\(7 downto 0) => \in\(7 downto 0),
      psRawAddr(9 downto 0) => psRawAddr(9 downto 0),
      psRawDin(7 downto 0) => psRawDin(7 downto 0),
      psRawEna => psRawEna,
      psRawWE(3 downto 0) => psRawWE(3 downto 0),
      rawTextMem_reg_bram_0_0(2 downto 0) => cs(2 downto 0)
    );
\dla[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \dla_reg__0\(0),
      O => \p_0_in__1\(0)
    );
\dla[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \dla_reg__0\(0),
      I1 => \dla_reg__0\(1),
      O => \p_0_in__1\(1)
    );
\dla[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \dla_reg__0\(2),
      I1 => \dla_reg__0\(1),
      I2 => \dla_reg__0\(0),
      O => \p_0_in__1\(2)
    );
\dla[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \dla_reg__0\(3),
      I1 => \dla_reg__0\(0),
      I2 => \dla_reg__0\(1),
      I3 => \dla_reg__0\(2),
      O => \p_0_in__1\(3)
    );
\dla[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF17"
    )
        port map (
      I0 => cs(2),
      I1 => cs(1),
      I2 => cs(0),
      I3 => clr,
      O => \dla[4]_i_1_n_0\
    );
\dla[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \dla_reg__0\(4),
      I1 => \dla_reg__0\(2),
      I2 => \dla_reg__0\(1),
      I3 => \dla_reg__0\(0),
      I4 => \dla_reg__0\(3),
      O => \p_0_in__1\(4)
    );
\dla_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__1\(0),
      Q => \dla_reg__0\(0),
      R => \dla[4]_i_1_n_0\
    );
\dla_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__1\(1),
      Q => \dla_reg__0\(1),
      R => \dla[4]_i_1_n_0\
    );
\dla_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__1\(2),
      Q => \dla_reg__0\(2),
      R => \dla[4]_i_1_n_0\
    );
\dla_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__1\(3),
      Q => \dla_reg__0\(3),
      R => \dla[4]_i_1_n_0\
    );
\dla_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \p_0_in__1\(4),
      Q => \dla_reg__0\(4),
      R => \dla[4]_i_1_n_0\
    );
done_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => cs(0),
      I1 => cs(1),
      I2 => cs(2),
      I3 => clr,
      O => done
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0_top is
  port (
    psHistDout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    psResultsDout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    done : out STD_LOGIC;
    clr : in STD_LOGIC;
    psHistAddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    psResultsAddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    psRawEna : in STD_LOGIC;
    psRawWE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    psRawAddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    psRawDin : in STD_LOGIC_VECTOR ( 7 downto 0 );
    psHuffEna : in STD_LOGIC;
    psHuffWE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    psHuffAddr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    psHuffDin : in STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_top_0_0_top : entity is "top";
end design_1_top_0_0_top;

architecture STRUCTURE of design_1_top_0_0_top is
begin
HUFFMAN: entity work.design_1_top_0_0_huffman
     port map (
      clk => clk,
      clr => clr,
      done => done,
      psHistAddr(7 downto 0) => psHistAddr(7 downto 0),
      psHistDout(15 downto 0) => psHistDout(15 downto 0),
      psHuffAddr(7 downto 0) => psHuffAddr(7 downto 0),
      psHuffDin(19 downto 0) => psHuffDin(19 downto 0),
      psHuffEna => psHuffEna,
      psHuffWE(3 downto 0) => psHuffWE(3 downto 0),
      psRawAddr(9 downto 0) => psRawAddr(9 downto 0),
      psRawDin(7 downto 0) => psRawDin(7 downto 0),
      psRawEna => psRawEna,
      psRawWE(3 downto 0) => psRawWE(3 downto 0),
      psResultsAddr(9 downto 0) => psResultsAddr(9 downto 0),
      psResultsDout(15 downto 0) => psResultsDout(15 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_top_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_top_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_top_0_0 : entity is "design_1_top_0_0,top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_top_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_top_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_top_0_0 : entity is "top,Vivado 2018.3";
end design_1_top_0_0;

architecture STRUCTURE of design_1_top_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^pshistdout\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^psresultsdout\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
begin
  psHistDout(31) <= \<const0>\;
  psHistDout(30) <= \<const0>\;
  psHistDout(29) <= \<const0>\;
  psHistDout(28) <= \<const0>\;
  psHistDout(27) <= \<const0>\;
  psHistDout(26) <= \<const0>\;
  psHistDout(25) <= \<const0>\;
  psHistDout(24) <= \<const0>\;
  psHistDout(23) <= \<const0>\;
  psHistDout(22) <= \<const0>\;
  psHistDout(21) <= \<const0>\;
  psHistDout(20) <= \<const0>\;
  psHistDout(19) <= \<const0>\;
  psHistDout(18) <= \<const0>\;
  psHistDout(17) <= \<const0>\;
  psHistDout(16) <= \<const0>\;
  psHistDout(15 downto 0) <= \^pshistdout\(15 downto 0);
  psResultsDout(31) <= \<const0>\;
  psResultsDout(30) <= \<const0>\;
  psResultsDout(29) <= \<const0>\;
  psResultsDout(28) <= \<const0>\;
  psResultsDout(27) <= \<const0>\;
  psResultsDout(26) <= \<const0>\;
  psResultsDout(25) <= \<const0>\;
  psResultsDout(24) <= \<const0>\;
  psResultsDout(23) <= \<const0>\;
  psResultsDout(22) <= \<const0>\;
  psResultsDout(21) <= \<const0>\;
  psResultsDout(20) <= \<const0>\;
  psResultsDout(19) <= \<const0>\;
  psResultsDout(18) <= \<const0>\;
  psResultsDout(17) <= \<const0>\;
  psResultsDout(16) <= \<const0>\;
  psResultsDout(15 downto 0) <= \^psresultsdout\(15 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_top_0_0_top
     port map (
      clk => clk,
      clr => clr,
      done => done,
      psHistAddr(7 downto 0) => psHistAddr(9 downto 2),
      psHistDout(15 downto 0) => \^pshistdout\(15 downto 0),
      psHuffAddr(7 downto 0) => psHuffAddr(9 downto 2),
      psHuffDin(19 downto 0) => psHuffDin(19 downto 0),
      psHuffEna => psHuffEna,
      psHuffWE(3 downto 0) => psHuffWE(3 downto 0),
      psRawAddr(9 downto 0) => psRawAddr(11 downto 2),
      psRawDin(7 downto 0) => psRawDin(7 downto 0),
      psRawEna => psRawEna,
      psRawWE(3 downto 0) => psRawWE(3 downto 0),
      psResultsAddr(9 downto 0) => psResultsAddr(11 downto 2),
      psResultsDout(15 downto 0) => \^psresultsdout\(15 downto 0)
    );
end STRUCTURE;
