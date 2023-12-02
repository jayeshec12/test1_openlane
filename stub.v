//=========================================================================
// Project     : 
// Module name : EO0128X8GC180BC01
// Author      : 
// Created on  : April 14, 2023
//
// Description : I2C interface control module
// 
//=========================================================================

module stub (
			// Inputs
			 VDD,
	                VPP,
	                VSS,
			PDIN,
                                                                  
			// Outputs
			PRD,                   
			PPROG,
			PDOB,
		    
			// InOuts
			PA,		 
			PTM,
			PWE );


///////////////////////////////////////////////////////////////////////////
// Ports declaration
///////////////////////////////////////////////////////////////////////////
		 
// Clocks and resets
input [6:0]            PA;
            
// Inputs
input             VDD;
input             VPP;
input             VSS;
input wire [7:0]  PDIN;

// Outputs
output [7:0]           PDOB;

// InOuts
input		  PPROG;      
input		  PRD;
input [1:0]	  PTM;
input		  PWE;


endmodule
