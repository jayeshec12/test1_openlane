//=========================================================================
// Project     : 
// Module name : control
// Author      : 
// Created on  : Dec 24, 2017
//
// Description : Control interface module
// 
//=========================================================================

module control (
                // Inputs
                VDD,
                VPP,
                VSS,
                POR,
                SCL,
                reset,
                clk,
                rd_start,
                wr_start,
                em_data0,
                em_data1,
                em_data2,
                em_data3,
                em_data4,
                em_data5,
                em_data6,
                em_data7,
                em_data8,
                em_data9,
                em_data10,
                em_data11,
                em_data12,
                em_data13,
                em_data14,
                em_data15,
                em_data16,
                em_data17,
                em_data18,
                em_data19,
                em_data20,
                em_data21,
                em_data22,
                em_data23,
                em_data24,
                em_data25,
                em_data26,
                em_data27,
                em_data28,
                em_data29,
                em_data30,
                em_data31,
                `ifdef FPGA_MEM
                em_reset,
                `endif

                // Outputs
                VPP_mode,
                em_init0,
                em_init1,
                em_init2,
                em_init3,
                em_init4,
                em_init5,
                em_init6,
                em_init7,
                em_init8,
                em_init9,
                em_init10,
                em_init11,
                em_init12,
                em_init13,
                em_init14,
                em_init15,
                em_init16,
                em_init17,
                em_init18,
                em_init19,
                em_init20,
                em_init21,
                em_init22,
                em_init23,
                em_init24,
                em_init25,
                em_init26,
                em_init27,
                em_init28,
                em_init29,
                em_init30,
                em_init31,
                em_laen0,
                em_laen1,
                em_laen2,
                em_laen3,
                em_laen4,
                em_laen5,
                em_laen6,
                em_laen7,
                em_laen8,
                em_laen9,
                em_laen10,
                em_laen11,
                em_laen12,
                em_laen13,
                em_laen14,
                em_laen15,
                em_laen16,
                em_laen17,
                em_laen18,
                em_laen19,
                em_laen20,
                em_laen21,
                em_laen22,
                em_laen23,
                em_laen24,
                em_laen25,
                em_laen26,
                em_laen27,
                em_laen28,
                em_laen29,
                em_laen30,
                em_laen31,
                em_bank,
                em_full,
                rd_mode,
                wr_mode,
                rd_done,
                wr_done,
                rd_busy,
                wr_busy
               );


parameter [2:0]   CONTROL_S0 = 3'd0;    // IDLE
parameter [2:0]   CONTROL_S1 = 3'd1;    // READ
parameter [2:0]   CONTROL_S2 = 3'd2;    // WRITE

parameter [4:0]   READ_S0 = 4'd0;       // IDLE
parameter [4:0]   READ_S1 = 4'd1;       // READ LOCATION
parameter [4:0]   READ_S2 = 4'd2;       // READ BLOCK
parameter [4:0]   READ_S3 = 4'd3;       // READ ENABLE
parameter [4:0]   READ_S4 = 4'd4;       // RECOVERY

parameter [5:0]   WRITE_S0 = 5'd0;      // IDLE
parameter [5:0]   WRITE_S1 = 5'd1;      // ENABLE PROGRAM 
parameter [5:0]   WRITE_S2 = 5'd2;      // WRITE BLOCK
parameter [5:0]   WRITE_S3 = 5'd3;      // WRITE ENABLE
parameter [5:0]   WRITE_S4 = 5'd4;      // WRITE LOCATION
parameter [5:0]   WRITE_S5 = 5'd5;      // RECOVERY

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Supplies
input             VDD;
input             VPP;
input             VSS;

// Clocks and resets
input             POR;
input             SCL;
input             reset;
input             clk;

// Inputs
input             rd_start;
input             wr_start;
input [7:0]       em_data0;
input [7:0]       em_data1;
input [7:0]       em_data2;
input [7:0]       em_data3;
input [7:0]       em_data4;
input [7:0]       em_data5;
input [7:0]       em_data6;
input [7:0]       em_data7;
input [7:0]       em_data8;
input [7:0]       em_data9;
input [7:0]       em_data10;
input [7:0]       em_data11;
input [7:0]       em_data12;
input [7:0]       em_data13;
input [7:0]       em_data14;
input [7:0]       em_data15;
input [7:0]       em_data16;
input [7:0]       em_data17;
input [7:0]       em_data18;
input [7:0]       em_data19;
input [7:0]       em_data20;
input [7:0]       em_data21;
input [7:0]       em_data22;
input [7:0]       em_data23;
input [7:0]       em_data24;
input [7:0]       em_data25;
input [7:0]       em_data26;
input [7:0]       em_data27;
input [7:0]       em_data28;
input [7:0]       em_data29;
input [7:0]       em_data30;
input [7:0]       em_data31;
`ifdef FPGA_MEM
input             em_reset;
`endif

