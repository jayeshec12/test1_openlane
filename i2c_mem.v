//=========================================================================
// Project     : 
// Module name : i2c_mem
// Author      : 
// Created on  : Sep 25, 2017
//
// Description : I2C interface memory module
// 
//=========================================================================

module i2c_mem (
                // Inputs
                reset,
                wr_clk,
                wr_en,
                wr_data,
                wr_addr,
                rd_addr,
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
                rd_data,
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
                rf_data31
               );

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Clocks and resets
input             reset;
input             wr_clk;

// Inputs
input             wr_en;    
input [7:0]       wr_data;
input [5:0]       wr_addr;
input [5:0]       rd_addr;
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
output [7:0]      rd_data;
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

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals
reg [7:0]         rd_data;

// Wire declarations for output signals
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

// Register declarations for internal signals
reg               wr_en0;
reg               wr_en1;
reg               wr_en2;
reg               wr_en3;

// Wire declarations for internal signals
wire [2:0]        wr_sel;
wire [2:0]        rd_sel;
wire [2:0]        wr_addr0;
wire [2:0]        rd_addr0;
wire [7:0]        rd_data0;
wire [2:0]        wr_addr1;
wire [2:0]        rd_addr1;
wire [7:0]        rd_data1;
wire [2:0]        wr_addr2;
wire [2:0]        rd_addr2;
wire [7:0]        rd_data2;
wire [2:0]        wr_addr3;
wire [2:0]        rd_addr3;
wire [7:0]        rd_data3;
wire [7:0]        rd_data4;

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

assign rd_data4 = (rd_addr[1:0] == 2'b00) ? rf_init32 : (rd_addr[1:0] == 2'b01) ? rf_init33 : 8'h0;

assign wr_addr0 = wr_addr[2:0];

assign rd_addr0 = rd_addr[2:0];

assign wr_addr1 = wr_addr[2:0];

assign rd_addr1 = rd_addr[2:0];

assign wr_addr2 = wr_addr[2:0];

assign rd_addr2 = rd_addr[2:0];

assign wr_addr3 = wr_addr[2:0];

assign rd_addr3 = rd_addr[2:0];

assign wr_sel = wr_addr[5:3];

assign rd_sel = rd_addr[5:3];

always @(wr_en or wr_sel)
  begin
    wr_en0 = 0;
    wr_en1 = 0;
    wr_en2 = 0;
    wr_en3 = 0;
    case (wr_sel)
      3'b000 : wr_en0 = wr_en;
      3'b001 : wr_en1 = wr_en;
      3'b010 : wr_en2 = wr_en;
      3'b011 : wr_en3 = wr_en;
    endcase
  end

rf_1r1w_le rf_1r1w_le0 (
                        .reset                  (reset),
                        .wr_clk                 (wr_clk),
                        .wr_en                  (wr_en0),
                        .wr_data                (wr_data),
                        .wr_addri               (wr_addr0),
                        .rd_addri               (rd_addr0),
                        .rf_init0               (rf_init0),
                        .rf_init1               (rf_init1),
                        .rf_init2               (rf_init2),
                        .rf_init3               (rf_init3),
                        .rf_init4               (rf_init4),
                        .rf_init5               (rf_init5),
                        .rf_init6               (rf_init6),
                        .rf_init7               (rf_init7),
                        .rf_laen0               (rf_laen0),
                        .rf_laen1               (rf_laen1),
                        .rf_laen2               (rf_laen2),
                        .rf_laen3               (rf_laen3),
                        .rf_laen4               (rf_laen4),
                        .rf_laen5               (rf_laen5),
                        .rf_laen6               (rf_laen6),
                        .rf_laen7               (rf_laen7),

                        .rd_data                (rd_data0),
                        .rf_data0               (rf_data0),
                        .rf_data1               (rf_data1),
                        .rf_data2               (rf_data2),
                        .rf_data3               (rf_data3),
                        .rf_data4               (rf_data4),
                        .rf_data5               (rf_data5),
                        .rf_data6               (rf_data6),
                        .rf_data7               (rf_data7)
                       );

