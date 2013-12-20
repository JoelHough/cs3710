`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:31:12 12/08/2013
// Design Name:   lfsr
// Module Name:   /home/joel/cs3710/main/lfsr_test.v
// Project Name:  main
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lfsr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lfsr_test;

	// Inputs
	reg clk;

	// Outputs
	wire [15:0] rd_data;

	// Instantiate the Unit Under Test (UUT)
	lfsr uut (
		.clk(clk), 
		.rd_data(rd_data)
	);

  always begin
    #10; clk = ~clk;
  end
	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

