//=========================================================================
// Project     : 
// Module name : pmb_rts
// Author      : 
// Created on  : Oct 14, 2018
//
// Description : PMB interface real time status module
// 
//=========================================================================

module pmb_rts (
                // Inputs
                reset,
                wr_clk,
                wr_len,
                wr_wdata,
                wr_chan,
                wr_anum1,
                wr_anum2,
                wr_bypass1,
                wr_bypass2,
                rd_addr,
                cs_gain,
                cs_offset,
                cs_scale,
                io_offset,
                tp_gain,
                tp_offset,
                vo_gain,
                vo_offset,

                // Outputs
                rd_data,
                rs_data0,
                rs_data1,
                rs_data2,
                rs_data3,
                rs_data4,
                rs_data5,
                rs_data6,
                rs_data7,
                rs_data8,
                rs_data9,
                rs_data10,
                rs_data11,
                rs_data12,
                rs_data13,
                rs_data14,
                rs_data15,
                rs_data16,
                rs_data17,
                rs_data18,
                rs_data19,
                rs_data20,
                rs_data21,
                rs_data22,
                rs_data23,
                rs_data24,
                rs_data25,
                rs_data26,
                rs_data27,
                rs_data28,
                rs_data29,
                rs_data30,
                rs_data31,
                rs_sample
               );


parameter         DEPTH  = 3;
parameter         IWIDTH = 10;
parameter         OWIDTH = 10;

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Clocks and resets
input             reset;
input             wr_clk;

// Inputs
input             wr_len;
input [7:0]      wr_wdata;
input [2:0]       wr_chan;
input [2:0]       wr_anum1;
input [2:0]       wr_anum2;
input             wr_bypass1;
input             wr_bypass2;
input [7:0]       rd_addr;
input [7:0]       cs_gain;
input [7:0]       cs_offset;
input             cs_scale;
input [15:0]      io_offset;
input [7:0]       tp_gain;
input [7:0]       tp_offset;
input [7:0]       vo_gain;
input [7:0]       vo_offset;

// Outputs
output [7:0]      rd_data;
output [7:0]      rs_data0;
output [7:0]      rs_data1;
output [7:0]      rs_data2;
output [7:0]      rs_data3;
output [7:0]      rs_data4;
output [7:0]      rs_data5;
output [7:0]      rs_data6;
output [7:0]      rs_data7;
output [7:0]      rs_data8;
output [7:0]      rs_data9;
output [7:0]      rs_data10;
output [7:0]      rs_data11;
output [7:0]      rs_data12;
output [7:0]      rs_data13;
output [7:0]      rs_data14;
output [7:0]      rs_data15;
output [7:0]      rs_data16;
output [7:0]      rs_data17;
output [7:0]      rs_data18;
output [7:0]      rs_data19;
output [7:0]      rs_data20;
output [7:0]      rs_data21;
output [7:0]      rs_data22;
output [7:0]      rs_data23;
output [7:0]      rs_data24;
output [7:0]      rs_data25;
output [7:0]      rs_data26;
output [7:0]      rs_data27;
output [7:0]      rs_data28;
output [7:0]      rs_data29;
output [7:0]      rs_data30;
output [7:0]      rs_data31;
output [7:0]      rs_sample;

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals
reg [7:0]         rd_data;

// Wire declarations for output signals
wire [7:0]        rs_data0;
wire [7:0]        rs_data1;
wire [7:0]        rs_data2;
wire [7:0]        rs_data3;
wire [7:0]        rs_data4;
wire [7:0]        rs_data5;
wire [7:0]        rs_data6;
wire [7:0]        rs_data7;
wire [7:0]        rs_data8;
wire [7:0]        rs_data9;
wire [7:0]        rs_data10;
wire [7:0]        rs_data11;
wire [7:0]        rs_data12;
wire [7:0]        rs_data13;
wire [7:0]        rs_data14;
wire [7:0]        rs_data15;
wire [7:0]        rs_data16;
wire [7:0]        rs_data17;
wire [7:0]        rs_data18;
wire [7:0]        rs_data19;
wire [7:0]        rs_data20;
wire [7:0]        rs_data21;
wire [7:0]        rs_data22;
wire [7:0]        rs_data23;
wire [7:0]        rs_data24;
wire [7:0]        rs_data25;
wire [7:0]        rs_data26;
wire [7:0]        rs_data27;
wire [7:0]        rs_data28;
wire [7:0]        rs_data29;
wire [7:0]        rs_data30;
wire [7:0]        rs_data31;
wire [7:0]        rs_sample;