rf_1r1w_le rf_1r1w_le1 (
                        .reset                  (reset),
                        .wr_clk                 (wr_clk),
                        .wr_en                  (wr_en1),
                        .wr_data                (wr_data),
                        .wr_addri               (wr_addr1),
                        .rd_addri               (rd_addr1),
                        .rf_init0               (rf_init8),
                        .rf_init1               (rf_init9),
                        .rf_init2               (rf_init10),
                        .rf_init3               (rf_init11),
                        .rf_init4               (rf_init12),
                        .rf_init5               (rf_init13),
                        .rf_init6               (rf_init14),
                        .rf_init7               (rf_init15),
                        .rf_laen0               (rf_laen8),
                        .rf_laen1               (rf_laen9),
                        .rf_laen2               (rf_laen10),
                        .rf_laen3               (rf_laen11),
                        .rf_laen4               (rf_laen12),
                        .rf_laen5               (rf_laen13),
                        .rf_laen6               (rf_laen14),
                        .rf_laen7               (rf_laen15),

                        .rd_data                (rd_data1),
                        .rf_data0               (rf_data8),
                        .rf_data1               (rf_data9),
                        .rf_data2               (rf_data10),
                        .rf_data3               (rf_data11),
                        .rf_data4               (rf_data12),
                        .rf_data5               (rf_data13),
                        .rf_data6               (rf_data14),
                        .rf_data7               (rf_data15)
                       );

rf_1r1w_le rf_1r1w_le2 (
                        .reset                  (reset),
                        .wr_clk                 (wr_clk),
                        .wr_en                  (wr_en2),
                        .wr_data                (wr_data),
                        .wr_addri               (wr_addr2),
                        .rd_addri               (rd_addr2),
                        .rf_init0               (rf_init16),
                        .rf_init1               (rf_init17),
                        .rf_init2               (rf_init18),
                        .rf_init3               (rf_init19),
                        .rf_init4               (rf_init20),
                        .rf_init5               (rf_init21),
                        .rf_init6               (rf_init22),
                        .rf_init7               (rf_init23),
                        .rf_laen0               (rf_laen16),
                        .rf_laen1               (rf_laen17),
                        .rf_laen2               (rf_laen18),
                        .rf_laen3               (rf_laen19),
                        .rf_laen4               (rf_laen20),
                        .rf_laen5               (rf_laen21),
                        .rf_laen6               (rf_laen22),
                        .rf_laen7               (rf_laen23),

                        .rd_data                (rd_data2),
                        .rf_data0               (rf_data16),
                        .rf_data1               (rf_data17),
                        .rf_data2               (rf_data18),
                        .rf_data3               (rf_data19),
                        .rf_data4               (rf_data20),
                        .rf_data5               (rf_data21),
                        .rf_data6               (rf_data22),
                        .rf_data7               (rf_data23)
                       );

rf_1r1w_le rf_1r1w_le3 (
                        .reset                  (reset),
                        .wr_clk                 (wr_clk),
                        .wr_en                  (wr_en3),
                        .wr_data                (wr_data),
                        .wr_addri               (wr_addr3),
                        .rd_addri               (rd_addr3),
                        .rf_init0               (rf_init24),
                        .rf_init1               (rf_init25),
                        .rf_init2               (rf_init26),
                        .rf_init3               (rf_init27),
                        .rf_init4               (rf_init28),
                        .rf_init5               (rf_init29),
                        .rf_init6               (rf_init30),
                        .rf_init7               (rf_init31),
                        .rf_laen0               (rf_laen24),
                        .rf_laen1               (rf_laen25),
                        .rf_laen2               (rf_laen26),
                        .rf_laen3               (rf_laen27),
                        .rf_laen4               (rf_laen28),
                        .rf_laen5               (rf_laen29),
                        .rf_laen6               (rf_laen30),
                        .rf_laen7               (rf_laen31),

                        .rd_data                (rd_data3),
                        .rf_data0               (rf_data24),
                        .rf_data1               (rf_data25),
                        .rf_data2               (rf_data26),
                        .rf_data3               (rf_data27),
                        .rf_data4               (rf_data28),
                        .rf_data5               (rf_data29),
                        .rf_data6               (rf_data30),
                        .rf_data7               (rf_data31)
                       );

/////////////////////////////////////////////
// Outputs
/////////////////////////////////////////////

always @(rd_sel or rd_data0 or rd_data1 or rd_data2 or rd_data3 or rd_data4)
  begin
    rd_data = 8'h0;
    case (rd_sel)
      3'b000  : rd_data = rd_data0;
      3'b001  : rd_data = rd_data1;
      3'b010  : rd_data = rd_data2;
      3'b011  : rd_data = rd_data3;
      3'b100  : rd_data = rd_data4;
      default : rd_data = 8'h0;
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