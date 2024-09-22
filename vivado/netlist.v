// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun Sep 15 07:18:51 2024
// Host        : DESKTOP-5537N50 running 64-bit major release  (build 9200)
// Command     : write_verilog -force netlist.v
// Design      : spi_wrapper
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module SPI
   (out,
    MISO_OBUF,
    \bit_counter_reg[3]_0 ,
    mem_reg,
    D,
    E,
    tx_valid_reg,
    mem_reg_0,
    \out_counter_reg[2]_0 ,
    \out_counter_reg[2]_1 ,
    \out_counter_reg[2]_2 ,
    \out_counter_reg[2]_3 ,
    clk_IBUF_BUFG,
    tx_valid,
    SS_n_IBUF,
    rst_n_IBUF,
    MOSI_IBUF,
    tx_valid_reg_0);
  output [0:0]out;
  output MISO_OBUF;
  output \bit_counter_reg[3]_0 ;
  output mem_reg;
  output [7:0]D;
  output [0:0]E;
  output tx_valid_reg;
  output mem_reg_0;
  output \out_counter_reg[2]_0 ;
  output \out_counter_reg[2]_1 ;
  output \out_counter_reg[2]_2 ;
  input \out_counter_reg[2]_3 ;
  input clk_IBUF_BUFG;
  input tx_valid;
  input SS_n_IBUF;
  input rst_n_IBUF;
  input MOSI_IBUF;
  input tx_valid_reg_0;

  wire \<const0> ;
  wire \<const1> ;
  wire [7:0]D;
  wire [0:0]E;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_cs_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_cs_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_cs_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_cs_reg_n_0_[3] ;
  wire \FSM_onehot_ns_reg[0]_i_1_n_0 ;
  wire \FSM_onehot_ns_reg[1]_i_1_n_0 ;
  wire \FSM_onehot_ns_reg[2]_i_1_n_0 ;
  wire \FSM_onehot_ns_reg[3]_i_1_n_0 ;
  wire \FSM_onehot_ns_reg[4]_i_1_n_0 ;
  wire \FSM_onehot_ns_reg_n_0_[0] ;
  wire \FSM_onehot_ns_reg_n_0_[1] ;
  wire \FSM_onehot_ns_reg_n_0_[2] ;
  wire \FSM_onehot_ns_reg_n_0_[3] ;
  wire \FSM_onehot_ns_reg_n_0_[4] ;
  wire GND_2;
  wire MISO_OBUF;
  wire MISO_i_1_n_0;
  wire MOSI_IBUF;
  wire SS_n_IBUF;
  wire VCC_2;
  wire [3:0]bit_counter;
  wire \bit_counter[3]_i_1_n_0 ;
  wire \bit_counter_reg[3]_0 ;
  wire [3:0]bit_counter_reg__0;
  wire clk_IBUF_BUFG;
  wire load;
  wire mem_reg;
  wire mem_reg_0;
  wire ns;
  (* RTL_KEEP = "yes" *) wire [0:0]out;
  wire \out_counter[0]_i_1_n_0 ;
  wire \out_counter[1]_i_1_n_0 ;
  wire \out_counter[2]_i_1_n_0 ;
  wire \out_counter_reg[2]_0 ;
  wire \out_counter_reg[2]_1 ;
  wire \out_counter_reg[2]_2 ;
  wire \out_counter_reg[2]_3 ;
  wire rst_n_IBUF;
  wire [9:8]rx_data;
  wire \rx_data[0]_i_1_n_0 ;
  wire \rx_data[0]_i_2_n_0 ;
  wire \rx_data[1]_i_1_n_0 ;
  wire \rx_data[1]_i_2_n_0 ;
  wire \rx_data[2]_i_1_n_0 ;
  wire \rx_data[2]_i_2_n_0 ;
  wire \rx_data[2]_i_3_n_0 ;
  wire \rx_data[3]_i_1_n_0 ;
  wire \rx_data[4]_i_1_n_0 ;
  wire \rx_data[5]_i_1_n_0 ;
  wire \rx_data[6]_i_1_n_0 ;
  wire \rx_data[6]_i_2_n_0 ;
  wire \rx_data[7]_i_1_n_0 ;
  wire \rx_data[7]_i_2_n_0 ;
  wire \rx_data[8]_i_1_n_0 ;
  wire \rx_data[9]_i_1_n_0 ;
  wire \rx_data[9]_i_2_n_0 ;
  wire rx_valid;
  wire tx_valid;
  wire tx_valid_reg;
  wire tx_valid_reg_0;
  wire wait_tx_i_1_n_0;
  wire wait_tx_i_2_n_0;
  wire wait_tx_reg_n_0;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_cs[4]_i_1 
       (.I0(rst_n_IBUF),
        .O(\bit_counter_reg[3]_0 ));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_ADD:01000,READ_DATA:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_cs_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\FSM_onehot_ns_reg_n_0_[0] ),
        .PRE(\bit_counter_reg[3]_0 ),
        .Q(\FSM_onehot_cs_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_ADD:01000,READ_DATA:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_cs_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\bit_counter_reg[3]_0 ),
        .D(\FSM_onehot_ns_reg_n_0_[1] ),
        .Q(\FSM_onehot_cs_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_ADD:01000,READ_DATA:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_cs_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\bit_counter_reg[3]_0 ),
        .D(\FSM_onehot_ns_reg_n_0_[2] ),
        .Q(\FSM_onehot_cs_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_ADD:01000,READ_DATA:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_cs_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\bit_counter_reg[3]_0 ),
        .D(\FSM_onehot_ns_reg_n_0_[3] ),
        .Q(\FSM_onehot_cs_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "CHK_CMD:00010,WRITE:00100,READ_ADD:01000,READ_DATA:10000,IDLE:00001" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_cs_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\bit_counter_reg[3]_0 ),
        .D(\FSM_onehot_ns_reg_n_0_[4] ),
        .Q(out));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b1)) 
    \FSM_onehot_ns_reg[0] 
       (.CLR(GND_2),
        .D(\FSM_onehot_ns_reg[0]_i_1_n_0 ),
        .G(ns),
        .GE(VCC_2),
        .Q(\FSM_onehot_ns_reg_n_0_[0] ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \FSM_onehot_ns_reg[0]_i_1 
       (.I0(SS_n_IBUF),
        .I1(\FSM_onehot_cs_reg_n_0_[3] ),
        .I2(\FSM_onehot_cs_reg_n_0_[1] ),
        .I3(out),
        .I4(\FSM_onehot_cs_reg_n_0_[0] ),
        .I5(\FSM_onehot_cs_reg_n_0_[2] ),
        .O(\FSM_onehot_ns_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_ns_reg[1] 
       (.CLR(GND_2),
        .D(\FSM_onehot_ns_reg[1]_i_1_n_0 ),
        .G(ns),
        .GE(VCC_2),
        .Q(\FSM_onehot_ns_reg_n_0_[1] ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_ns_reg[1]_i_1 
       (.I0(\FSM_onehot_cs_reg_n_0_[0] ),
        .I1(SS_n_IBUF),
        .O(\FSM_onehot_ns_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_ns_reg[2] 
       (.CLR(GND_2),
        .D(\FSM_onehot_ns_reg[2]_i_1_n_0 ),
        .G(ns),
        .GE(VCC_2),
        .Q(\FSM_onehot_ns_reg_n_0_[2] ));
  LUT4 #(
    .INIT(16'h2232)) 
    \FSM_onehot_ns_reg[2]_i_1 
       (.I0(\FSM_onehot_cs_reg_n_0_[2] ),
        .I1(SS_n_IBUF),
        .I2(\FSM_onehot_cs_reg_n_0_[1] ),
        .I3(MOSI_IBUF),
        .O(\FSM_onehot_ns_reg[2]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_ns_reg[3] 
       (.CLR(GND_2),
        .D(\FSM_onehot_ns_reg[3]_i_1_n_0 ),
        .G(ns),
        .GE(VCC_2),
        .Q(\FSM_onehot_ns_reg_n_0_[3] ));
  LUT4 #(
    .INIT(16'h3222)) 
    \FSM_onehot_ns_reg[3]_i_1 
       (.I0(\FSM_onehot_cs_reg_n_0_[3] ),
        .I1(SS_n_IBUF),
        .I2(\FSM_onehot_cs_reg_n_0_[1] ),
        .I3(MOSI_IBUF),
        .O(\FSM_onehot_ns_reg[3]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_ns_reg[4] 
       (.CLR(GND_2),
        .D(\FSM_onehot_ns_reg[4]_i_1_n_0 ),
        .G(ns),
        .GE(VCC_2),
        .Q(\FSM_onehot_ns_reg_n_0_[4] ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_ns_reg[4]_i_1 
       (.I0(out),
        .I1(SS_n_IBUF),
        .O(\FSM_onehot_ns_reg[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_ns_reg[4]_i_2 
       (.I0(\FSM_onehot_cs_reg_n_0_[2] ),
        .I1(\FSM_onehot_cs_reg_n_0_[0] ),
        .I2(out),
        .I3(\FSM_onehot_cs_reg_n_0_[1] ),
        .I4(\FSM_onehot_cs_reg_n_0_[3] ),
        .O(ns));
  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  LUT4 #(
    .INIT(16'h0800)) 
    MISO_i_1
       (.I0(rst_n_IBUF),
        .I1(out),
        .I2(SS_n_IBUF),
        .I3(tx_valid),
        .O(MISO_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MISO_reg
       (.C(clk_IBUF_BUFG),
        .CE(MISO_i_1_n_0),
        .D(\out_counter_reg[2]_3 ),
        .Q(MISO_OBUF),
        .R(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addr[7]_i_1 
       (.I0(rx_valid),
        .I1(rx_data[8]),
        .O(E));
  LUT1 #(
    .INIT(2'h1)) 
    \bit_counter[0]_i_1 
       (.I0(bit_counter_reg__0[0]),
        .O(bit_counter[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hF00E)) 
    \bit_counter[1]_i_1 
       (.I0(bit_counter_reg__0[2]),
        .I1(bit_counter_reg__0[3]),
        .I2(bit_counter_reg__0[0]),
        .I3(bit_counter_reg__0[1]),
        .O(bit_counter[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hEE10)) 
    \bit_counter[2]_i_1 
       (.I0(bit_counter_reg__0[1]),
        .I1(bit_counter_reg__0[0]),
        .I2(bit_counter_reg__0[3]),
        .I3(bit_counter_reg__0[2]),
        .O(bit_counter[2]));
  LUT6 #(
    .INIT(64'h3232323232323332)) 
    \bit_counter[3]_i_1 
       (.I0(\FSM_onehot_cs_reg_n_0_[3] ),
        .I1(SS_n_IBUF),
        .I2(\FSM_onehot_cs_reg_n_0_[2] ),
        .I3(out),
        .I4(tx_valid),
        .I5(wait_tx_reg_n_0),
        .O(\bit_counter[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hAAA9)) 
    \bit_counter[3]_i_2 
       (.I0(bit_counter_reg__0[3]),
        .I1(bit_counter_reg__0[1]),
        .I2(bit_counter_reg__0[0]),
        .I3(bit_counter_reg__0[2]),
        .O(bit_counter[3]));
  FDSE #(
    .INIT(1'b1)) 
    \bit_counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter[3]_i_1_n_0 ),
        .D(bit_counter[0]),
        .Q(bit_counter_reg__0[0]),
        .S(\bit_counter_reg[3]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter[3]_i_1_n_0 ),
        .D(bit_counter[1]),
        .Q(bit_counter_reg__0[1]),
        .R(\bit_counter_reg[3]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bit_counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter[3]_i_1_n_0 ),
        .D(bit_counter[2]),
        .Q(bit_counter_reg__0[2]),
        .R(\bit_counter_reg[3]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \bit_counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter[3]_i_1_n_0 ),
        .D(bit_counter[3]),
        .Q(bit_counter_reg__0[3]),
        .S(\bit_counter_reg[3]_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    mem_reg_i_1
       (.I0(rx_data[8]),
        .I1(rx_valid),
        .I2(rx_data[9]),
        .O(mem_reg));
  LUT4 #(
    .INIT(16'h80FF)) 
    mem_reg_i_2
       (.I0(rx_valid),
        .I1(rx_data[8]),
        .I2(rx_data[9]),
        .I3(rst_n_IBUF),
        .O(mem_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hD7)) 
    \out_counter[0]_i_1 
       (.I0(rst_n_IBUF),
        .I1(\out_counter_reg[2]_1 ),
        .I2(tx_valid_reg_0),
        .O(\out_counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hF5D7)) 
    \out_counter[1]_i_1 
       (.I0(rst_n_IBUF),
        .I1(\out_counter_reg[2]_1 ),
        .I2(\out_counter_reg[2]_0 ),
        .I3(tx_valid_reg_0),
        .O(\out_counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hDDDDDDD7)) 
    \out_counter[2]_i_1 
       (.I0(rst_n_IBUF),
        .I1(\out_counter_reg[2]_2 ),
        .I2(\out_counter_reg[2]_1 ),
        .I3(\out_counter_reg[2]_0 ),
        .I4(tx_valid_reg_0),
        .O(\out_counter[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \out_counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\out_counter[0]_i_1_n_0 ),
        .Q(\out_counter_reg[2]_1 ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out_counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\out_counter[1]_i_1_n_0 ),
        .Q(\out_counter_reg[2]_0 ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \out_counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\out_counter[2]_i_1_n_0 ),
        .Q(\out_counter_reg[2]_2 ),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'hFFEF0020)) 
    \rx_data[0]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\rx_data[2]_i_2_n_0 ),
        .I2(rst_n_IBUF),
        .I3(\rx_data[0]_i_2_n_0 ),
        .I4(D[0]),
        .O(\rx_data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rx_data[0]_i_2 
       (.I0(bit_counter_reg__0[0]),
        .I1(bit_counter_reg__0[1]),
        .I2(bit_counter_reg__0[3]),
        .I3(bit_counter_reg__0[2]),
        .O(\rx_data[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000002)) 
    \rx_data[1]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\rx_data[2]_i_2_n_0 ),
        .I2(\rx_data[1]_i_2_n_0 ),
        .I3(bit_counter_reg__0[2]),
        .I4(bit_counter_reg__0[3]),
        .I5(D[1]),
        .O(\rx_data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \rx_data[1]_i_2 
       (.I0(bit_counter_reg__0[0]),
        .I1(bit_counter_reg__0[1]),
        .I2(rst_n_IBUF),
        .O(\rx_data[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFF00020000)) 
    \rx_data[2]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\rx_data[2]_i_2_n_0 ),
        .I2(\rx_data[2]_i_3_n_0 ),
        .I3(bit_counter_reg__0[0]),
        .I4(bit_counter_reg__0[1]),
        .I5(D[2]),
        .O(\rx_data[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000FFFF00EF)) 
    \rx_data[2]_i_2 
       (.I0(wait_tx_reg_n_0),
        .I1(tx_valid),
        .I2(out),
        .I3(\FSM_onehot_cs_reg_n_0_[2] ),
        .I4(SS_n_IBUF),
        .I5(\FSM_onehot_cs_reg_n_0_[3] ),
        .O(\rx_data[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \rx_data[2]_i_3 
       (.I0(bit_counter_reg__0[3]),
        .I1(bit_counter_reg__0[2]),
        .I2(rst_n_IBUF),
        .O(\rx_data[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \rx_data[3]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\rx_data[7]_i_2_n_0 ),
        .I2(rst_n_IBUF),
        .I3(bit_counter_reg__0[2]),
        .I4(bit_counter_reg__0[3]),
        .I5(D[3]),
        .O(\rx_data[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE0002)) 
    \rx_data[4]_i_1 
       (.I0(MOSI_IBUF),
        .I1(bit_counter_reg__0[0]),
        .I2(bit_counter_reg__0[1]),
        .I3(\rx_data[6]_i_2_n_0 ),
        .I4(D[4]),
        .O(\rx_data[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    \rx_data[5]_i_1 
       (.I0(MOSI_IBUF),
        .I1(bit_counter_reg__0[0]),
        .I2(bit_counter_reg__0[1]),
        .I3(\rx_data[6]_i_2_n_0 ),
        .I4(D[5]),
        .O(\rx_data[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    \rx_data[6]_i_1 
       (.I0(MOSI_IBUF),
        .I1(bit_counter_reg__0[1]),
        .I2(bit_counter_reg__0[0]),
        .I3(\rx_data[6]_i_2_n_0 ),
        .I4(D[6]),
        .O(\rx_data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \rx_data[6]_i_2 
       (.I0(\rx_data[2]_i_2_n_0 ),
        .I1(rst_n_IBUF),
        .I2(bit_counter_reg__0[3]),
        .I3(bit_counter_reg__0[2]),
        .O(\rx_data[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \rx_data[7]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\rx_data[7]_i_2_n_0 ),
        .I2(rst_n_IBUF),
        .I3(bit_counter_reg__0[3]),
        .I4(bit_counter_reg__0[2]),
        .I5(D[7]),
        .O(\rx_data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \rx_data[7]_i_2 
       (.I0(bit_counter_reg__0[0]),
        .I1(bit_counter_reg__0[1]),
        .I2(\rx_data[2]_i_2_n_0 ),
        .O(\rx_data[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \rx_data[8]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\rx_data[9]_i_2_n_0 ),
        .I2(rst_n_IBUF),
        .I3(bit_counter_reg__0[1]),
        .I4(bit_counter_reg__0[0]),
        .I5(rx_data[8]),
        .O(\rx_data[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \rx_data[9]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\rx_data[9]_i_2_n_0 ),
        .I2(rst_n_IBUF),
        .I3(bit_counter_reg__0[1]),
        .I4(bit_counter_reg__0[0]),
        .I5(rx_data[9]),
        .O(\rx_data[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \rx_data[9]_i_2 
       (.I0(bit_counter_reg__0[2]),
        .I1(bit_counter_reg__0[3]),
        .I2(\rx_data[2]_i_2_n_0 ),
        .O(\rx_data[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[0]_i_1_n_0 ),
        .Q(D[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[1]_i_1_n_0 ),
        .Q(D[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[2]_i_1_n_0 ),
        .Q(D[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[3]_i_1_n_0 ),
        .Q(D[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[4]_i_1_n_0 ),
        .Q(D[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[5]_i_1_n_0 ),
        .Q(D[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[6]_i_1_n_0 ),
        .Q(D[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[7]_i_1_n_0 ),
        .Q(D[7]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[8]_i_1_n_0 ),
        .Q(rx_data[8]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[9]_i_1_n_0 ),
        .Q(rx_data[9]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    rx_valid_i_1
       (.I0(bit_counter_reg__0[2]),
        .I1(bit_counter_reg__0[3]),
        .I2(bit_counter_reg__0[1]),
        .I3(bit_counter_reg__0[0]),
        .O(load));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter[3]_i_1_n_0 ),
        .D(load),
        .Q(rx_valid),
        .R(\bit_counter_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    tx_valid_i_1
       (.I0(rst_n_IBUF),
        .I1(rx_valid),
        .I2(rx_data[9]),
        .I3(rx_data[8]),
        .O(tx_valid_reg));
  LUT6 #(
    .INIT(64'h00000000AAAAAABA)) 
    wait_tx_i_1
       (.I0(wait_tx_reg_n_0),
        .I1(tx_valid),
        .I2(out),
        .I3(SS_n_IBUF),
        .I4(\rx_data[0]_i_2_n_0 ),
        .I5(wait_tx_i_2_n_0),
        .O(wait_tx_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0001FFFF)) 
    wait_tx_i_2
       (.I0(tx_valid_reg_0),
        .I1(\out_counter_reg[2]_0 ),
        .I2(\out_counter_reg[2]_1 ),
        .I3(\out_counter_reg[2]_2 ),
        .I4(rst_n_IBUF),
        .O(wait_tx_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    wait_tx_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(wait_tx_i_1_n_0),
        .Q(wait_tx_reg_n_0),
        .R(\<const0> ));
endmodule

module ram
   (tx_valid,
    \out_counter_reg[2] ,
    MISO_reg,
    clk_IBUF_BUFG,
    \rx_data_reg[8] ,
    rx_valid_reg,
    rst_n,
    D,
    rst_n_IBUF,
    rx_valid_reg_0,
    SS_n_IBUF,
    out,
    \out_counter_reg[2]_0 ,
    \out_counter_reg[1] ,
    \out_counter_reg[0] ,
    E);
  output tx_valid;
  output \out_counter_reg[2] ;
  output MISO_reg;
  input clk_IBUF_BUFG;
  input \rx_data_reg[8] ;
  input rx_valid_reg;
  input rst_n;
  input [7:0]D;
  input rst_n_IBUF;
  input rx_valid_reg_0;
  input SS_n_IBUF;
  input [0:0]out;
  input \out_counter_reg[2]_0 ;
  input \out_counter_reg[1] ;
  input \out_counter_reg[0] ;
  input [0:0]E;

  wire \<const0> ;
  wire \<const1> ;
  wire [7:0]D;
  wire [0:0]E;
  wire MISO_i_3_n_0;
  wire MISO_i_4_n_0;
  wire MISO_reg;
  wire SS_n_IBUF;
  wire [7:0]addr;
  wire clk_IBUF_BUFG;
  wire [0:0]out;
  wire \out_counter_reg[0] ;
  wire \out_counter_reg[1] ;
  wire \out_counter_reg[2] ;
  wire \out_counter_reg[2]_0 ;
  wire rst_n;
  wire rst_n_IBUF;
  wire \rx_data_reg[8] ;
  wire rx_valid_reg;
  wire rx_valid_reg_0;
  wire [7:0]tx_data;
  wire tx_valid;

  GND GND
       (.G(\<const0> ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    MISO_i_3
       (.I0(tx_data[3]),
        .I1(tx_data[2]),
        .I2(\out_counter_reg[1] ),
        .I3(tx_data[1]),
        .I4(\out_counter_reg[0] ),
        .I5(tx_data[0]),
        .O(MISO_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    MISO_i_4
       (.I0(tx_data[7]),
        .I1(tx_data[6]),
        .I2(\out_counter_reg[1] ),
        .I3(tx_data[5]),
        .I4(\out_counter_reg[0] ),
        .I5(tx_data[4]),
        .O(MISO_i_4_n_0));
  MUXF7 MISO_reg_i_2
       (.I0(MISO_i_3_n_0),
        .I1(MISO_i_4_n_0),
        .O(MISO_reg),
        .S(\out_counter_reg[2]_0 ));
  VCC VCC
       (.P(\<const1> ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[0]),
        .Q(addr[0]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[1]),
        .Q(addr[1]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[2]),
        .Q(addr[2]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[3]),
        .Q(addr[3]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[4]),
        .Q(addr[4]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[5]),
        .Q(addr[5]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[6]),
        .Q(addr[6]),
        .R(rst_n));
  FDRE #(
    .INIT(1'b0)) 
    \addr_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(D[7]),
        .Q(addr[7]),
        .R(rst_n));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "ramBlock/mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
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
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,addr,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,addr,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,D}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const0> ,\<const0> }),
        .DOBDO(tx_data),
        .ENARDEN(\rx_data_reg[8] ),
        .ENBWREN(rx_valid_reg),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(rst_n),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({rst_n_IBUF,rst_n_IBUF}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  LUT3 #(
    .INIT(8'hDF)) 
    \out_counter[2]_i_2 
       (.I0(tx_valid),
        .I1(SS_n_IBUF),
        .I2(out),
        .O(\out_counter_reg[2] ));
  FDRE #(
    .INIT(1'b0)) 
    tx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(rx_valid_reg_0),
        .Q(tx_valid),
        .R(\<const0> ));
endmodule

(* STRUCTURAL_NETLIST = "yes" *)
module spi_wrapper
   (clk,
    rst_n,
    MOSI,
    SS_n,
    MISO);
  input clk;
  input rst_n;
  input MOSI;
  input SS_n;
  output MISO;

  wire MISO;
  wire MISO_OBUF;
  wire MOSI;
  wire MOSI_IBUF;
  wire SS_n;
  wire SS_n_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire ramBlock_n_1;
  wire ramBlock_n_2;
  wire rst_n;
  wire rst_n_IBUF;
  wire [7:0]rx_data;
  wire spiBlock_n_0;
  wire spiBlock_n_12;
  wire spiBlock_n_13;
  wire spiBlock_n_14;
  wire spiBlock_n_15;
  wire spiBlock_n_16;
  wire spiBlock_n_17;
  wire spiBlock_n_2;
  wire spiBlock_n_3;
  wire tx_valid;

  OBUF MISO_OBUF_inst
       (.I(MISO_OBUF),
        .O(MISO));
  IBUF MOSI_IBUF_inst
       (.I(MOSI),
        .O(MOSI_IBUF));
  IBUF SS_n_IBUF_inst
       (.I(SS_n),
        .O(SS_n_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  ram ramBlock
       (.D(rx_data),
        .E(spiBlock_n_12),
        .MISO_reg(ramBlock_n_2),
        .SS_n_IBUF(SS_n_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .out(spiBlock_n_0),
        .\out_counter_reg[0] (spiBlock_n_16),
        .\out_counter_reg[1] (spiBlock_n_15),
        .\out_counter_reg[2] (ramBlock_n_1),
        .\out_counter_reg[2]_0 (spiBlock_n_17),
        .rst_n(spiBlock_n_2),
        .rst_n_IBUF(rst_n_IBUF),
        .\rx_data_reg[8] (spiBlock_n_3),
        .rx_valid_reg(spiBlock_n_14),
        .rx_valid_reg_0(spiBlock_n_13),
        .tx_valid(tx_valid));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  SPI spiBlock
       (.D(rx_data),
        .E(spiBlock_n_12),
        .MISO_OBUF(MISO_OBUF),
        .MOSI_IBUF(MOSI_IBUF),
        .SS_n_IBUF(SS_n_IBUF),
        .\bit_counter_reg[3]_0 (spiBlock_n_2),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .mem_reg(spiBlock_n_3),
        .mem_reg_0(spiBlock_n_14),
        .out(spiBlock_n_0),
        .\out_counter_reg[2]_0 (spiBlock_n_15),
        .\out_counter_reg[2]_1 (spiBlock_n_16),
        .\out_counter_reg[2]_2 (spiBlock_n_17),
        .\out_counter_reg[2]_3 (ramBlock_n_2),
        .rst_n_IBUF(rst_n_IBUF),
        .tx_valid(tx_valid),
        .tx_valid_reg(spiBlock_n_13),
        .tx_valid_reg_0(ramBlock_n_1));
endmodule