// Register declarations for internal signals
reg [OWIDTH-1:0]  pvin_data_reg;
reg [OWIDTH-1:0]  iout1_data_reg;
reg [OWIDTH-1:0]  iout2_data_reg;
reg [OWIDTH-1:0]  vout_data_reg;
reg [OWIDTH-1:0]  temp_data_reg;
reg [OWIDTH-1:0]  vcc_data_reg;
reg               wr_len1;
reg               wr_len2;

// Wire declarations for internal signals
wire [OWIDTH-1:0] pvin_data;
wire              pvin_sample;
wire [OWIDTH-1:0] iout1_data;
wire              iout1_sample;
wire [OWIDTH-1:0] iout2_data;
wire              iout2_sample;
wire [OWIDTH-1:0] vout_data;
wire              vout_sample;
wire [OWIDTH-1:0] temp_data;
wire              temp_sample;
wire [OWIDTH-1:0] vcc_data;
wire              vcc_sample;
wire              data_ready;
wire [OWIDTH*2:0] pvin_data_con;
wire [OWIDTH*2:0] iout1_data_con;
wire [OWIDTH*2:0] vout_data_con;
wire [OWIDTH*2:0] temp_data_con;
wire [OWIDTH*2:0] vcc_data_con;
wire [10:0]       pvin_data_adj;
wire [10:0]       iout1_data_adj;
wire [15:0]       vout_data_adj;
wire [10:0]       temp_data_adj;
wire [10:0]       vcc_data_adj;
wire              wr_sel;
wire [7:0]        rd_sel;
wire [1:0]        wr_chan1;
wire [2:0]        rd_addr1;
wire [7:0]        rd_data1;
wire [1:0]        wr_chan2;
wire [2:0]        rd_addr2;
wire [7:0]        rd_data2;
wire signed [7:0] vo_offset_signed;
wire signed [7:0] tp_offset_signed;
wire signed [7:0] cs_offset_signed;
wire signed [10:0]io_offset_signed;
wire signed [23:0]temp_data_st1;
wire signed [23:0]temp_data_st2;
wire signed [23:0]temp_data_st3;
wire signed [15:0]temp_data_st4;
wire signed [15:0]iout1_data_st1;
wire signed [15:0]iout1_data_st2;
wire signed [15:0]iout1_data_st3;
wire signed [27:0]iout1_data_st4;
wire        [15:0]iout1_data_st5;
wire signed [15:0]iout1_data_st6;
wire signed [15:0]iout1_data_st7;
wire        [23:0]vcc_data_st1;
wire        [23:0]vout_data_st1;
wire        [23:0]vout_data_st2;
wire signed [15:0]vout_data_st3;

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

assign wr_chan1 = wr_chan[1:0];

assign rd_addr1 = rd_addr[2:0];

assign wr_chan2 = wr_chan[1:0];

assign rd_addr2 = rd_addr[2:0];

assign wr_sel = wr_chan[2];

assign rd_sel = rd_addr[7:0];

always @(wr_len or wr_sel)
  begin
    wr_len1 = 0;
    wr_len2 = 0;
    case (wr_sel)
      1'b0 : wr_len1 = wr_len;
      1'b1 : wr_len2 = wr_len;
    endcase
  end

