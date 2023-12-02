//=========================================================================
// Project     : 
// Module name : i2c_fsm
// Author      : 
// Created on  : Sep 25,  2017
//
// Description : Finite State Machine for I2C interface
// 
//=========================================================================

module i2c_fsm (
                // Inputs
                POR,
                SCL,
                s_detect,
                p_detect,
                wr_mode,
                rd_mode,
                id_mode,
                addr_ack,
                data_ack,

                // Outputs
                rwb_reg_sen,
                addr_reg_sen,
                din_reg_sen,
                dout_reg_sen,
                dout_reg_len,
                addr_inc,
                addr_end,
                data_end,
                wr_clk,
                wr_en,
                op_en
               );


parameter [18:0]  I2C_S0  = 19'd0;   // IDLE
parameter [18:0]  I2C_S1  = 19'd1;   // ADDR1
parameter [18:0]  I2C_S2  = 19'd2;   // ADDR2
parameter [18:0]  I2C_S3  = 19'd3;   // ADDR3
parameter [18:0]  I2C_S4  = 19'd4;   // ADDR4
parameter [18:0]  I2C_S5  = 19'd5;   // ADDR5
parameter [18:0]  I2C_S6  = 19'd6;   // ADDR6
parameter [18:0]  I2C_S7  = 19'd7;   // ADDR7
parameter [18:0]  I2C_S8  = 19'd8;   // RWB
parameter [18:0]  I2C_S9  = 19'd9;   // AACK
parameter [18:0]  I2C_S10 = 19'd10;  // DATA1
parameter [18:0]  I2C_S11 = 19'd11;  // DATA2
parameter [18:0]  I2C_S12 = 19'd12;  // DATA3
parameter [18:0]  I2C_S13 = 19'd13;  // DATA4
parameter [18:0]  I2C_S14 = 19'd14;  // DATA5
parameter [18:0]  I2C_S15 = 19'd15;  // DATA6
parameter [18:0]  I2C_S16 = 19'd16;  // DATA7
parameter [18:0]  I2C_S17 = 19'd17;  // DATA8
parameter [18:0]  I2C_S18 = 19'd18;  // DACK

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Clocks and resets
input             POR;
input             SCL;

// Inputs  
input             s_detect;
input             p_detect;
input             wr_mode;
input             rd_mode;
input             id_mode;
input             addr_ack;
input             data_ack;

// Outputs
output            rwb_reg_sen;
output            addr_reg_sen;
output            din_reg_sen;
output            dout_reg_sen;
output            dout_reg_len;
output            addr_inc;
output            addr_end;
output            data_end;
output            wr_clk;
output            wr_en;
output            op_en;

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals

// Wire declarations for output signals
wire              addr_reg_sen;
wire              din_reg_sen;
wire              dout_reg_sen;
wire              dout_reg_len;
wire              addr_inc;
wire              addr_end;
wire              data_end;
wire              wr_clk;
wire              wr_en;
wire              op_en;

// Register declarations for internal signals
reg [18:0]        i2c_state;                
reg [18:0]        i2c_next_state;

// Wire declarations for internal signals

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

always @(negedge SCL or negedge POR)
  begin
    if (~POR)
      i2c_state <= 19'd1;
    else if (~s_detect & p_detect)
      i2c_state <= 19'd1;
    else if (s_detect)
      i2c_state <= 19'd2;
    else
      i2c_state <= i2c_next_state;
  end

