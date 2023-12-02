//=========================================================================
// Project     : 
// Module name : adc_filters
// Author      : 
// Created on  : Oct 23, 2018
//
// Description : N*8 moving average filters for ADC output channels
// 
//=========================================================================

module adc_filters (
                    // Inputs
                    POR,
                    SCK,
                    adc_data,
                    adc_channel,
                    adc_sample,
                    adc_anum1,
                    adc_anum2,
                    adc_bypass1,
                    adc_bypass2,

                    // Outputs
                    pvin_data,
                    pvin_sample,
                    iout1_data,
                    iout1_sample,
                    iout2_data,
                    iout2_sample,
                    vout_data,
                    vout_sample,
                    temp_data,
                    temp_sample,
                    vcc_data,
                    vcc_sample,
                    data_ready
                   );


parameter         DEPTH  = 3;
parameter         IWIDTH = 10;
parameter         OWIDTH = 10;

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Clocks and resets
input               POR;
input               SCK;

// Inputs
input [IWIDTH-1:0]  adc_data;
input [2:0]         adc_channel;
input               adc_sample;
input [2:0]         adc_anum1;
input [2:0]         adc_anum2;
input               adc_bypass1;
input               adc_bypass2;

// Outputs
output [OWIDTH-1:0] pvin_data;
output              pvin_sample;
output [OWIDTH-1:0] iout1_data;
output              iout1_sample;
output [OWIDTH-1:0] iout2_data;
output              iout2_sample;
output [OWIDTH-1:0] vout_data;
output              vout_sample;
output [OWIDTH-1:0] temp_data;
output              temp_sample;
output [OWIDTH-1:0] vcc_data;
output              vcc_sample;
output              data_ready;

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals
reg                 data_ready;

// Wire declarations for output signals
wire [OWIDTH-1:0]   pvin_data;
wire                pvin_sample;
wire [OWIDTH-1:0]   iout1_data;
wire                iout1_sample;
wire [OWIDTH-1:0]   iout2_data;
wire                iout2_sample;
wire [OWIDTH-1:0]   vout_data;
wire                vout_sample;
wire [OWIDTH-1:0]   temp_data;
wire                temp_sample;
wire [OWIDTH-1:0]   vcc_data;
wire                vcc_sample;

// Register declarations for internal signals
reg                 gnd_sample_int;
reg                 pvin_sample_int;
reg                 iout1_sample_int;
reg                 iout2_sample_int;
reg                 vout_sample_int;
reg                 temp_sample_int;
reg                 vcc_sample_int;
reg                 addr_sample_int;

// Wire declarations for internal signals
wire [OWIDTH-1:0]   pvin_dataa;
wire                pvin_samplea;
wire [OWIDTH-1:0]   iout1_dataa;
wire                iout1_samplea;
wire [OWIDTH-1:0]   iout2_dataa;
wire                iout2_samplea;
wire [OWIDTH-1:0]   vout_dataa;
wire                vout_samplea;
wire [OWIDTH-1:0]   temp_dataa;
wire                temp_samplea;
wire [OWIDTH-1:0]   vcc_dataa;
wire                vcc_samplea;
wire [OWIDTH-1:0]   pvin_datab;
wire                pvin_sampleb;
wire [OWIDTH-1:0]   iout1_datab;
wire                iout1_sampleb;
wire [OWIDTH-1:0]   iout2_datab;
wire                iout2_sampleb;
wire [OWIDTH-1:0]   vout_datab;
wire                vout_sampleb;
wire [OWIDTH-1:0]   temp_datab;
wire                temp_sampleb;
wire [OWIDTH-1:0]   vcc_datab;
wire                vcc_sampleb;
wire [OWIDTH-1:0]   pvin_datai;
wire                pvin_samplei;
wire [OWIDTH-1:0]   iout1_datai;
wire                iout1_samplei;
wire [OWIDTH-1:0]   iout2_datai;
wire                iout2_samplei;
wire [OWIDTH-1:0]   vout_datai;
wire                vout_samplei;
wire [OWIDTH-1:0]   temp_datai;
wire                temp_samplei;
wire [OWIDTH-1:0]   vcc_datai;
wire                vcc_samplei;
wire                pvin_rdya;
wire                pvin_rdyb;
wire                iout1_rdya;
wire                iout1_rdyb;
wire                vout_rdya;
wire                vout_rdyb;

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

assign pvin_datai = adc_bypass1 ? adc_data : pvin_dataa;

assign iout1_datai = adc_bypass1 ? adc_data : iout1_dataa;

assign iout2_datai = adc_bypass1 ? adc_data : adc_data;

assign vout_datai = adc_bypass1 ? adc_data : vout_dataa;

assign temp_datai = adc_bypass1 ? adc_data : adc_data;

assign vcc_datai = adc_bypass1 ? adc_data : adc_data;

assign pvin_samplei = adc_bypass1 ? pvin_sample_int : pvin_samplea;

assign iout1_samplei = adc_bypass1 ? iout1_sample_int : iout1_samplea;

assign iout2_samplei = adc_bypass1 ? iout2_sample_int : iout2_sample_int;

assign vout_samplei = adc_bypass1 ? vout_sample_int : vout_samplea;

assign temp_samplei = adc_bypass1 ? temp_sample_int : temp_sample_int;

