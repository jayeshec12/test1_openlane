//=========================================================================
// Project     : 
// Module name : adc_control
// Author      : 
// Created on  : Oct 23, 2018
//
// Description : Control interface module for ADC
// 
//=========================================================================

module adc_control (
                    // Inputs
                    POR,
                    SCK,
                    ch_dly,
                    us_dly,
                    sys_ready,
                    adc_ready,
                    adc_freeze,
                    adc_fchannel,

                    // Outputs
                    adc_convert,
                    adc_channel,
                    adc_sample
                   );


parameter [8:0]   CONTROL_S0 = 9'd0;       // IDLE
parameter [8:0]   CONTROL_S1 = 9'd1;       // GND
parameter [8:0]   CONTROL_S2 = 9'd2;       // PVIN
parameter [8:0]   CONTROL_S3 = 9'd3;       // IOUT1
parameter [8:0]   CONTROL_S4 = 9'd4;       // IOUT2
parameter [8:0]   CONTROL_S5 = 9'd5;       // VOUT
parameter [8:0]   CONTROL_S6 = 9'd6;       // TEMPERATURE
parameter [8:0]   CONTROL_S7 = 9'd7;       // VCC
parameter [8:0]   CONTROL_S8 = 9'd8;       // ADDRESS

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Clocks and resets
input             POR;
input             SCK;

// Inputs
input [1:0]       ch_dly;
input             us_dly;
input             sys_ready;
input             adc_ready;
input             adc_freeze;
input [2:0]       adc_fchannel;

// Outputs
output            adc_convert;
output [2:0]      adc_channel;
output            adc_sample;

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals
reg [2:0]         adc_channel;
reg               adc_sample;

// Wire declarations for output signals
wire              adc_convert;

// Register declarations for internal signals
reg [8:0]         control_state;
reg [8:0]         control_next_state;
reg [8:0]         control_last_state;
reg [7:0]         adc_delay;
reg [2:0]         adc_frozen_channel;
reg               adc_frozen;

// Wire declarations for internal signals
wire              control_state_S0_2_S1;
wire              control_state_S1_2_S2;wire              control_state_S1_2_S3;
wire              control_state_S1_2_S4;
wire              control_state_S1_2_S5;
wire              control_state_S1_2_S6;
wire              control_state_S1_2_S7;
wire              control_state_S1_2_S8;
wire              control_state_S2_2_S1;
wire              control_state_S3_2_S1;
wire              control_state_S4_2_S1;
wire              control_state_S5_2_S1;
wire              control_state_S6_2_S1;
wire              control_state_S7_2_S1;
wire              control_state_S8_2_S1;

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////
// Main control
/////////////////////////////////////////////

assign control_state_S0_2_S1 = sys_ready;

assign control_state_S1_2_S2 = control_last_state[CONTROL_S7] | control_last_state[CONTROL_S8];

assign control_state_S1_2_S3 = control_last_state[CONTROL_S2];

assign control_state_S1_2_S4 = control_last_state[CONTROL_S3];

assign control_state_S1_2_S5 = control_last_state[CONTROL_S4];

assign control_state_S1_2_S6 = control_last_state[CONTROL_S5];

assign control_state_S1_2_S7 = control_last_state[CONTROL_S6];

assign control_state_S1_2_S8 = control_last_state[CONTROL_S0];

assign control_state_S2_2_S1 = adc_sample;

assign control_state_S3_2_S1 = adc_sample;

assign control_state_S4_2_S1 = adc_sample;

assign control_state_S5_2_S1 = adc_sample;

assign control_state_S6_2_S1 = adc_sample;

assign control_state_S7_2_S1 = adc_sample;

assign control_state_S8_2_S1 = adc_sample;

always @(posedge SCK or negedge POR)
  begin
    if (~POR)
      control_last_state <= 9'h1;
    else
      control_last_state <= control_state;
  end

always @(posedge SCK or negedge POR)
  begin
    if (~POR)
      control_state <= 9'h1;
    else
      control_state <= control_next_state;
  end

