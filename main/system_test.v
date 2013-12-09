`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   3:32:00 12/2/2013
// Design Name:   system
// Module Name:   /home/joel/cs3710/main/system_test.v
// Project Name:  main
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: system
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module system_test;

	// Inputs
	reg clk = 0;
	
	// Outputs
	wire [15:0] mem_rd_data;

	// Instantiate the Unit Under Test (UUT)
	system uut (
		.clk(clk), 
		.mem_rd_data(mem_rd_data)
  );

  always begin
    #10; clk = ~clk;
  end
	
  initial begin
		// Initialize Inputs
	end
      
endmodule

