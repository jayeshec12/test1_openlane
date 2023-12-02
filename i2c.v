//=========================================================================
// Project     : 
// Module name : i2c
// Author      : 
// Created on  : Sep 24, 2017
//
// Description : I2C interface control module
// 
//=========================================================================

module i2c (
            // Inputs
            POR,
            SCL,
            SDA_IN,
            dev_addr,
            wp_range,
            wp_enable,
            wp_locked,
            rf_init0,
            rf_init1,
            rf_init2,
            rf_init3,
            rf_init4,
            rf_init5,
            rf_init6,
            rf_init7,
            rf_init8,
            rf_init9,
            rf_init10,
            rf_init11,
            rf_init12,
            rf_init13,
            rf_init14,
            rf_init15,
            rf_init16,
            rf_init17,
            rf_init18,
            rf_init19,
            rf_init20,
            rf_init21,
            rf_init22,
            rf_init23,
            rf_init24,
            rf_init25,
            rf_init26,
            rf_init27,
            rf_init28,
            rf_init29,
            rf_init30,
            rf_init31,
            rf_init32,
            rf_init33,
            rf_laen0,
            rf_laen1,
            rf_laen2,
            rf_laen3,
            rf_laen4,
            rf_laen5,
            rf_laen6,
            rf_laen7,
            rf_laen8,
            rf_laen9,
            rf_laen10,
            rf_laen11,
            rf_laen12,
            rf_laen13,
            rf_laen14,
            rf_laen15,
            rf_laen16,
            rf_laen17,
            rf_laen18,
            rf_laen19,
            rf_laen20,
            rf_laen21,
            rf_laen22,
            rf_laen23,
            rf_laen24,
            rf_laen25,
            rf_laen26,
            rf_laen27,
            rf_laen28,
            rf_laen29,
            rf_laen30,
            rf_laen31,

            // Outputs
            SDA_OUT,
            SDA_OE,
            rf_data0,
            rf_data1,
            rf_data2,
            rf_data3,
            rf_data4,
            rf_data5,
            rf_data6,
            rf_data7,
            rf_data8,
            rf_data9,
            rf_data10,
            rf_data11,
            rf_data12,
            rf_data13,
            rf_data14,
            rf_data15,
            rf_data16,
            rf_data17,
            rf_data18,
            rf_data19,
            rf_data20,
            rf_data21,
            rf_data22,
            rf_data23,
            rf_data24,
            rf_data25,
            rf_data26,
            rf_data27,
            rf_data28,
            rf_data29,
            rf_data30,
            rf_data31,
            wr_addr18,
            wr_addr19,
            i2c_start
           );

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Clocks and resets
input             POR;
input             SCL;

// Inputs
input             SDA_IN;
input [6:0]       dev_addr;
input [6:0]       wp_range;
input             wp_enable;
input             wp_locked;
input [7:0]       rf_init0;
input [7:0]       rf_init1;
input [7:0]       rf_init2;
input [7:0]       rf_init3;
input [7:0]       rf_init4;
input [7:0]       rf_init5;
input [7:0]       rf_init6;
input [7:0]       rf_init7;
input [7:0]       rf_init8;
input [7:0]       rf_init9;
input [7:0]       rf_init10;
input [7:0]       rf_init11;
input [7:0]       rf_init12;
input [7:0]       rf_init13;
input [7:0]       rf_init14;
input [7:0]       rf_init15;
input [7:0]       rf_init16;
input [7:0]       rf_init17;
input [7:0]       rf_init18;
input [7:0]       rf_init19;
input [7:0]       rf_init20;
input [7:0]       rf_init21;
input [7:0]       rf_init22;
input [7:0]       rf_init23;
input [7:0]       rf_init24;
input [7:0]       rf_init25;
input [7:0]       rf_init26;
input [7:0]       rf_init27;
input [7:0]       rf_init28;
input [7:0]       rf_init29;
input [7:0]       rf_init30;
input [7:0]       rf_init31;
input [7:0]       rf_init32;
input [7:0]       rf_init33;
input [7:0]       rf_laen0;
input [7:0]       rf_laen1;
input [7:0]       rf_laen2;
input [7:0]       rf_laen3;
input [7:0]       rf_laen4;
input [7:0]       rf_laen5;
input [7:0]       rf_laen6;
input [7:0]       rf_laen7;
input [7:0]       rf_laen8;
input [7:0]       rf_laen9;
input [7:0]       rf_laen10;
input [7:0]       rf_laen11;
input [7:0]       rf_laen12;
input [7:0]       rf_laen13;
input [7:0]       rf_laen14;
input [7:0]       rf_laen15;
input [7:0]       rf_laen16;
input [7:0]       rf_laen17;
input [7:0]       rf_laen18;
input [7:0]       rf_laen19;
input [7:0]       rf_laen20;
input [7:0]       rf_laen21;
input [7:0]       rf_laen22;
input [7:0]       rf_laen23;
input [7:0]       rf_laen24;
input [7:0]       rf_laen25;
input [7:0]       rf_laen26;
input [7:0]       rf_laen27;
input [7:0]       rf_laen28;
input [7:0]       rf_laen29;
input [7:0]       rf_laen30;
input [7:0]       rf_laen31;