always @(*)
  begin
    control_next_state = 9'h0;
    case (1'b1)
      control_state[CONTROL_S0]  :
                                   begin
                                     if (control_state_S0_2_S1)
                                       control_next_state[CONTROL_S1] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S0] = 1'b1;
                                   end
      control_state[CONTROL_S1]  :
                                   begin
                                     if (control_state_S1_2_S2)
                                       control_next_state[CONTROL_S2] = 1'b1;
                                     else if (control_state_S1_2_S3)
                                       control_next_state[CONTROL_S3] = 1'b1;
                                     else if (control_state_S1_2_S4)
                                       control_next_state[CONTROL_S4] = 1'b1;
                                     else if (control_state_S1_2_S5)
                                       control_next_state[CONTROL_S5] = 1'b1;
                                     else if (control_state_S1_2_S6)
                                       control_next_state[CONTROL_S6] = 1'b1;
                                     else if (control_state_S1_2_S7)
                                       control_next_state[CONTROL_S7] = 1'b1;
                                     else if (control_state_S1_2_S8)
                                       control_next_state[CONTROL_S8] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S1] = 1'b1;
                                   end
      control_state[CONTROL_S2]  :
                                   begin
                                     if (control_state_S2_2_S1)
                                       control_next_state[CONTROL_S1] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S2] = 1'b1;
                                   end
      control_state[CONTROL_S3]  :
                                   begin
                                     if (control_state_S3_2_S1)
                                       control_next_state[CONTROL_S1] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S3] = 1'b1;
                                   end
      control_state[CONTROL_S4]  :
                                   begin
                                     if (control_state_S4_2_S1)
                                       control_next_state[CONTROL_S1] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S4] = 1'b1;
                                   end
      control_state[CONTROL_S5]  :
                                   begin
                                     if (control_state_S5_2_S1)
                                       control_next_state[CONTROL_S1] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S5] = 1'b1;
                                   end
      control_state[CONTROL_S6]  :
                                   begin
                                     if (control_state_S6_2_S1)
                                       control_next_state[CONTROL_S1] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S6] = 1'b1;
                                   end
      control_state[CONTROL_S7]  :
                                   begin
                                     if (control_state_S7_2_S1)
                                       control_next_state[CONTROL_S1] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S7] = 1'b1;
                                   end
      control_state[CONTROL_S8]  :
                                   begin
                                     if (control_state_S8_2_S1)
                                       control_next_state[CONTROL_S1] = 1'b1;
                                     else
                                       control_next_state[CONTROL_S8] = 1'b1;
                                   end
      default                    :
                                   begin
                                     control_next_state[CONTROL_S0] = 1'b1;
                                   end
    endcase
  end

/////////////////////////////////////////////
// Inputs/Outputs
/////////////////////////////////////////////

assign adc_convert = control_state[CONTROL_S8] ? us_dly : ~(control_state[CONTROL_S0] | control_state[CONTROL_S1]) ? ~|adc_delay : 1'b0;

always @(posedge SCK or negedge POR)
  begin
    if (~POR)
      adc_sample <= 1'b0;
    else if (((~(control_state[CONTROL_S0] | control_state[CONTROL_S8]) & adc_ready) | (control_state[CONTROL_S8] & adc_ready)) & ~adc_sample)
      adc_sample <= 1'b1;
    else
      adc_sample <= 1'b0;
  end

always @(posedge SCK or negedge POR)
  begin
    if (~POR)
      adc_frozen <= 1'b0;
    else if (adc_sample)
      adc_frozen <= adc_freeze;
  end

always @(posedge SCK or negedge POR)
  begin
    if (~POR)
      adc_frozen_channel <= 3'h0;
    else if (adc_sample)
      adc_frozen_channel <= adc_fchannel;
  end

always @(posedge SCK or negedge POR)
  begin
    if (~POR)
      adc_delay <= 8'd0;
    else if (control_state[CONTROL_S1])
      adc_delay <= (ch_dly == 2'b11) ? 8'd128 : (ch_dly == 2'b10) ? 8'd8 : (ch_dly == 2'b01) ? 8'd2 : 8'd1;
    else
      adc_delay <= adc_delay >> 1;
  end

always @(*)
  begin
    adc_channel = 3'd0;
    case (1'b1)
      control_state[CONTROL_S0] : adc_channel = (adc_frozen ? adc_frozen_channel : 3'd0);
      control_state[CONTROL_S1] : adc_channel = (adc_frozen ? adc_frozen_channel : 3'd0);
      control_state[CONTROL_S2] : adc_channel = (adc_frozen ? adc_frozen_channel : 3'd1);
      control_state[CONTROL_S3] : adc_channel = (adc_frozen ? adc_frozen_channel : 3'd2);
      control_state[CONTROL_S4] : adc_channel = (adc_frozen ? adc_frozen_channel : 3'd3);
      control_state[CONTROL_S5] : adc_channel = (adc_frozen ? adc_frozen_channel : 3'd4);
      control_state[CONTROL_S6] : adc_channel = (adc_frozen ? adc_frozen_channel : 3'd5);
      control_state[CONTROL_S7] : adc_channel = (adc_frozen ? adc_frozen_channel : 3'd6);
      control_state[CONTROL_S8] : adc_channel = (adc_frozen ? adc_frozen_channel : 3'd7);
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