rf_1r1w_le rf_1r1w_le1 (
                        .reset                  (reset),
                        .wr_clk                 (wr_clk),
                        .wr_en                  (wr_len1),
                        .wr_data                (wr_wdata),
                        //.wr_chan                (wr_chan1),
                        .rd_addri                (rd_addr1),

                        .rd_data                (rd_data1),
                        .rf_data0               (rs_data16),
                        .rf_data1               (rs_data17),
                        .rf_data2               (rs_data18),
                        .rf_data3               (rs_data19),
                        .rf_data4               (rs_data20),
                        .rf_data5               (rs_data21),
                        .rf_data6               (rs_data22),
                        .rf_data7               (rs_data23)
                       );

rf_1r1w_le rf_1r1w_le2 (
                        .reset                  (reset),
                        .wr_clk                 (wr_clk),
                        .wr_en                  (wr_len2),
                        .wr_data                (wr_wdata),
                        //.wr_chan                (wr_chan2),
                        .rd_addri                (rd_addr2),

                        .rd_data                (rd_data2),
                        .rf_data0               (rs_data24),
                        .rf_data1               (rs_data25),
                        .rf_data2               (rs_data26),
                        .rf_data3               (rs_data27),
                        .rf_data4               (rs_data28),
                        .rf_data5               (rs_data29),
                        .rf_data6               (rs_data30),
                        .rf_data7               (rs_data31)
                       );

adc_filters #(DEPTH,IWIDTH,OWIDTH) adc_filters (
                                                .POR                    (reset),
                                                .SCK                    (wr_clk),
                                                .adc_data               (wr_wdata[IWIDTH-1:0]),
                                                .adc_channel            (wr_chan),
                                                .adc_sample             (wr_len),
                                                .adc_anum1              (wr_anum1),
                                                .adc_anum2              (wr_anum2),
                                                .adc_bypass1            (wr_bypass1),
                                                .adc_bypass2            (wr_bypass2),

                                                .pvin_data              (pvin_data),
                                                .pvin_sample            (pvin_sample),
                                                .iout1_data             (iout1_data),
                                                .iout1_sample           (iout1_sample),
                                                .iout2_data             (iout2_data),
                                                .iout2_sample           (iout2_sample),
                                                .vout_data              (vout_data),
                                                .vout_sample            (vout_sample),
                                                .temp_data              (temp_data),
                                                .temp_sample            (temp_sample),
                                                .vcc_data               (vcc_data),
                                                .vcc_sample             (vcc_sample),
                                                .data_ready             (data_ready)
                                               );

/////////////////////////////////////////////
// Post processing
/////////////////////////////////////////////

always @(posedge wr_clk or negedge reset)
  begin
    if (~reset)
      pvin_data_reg <= 'h0;
    else if (data_ready & pvin_sample)
      pvin_data_reg <= pvin_data;
  end

always @(posedge wr_clk or negedge reset)
  begin
    if (~reset)
      iout1_data_reg <= 'h0;
    else if (data_ready & iout1_sample)
      iout1_data_reg <= iout1_data;
  end

always @(posedge wr_clk or negedge reset)
  begin
    if (~reset)
      iout2_data_reg <= 'h0;
    else if (data_ready & iout2_sample)
      iout2_data_reg <= iout2_data;
  end

always @(posedge wr_clk or negedge reset)
  begin
    if (~reset)
      vout_data_reg <= 'h0;
    else if (data_ready & vout_sample)
      vout_data_reg <= vout_data;
  end

always @(posedge wr_clk or negedge reset)
  begin
    if (~reset)
      temp_data_reg <= 'h0;
    else if (data_ready & temp_sample)
      temp_data_reg <= temp_data;
  end

always @(posedge wr_clk or negedge reset)
  begin
    if (~reset)
      vcc_data_reg <= 'h0;
    else if (data_ready & vcc_sample)
      vcc_data_reg <= vcc_data;
  end

assign vo_offset_signed = $signed(vo_offset[7:0]);

assign tp_offset_signed = $signed(tp_offset[7:0]);

assign cs_offset_signed = $signed(cs_offset[7:0]);

