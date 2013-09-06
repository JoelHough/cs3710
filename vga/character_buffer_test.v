`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   21:04:53 09/05/2013
// Design Name:   character_buffer
// Module Name:   /home/joel/cs3710/vga/character_buffer_test.v
// Project Name:  vga
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: character_buffer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module character_buffer_test;

	// Inputs
	reg write_clk;
	reg [4:0] write_row;
	reg [6:0] write_col;
	reg [7:0] write_char;
  reg read_clk;
	reg [4:0] read_row;
	reg [6:0] read_col;

	// Outputs
	wire [7:0] read_char;
  
	// Instantiate the Unit Under Test (UUT)
	character_buffer uut (
		.write_clk(write_clk), 
		.write_row(write_row), 
		.write_col(write_col), 
		.write_char(write_char),
    .read_clk(read_clk),
		.read_row(read_row), 
		.read_col(read_col), 
		.read_char(read_char)
	);

	initial begin
    $monitor("row:%d, col:%d, char:%d", read_row, read_col, read_char);
		// Initialize Inputs
		write_clk = 0;
		write_row = 0;
		write_col = 0;
		write_char = 0;
		read_row = 0;
		read_col = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    write_char = 106;
    write_clk = 1;
    #10;
    write_clk = 0;
    read_clk = 1;
    #10;
    read_clk = 0;
    write_row = 14;
    write_col = 30;
    write_char = 65;
    write_clk = 1;
    #10;
    write_clk = 0;
    read_row = 14;
    read_col = 30;
    #10;
    read_clk = 1;
    #10;
    read_clk = 0;
    #10;
  end
      
endmodule