// Outputs
output            SDA_OUT;
output            SDA_OE;
output [7:0]      rf_data0;
output [7:0]      rf_data1;
output [7:0]      rf_data2;
output [7:0]      rf_data3;
output [7:0]      rf_data4;
output [7:0]      rf_data5;
output [7:0]      rf_data6;
output [7:0]      rf_data7;
output [7:0]      rf_data8;
output [7:0]      rf_data9;
output [7:0]      rf_data10;
output [7:0]      rf_data11;
output [7:0]      rf_data12;
output [7:0]      rf_data13;
output [7:0]      rf_data14;
output [7:0]      rf_data15;
output [7:0]      rf_data16;
output [7:0]      rf_data17;
output [7:0]      rf_data18;
output [7:0]      rf_data19;
output [7:0]      rf_data20;
output [7:0]      rf_data21;
output [7:0]      rf_data22;
output [7:0]      rf_data23;
output [7:0]      rf_data24;
output [7:0]      rf_data25;
output [7:0]      rf_data26;
output [7:0]      rf_data27;
output [7:0]      rf_data28;
output [7:0]      rf_data29;
output [7:0]      rf_data30;
output [7:0]      rf_data31;
output            wr_addr18;
output            wr_addr19;
output            i2c_start;

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals

// Wire declarations for output signals
wire              SDA_OUT;
wire              SDA_OE;
wire              wr_addr18;
wire              wr_addr19;
wire              i2c_start;

// Register declarations for internal signals
reg [6:0]         iaddr_reg;
reg [6:0]         addr_reg;
reg [7:0]         din_reg;
reg [7:0]         dout_reg;
reg               rwb_reg;
reg               id1_reg;
reg               id2_reg;
reg               id3_reg;
reg               addr_ack;
reg               data_acw;
reg               data_acr;
reg               addr_act;
reg               data_act;
reg               s_detect;
reg               s_reset;
reg               p_detect;
reg               p_reset;

// Wire declarations for internal signals
wire              SDA_i;
wire              SDA_o;
wire              SDA_oe;
wire              rwb_reg_sen;
wire              addr_reg_sen;
wire              din_reg_sen;
wire              dout_reg_sen;
wire              dout_reg_len;
wire              addr_inc;
wire              addr_end;
wire              data_end;
wire              data_ack;
wire              wr_clk;
wire              wr_en;
wire              op_en;
wire              wr_mode;
wire              rd_mode;
wire              id_mode;
wire              wp_mode;
wire              s_rst;
wire              p_rst;
wire [7:0]        wr_data;
wire [5:0]        wr_addr;
wire [7:0]        rd_data;
wire [5:0]        rd_addr;
wire [7:0]        rf_data0;
wire [7:0]        rf_data1;
wire [7:0]        rf_data2;
wire [7:0]        rf_data3;
wire [7:0]        rf_data4;
wire [7:0]        rf_data5;
wire [7:0]        rf_data6;
wire [7:0]        rf_data7;
wire [7:0]        rf_data8;
wire [7:0]        rf_data9;
wire [7:0]        rf_data10;
wire [7:0]        rf_data11;
wire [7:0]        rf_data12;
wire [7:0]        rf_data13;
wire [7:0]        rf_data14;
wire [7:0]        rf_data15;
wire [7:0]        rf_data16;
wire [7:0]        rf_data17;
wire [7:0]        rf_data18;
wire [7:0]        rf_data19;
wire [7:0]        rf_data20;
wire [7:0]        rf_data21;
wire [7:0]        rf_data22;
wire [7:0]        rf_data23;
wire [7:0]        rf_data24;
wire [7:0]        rf_data25;
wire [7:0]        rf_data26;
wire [7:0]        rf_data27;
wire [7:0]        rf_data28;
wire [7:0]        rf_data29;
wire [7:0]        rf_data30;
wire [7:0]        rf_data31;

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