// Outputs
output [1:0]      VPP_mode;
output [7:0]      em_init0;
output [7:0]      em_init1;
output [7:0]      em_init2;
output [7:0]      em_init3;
output [7:0]      em_init4;
output [7:0]      em_init5;
output [7:0]      em_init6;
output [7:0]      em_init7;
output [7:0]      em_init8;
output [7:0]      em_init9;
output [7:0]      em_init10;
output [7:0]      em_init11;
output [7:0]      em_init12;
output [7:0]      em_init13;
output [7:0]      em_init14;
output [7:0]      em_init15;
output [7:0]      em_init16;
output [7:0]      em_init17;
output [7:0]      em_init18;
output [7:0]      em_init19;
output [7:0]      em_init20;
output [7:0]      em_init21;
output [7:0]      em_init22;
output [7:0]      em_init23;
output [7:0]      em_init24;
output [7:0]      em_init25;
output [7:0]      em_init26;
output [7:0]      em_init27;
output [7:0]      em_init28;
output [7:0]      em_init29;
output [7:0]      em_init30;
output [7:0]      em_init31;
output [7:0]      em_laen0;
output [7:0]      em_laen1;
output [7:0]      em_laen2;
output [7:0]      em_laen3;
output [7:0]      em_laen4;
output [7:0]      em_laen5;
output [7:0]      em_laen6;
output [7:0]      em_laen7;
output [7:0]      em_laen8;
output [7:0]      em_laen9;
output [7:0]      em_laen10;
output [7:0]      em_laen11;
output [7:0]      em_laen12;
output [7:0]      em_laen13;
output [7:0]      em_laen14;
output [7:0]      em_laen15;
output [7:0]      em_laen16;
output [7:0]      em_laen17;
output [7:0]      em_laen18;
output [7:0]      em_laen19;
output [7:0]      em_laen20;
output [7:0]      em_laen21;
output [7:0]      em_laen22;
output [7:0]      em_laen23;
output [7:0]      em_laen24;
output [7:0]      em_laen25;
output [7:0]      em_laen26;
output [7:0]      em_laen27;
output [7:0]      em_laen28;
output [7:0]      em_laen29;
output [7:0]      em_laen30;
output [7:0]      em_laen31;
output [2:0]      em_bank;
output            em_full;
output            rd_mode;
output            wr_mode;
output            rd_done;
output            wr_done;
output            rd_busy;
output            wr_busy;

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals
reg [7:0]         em_init0;
reg [7:0]         em_init1;
reg [7:0]         em_init2;
reg [7:0]         em_init3;
reg [7:0]         em_init4;
reg [7:0]         em_init5;
reg [7:0]         em_init6;
reg [7:0]         em_init7;
reg [7:0]         em_init8;
reg [7:0]         em_init9;
reg [7:0]         em_init10;
reg [7:0]         em_init11;
reg [7:0]         em_init12;
reg [7:0]         em_init13;
reg [7:0]         em_init14;
reg [7:0]         em_init15;
reg [7:0]         em_init16;
reg [7:0]         em_init17;
reg [7:0]         em_init18;
reg [7:0]         em_init19;
reg [7:0]         em_init20;
reg [7:0]         em_init21;
reg [7:0]         em_init22;
reg [7:0]         em_init23;
reg [7:0]         em_init24;
reg [7:0]         em_init25;
reg [7:0]         em_init26;
reg [7:0]         em_init27;
reg [7:0]         em_init28;
reg [7:0]         em_init29;
reg [7:0]         em_init30;
reg [7:0]         em_init31;
reg [7:0]         em_laen0;
reg [7:0]         em_laen1;
reg [7:0]         em_laen2;
reg [7:0]         em_laen3;
reg [7:0]         em_laen4;
reg [7:0]         em_laen5;
reg [7:0]         em_laen6;
reg [7:0]         em_laen7;
reg [7:0]         em_laen8;
reg [7:0]         em_laen9;
reg [7:0]         em_laen10;
reg [7:0]         em_laen11;
reg [7:0]         em_laen12;
reg [7:0]         em_laen13;
reg [7:0]         em_laen14;
reg [7:0]         em_laen15;
reg [7:0]         em_laen16;
reg [7:0]         em_laen17;
reg [7:0]         em_laen18;
reg [7:0]         em_laen19;
reg [7:0]         em_laen20;
reg [7:0]         em_laen21;
reg [7:0]         em_laen22;
reg [7:0]         em_laen23;
reg [7:0]         em_laen24;
reg [7:0]         em_laen25;
reg [7:0]         em_laen26;
reg [7:0]         em_laen27;
reg [7:0]         em_laen28;
reg [7:0]         em_laen29;
reg [7:0]         em_laen30;
reg [7:0]         em_laen31;

