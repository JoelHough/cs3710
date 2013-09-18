`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   17:50:35 09/17/2013
// Design Name:   reg_mux
// Module Name:   /home/joel/cs3710/register_file/mux_test.v
// Project Name:  register_file
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_test;

	// Inputs
	reg [7:0] data_in;
	reg [1:0] select;

	// Outputs
	wire [1:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	reg_mux #(.WIDTH(2), .NUM_REGS(4)) uut (
		.data_in(data_in), 
		.select(select), 
		.data_out(data_out)
	);

	initial begin
    $monitor("in:%b, sel:%b, out:%b", data_in, select, data_out);
		// Initialize Inputs
		data_in = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    data_in = 8'b0001_1011;
    #10;
    select = 2'b01;
    #10;
    select = 2'b10;
    #10;
    select = 2'b11;
    #10;
	end
      
endmodule

