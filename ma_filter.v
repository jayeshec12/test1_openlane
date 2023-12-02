//=========================================================================
// Project     : 
// Module name : ma_filter
// Author      : 
// Created on  : Oct 13, 2018
//
// Description : Generic N*8 moving average filter
// 
//=========================================================================

module ma_filter (
                  // Inputs
                  reset,
                  clk,
                  avg_num,
                  data_in,
                  sample_in,

                  // Outputs
                  data_out,
                  data_rdy,
                  sample_out
                 );


parameter         DEPTH  = 0;
parameter         IWIDTH = 10;
parameter         OWIDTH = IWIDTH;
parameter         WIDTH = (DEPTH <=  2) ? 1 :
                          (DEPTH <=  4) ? 2 :
                          (DEPTH <=  8) ? 3 :
                          (DEPTH <= 16) ? 4 :
                          (DEPTH <= 32) ? 5 :
                                          6 ;
parameter         DEPTH8 = 3;
parameter         RWIDTH = IWIDTH + DEPTH8;

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Clocks and resets
input                 reset;
input                 clk;

// Inputs
input [2:0]           avg_num;
input [IWIDTH-1:0]    data_in;
input                 sample_in;

// Outputs
output [OWIDTH-1:0]   data_out;
output                data_rdy;
output                sample_out;

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals

// Wire declarations for output signals
wire [OWIDTH-1:0]     data_out;
wire                  data_rdy;
wire                  sample_out;

// Register declarations for internal signals
reg [IWIDTH-1:0]      mem [0:(1<<DEPTH8)-1];
reg [IWIDTH-1:0]      mem_val;
reg [DEPTH8-1:0]      rd_addr;
reg [DEPTH8-1:0]      wr_addr;
reg [DEPTH8-1:0]      sample_cnt;
reg                   sample_cnt_d1;
reg                   sample_cnt_d2;
reg                   mem_full;
reg signed [RWIDTH:0] acc;


// Wire declarations for internal signals
wire signed [RWIDTH:0]sub;
wire [DEPTH8-1:0]     offset;

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////
// Memory controls
/////////////////////////////////////////////

assign offset = {(DEPTH8){1'b1}};

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      wr_addr <= 'h0;
    else if (sample_in)
      wr_addr <= wr_addr + 1'b1;
  end

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      rd_addr <= 'h0;
    else if (sample_in & (mem_full | (wr_addr == offset)))
      rd_addr <= rd_addr + 1'b1;
  end

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      mem[wr_addr] <= 'h0;
    else if (sample_in)
      mem[wr_addr] <= data_in;
  end

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      mem_val <= 'h0;
    else if (sample_in)
      mem_val <= mem[rd_addr];
  end

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      mem_full <= 'h0;
    else if (sample_in)
      mem_full <= (mem_full) | (wr_addr == offset);
  end

/////////////////////////////////////////////
// Accumulator
/////////////////////////////////////////////

assign sub = data_in - mem_val;

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      acc <= 'h0;
    else if (sample_in)
      acc <= (mem_full) ? acc + sub : acc + data_in;
  end

/////////////////////////////////////////////
// Sample counter
/////////////////////////////////////////////

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      sample_cnt <= offset;
    else if (sample_in)
      sample_cnt <= (sample_cnt == 'h0) ? offset : sample_cnt - 1'b1;
  end

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      sample_cnt_d1 <= 1'b0;
    else
      sample_cnt_d1 <= (sample_cnt == 'h0) ? 1'b1 : 1'b0;
  end

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      sample_cnt_d2 <= 1'b0;
    else
      sample_cnt_d2 <= sample_cnt_d1;
  end

/////////////////////////////////////////////
// Outputs
/////////////////////////////////////////////

assign data_out = acc[RWIDTH-1:RWIDTH-OWIDTH];

assign data_rdy = mem_full;

assign sample_out = sample_cnt_d1 & ~sample_cnt_d2;

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
