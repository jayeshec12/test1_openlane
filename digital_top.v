//=========================================================================
// Project     : 
// Module name : digital_top
// Author      : 
// Created on  : Nov 2, 2017
//
// Description : Digital interface top module
// 
//=========================================================================

module digital_top (
                    // Inputs
                    VDD,
                    VPP,
                    VSS,
                    POR,
                    EM_RESET,
                    PD_SCL,
                    PD_SDA_IN,
                    AD_PGood,
                    AD_OVP,
                    AD_OCP,
                    AD_OTP,
                    AD_ADDR,
                    AD_ADDR_RDY,
                    AD_OSC,
                    AD_ENable,
                    AD_SS_DONE,

                    // Outputs
                    DP_SDA_OUT,
                    DP_SDA_OE,
                    TM_SCALE,
                    TM_OCSET,
                    TM_RAMP,
                    TM_BG,
                    TM_OSC,
                    TM_Drv_Delay,
                    TM_RDB,
                    TM_Toffmin,
                    TM_FSW,
                    TM_dcm_ramp,
                    TM_Both_drivers_off,
                    TM_Both_drivers_on,
                    TM_HD_ON,
                    TM_LD_ON,
                    TM_OSC_TEST,
                    TM_OC_TRIM,
                    DA_DAC,
                    DA_OCSET,
                    DA_SS_RATE,
                    DA_PGOOD_MODE,
                    DA_DCM,
                    DA_OV_threshold,
                    DA_PG_threshold,
                    DA_OT_threshold,
                    DA_bus_voltage,
                    DA_Enable,
                    DA_OV_response,
                    DA_SCTRLB,
                    DA_RAMP_DONE,
                    DA_INITIALIZED,
                    DA_OSC_EN,
                    DA_NCL_EN,
                    DA_MEM_WRITE_MODE
                   );

///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////

// Clocks and resets
input             POR;
input             PD_SCL;
input             EM_RESET;
input             AD_OSC;

// Inputs
input             VDD;
input             VPP;
input             VSS;
input             PD_SDA_IN;
input             AD_PGood;
input             AD_OVP;
input             AD_OCP;
input             AD_OTP;
input [1:0]       AD_ADDR;
input             AD_ADDR_RDY;
input             AD_ENable;
input             AD_SS_DONE;

// Outputs
output            DP_SDA_OUT;
output            DP_SDA_OE;
output [1:0]      TM_SCALE;
output [4:0]      TM_OCSET;
output [3:0]      TM_RAMP;
output [5:0]      TM_BG;
output [3:0]      TM_OSC;
output [1:0]      TM_Drv_Delay;
output [1:0]      TM_RDB;
output            TM_Toffmin;
output [4:0]      TM_FSW;
output [1:0]      TM_dcm_ramp;
output            TM_Both_drivers_off;
output            TM_Both_drivers_on;
output            TM_HD_ON;
output            TM_LD_ON;
output            TM_OSC_TEST;
output            TM_OC_TRIM;
output [8:0]      DA_DAC;
output [2:0]      DA_OCSET;
output            DA_SS_RATE;
output            DA_PGOOD_MODE;
output            DA_DCM;
output [1:0]      DA_OV_threshold;
output [1:0]      DA_PG_threshold;
output [1:0]      DA_OT_threshold;
output            DA_bus_voltage;
output            DA_Enable;
output            DA_OV_response;
output            DA_SCTRLB;
output            DA_RAMP_DONE;
output            DA_INITIALIZED;
output            DA_OSC_EN;
output            DA_NCL_EN;
output            DA_MEM_WRITE_MODE;

///////////////////////////////////////////////////////////////////////////
// Signals declaration
///////////////////////////////////////////////////////////////////////////

// Register declarations for output signals
reg [8:0]         DA_DAC;
reg [4:0]         TM_FSW;