i2c_fsm i2c_fsm (
                 .POR                    (POR),
                 .SCL                    (SCL),
                 .s_detect               (s_detect),
                 .p_detect               (p_detect),
                 .wr_mode                (wr_mode),
                 .rd_mode                (rd_mode),
                 .id_mode                (id_mode),
                 .addr_ack               (addr_ack),
                 .data_ack               (data_ack),

                 .rwb_reg_sen            (rwb_reg_sen),
                 .addr_reg_sen           (addr_reg_sen),
                 .din_reg_sen            (din_reg_sen),
                 .dout_reg_sen           (dout_reg_sen),
                 .dout_reg_len           (dout_reg_len),
                 .addr_inc               (addr_inc),
                 .addr_end               (addr_end),
                 .data_end               (data_end),
                 .wr_clk                 (wr_clk),
                 .wr_en                  (wr_en),
                 .op_en                  (op_en)
                );

i2c_mem i2c_mem (
                 .reset                  (POR),
                 .wr_clk                 (wr_clk),
                 .wr_en                  (wr_en & ~wp_mode),
                 .wr_data                (wr_data),
                 .wr_addr                (wr_addr),
                 .rd_addr                (rd_addr),
                 .rf_init0               (rf_init0),
                 .rf_init1               (rf_init1),
                 .rf_init2               (rf_init2),
                 .rf_init3               (rf_init3),
                 .rf_init4               (rf_init4),
                 .rf_init5               (rf_init5),
                 .rf_init6               (rf_init6),
                 .rf_init7               (rf_init7),
                 .rf_init8               (rf_init8),
                 .rf_init9               (rf_init9),
                 .rf_init10              (rf_init10),
                 .rf_init11              (rf_init11),
                 .rf_init12              (rf_init12),
                 .rf_init13              (rf_init13),
                 .rf_init14              (rf_init14),
                 .rf_init15              (rf_init15),
                 .rf_init16              (rf_init16),
                 .rf_init17              (rf_init17),
                 .rf_init18              (rf_init18),
                 .rf_init19              (rf_init19),
                 .rf_init20              (rf_init20),
                 .rf_init21              (rf_init21),
                 .rf_init22              (rf_init22),
                 .rf_init23              (rf_init23),
                 .rf_init24              (rf_init24),
                 .rf_init25              (rf_init25),
                 .rf_init26              (rf_init26),
                 .rf_init27              (rf_init27),
                 .rf_init28              (rf_init28),
                 .rf_init29              (rf_init29),
                 .rf_init30              (rf_init30),
                 .rf_init31              (rf_init31),
                 .rf_init32              (rf_init32),
                 .rf_init33              (rf_init33),
                 .rf_laen0               (rf_laen0),
                 .rf_laen1               (rf_laen1),
                 .rf_laen2               (rf_laen2),
                 .rf_laen3               (rf_laen3),
                 .rf_laen4               (rf_laen4),
                 .rf_laen5               (rf_laen5),
                 .rf_laen6               (rf_laen6),
                 .rf_laen7               (rf_laen7),
                 .rf_laen8               (rf_laen8),
                 .rf_laen9               (rf_laen9),
                 .rf_laen10              (rf_laen10),
                 .rf_laen11              (rf_laen11),
                 .rf_laen12              (rf_laen12),
                 .rf_laen13              (rf_laen13),
                 .rf_laen14              (rf_laen14),
                 .rf_laen15              (rf_laen15),
                 .rf_laen16              (rf_laen16),
                 .rf_laen17              (rf_laen17),
                 .rf_laen18              (rf_laen18),
                 .rf_laen19              (rf_laen19),
                 .rf_laen20              (rf_laen20),
                 .rf_laen21              (rf_laen21),
                 .rf_laen22              (rf_laen22),
                 .rf_laen23              (rf_laen23),
                 .rf_laen24              (rf_laen24),
                 .rf_laen25              (rf_laen25),
                 .rf_laen26              (rf_laen26),
                 .rf_laen27              (rf_laen27),
                 .rf_laen28              (rf_laen28),
                 .rf_laen29              (rf_laen29),
                 .rf_laen30              (rf_laen30),
                 .rf_laen31              (rf_laen31),

                 .rd_data                (rd_data),
                 .rf_data0               (rf_data0),
                 .rf_data1               (rf_data1),
                 .rf_data2               (rf_data2),
                 .rf_data3               (rf_data3),
                 .rf_data4               (rf_data4),
                 .rf_data5               (rf_data5),
                 .rf_data6               (rf_data6),
                 .rf_data7               (rf_data7),
                 .rf_data8               (rf_data8),
                 .rf_data9               (rf_data9),
                 .rf_data10              (rf_data10),
                 .rf_data11              (rf_data11),
                 .rf_data12              (rf_data12),
                 .rf_data13              (rf_data13),
                 .rf_data14              (rf_data14),
                 .rf_data15              (rf_data15),
                 .rf_data16              (rf_data16),
                 .rf_data17              (rf_data17),
                 .rf_data18              (rf_data18),
                 .rf_data19              (rf_data19),
                 .rf_data20              (rf_data20),
                 .rf_data21              (rf_data21),
                 .rf_data22              (rf_data22),
                 .rf_data23              (rf_data23),
                 .rf_data24              (rf_data24),
                 .rf_data25              (rf_data25),
                 .rf_data26              (rf_data26),
                 .rf_data27              (rf_data27),
                 .rf_data28              (rf_data28),
                 .rf_data29              (rf_data29),
                 .rf_data30              (rf_data30),
                 .rf_data31              (rf_data31)
                );