always @(i2c_state or addr_ack or data_ack)
  begin
    i2c_next_state = 19'h0;
    case (1'b1)
      i2c_state[I2C_S0]  :
                               begin
                                 i2c_next_state[I2C_S0] = 1'b1;
                               end
      i2c_state[I2C_S1]  :
                               begin
                                 i2c_next_state[I2C_S2] = 1'b1;
                               end
      i2c_state[I2C_S2]  :
                               begin
                                 i2c_next_state[I2C_S3] = 1'b1;
                               end
      i2c_state[I2C_S3]  :
                               begin
                                 i2c_next_state[I2C_S4] = 1'b1;
                               end
      i2c_state[I2C_S4]  :
                               begin
                                 i2c_next_state[I2C_S5] = 1'b1;
                               end
      i2c_state[I2C_S5]  :
                               begin
                                 i2c_next_state[I2C_S6] = 1'b1;
                               end
      i2c_state[I2C_S6]  :
                               begin
                                 i2c_next_state[I2C_S7] = 1'b1;
                               end
      i2c_state[I2C_S7]  :
                               begin
                                 i2c_next_state[I2C_S8] = 1'b1;
                               end
      i2c_state[I2C_S8]  :
                               begin
                                 i2c_next_state[I2C_S9] = 1'b1;
                               end
      i2c_state[I2C_S9]  :
                               begin
                                 if (addr_ack)
                                   i2c_next_state[I2C_S10] = 1'b1;
                                 else
                                   i2c_next_state[I2C_S0] = 1'b1;
                               end
      i2c_state[I2C_S10] :
                               begin
                                 i2c_next_state[I2C_S11] = 1'b1;
                               end
      i2c_state[I2C_S11] :
                               begin
                                 i2c_next_state[I2C_S12] = 1'b1;
                               end
      i2c_state[I2C_S12] :
                               begin
                                 i2c_next_state[I2C_S13] = 1'b1;
                               end
      i2c_state[I2C_S13] :
                               begin
                                 i2c_next_state[I2C_S14] = 1'b1;
                               end
      i2c_state[I2C_S14] :
                               begin
                                 i2c_next_state[I2C_S15] = 1'b1;
                               end
      i2c_state[I2C_S15] :
                               begin
                                 i2c_next_state[I2C_S16] = 1'b1;
                               end
      i2c_state[I2C_S16] :
                               begin
                                 i2c_next_state[I2C_S17] = 1'b1;
                               end
      i2c_state[I2C_S17] :
                               begin
                                 i2c_next_state[I2C_S18] = 1'b1;
                               end
      i2c_state[I2C_S18] :
                               begin
                                 if (data_ack)
                                   i2c_next_state[I2C_S10] = 1'b1;
                                 else
                                   i2c_next_state[I2C_S0] = 1'b1;
                               end
      default            :
                               begin
                                 i2c_next_state[I2C_S0] = 1'b1;
                               end
    endcase
  end

/////////////////////////////////////////////
// Outputs
/////////////////////////////////////////////

assign addr_end = (i2c_state[I2C_S8]);

assign data_end = (i2c_state[I2C_S17]);

assign rwb_reg_sen = (i2c_state[I2C_S8]);

assign addr_reg_sen = (i2c_state[I2C_S1]) |
                      (i2c_state[I2C_S2]) |
                      (i2c_state[I2C_S3]) |
                      (i2c_state[I2C_S4]) |
                      (i2c_state[I2C_S5]) |
                      (i2c_state[I2C_S6]) |
                      (i2c_state[I2C_S7]);

assign din_reg_sen = (i2c_state[I2C_S10] & wr_mode) |
                     (i2c_state[I2C_S11] & wr_mode) |
                     (i2c_state[I2C_S12] & wr_mode) |
                     (i2c_state[I2C_S13] & wr_mode) |
                     (i2c_state[I2C_S14] & wr_mode) |
                     (i2c_state[I2C_S15] & wr_mode) |
                     (i2c_state[I2C_S16] & wr_mode) |
                     (i2c_state[I2C_S17] & wr_mode);
                     
assign dout_reg_sen = (i2c_state[I2C_S10] & rd_mode) |
                      (i2c_state[I2C_S11] & rd_mode) |
                      (i2c_state[I2C_S12] & rd_mode) |
                      (i2c_state[I2C_S13] & rd_mode) |
                      (i2c_state[I2C_S14] & rd_mode) |
                      (i2c_state[I2C_S15] & rd_mode) |
                      (i2c_state[I2C_S16] & rd_mode) |
                      (i2c_state[I2C_S17] & rd_mode);

assign dout_reg_len = (i2c_state[I2C_S9] & rd_mode & addr_ack) | 
                      (i2c_state[I2C_S18] & rd_mode & data_ack);

assign addr_inc = i2c_state[I2C_S18];

assign wr_clk = SCL;

assign wr_en = (i2c_state[I2C_S17] & wr_mode & ~id_mode);

assign op_en = (i2c_state[I2C_S9]) |
               (i2c_state[I2C_S10] & rd_mode) |
               (i2c_state[I2C_S11] & rd_mode) |
               (i2c_state[I2C_S12] & rd_mode) |
               (i2c_state[I2C_S13] & rd_mode) |
               (i2c_state[I2C_S14] & rd_mode) |
               (i2c_state[I2C_S15] & rd_mode) |
               (i2c_state[I2C_S16] & rd_mode) |
               (i2c_state[I2C_S17] & rd_mode) |
               (i2c_state[I2C_S18] & wr_mode);

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