// Wire declarations for output signals
wire              DP_SDA_OUT;
wire              DP_SDA_OE;
wire [1:0]        TM_SCALE;
wire [4:0]        TM_OCSET;
wire [3:0]        TM_RAMP;
wire [5:0]        TM_BG;
wire [3:0]        TM_OSC;
wire [1:0]        TM_Drv_Delay;
wire [1:0]        TM_RDB;
wire              TM_Toffmin;
wire [1:0]        TM_dcm_ramp;
wire              TM_Both_drivers_off;
wire              TM_Both_drivers_on;
wire              TM_HD_ON;
wire              TM_LD_ON;
wire              TM_OSC_TEST;
wire              TM_OC_TRIM;
wire [2:0]        DA_OCSET;
wire              DA_SS_RATE;
wire              DA_PGOOD_MODE;
wire              DA_DCM;
wire [1:0]        DA_OV_threshold;
wire [1:0]        DA_PG_threshold;
wire [1:0]        DA_OT_threshold;
wire              DA_bus_voltage;
wire              DA_Enable;
wire              DA_OV_response;
wire              DA_SCTRLB;
wire              DA_RAMP_DONE;
wire              DA_INITIALIZED;
wire              DA_OSC_EN;
wire              DA_NCL_EN;
wire              DA_MEM_WRITE_MODE;

// Register declarations for internal signals
reg               POR_d;
reg               POR_dd;
reg               POR_ddd;
reg               User_otp_on_d;
reg               User_otp_on_dd;
reg               User_otp_on_ddd;
reg [4:0]         count_reg;
reg               otp_load;
reg               otp_save;
reg               otp_busy;
reg               wr_lock18;
reg               wr_lock19;
reg [8:0]         rf_data1918;
reg               Status_ovp_sticky;
reg               Status_ocp_sticky;
reg               Status_otp_sticky;

// Wire declarations for internal signals
wire              PD_SCL;
wire              PD_SDA_IN;
wire [6:0]        dev_addr;
wire              wp_enable;
wire              wp_locked;
wire [7:0]        rf_init0;
wire [7:0]        rf_init1;
wire [7:0]        rf_init2;
wire [7:0]        rf_init3;
wire [7:0]        rf_init4;
wire [7:0]        rf_init5;
wire [7:0]        rf_init6;
wire [7:0]        rf_init7;
wire [7:0]        rf_init8;
wire [7:0]        rf_init9;
wire [7:0]        rf_init10;
wire [7:0]        rf_init11;
wire [7:0]        rf_init12;
wire [7:0]        rf_init13;
wire [7:0]        rf_init14;
wire [7:0]        rf_init15;
wire [7:0]        rf_init16;
wire [7:0]        rf_init17;
wire [7:0]        rf_init18;
wire [7:0]        rf_init19;
wire [7:0]        rf_init20;
wire [7:0]        rf_init21;
wire [7:0]        rf_init22;
wire [7:0]        rf_init23;
wire [7:0]        rf_init24;
wire [7:0]        rf_init25;
wire [7:0]        rf_init26;
wire [7:0]        rf_init27;
wire [7:0]        rf_init28;
wire [7:0]        rf_init29;
wire [7:0]        rf_init30;
wire [7:0]        rf_init31;
wire [7:0]        rf_init32;
wire [7:0]        rf_init33;
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
wire [7:0]        em_init0;
wire [7:0]        em_init1;
wire [7:0]        em_init2;
wire [7:0]        em_init3;
wire [7:0]        em_init4;
wire [7:0]        em_init5;
wire [7:0]        em_init6;
wire [7:0]        em_init7;
wire [7:0]        em_init8;
wire [7:0]        em_init9;
wire [7:0]        em_init10;
wire [7:0]        em_init11;
wire [7:0]        em_init12;
wire [7:0]        em_init13;
wire [7:0]        em_init14;
wire [7:0]        em_init15;
wire [7:0]        em_init16;
wire [7:0]        em_init17;
wire [7:0]        em_init18;
wire [7:0]        em_init19;
wire [7:0]        em_init20;
wire [7:0]        em_init21;
wire [7:0]        em_init22;
wire [7:0]        em_init23;
wire [7:0]        em_init24;
wire [7:0]        em_init25;
wire [7:0]        em_init26;
wire [7:0]        em_init27;
wire [7:0]        em_init28;
wire [7:0]        em_init29;
wire [7:0]        em_init30;
wire [7:0]        em_init31;
wire [7:0]        em_init32;
wire [7:0]        em_init33;
wire [7:0]        em_laen0;
wire [7:0]        em_laen1;
wire [7:0]        em_laen2;
wire [7:0]        em_laen3;
wire [7:0]        em_laen4;
wire [7:0]        em_laen5;
wire [7:0]        em_laen6;
wire [7:0]        em_laen7;
wire [7:0]        em_laen8;
wire [7:0]        em_laen9;
wire [7:0]        em_laen10;
wire [7:0]        em_laen11;
wire [7:0]        em_laen12;
wire [7:0]        em_laen13;
wire [7:0]        em_laen14;
wire [7:0]        em_laen15;
wire [7:0]        em_laen16;
wire [7:0]        em_laen17;
wire [7:0]        em_laen18;
wire [7:0]        em_laen19;
wire [7:0]        em_laen20;
wire [7:0]        em_laen21;
wire [7:0]        em_laen22;
wire [7:0]        em_laen23;
wire [7:0]        em_laen24;
wire [7:0]        em_laen25;
wire [7:0]        em_laen26;
wire [7:0]        em_laen27;
wire [7:0]        em_laen28;
wire [7:0]        em_laen29;
wire [7:0]        em_laen30;
wire [7:0]        em_laen31;
wire [2:0]        em_bank;
wire              em_full;
wire              rd_mode;
wire              wr_mode;
wire              rd_done;
wire              wr_done;
wire              rd_busy;
wire              wr_busy;
wire              wr_addr18;
wire              wr_addr19;
wire              i2c_start;
wire              rd_start;
wire              wr_start;