/////////////////////////////////////////////
// Start detector
/////////////////////////////////////////////

assign s_rst = ~POR | s_reset;

always @(negedge SDA_i or posedge s_rst)
  begin
    if (s_rst)
      s_detect <= 1'b0;
    else
      s_detect <= SCL;
  end

always @(negedge SCL or negedge POR)
  begin
    if (~POR)
      s_reset <= 1'b0;
    else
      s_reset <= s_detect;
  end

/////////////////////////////////////////////
// Stop detector
/////////////////////////////////////////////

assign p_rst = ~POR | p_reset;

always @(posedge SDA_i or posedge p_rst)
  begin   
    if (p_rst)
      p_detect <= 1'b0;
    else
      p_detect <= SCL;
  end

always @(negedge SCL or negedge POR)
  begin   
    if (~POR)
      p_reset <= 1'b0;
    else
      p_reset <= p_detect;
  end

/////////////////////////////////////////////
// Address register
/////////////////////////////////////////////

always @(posedge SCL or negedge POR)
  begin
    if (~POR)
      addr_reg <= 7'h0;
    else if (addr_reg_sen)
      addr_reg <= {addr_reg[5:0], SDA_i};
    else if (addr_inc)
      addr_reg <= addr_reg + 1;
  end

/////////////////////////////////////////////
// Indirect address register
/////////////////////////////////////////////

always @(posedge SCL or negedge POR)
  begin
    if (~POR)
      iaddr_reg <= 7'h0;
    else if (data_acw & id1_reg)
      iaddr_reg <= din_reg[6:0];
    else if (addr_inc & ~id1_reg)
      iaddr_reg <= iaddr_reg + 1;
  end

/////////////////////////////////////////////
// Indirect 1 register
/////////////////////////////////////////////