// Wire declarations for output signals
wire [1:0]        VPP_mode;
wire [2:0]        em_bank;
wire              em_full;
wire              rd_mode;
wire              wr_mode;
wire              rd_done;
wire              wr_done;
wire              rd_busy;
wire              wr_busy;

// Register declarations for internal signals
reg [2:0]         control_state;
reg [2:0]         control_next_state;
reg [4:0]         read_state;
reg [4:0]         read_next_state;
reg [5:0]         write_state;
reg [5:0]         write_next_state;
reg [9:0]         count_reg;
reg [3:0]         loc_reg;
reg [3:0]         loc_off;
reg [7:0]         rd_block_addr;
reg [7:0]         wr_block_addr;
reg [7:0]         wr_data;
reg               mem_prog_d;
reg               rd_en;
reg               prd;
reg               pwe;

// Wire declarations for internal signals
wire [7:0]        rd_data;
wire [7:0]        rd_data_b;
wire [6:0]        rd_addr;
wire [6:0]        wr_addr;
wire [6:0]        mem_addr;
wire [6:0]        loc_addr;
wire [6:0]        loc_adj;
wire              rd_clk;
wire              wr_clk;
wire              rd_laen;
wire              wr_en;
wire              mem_empty;
wire              mem_full;
wire              mem_prog;

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