wire [2:0]        user_pointer;
wire [2:0]        trim_pointer;

wire              Status_pgood;
wire              Status_ovp;
wire              Status_ocp;
wire              Status_otp;
wire              Status_enable;
wire              Status_trim_burn;
wire              Status_user_burn;

wire [1:0]        Dac_scale;
wire [5:0]        Bandgap_trim;
wire [4:0]        OC_trim;
wire              NCL_enable;
wire              Osc_always_on;
wire              Min_off_time;
wire [1:0]        Dcm_ramp;
wire [3:0]        Ramp_amplitude;
wire [3:0]        Oscillator_trim;
wire [1:0]        Driver_delay;
wire [1:0]        Deadband;
wire [7:0]        Password_set;
wire [4:0]        Switching_frequency_1;
wire              Vo_range_1_high;
wire [7:0]        Vo_range_1_low;
wire [4:0]        Switching_frequency_2;
wire              Vo_range_2_high;
wire [7:0]        Vo_range_2_low;
wire [4:0]        Switching_frequency_3;
wire              Vo_range_3_high;
wire [7:0]        Vo_range_3_low;
wire [4:0]        Switching_frequency_4;
wire              Vo_range_4_high;
wire [7:0]        Vo_range_4_low;
wire              Max_Vout_protection;
wire              Vout_high_byte;
wire [7:0]        Vout_low_byte;
wire              SS_rate;
wire              SoftStopEnable;
wire              Dcm;
wire              PGControl;
wire [2:0]        OCSet;
wire [7:0]        Base_address;
wire [1:0]        OV_threshold;
wire [1:0]        PG_threshold;
wire [1:0]        OT_threshold;
wire              Bus_voltage_sel;
wire              OV_response;
wire [7:0]        Password_enter;
wire              Write_lock;
wire              Clear_status;
wire              Trim_lock;
wire              Soft_Disable;
wire [2:0]        Testmode;
wire [2:0]        User_otp_bank;
wire [2:0]        Trim_otp_bank;
wire              User_otp_on;
wire              Trim_otp_on;
wire [4:0]        TM_FSW_int;
wire              count_15;
wire              count_30;

wire [1:0]        VPP_mode;

///////////////////////////////////////////////////////////////////////////
// Implementation
///////////////////////////////////////////////////////////////////////////