assign io_offset_signed = $signed(io_offset[10:0]);

assign pvin_data_con = (pvin_data_reg << 10) / 3641;

assign iout1_data_st1 = (iout1_data_reg << 3);

assign iout1_data_st2 = (iout1_data_st1 < 1706) ? 1706 : iout1_data_st1;

assign iout1_data_st3 = (iout1_data_st2 - 1706);

assign iout1_data_st4 = (iout1_data_st3 << 12);

assign iout1_data_st5 = (iout1_data_st4 / (cs_gain * 173));

assign iout1_data_st6 = (iout1_data_st5);

assign iout1_data_st7 = (iout1_data_st6 + io_offset_signed);

assign iout1_data_con = (iout1_data_st7 - cs_offset_signed);

assign vout_data_st1 = (cs_scale ? ((vout_data_reg << 11) / 4551) : ((vout_data_reg << 12) / 4551));

assign vout_data_st2 = (vout_data_st1 * (vo_gain + 128));

assign vout_data_st3 = (vout_data_st2 >> 7);

assign vout_data_con = (vout_data_st3 + vo_offset_signed);

assign temp_data_st1 = (temp_data_reg - 450);

assign temp_data_st2 = (temp_data_st1 * (tp_gain + 128));

assign temp_data_st3 = (temp_data_st2 / 436);

assign temp_data_st4 = (temp_data_st3 + tp_offset_signed);

assign temp_data_con = (temp_data_st4 > 150) ? 150 : (temp_data_st4 < -40) ? -40 : temp_data_st4;

assign vcc_data_st1 = (vcc_data_reg << 11);

assign vcc_data_con = (vcc_data_st1 / 10923);

assign pvin_data_adj = pvin_data_con[10:0];

assign iout1_data_adj = iout1_data_con[10:0];

assign vout_data_adj = vout_data_con[15:0];

assign temp_data_adj = temp_data_con[10:0];

assign vcc_data_adj = vcc_data_con[10:0];

/////////////////////////////////////////////
// Outputs
/////////////////////////////////////////////

always @(*)
  begin
    rd_data = 8'h0;
    casez (rd_sel)
      8'b10011000  : rd_data = rs_data0;
      8'b10011001  : rd_data = rs_data1;
      8'b10011010  : rd_data = rs_data2;
      8'b10011011  : rd_data = rs_data3;
      8'b10011100  : rd_data = rs_data4;
      8'b10011101  : rd_data = rs_data5;
      8'b10011110  : rd_data = rs_data6;
      8'b10011111  : rd_data = rs_data7;
      8'b10100000  : rd_data = rs_data8;
      8'b10100001  : rd_data = rs_data9;
      8'b10100010  : rd_data = rs_data10;
      8'b10100011  : rd_data = rs_data11;
      8'b10100100  : rd_data = rs_data12;
      8'b10100101  : rd_data = rs_data13;
      8'b10100110  : rd_data = rs_data14;
      8'b10100111  : rd_data = rs_data15;
      8'b10101???  : rd_data = rd_data1;
      8'b10110???  : rd_data = rd_data2;
      default      : rd_data = 8'h0;
    endcase
  end

assign rs_sample = {1'b0, vcc_sample, temp_sample, vout_sample, iout2_sample, iout1_sample, pvin_sample, 1'b0};

assign {rs_data1, rs_data0} = {rs_data17, rs_data16};

assign {rs_data3, rs_data2} = {5'b11100, pvin_data_adj};

assign {rs_data5, rs_data4} = {5'b11100, iout1_data_adj};

assign {rs_data7, rs_data6} = {6'h0, iout2_data_reg};

assign {rs_data9, rs_data8} = {vout_data_adj};

assign {rs_data11, rs_data10} = {5'b00000, temp_data_adj};

assign {rs_data13, rs_data12} = {5'b11011, vcc_data_adj};

assign {rs_data15, rs_data14} = {rs_data31, rs_data30};

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