always @(posedge SCL or negedge POR)
  begin
    if (~POR)
      id1_reg <= 1'b0;
    else if ((addr_reg[6] == 1'b0) & ((addr_ack | data_ack) & ~id3_reg))
      id1_reg <= ~id1_reg;
  end

/////////////////////////////////////////////
// Indirect 2 register
/////////////////////////////////////////////

always @(posedge SCL or negedge POR)
  begin
    if (~POR)
      id2_reg <= 1'b0;
    else if (data_acw)
      id2_reg <= id1_reg;
  end

/////////////////////////////////////////////
// Indirect 3 register
/////////////////////////////////////////////

always @(negedge SCL or negedge POR)
  begin
    if (~POR)
      id3_reg <= 1'b0;
    else if (s_detect | p_detect)
      id3_reg <= 1'b0;
    else if (id2_reg)
      id3_reg <= 1'b1;
  end

/////////////////////////////////////////////
// Read/Write register
/////////////////////////////////////////////

always @(posedge SCL or negedge POR)
  begin
    if (~POR)
      rwb_reg <= 1'b0;
    else if (rwb_reg_sen)
      rwb_reg <= SDA_i;
  end

/////////////////////////////////////////////
// Data input register
/////////////////////////////////////////////

always @(posedge SCL or negedge POR)
  begin
    if (~POR)
      din_reg <= 8'h0;
    else if (din_reg_sen)
      din_reg <= {din_reg[6:0], SDA_i};
  end

/////////////////////////////////////////////
// Data output register
/////////////////////////////////////////////

always @(negedge SCL or negedge POR)
  begin
    if (~POR)
      dout_reg <= 8'h0;
    else if (dout_reg_len)
      dout_reg <= rd_data;
    else if (dout_reg_sen)
      dout_reg <= {dout_reg[6:0], dout_reg[7]};
  end

/////////////////////////////////////////////
// Address acknowledge
/////////////////////////////////////////////

always @(negedge SCL or negedge POR)
  begin
    if (~POR)
      addr_ack <= 1'b0;
    else if (((addr_reg[6] == 1'b0) & (addr_reg[5:0] == dev_addr[5:0]) & addr_end) | ((addr_reg[6] == 1'b1) & (addr_reg[6] == dev_addr[6]) & addr_end))
      addr_ack <= 1'b1;
    else
      addr_ack <= 1'b0;
  end

always @(negedge SCL or negedge POR)
  begin
    if (~POR)
      addr_act <= 1'b0;
    else
      addr_act <= addr_end;
  end

/////////////////////////////////////////////
// Data acknowledge
/////////////////////////////////////////////

assign data_ack = rd_mode ? data_acr : data_acw;

always @(negedge SCL or negedge POR)
  begin
    if (~POR)
      data_acw <= 1'b0;
    else if (data_end)
      data_acw <= 1'b1;
    else
      data_acw <= 1'b0;
  end

always @(posedge SCL or negedge POR)
  begin
    if (~POR)
      data_acr <= 1'b0;
    else if (data_acw)
      data_acr <= ~SDA_i;
    else
      data_acr <= 1'b0;
  end

always @(negedge SCL or negedge POR)
  begin
    if (~POR)
      data_act <= 1'b0;
    else
      data_act <= data_end;
  end

/////////////////////////////////////////////
// Memory address and data
/////////////////////////////////////////////

assign wr_data = {din_reg[6:0], SDA_i};

assign wr_addr = (id1_reg | id2_reg | id3_reg) ? iaddr_reg[5:0] : addr_reg[5:0];

assign rd_addr = (id1_reg | id2_reg | id3_reg) ? iaddr_reg[5:0] : addr_reg[5:0];

assign wr_mode = ~rwb_reg;

assign rd_mode = rwb_reg;

assign id_mode = id1_reg;

assign wp_mode = (wp_enable & (wr_addr < wp_range)) | wp_locked;

/////////////////////////////////////////////
// Inputs/Outputs
/////////////////////////////////////////////

assign SDA_i = SDA_IN;

assign SDA_o = addr_act ? ~addr_ack : data_act ? ~data_acw : (dout_reg[7] & dout_reg_sen);

assign SDA_oe = op_en;

assign SDA_OUT = SDA_o;

assign SDA_OE = SDA_oe;

assign wr_addr18 = (wr_addr[5:0] == 6'h12) & wr_en;

assign wr_addr19 = (wr_addr[5:0] == 6'h13) & wr_en;

assign i2c_start = id1_reg | id2_reg;

endmodule

//=========================================================================
// Modification History:
//
// $Id: $
//
// $Source: $
//
// $Log: $
//
//=========================================================================
