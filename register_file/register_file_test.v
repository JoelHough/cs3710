`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   18:03:26 09/17/2013
// Design Name:   register_file
// Module Name:   /home/joel/cs3710/register_file/register_file_test.v
// Project Name:  register_file
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_file_test;

	// Inputs
	reg [1:0] enable;
	reg reset;
	reg clk;
	reg [1:0] data_in;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	register_file #(.WIDTH(2), .NUM_REGS(4)) uut (
		.enable(enable), 
		.reset(reset), 
		.clk(clk), 
		.data_in(data_in), 
		.data_out(data_out)
	);

	initial begin
    $monitor("enable:%b, reset:%b, clk:%b, data_in:%b, data_out:%b", enable, reset, clk, data_in, data_out);
 
		// Initialize Inputs
		enable = 0;
		reset = 0;
		clk = 0;
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    clk = 1;
    #10;
    clk = 0;
    data_in = 2'b11;
    enable = 2'b00;
    #10;
    clk = 1;
    #10;
    clk = 0;
    data_in = 2'b11;
    enable = 2'b01;
    #10;
    clk = 1;
    #10;
    clk = 0;
    data_in = 2'b10;
    enable = 2'b10;
    #10;
    clk = 1;
    #10;
    clk = 0;
    data_in = 2'b11;
    enable = 2'b11;
    #10;
    clk = 1;
    #10;
    clk = 0;
    data_in = 2'b01;
    enable = 2'b10;
    #10;
    clk = 1;
    #5;
    reset = 1;
    #5;
    clk = 0;
    reset = 0;
    #10;
	end
      
endmodule