i2c i2c (
         .POR                    (POR_d),
         .SCL                    (PD_SCL),
         .SDA_IN                 (PD_SDA_IN),
         .dev_addr               (dev_addr),
         .wp_range               (7'h12),
         .wp_enable              (wp_enable),
         .wp_locked              (wp_locked),
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
         .rf_laen0               (em_laen0),
         .rf_laen1               (em_laen1),
         .rf_laen2               (em_laen2),
         .rf_laen3               (em_laen3),
         .rf_laen4               (em_laen4),
         .rf_laen5               (em_laen5),
         .rf_laen6               (em_laen6),
         .rf_laen7               (em_laen7),
         .rf_laen8               (em_laen8),
         .rf_laen9               (em_laen9),
         .rf_laen10              (em_laen10),
         .rf_laen11              (em_laen11),
         .rf_laen12              (em_laen12),
         .rf_laen13              (em_laen13),
         .rf_laen14              (em_laen14),
         .rf_laen15              (em_laen15),
         .rf_laen16              (em_laen16),
         .rf_laen17              (em_laen17),
         .rf_laen18              (em_laen18),
         .rf_laen19              (em_laen19),
         .rf_laen20              (em_laen20),
         .rf_laen21              (em_laen21),
         .rf_laen22              (em_laen22),
         .rf_laen23              (em_laen23),
         .rf_laen24              (em_laen24),
         .rf_laen25              (em_laen25),
         .rf_laen26              (em_laen26),
         .rf_laen27              (em_laen27),
         .rf_laen28              (em_laen28),
         .rf_laen29              (em_laen29),
         .rf_laen30              (em_laen30),
         .rf_laen31              (em_laen31),

         .SDA_OUT                (DP_SDA_OUT),
         .SDA_OE                 (DP_SDA_OE),
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
         .rf_data31              (rf_data31),
         .wr_addr18              (wr_addr18),
         .wr_addr19              (wr_addr19),
         .i2c_start              (i2c_start)
        );

control control (
                 .VDD                    (VDD),
                 .VPP                    (VPP),
                 .VSS                    (VSS),
                 .POR                    (POR),
                 .SCL                    (PD_SCL),
                 .reset                  (POR),
                 .clk                    (AD_OSC),
                 .rd_start               (rd_start),
                 .wr_start               (wr_start),
                 .em_data0               (rf_data0),
                 .em_data1               (rf_data1),
                 .em_data2               (rf_data2),
                 .em_data3               (rf_data3),
                 .em_data4               (rf_data4),
                 .em_data5               (rf_data5),
                 .em_data6               (rf_data6),
                 .em_data7               (rf_data7),
                 .em_data8               (rf_data8),
                 .em_data9               (rf_data9),
                 .em_data10              (rf_data10),
                 .em_data11              (rf_data11),
                 .em_data12              (rf_data12),
                 .em_data13              (rf_data13),
                 .em_data14              (rf_data14),
                 .em_data15              (rf_data15),
                 .em_data16              (rf_data16),
                 .em_data17              (rf_data17),
                 .em_data18              (rf_data18),
                 .em_data19              (rf_data19),
                 .em_data20              (rf_data20),
                 .em_data21              (rf_data21),
                 .em_data22              (rf_data22),
                 .em_data23              (rf_data23),
                 .em_data24              (rf_data24),
                 .em_data25              (rf_data25),
                 .em_data26              (rf_data26),
                 .em_data27              (rf_data27),
                 .em_data28              (rf_data28),
                 .em_data29              (rf_data29),
                 .em_data30              (rf_data30),
                 .em_data31              (rf_data31),
                 `ifdef FPGA_MEM
                 .em_reset               (EM_RESET),
                 `endif

                 .VPP_mode               (VPP_mode),
                 .em_init0               (em_init0),
                 .em_init1               (em_init1),
                 .em_init2               (em_init2),
                 .em_init3               (em_init3),
                 .em_init4               (em_init4),
                 .em_init5               (em_init5),
                 .em_init6               (em_init6),
                 .em_init7               (em_init7),
                 .em_init8               (em_init8),
                 .em_init9               (em_init9),
                 .em_init10              (em_init10),
                 .em_init11              (em_init11),
                 .em_init12              (em_init12),
                 .em_init13              (em_init13),
                 .em_init14              (em_init14),
                 .em_init15              (em_init15),
                 .em_init16              (em_init16),
                 .em_init17              (em_init17),
                 .em_init18              (em_init18),
                 .em_init19              (em_init19),
                 .em_init20              (em_init20),
                 .em_init21              (em_init21),
                 .em_init22              (em_init22),
                 .em_init23              (em_init23),
                 .em_init24              (em_init24),
                 .em_init25              (em_init25),
                 .em_init26              (em_init26),
                 .em_init27              (em_init27),
                 .em_init28              (em_init28),
                 .em_init29              (em_init29),
                 .em_init30              (em_init30),
                 .em_init31              (em_init31),
                 .em_laen0               (em_laen0),
                 .em_laen1               (em_laen1),
                 .em_laen2               (em_laen2),
                 .em_laen3               (em_laen3),
                 .em_laen4               (em_laen4),
                 .em_laen5               (em_laen5),
                 .em_laen6               (em_laen6),
                 .em_laen7               (em_laen7),
                 .em_laen8               (em_laen8),
                 .em_laen9               (em_laen9),
                 .em_laen10              (em_laen10),
                 .em_laen11              (em_laen11),
                 .em_laen12              (em_laen12),
                 .em_laen13              (em_laen13),
                 .em_laen14              (em_laen14),
                 .em_laen15              (em_laen15),
                 .em_laen16              (em_laen16),
                 .em_laen17              (em_laen17),
                 .em_laen18              (em_laen18),
                 .em_laen19              (em_laen19),
                 .em_laen20              (em_laen20),
                 .em_laen21              (em_laen21),
                 .em_laen22              (em_laen22),
                 .em_laen23              (em_laen23),
                 .em_laen24              (em_laen24),
                 .em_laen25              (em_laen25),
                 .em_laen26              (em_laen26),
                 .em_laen27              (em_laen27),
                 .em_laen28              (em_laen28),
                 .em_laen29              (em_laen29),
                 .em_laen30              (em_laen30),
                 .em_laen31              (em_laen31),
                 .em_bank                (em_bank),
                 .em_full                (em_full),
                 .rd_mode                (rd_mode),
                 .wr_mode                (wr_mode),
                 .rd_done                (rd_done),
                 .wr_done                (wr_done),
                 .rd_busy                (rd_busy),
                 .wr_busy                (wr_busy)
                );

/////////////////////////////////////////////
// Inputs/Outputs
/////////////////////////////////////////////

assign wp_enable = Trim_lock | (Password_enter != Password_set);

assign wp_locked = Write_lock & em_full;

assign dev_addr = AD_ADDR_RDY ? rf_data22[6:0] + AD_ADDR : rf_data22[6:0];

assign rf_init0 = ~POR_dd ? 8'h00 : em_init0;

assign rf_init1 = ~POR_dd ? 8'h00 : em_init1;

assign rf_init2 = ~POR_dd ? 8'h00 : em_init2;

assign rf_init3 = ~POR_dd ? 8'h04 : em_init3;

assign rf_init4 = ~POR_dd ? 8'h00 : em_init4;

assign rf_init5 = ~POR_dd ? 8'h00 : em_init5;

assign rf_init6 = ~POR_dd ? 8'h00 : em_init6;

assign rf_init7 = ~POR_dd ? 8'h00 : em_init7;

assign rf_init8 = ~POR_dd ? 8'h00 : em_init8;

assign rf_init9 = ~POR_dd ? 8'h00 : em_init9;

assign rf_init10 = ~POR_dd ? 8'h10 : em_init10;

assign rf_init11 = ~POR_dd ? 8'ha0 : em_init11;

assign rf_init12 = ~POR_dd ? 8'h10 : em_init12;

assign rf_init13 = ~POR_dd ? 8'ha0 : em_init13;

assign rf_init14 = ~POR_dd ? 8'h10 : em_init14;

assign rf_init15 = ~POR_dd ? 8'ha0 : em_init15;

assign rf_init16 = ~POR_dd ? 8'h10 : em_init16;

assign rf_init17 = ~POR_dd ? 8'ha0 : em_init17;

assign rf_init18 = ~POR_dd ? 8'h00 : em_init18;

assign rf_init19 = ~POR_dd ? 8'ha0 : em_init19;

assign rf_init20 = ~POR_dd ? 8'h01 : em_init20;

assign rf_init21 = ~POR_dd ? 8'h00 : em_init21;

assign rf_init22 = ~POR_dd ? 8'h08 : em_init22;

assign rf_init23 = ~POR_dd ? 8'h03 : em_init23;

assign rf_init24 = ~POR_dd ? 8'h02 : em_init24;

assign rf_init25 = ~POR_dd ? 8'h03 : em_init25;

assign rf_init26 = ~POR_dd ? 8'h02 : em_init26;

assign rf_init27 = ~POR_dd ? 8'h00 : em_init27;

assign rf_init28 = ~POR_dd ? 8'h10 : em_init28;

assign rf_init29 = ~POR_dd ? 8'h00 : em_init29;

assign rf_init30 = ~POR_dd ? 8'h00 : em_init30;

assign rf_init31 = ~POR_dd ? 8'h00 : em_init31;

assign rf_init32 = ~POR ? 8'h00 : {2'b00, user_pointer, trim_pointer};