assign vcc_samplei = adc_bypass1 ? vcc_sample_int : vcc_sample_int;

ma_filter #(DEPTH,IWIDTH,OWIDTH,3) ma_filter1a (
                                                .reset                  (POR),
                                                .clk                    (SCK),
                                                .avg_num                (adc_anum1),
                                                .data_in                (adc_data),
                                                .sample_in              (pvin_sample_int),

                                                .data_out               (pvin_dataa),
                                                .data_rdy               (pvin_rdya),
                                                .sample_out             (pvin_samplea)
                                               );

ma_filter #(DEPTH,IWIDTH,OWIDTH,3) ma_filter1b (
                                                .reset                  (POR),
                                                .clk                    (SCK),
                                                .avg_num                (adc_anum2),
                                                .data_in                (pvin_datai),
                                                .sample_in              (pvin_samplei),

                                                .data_out               (pvin_datab),
                                                .data_rdy               (pvin_rdyb),
                                                .sample_out             (pvin_sampleb)
                                               );

ma_filter #(DEPTH,IWIDTH,OWIDTH,3) ma_filter2a (
                                                .reset                  (POR),
                                                .clk                    (SCK),
                                                .avg_num                (adc_anum1),
                                                .data_in                (adc_data),
                                                .sample_in              (iout1_sample_int),

                                                .data_out               (iout1_dataa),
                                                .data_rdy               (iout1_rdya),
                                                .sample_out             (iout1_samplea)
                                               );

ma_filter #(DEPTH,IWIDTH,OWIDTH,3) ma_filter2b (
                                                .reset                  (POR),
                                                .clk                    (SCK),
                                                .avg_num                (adc_anum2),
                                                .data_in                (iout1_datai),
                                                .sample_in              (iout1_samplei),

                                                .data_out               (iout1_datab),
                                                .data_rdy               (iout1_rdyb),
                                                .sample_out             (iout1_sampleb)
                                               );

ma_filter #(DEPTH,IWIDTH,OWIDTH,3) ma_filter3a (
                                                .reset                  (POR),
                                                .clk                    (SCK),
                                                .avg_num                (adc_anum1),
                                                .data_in                (adc_data),
                                                .sample_in              (vout_sample_int),

                                                .data_out               (vout_dataa),
                                                .data_rdy               (vout_rdya),
                                                .sample_out             (vout_samplea)
                                               );

ma_filter #(DEPTH,IWIDTH,OWIDTH,3) ma_filter3b (
                                                .reset                  (POR),
                                                .clk                    (SCK),
                                                .avg_num                (adc_anum2),
                                                .data_in                (vout_datai),
                                                .sample_in              (vout_samplei),

                                                .data_out               (vout_datab),
                                                .data_rdy               (vout_rdyb),
                                                .sample_out             (vout_sampleb)
                                               );

always @(*)
  begin
    gnd_sample_int = 0;
    pvin_sample_int = 0;
    iout1_sample_int = 0;
    iout2_sample_int = 0;
    vout_sample_int = 0;
    temp_sample_int = 0;
    vcc_sample_int = 0;
    addr_sample_int = 0;
    case (adc_channel)
      3'b000 : gnd_sample_int = adc_sample;
      3'b001 : pvin_sample_int = adc_sample;
      3'b010 : iout1_sample_int = adc_sample;
      3'b011 : iout2_sample_int = adc_sample;
      3'b100 : vout_sample_int = adc_sample;
      3'b101 : temp_sample_int = adc_sample;
      3'b110 : vcc_sample_int = adc_sample;
      3'b111 : addr_sample_int = adc_sample;
    endcase
  end

/////////////////////////////////////////////
// Outputs
/////////////////////////////////////////////

assign pvin_data = adc_bypass2 ? pvin_datai : pvin_datab;

assign iout1_data = adc_bypass2 ? iout1_datai : iout1_datab;

assign iout2_data = adc_bypass2 ? iout2_datai : iout2_datai;

assign vout_data = adc_bypass2 ? vout_datai : vout_datab;

assign temp_data = adc_bypass2 ? temp_datai : temp_datai;

assign vcc_data = adc_bypass2 ? vcc_datai : vcc_datai;

assign pvin_sample = adc_bypass2 ? pvin_samplei : pvin_sampleb;

assign iout1_sample = adc_bypass2 ? iout1_samplei : iout1_sampleb;

assign iout2_sample = adc_bypass2 ? iout2_samplei : iout2_samplei;

assign vout_sample = adc_bypass2 ? vout_samplei : vout_sampleb;

assign temp_sample = adc_bypass2 ? temp_samplei : temp_samplei;

assign vcc_sample = adc_bypass2 ? vcc_samplei : vcc_samplei;

always @(*)
  begin
    data_ready = 1'b0;
    case ({adc_bypass1, adc_bypass2})
      2'b00 : data_ready = pvin_rdya & pvin_rdyb & iout1_rdya & iout1_rdyb & vout_rdya & vout_rdyb;
      2'b01 : data_ready = pvin_rdya & iout1_rdya & vout_rdya;
      2'b10 : data_ready = pvin_rdyb & iout1_rdyb & vout_rdyb;
      2'b11 : data_ready = 1'b1;
    endcase
  end

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
