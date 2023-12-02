//=========================================================================
// Project     : 
// Module name : rf_1r1w_le
// Author      : 
// Created on  : Oct 17, 2017
//
// Description : Generic wrapper for register file with latch enable
// 
//=========================================================================

module rf_1r1w_le (
                   // Inputs
                   reset,
                   wr_clk,
                   wr_en,
                   wr_data,
                   wr_addri,
                   rd_addri,
                   rf_init0,
                   rf_init1,
                   rf_init2,
                   rf_init3,
                   rf_init4,
                   rf_init5,
                   rf_init6,
                   rf_init7,
                   rf_laen0,
                   rf_laen1,
                   rf_laen2,
                   rf_laen3,
                   rf_laen4,
                   rf_laen5,
                   rf_laen6,
                   rf_laen7,

                   // Outputs
                   rd_data,
                   rf_data0,
                   rf_data1,
                   rf_data2,
                   rf_data3,
                   rf_data4,
                   rf_data5,
                   rf_data6,
                   rf_data7
                  );


parameter         DEPTH = 8;
parameter         WIDTH = (DEPTH <=  4) ? 2 :
                          (DEPTH <=  8) ? 3 :
                          (DEPTH <= 16) ? 4 :
                          (DEPTH <= 32) ? 5 :
                           6;

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Clocks and resets
input              reset;
input              wr_clk;

// Inputs
input              wr_en;    
input [7:0]        wr_data;
input [2:0]        wr_addri;
input [2:0]        rd_addri;
input [7:0]        rf_init0;
input [7:0]        rf_init1;
input [7:0]        rf_init2;
input [7:0]        rf_init3;
input [7:0]        rf_init4;
input [7:0]        rf_init5;
input [7:0]        rf_init6;
input [7:0]        rf_init7;
input [7:0]        rf_laen0;
input [7:0]        rf_laen1;
input [7:0]        rf_laen2;
input [7:0]        rf_laen3;
input [7:0]        rf_laen4;
input [7:0]        rf_laen5;
input [7:0]        rf_laen6;
input [7:0]        rf_laen7;

// Outputs
output [7:0]       rd_data;
output [7:0]       rf_data0;
output [7:0]       rf_data1;
output [7:0]       rf_data2;
output [7:0]       rf_data3;
output [7:0]       rf_data4;
output [7:0]       rf_data5;
output [7:0]       rf_data6;
output [7:0]       rf_data7;

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals
reg [7:0]          rd_data;

// Wire declarations for output signals
wire [7:0]         rf_data0;
wire [7:0]         rf_data1;
wire [7:0]         rf_data2;
wire [7:0]         rf_data3;
wire [7:0]         rf_data4;
wire [7:0]         rf_data5;
wire [7:0]         rf_data6;
wire [7:0]         rf_data7;

// Register declarations for internal signals
reg [7:0]          regfile0;
reg [7:0]          regfile1;
reg [7:0]          regfile2;
reg [7:0]          regfile3;
reg [7:0]          regfile4;
reg [7:0]          regfile5;
reg [7:0]          regfile6;
reg [7:0]          regfile7;

// Wire declarations for internal signals
wire               rf_load0;
wire               rf_load1;
wire               rf_load2;
wire               rf_load3;
wire               rf_load4;
wire               rf_load5;
wire               rf_load6;
wire               rf_load7;

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

assign rf_load0 = |rf_laen0;

assign rf_load1 = |rf_laen1;

assign rf_load2 = |rf_laen2;

assign rf_load3 = |rf_laen3;

assign rf_load4 = |rf_laen4;

assign rf_load5 = |rf_laen5;

assign rf_load6 = |rf_laen6;

assign rf_load7 = |rf_laen7;

always @(posedge wr_clk or negedge reset or posedge rf_load0)
  begin
    if (~reset)
      regfile0 <= rf_init0;
    else if (rf_load0)
      regfile0 <= (regfile0 & ~rf_laen0) | (rf_init0 & rf_laen0);
    else if ((wr_addri == 3'b000) & wr_en)
      regfile0 <= wr_data;
  end

always @(posedge wr_clk or negedge reset or posedge rf_load1)
  begin
    if (~reset)
      regfile1 <= rf_init1;
    else if (rf_load1)
      regfile1 <= (regfile1 & ~rf_laen1) | (rf_init1 & rf_laen1);
    else if ((wr_addri == 3'b001) & wr_en)
      regfile1 <= wr_data;
  end

always @(posedge wr_clk or negedge reset or posedge rf_load2)
  begin
    if (~reset)
      regfile2 <= rf_init2;
    else if (rf_load2)
      regfile2 <= (regfile2 & ~rf_laen2) | (rf_init2 & rf_laen2);
    else if ((wr_addri == 3'b010) & wr_en)
      regfile2 <= wr_data;
  end

always @(posedge wr_clk or negedge reset or posedge rf_load3)
  begin
    if (~reset)
      regfile3 <= rf_init3;
    else if (rf_load3)
      regfile3 <= (regfile3 & ~rf_laen3) | (rf_init3 & rf_laen3);
    else if ((wr_addri == 3'b011) & wr_en)
      regfile3 <= wr_data;
  end

always @(posedge wr_clk or negedge reset or posedge rf_load4)
  begin
    if (~reset)
      regfile4 <= rf_init4;
    else if (rf_load4)
      regfile4 <= (regfile4 & ~rf_laen4) | (rf_init4 & rf_laen4);
    else if ((wr_addri == 3'b100) & wr_en)
      regfile4 <= wr_data;
  end

always @(posedge wr_clk or negedge reset or posedge rf_load5)
  begin
    if (~reset)
      regfile5 <= rf_init5;
    else if (rf_load5)
      regfile5 <= (regfile5 & ~rf_laen5) | (rf_init5 & rf_laen5);
    else if ((wr_addri == 3'b101) & wr_en)
      regfile5 <= wr_data;
  end

always @(posedge wr_clk or negedge reset or posedge rf_load6)
  begin
    if (~reset)
      regfile6 <= rf_init6;
    else if (rf_load6)
      regfile6 <= (regfile6 & ~rf_laen6) | (rf_init6 & rf_laen6);
    else if ((wr_addri == 3'b110) & wr_en)
      regfile6 <= wr_data;
  end

always @(posedge wr_clk or negedge reset or posedge rf_load7)
  begin
    if (~reset)
      regfile7 <= rf_init7;
    else if (rf_load7)
      regfile7 <= (regfile7 & ~rf_laen7) | (rf_init7 & rf_laen7);
    else if ((wr_addri == 3'b111) & wr_en)
      regfile7 <= wr_data;
  end

/////////////////////////////////////////////
// Outputs
/////////////////////////////////////////////

always @(rd_addri or regfile0 or regfile1 or regfile2 or regfile3 or regfile4 or regfile5 or regfile6 or regfile7)
  begin
    rd_data = 8'h0;
    case (rd_addri)
      3'b000 :  rd_data = regfile0;
      3'b001 :  rd_data = regfile1;
      3'b010 :  rd_data = regfile2;
      3'b011 :  rd_data = regfile3;
      3'b100 :  rd_data = regfile4;
      3'b101 :  rd_data = regfile5;
      3'b110 :  rd_data = regfile6;
      3'b111 :  rd_data = regfile7;
      default : rd_data = 8'h0;
    endcase
  end

assign rf_data0 = regfile0;

assign rf_data1 = regfile1;

assign rf_data2 = regfile2;

assign rf_data3 = regfile3;

assign rf_data4 = regfile4;

assign rf_data5 = regfile5;

assign rf_data6 = regfile6;

assign rf_data7 = regfile7;

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