assign rf_init33 = ~POR ? 8'h00 : {Status_pgood, Status_ovp, Status_ocp, Status_otp, Status_enable, Status_trim_burn, Status_user_burn, Clear_status};

assign user_pointer = em_bank;

assign trim_pointer = em_bank;

assign Status_pgood = AD_PGood;

assign Status_ovp = OV_response ? AD_OVP : Status_ovp_sticky;

assign Status_ocp = Status_ocp_sticky;

assign Status_otp = Status_otp_sticky;

assign Status_enable = DA_Enable;

assign Status_trim_burn = otp_save;

assign Status_user_burn = otp_save;

assign TM_SCALE = Dac_scale;

assign TM_OCSET = OC_trim;

assign TM_RAMP = Ramp_amplitude;

assign TM_BG = Bandgap_trim;

assign TM_OSC = Oscillator_trim;

assign TM_Drv_Delay = Driver_delay;

assign TM_RDB = Deadband;

assign TM_Toffmin = Min_off_time;

assign TM_dcm_ramp = Dcm_ramp;

assign TM_Both_drivers_off = (Testmode == 3'd3) ? 1'b1 : 1'b0; 

assign TM_Both_drivers_on = (Testmode == 3'd6) ? 1'b1 : 1'b0;

assign TM_HD_ON = (Testmode == 3'd4) ? 1'b1 : 1'b0;

assign TM_LD_ON = (Testmode == 3'd5) ? 1'b1 : 1'b0;

assign TM_OSC_TEST = (Testmode == 3'd1) ? 1'b1 : 1'b0;

assign TM_OC_TRIM = (Testmode == 3'd2) ? 1'b1 : 1'b0;

assign TM_FSW_int = ({Vout_high_byte, Vout_low_byte} < {Vo_range_1_high, Vo_range_1_low}) ? Switching_frequency_1 :
                    ({Vout_high_byte, Vout_low_byte} < {Vo_range_2_high, Vo_range_2_low}) ? Switching_frequency_2 :
                    ({Vout_high_byte, Vout_low_byte} < {Vo_range_3_high, Vo_range_3_low}) ? Switching_frequency_3 :
                    ({Vout_high_byte, Vout_low_byte} < {Vo_range_4_high, Vo_range_4_low}) ? Switching_frequency_4 : TM_FSW;

always @(posedge DA_Enable or negedge POR)
  begin
    if (~POR)
      TM_FSW <= 5'h08;
    else
      TM_FSW <= TM_FSW_int;
  end

assign Dac_scale = rf_data0[1:0];

assign Bandgap_trim = rf_data1[5:0];

assign OC_trim = rf_data2[4:0];

assign NCL_enable = rf_data3[2];

assign Osc_always_on = rf_data3[1];

assign Min_off_time = rf_data3[0];

assign Dcm_ramp = rf_data4[1:0];

assign Ramp_amplitude = rf_data5[3:0];

assign Oscillator_trim = rf_data6[3:0];

assign Driver_delay = rf_data7[1:0];

assign Deadband = rf_data8[1:0];

assign Password_set = rf_data9[7:0];

assign Switching_frequency_1 = rf_data10[5:1];

assign Vo_range_1_high = rf_data10[0];

assign Vo_range_1_low = rf_data11[7:0];

assign Switching_frequency_2 = rf_data12[5:1];

assign Vo_range_2_high = rf_data12[0];

assign Vo_range_2_low = rf_data13[7:0];

assign Switching_frequency_3 = rf_data14[5:1];

assign Vo_range_3_high = rf_data14[0];

assign Vo_range_3_low = rf_data15[7:0];

assign Max_Vout_protection = rf_data16[7];

assign Switching_frequency_4 = rf_data16[5:1];

assign Vo_range_4_high = rf_data16[0];

assign Vo_range_4_low = rf_data17[7:0];

assign Vout_high_byte = rf_data1918[8];

assign Vout_low_byte = rf_data1918[7:0];

assign SS_rate = rf_data20[3];

assign SoftStopEnable = rf_data20[2];

assign Dcm = rf_data20[1];

assign PGControl = rf_data20[0];

assign OCSet = rf_data21[2:0];

assign Base_address = rf_data22[7:0];

assign OV_threshold = rf_data23[1:0];

assign PG_threshold = rf_data24[1:0];

assign OT_threshold = rf_data25[1:0];

assign Bus_voltage_sel = rf_data26[1];

assign OV_response = rf_data26[0];

assign Password_enter = rf_data27[7:0];

assign Write_lock = rf_data28[7];

assign Clear_status = rf_data28[5];

assign Trim_lock = rf_data28[4];

assign Soft_Disable = rf_data28[3];

assign Testmode = rf_data28[2:0];

assign User_otp_bank = rf_data29[7:5];

assign Trim_otp_bank = rf_data29[4:2];

assign User_otp_on = rf_data29[1];

assign Trim_otp_on = rf_data29[0];

assign DA_OCSET = OCSet;

assign DA_SS_RATE = SS_rate;

assign DA_PGOOD_MODE = PGControl;

assign DA_DCM = Dcm;

assign DA_OV_threshold = OV_threshold;

assign DA_PG_threshold = PG_threshold;

assign DA_OT_threshold = OT_threshold;

assign DA_bus_voltage = Bus_voltage_sel;

assign DA_Enable = (AD_ENable & DA_INITIALIZED & AD_ADDR_RDY) ? 1'b1 : 1'b0;

assign DA_OV_response = OV_response;

assign DA_SCTRLB = (SoftStopEnable & Soft_Disable) ? 1'b0 : 1'b1;

assign DA_RAMP_DONE = (DA_DAC == {Vout_high_byte, Vout_low_byte}) ? 1'b1 : 1'b0;

assign DA_INITIALIZED = otp_load;

assign DA_OSC_EN = Osc_always_on | i2c_start | otp_busy | rd_busy | wr_busy | ~DA_RAMP_DONE | ~POR_ddd;

assign DA_NCL_EN = NCL_enable;

assign DA_MEM_WRITE_MODE = VPP_mode[1];

assign count_15 = (count_reg == 5'd14) ? 1'b1 : 1'b0;

assign count_30 = (count_reg == 5'd30) ? 1'b1 : 1'b0;

always @(posedge AD_OSC or negedge POR)
  begin
    if (~POR)
      count_reg <= 5'd0;
    else
      count_reg <= (count_reg == 5'd30) ? 5'd0 : count_reg + 1;
  end

always @(posedge AD_OSC or negedge POR)
  begin
    if (~POR)
      DA_DAC <= 9'h0a0;
    else if (~AD_SS_DONE)
      DA_DAC <= {Vout_high_byte, Vout_low_byte};
    else if (AD_SS_DONE & (DA_DAC < {Vout_high_byte, Vout_low_byte}))
      if (SS_rate)
        DA_DAC <= (count_30 | count_15) ? DA_DAC + 1 : DA_DAC;
      else
        DA_DAC <= (count_30) ? DA_DAC + 1 : DA_DAC;
    else if (AD_SS_DONE & (DA_DAC > {Vout_high_byte, Vout_low_byte}))
      if (SS_rate)
        DA_DAC <= (count_30 | count_15) ? DA_DAC - 1 : DA_DAC;
      else
        DA_DAC <= (count_30) ? DA_DAC - 1 : DA_DAC;
  end

always @(posedge AD_OSC or negedge POR)
  begin
    if (~POR)
      otp_load <= 1'b0;
    else if (rd_start)
      otp_load <= 1'b0;
    else if (rd_done)
      otp_load <= 1'b1;
  end

always @(posedge AD_OSC or negedge POR)
  begin
    if (~POR)
      otp_save <= 1'b0;
    else if (wr_start)
      otp_save <= 1'b0;
    else if (wr_done)
      otp_save <= 1'b1;
  end

always @(posedge AD_OSC or negedge POR)
  begin
    if (~POR)
      begin
        POR_d <= 1'd0;
        POR_dd <= 1'd0;
        POR_ddd <= 1'd0;
      end
    else
      begin
        POR_d <= POR;
        POR_dd <= POR_d;
        POR_ddd <= POR_dd;
      end
  end

always @(posedge AD_OSC or negedge POR)
  begin
    if (~POR)
      begin
        User_otp_on_d <= 1'd0;
        User_otp_on_dd <= 1'd0;
        User_otp_on_ddd <= 1'd0;
      end
    else
      begin
        User_otp_on_d <= User_otp_on;
        User_otp_on_dd <= User_otp_on_d;
        User_otp_on_ddd <= User_otp_on_dd;
      end
  end

always @(wr_start or rd_start or wr_done or rd_done or POR)
  begin
    if (~POR)
      otp_busy <= 1'b0;
    else if (wr_start | rd_start)
      otp_busy <= 1'b1;
    else if (wr_done | rd_done)
      otp_busy <= 1'b0;
  end

always @(AD_OVP or DA_Enable or Clear_status)
  begin
    if (AD_OVP)
      Status_ovp_sticky <= 1'b1;
    else if (~DA_Enable | Clear_status)
      Status_ovp_sticky <= 1'b0;
  end

always @(AD_OCP or DA_Enable or Clear_status)
  begin
    if (AD_OCP)
      Status_ocp_sticky <= 1'b1;
    else if (~DA_Enable | Clear_status)
      Status_ocp_sticky <= 1'b0;
  end

always @(AD_OTP or DA_Enable or Clear_status)
  begin
    if (AD_OTP)
      Status_otp_sticky <= 1'b1;
    else if (~DA_Enable | Clear_status)
      Status_otp_sticky <= 1'b0;
  end

always @(posedge PD_SCL or negedge POR)
  begin
    if (~POR)
      wr_lock18 <= 1'b0;
    else if (wr_addr18)
      wr_lock18 <= ~wr_lock18;
  end

always @(posedge PD_SCL or negedge POR)
  begin
    if (~POR)
      wr_lock19 <= 1'b0;
    else if (wr_addr19)
      wr_lock19 <= ~wr_lock19;
  end

always @(posedge PD_SCL or negedge POR or posedge rd_done)
  begin
    if (~POR)
      rf_data1918 <= 9'h0a0;
    else if (rd_done)
      rf_data1918 <= Max_Vout_protection & ({Vout_high_byte, Vout_low_byte} > {Vo_range_4_high, Vo_range_4_low}) ? {Vo_range_4_high, Vo_range_4_low} : {rf_data18[0], rf_data19};
    else if (~(wr_lock18 ^ wr_lock19))
      rf_data1918 <= Max_Vout_protection & ({Vout_high_byte, Vout_low_byte} > {Vo_range_4_high, Vo_range_4_low}) ? {Vo_range_4_high, Vo_range_4_low} : {rf_data18[0], rf_data19};
  end

assign rd_start = POR_dd & ~POR_ddd;

assign wr_start = User_otp_on_dd & ~User_otp_on_ddd;

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