`ifdef FPGA_MEM
fpga_mem fpga_mem (
                   .reset                  (em_reset),
                   .wr_clk                 (wr_clk),
                   .wr_en                  (wr_en),
                   .wr_data                (wr_data),
                   .wr_addr                (wr_addr),
                   .rd_addr                (rd_addr),
                   .rd_data_b              (rd_data_b)
                  );

parameter saved = 8'hff;
parameter empty = 8'h00;

`else
stub emem (
                        .PA                     (mem_addr),
                        .PDIN                   (wr_data),
                        .PPROG                  (mem_prog),
                        .PRD                    (prd | rd_en),
                        .PTM                    (2'b00),
                        .PWE                    (pwe),
                        .VDD                    (VDD),
                        .VPP                    (VPP),
                        .VSS                    (VSS),
                        .PDOB                   (rd_data_b)
                       );

parameter saved = 8'h00;
parameter empty = 8'hff;

`endif

/////////////////////////////////////////////
// Clocks
/////////////////////////////////////////////

assign rd_clk = count_reg[0];

assign wr_clk = count_reg[9];

always @(posedge clk or negedge POR)
  begin
    if (~POR)
      count_reg <= 10'd0;
    else
      count_reg <= count_reg + 1;
  end

/////////////////////////////////////////////
// Main control
/////////////////////////////////////////////

assign control_state_S0_2_S1 = rd_start;

assign control_state_S0_2_S2 = wr_start;

assign control_state_S1_2_S0 = read_state[READ_S4] & read_next_state[READ_S0];

assign control_state_S2_2_S0 = write_state[WRITE_S5] & write_next_state[WRITE_S0];

always @(posedge clk or negedge reset)
  begin
    if (~reset)
      control_state <= 3'd1;
    else
      control_state <= control_next_state;
  end

always @(control_state or control_state_S0_2_S1 or control_state_S0_2_S2 or control_state_S1_2_S0 or control_state_S2_2_S0 )
  begin
    control_next_state = 3'h0;
    case (1'b1)
      control_state[CONTROL_S0]  :
                                   begin
                                     if (control_state_S0_2_S1)
                                       control_next_state[CONTROL_S1] = 1'b1;
                                     else if (control_state_S0_2_S2)
                                       control_next_state[CONTROL_S2] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S0] = 1'b1;
                                   end
      control_state[CONTROL_S1]  :
                                   begin
                                     if (control_state_S1_2_S0)
                                       control_next_state[CONTROL_S0] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S1] = 1'b1;
                                   end
      control_state[CONTROL_S2]  :
                                   begin
                                     if (control_state_S2_2_S0)
                                       control_next_state[CONTROL_S0] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S2] = 1'b1;
                                   end
      default                    :
                                   begin
                                     control_next_state[CONTROL_S0] = 1'b1;
                                   end
    endcase
  end

/////////////////////////////////////////////
// Read control
/////////////////////////////////////////////

assign read_state_S0_2_S1 = control_state[CONTROL_S1];

assign read_state_S1_2_S2 = (rd_data == empty) | mem_full;

assign read_state_S2_2_S4 = mem_empty;

assign read_state_S3_2_S4 = (rd_addr[4:0] == 5'h1e);

assign read_state_S4_2_S0 = 1'b1;

always @(posedge rd_clk or negedge reset)
  begin
    if (~reset)
      read_state <= 5'd1;
    else
      read_state <= read_next_state;
  end

always @(read_state or read_state_S0_2_S1 or read_state_S1_2_S2 or read_state_S2_2_S4 or read_state_S3_2_S4 or read_state_S4_2_S0 )
  begin
    read_next_state = 5'h0;
    case (1'b1)
      read_state[READ_S0]  :
                             begin
                               if (read_state_S0_2_S1)
                                 read_next_state[READ_S1] = 1'b1;
                               else
                                 read_next_state[READ_S0] = 1'b1;
                             end
      read_state[READ_S1]  :
                             begin
                               if (read_state_S1_2_S2)
                                 read_next_state[READ_S2] = 1'b1;
                               else
                                 read_next_state[READ_S1] = 1'b1;
                             end
      read_state[READ_S2]  :
                             begin
                               if (read_state_S2_2_S4)
                                 read_next_state[READ_S4] = 1'b1;
                               else
                                 read_next_state[READ_S3] = 1'b1;
                             end
      read_state[READ_S3]  :
                             begin
                               if (read_state_S3_2_S4)
                                 read_next_state[READ_S4] = 1'b1;
                               else
                                 read_next_state[READ_S2] = 1'b1;
                             end
      read_state[READ_S4]  :
                             begin
                               if (read_state_S4_2_S0)
                                 read_next_state[READ_S0] = 1'b1;
                               else
                                 read_next_state[READ_S4] = 1'b1;
                             end
      default              :
                             begin
                               read_next_state[READ_S0] = 1'b1;
                             end
    endcase
  end

/////////////////////////////////////////////
// Write control
/////////////////////////////////////////////

assign write_state_S0_2_S1 = control_state[CONTROL_S2];

assign write_state_S1_2_S2 = 1'b1;

assign write_state_S2_2_S5 = mem_full;

assign write_state_S3_2_S4 = (wr_addr[4:0] == 5'h1f);

assign write_state_S5_2_S0 = 1'b1;

always @(posedge wr_clk or negedge reset)
  begin
    if (~reset)
      write_state <= 6'd1;
    else
      write_state <= write_next_state;
  end

always @(write_state or write_state_S0_2_S1 or write_state_S1_2_S2 or write_state_S2_2_S5 or write_state_S3_2_S4 or write_state_S5_2_S0 )
  begin
    write_next_state = 6'h0;
    case (1'b1)
      write_state[WRITE_S0]  :
                               begin
                                 if (write_state_S0_2_S1)
                                   write_next_state[WRITE_S1] = 1'b1;
                                 else
                                   write_next_state[WRITE_S0] = 1'b1;
                               end
      write_state[WRITE_S1]  :
                               begin
                                 if (write_state_S1_2_S2)
                                   write_next_state[WRITE_S2] = 1'b1;
                                 else
                                   write_next_state[WRITE_S1] = 1'b1;
                               end
      write_state[WRITE_S2]  :
                               begin
                                 if (write_state_S2_2_S5)
                                   write_next_state[WRITE_S5] = 1'b1;
                                 else
                                   write_next_state[WRITE_S3] = 1'b1;
                               end
      write_state[WRITE_S3]  :
                               begin
                                 if (write_state_S3_2_S4)
                                   write_next_state[WRITE_S4] = 1'b1;
                                 else
                                   write_next_state[WRITE_S2] = 1'b1;
                               end
      write_state[WRITE_S4]  :
                               begin
                                   write_next_state[WRITE_S5] = 1'b1;
                               end
      write_state[WRITE_S5]  :
                               begin
                                 if (write_state_S5_2_S0)
                                   write_next_state[WRITE_S0] = 1'b1;
                                 else
                                   write_next_state[WRITE_S5] = 1'b1;
                               end
      default                :
                               begin
                                 write_next_state[WRITE_S0] = 1'b1;
                               end
    endcase
  end

/////////////////////////////////////////////
// Location address register
/////////////////////////////////////////////

always @(posedge rd_clk or negedge reset)
  begin
    if (~reset)
      loc_reg <= 4'h1;
    else if (read_state[READ_S1] & (rd_data == saved) & !mem_full)
      loc_reg <= loc_reg + 4'h2;
  end

always @(posedge wr_clk or negedge reset or posedge rd_start)
  begin
    if (~reset)
      loc_off <= 4'h0;
    else if (rd_start)
      loc_off <= 4'h0;
    else if (write_state[WRITE_S3] & write_next_state[WRITE_S4])
      loc_off <= loc_off + 4'h2;
  end

assign loc_adj = loc_reg + loc_off;

assign loc_addr = {loc_adj[2:0], 4'b1111};

assign mem_empty = (loc_adj == 4'h1);

assign mem_full = loc_adj[3];

/////////////////////////////////////////////
// Read block address register
/////////////////////////////////////////////

always @(posedge rd_clk or negedge reset)
  begin
    if (~reset)
      rd_block_addr <= 8'h0;
    else if (read_state[READ_S1] & read_next_state[READ_S2])
      rd_block_addr <= (loc_adj == 4'h1) ? 8'h80 : (loc_adj == 4'h3) ? 8'h00 : (loc_adj == 4'h5) ? 8'h20 : (loc_adj == 4'h7) ? 8'h40 : 8'h60;
    else if (read_state[READ_S3])
      rd_block_addr <= (rd_block_addr == 8'h80) ? rd_block_addr : rd_block_addr + 8'h1;
  end

/////////////////////////////////////////////
// Write block address register
/////////////////////////////////////////////

always @(posedge wr_clk or negedge reset)
  begin
    if (~reset)
      wr_block_addr <= 8'h0;
    else if (write_state[WRITE_S1] & write_next_state[WRITE_S2])
      wr_block_addr <= (loc_adj == 4'h1) ? 8'h00 : (loc_adj == 4'h3) ? 8'h20 : (loc_adj == 4'h5) ? 8'h40 : (loc_adj == 4'h7) ? 8'h60 : 8'h80;
    else if (write_state[WRITE_S3])
      wr_block_addr <= (wr_block_addr == 8'h80) ? wr_block_addr : wr_block_addr + 8'h1;
  end

/////////////////////////////////////////////
// Memory address and data
/////////////////////////////////////////////

always @(negedge clk or negedge reset)
  begin
    if (~reset)
      prd <= 1'b0;
    else if (read_state[READ_S1])
      prd <= ~prd;
    else if (~read_next_state[READ_S1])
      prd <= 1'b0;
  end

always @(negedge rd_clk or negedge reset)
  begin
    if (~reset)
      rd_en <= 1'b0;
    else if (read_next_state[READ_S3])
      rd_en <= 1'b1;
    else
      rd_en <= 1'b0;
  end

always @(negedge wr_clk or negedge reset)
  begin
    if (~reset)
      pwe <= 1'b0;
    else
      pwe <= write_next_state[WRITE_S3];
  end

always @(posedge wr_clk or negedge reset)
  begin
    if (~reset)
      mem_prog_d <= 1'b0;
    else
      mem_prog_d <= write_state[WRITE_S5];
  end

assign rd_data = ~rd_data_b;

assign wr_addr = wr_block_addr[6:0];

assign rd_addr = read_state[READ_S1] ? loc_addr : rd_block_addr[6:0];

assign mem_addr = rd_mode ? rd_addr : wr_addr;

assign wr_en = write_state[WRITE_S3];

assign rd_laen = read_state[READ_S3];

assign mem_prog = write_state[WRITE_S1] | VPP_mode[1] | mem_prog_d;

assign VPP_mode[1] = write_state[WRITE_S2] | write_state[WRITE_S3] | write_state[WRITE_S4] | write_state[WRITE_S5];

assign VPP_mode[0] = rd_mode ? 1'b0 : (wr_mode ? (VPP_mode[1] ? 1'b1 : 1'b0) : 1'b0);

always @(wr_addr[4:0] or em_data0  or em_data1  or em_data2  or em_data3  or em_data4  or em_data5  or em_data6  or em_data7  or
                         em_data8  or em_data9  or em_data10 or em_data11 or em_data12 or em_data13 or em_data14 or em_data15 or
                         em_data16 or em_data17 or em_data18 or em_data19 or em_data20 or em_data21 or em_data22 or em_data23 or
                         em_data24 or em_data25 or em_data26 or em_data27 or em_data28 or em_data29 or em_data30 or em_data31)
  begin
    wr_data = empty;
    case (wr_addr[4:0])
      5'b00000 : wr_data = em_data0;
      5'b00001 : wr_data = em_data1;
      5'b00010 : wr_data = em_data2;
      5'b00011 : wr_data = em_data3;
      5'b00100 : wr_data = em_data4;
      5'b00101 : wr_data = em_data5;
      5'b00110 : wr_data = em_data6;
      5'b00111 : wr_data = em_data7;
      5'b01000 : wr_data = em_data8;
      5'b01001 : wr_data = em_data9;
      5'b01010 : wr_data = em_data10;
      5'b01011 : wr_data = em_data11;
      5'b01100 : wr_data = em_data12;
      5'b01101 : wr_data = em_data13;
      5'b01110 : wr_data = em_data14;
      5'b01111 : wr_data = em_data15;
      5'b10000 : wr_data = em_data16;
      5'b10001 : wr_data = em_data17;
      5'b10010 : wr_data = em_data18;
      5'b10011 : wr_data = em_data19;
      5'b10100 : wr_data = em_data20;
      5'b10101 : wr_data = em_data21;
      5'b10110 : wr_data = em_data22;
      5'b10111 : wr_data = em_data23;
      5'b11000 : wr_data = em_data24;
      5'b11001 : wr_data = em_data25;
      5'b11010 : wr_data = em_data26;
      5'b11011 : wr_data = em_data27;
      5'b11100 : wr_data = em_data28;
      5'b11101 : wr_data = em_data29;
      5'b11110 : wr_data = em_data30;
      5'b11111 : wr_data = saved;
      default  : wr_data = empty;
    endcase
  end

/////////////////////////////////////////////
// Inputs/Outputs
/////////////////////////////////////////////

always @(rd_addr[4:0] or rd_data)
  begin
    case (rd_addr[4:0])
      5'b00000 : em_init0  = rd_data;
      5'b00001 : em_init1  = rd_data;
      5'b00010 : em_init2  = rd_data;
      5'b00011 : em_init3  = rd_data;
      5'b00100 : em_init4  = rd_data;
      5'b00101 : em_init5  = rd_data;
      5'b00110 : em_init6  = rd_data;
      5'b00111 : em_init7  = rd_data;
      5'b01000 : em_init8  = rd_data;
      5'b01001 : em_init9  = rd_data;
      5'b01010 : em_init10 = rd_data;
      5'b01011 : em_init11 = rd_data;
      5'b01100 : em_init12 = rd_data;
      5'b01101 : em_init13 = rd_data;
      5'b01110 : em_init14 = rd_data;
      5'b01111 : em_init15 = rd_data;
      5'b10000 : em_init16 = rd_data;
      5'b10001 : em_init17 = rd_data;
      5'b10010 : em_init18 = rd_data;
      5'b10011 : em_init19 = rd_data;
      5'b10100 : em_init20 = rd_data;
      5'b10101 : em_init21 = rd_data;
      5'b10110 : em_init22 = rd_data;
      5'b10111 : em_init23 = rd_data;
      5'b11000 : em_init24 = rd_data;
      5'b11001 : em_init25 = rd_data;
      5'b11010 : em_init26 = rd_data;
      5'b11011 : em_init27 = rd_data;
      5'b11100 : em_init28 = rd_data;
      5'b11101 : em_init29 = rd_data;
      5'b11110 : em_init30 = rd_data;
      5'b11111 : em_init31 = rd_data;
    endcase
  end

always @(rd_addr[4:0] or rd_laen)
  begin
    em_laen0  = 8'h0;
    em_laen1  = 8'h0;
    em_laen2  = 8'h0;
    em_laen3  = 8'h0;
    em_laen4  = 8'h0;
    em_laen5  = 8'h0;
    em_laen6  = 8'h0;
    em_laen7  = 8'h0;
    em_laen8  = 8'h0;
    em_laen9  = 8'h0;
    em_laen10 = 8'h0;
    em_laen11 = 8'h0;
    em_laen12 = 8'h0;
    em_laen13 = 8'h0;
    em_laen14 = 8'h0;
    em_laen15 = 8'h0;
    em_laen16 = 8'h0;
    em_laen17 = 8'h0;
    em_laen18 = 8'h0;
    em_laen19 = 8'h0;
    em_laen20 = 8'h0;
    em_laen21 = 8'h0;
    em_laen22 = 8'h0;
    em_laen23 = 8'h0;
    em_laen24 = 8'h0;
    em_laen25 = 8'h0;
    em_laen26 = 8'h0;
    em_laen27 = 8'h0;
    em_laen28 = 8'h0;
    em_laen29 = 8'h0;
    em_laen30 = 8'h0;
    em_laen31 = 8'h0;
    case (rd_addr[4:0])
      5'b00000 : em_laen0  = {8{rd_laen}};
      5'b00001 : em_laen1  = {8{rd_laen}};
      5'b00010 : em_laen2  = {8{rd_laen}};
      5'b00011 : em_laen3  = {8{rd_laen}};
      5'b00100 : em_laen4  = {8{rd_laen}};
      5'b00101 : em_laen5  = {8{rd_laen}};
      5'b00110 : em_laen6  = {8{rd_laen}};
      5'b00111 : em_laen7  = {8{rd_laen}};
      5'b01000 : em_laen8  = {8{rd_laen}};
      5'b01001 : em_laen9  = {8{rd_laen}};
      5'b01010 : em_laen10 = {8{rd_laen}};
      5'b01011 : em_laen11 = {8{rd_laen}};
      5'b01100 : em_laen12 = {8{rd_laen}};
      5'b01101 : em_laen13 = {8{rd_laen}};
      5'b01110 : em_laen14 = {8{rd_laen}};
      5'b01111 : em_laen15 = {8{rd_laen}};
      5'b10000 : em_laen16 = {8{rd_laen}};
      5'b10001 : em_laen17 = {8{rd_laen}};
      5'b10010 : em_laen18 = {8{rd_laen}};
      5'b10011 : em_laen19 = {8{rd_laen}};
      5'b10100 : em_laen20 = {8{rd_laen}};
      5'b10101 : em_laen21 = {8{rd_laen}};
      5'b10110 : em_laen22 = {8{rd_laen}};
      5'b10111 : em_laen23 = {8{rd_laen}};
      5'b11000 : em_laen24 = {8{rd_laen}};
      5'b11001 : em_laen25 = {8{rd_laen}};
      5'b11010 : em_laen26 = {8{rd_laen}};
      5'b11011 : em_laen27 = {8{rd_laen}};
      5'b11100 : em_laen28 = {8{rd_laen}};
      5'b11101 : em_laen29 = {8{rd_laen}};
      5'b11110 : em_laen30 = {8{rd_laen}};
      5'b11111 : em_laen31 = {8{rd_laen}};
    endcase
  end

assign em_bank = loc_adj[3] ? 3'h4 : (loc_adj[2:0] == 3'h7) ? 3'h3 : (loc_adj[2:0] == 3'h5) ? 3'h2 : (loc_adj[2:0] == 3'h3) ? 3'h1 : 3'h0;

assign em_full = mem_full;

assign rd_mode = control_state[CONTROL_S1];

assign wr_mode = control_state[CONTROL_S2];

assign rd_done = control_state_S1_2_S0;

assign wr_done = control_state_S2_2_S0;

assign rd_busy = read_state[READ_S1] | read_state[READ_S2] | read_state[READ_S3] | read_state[READ_S4];

assign wr_busy = write_state[WRITE_S1] | write_state[WRITE_S2] | write_state[WRITE_S3] | write_state[WRITE_S4] | write_state[WRITE_S5] | mem_prog_d;

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
