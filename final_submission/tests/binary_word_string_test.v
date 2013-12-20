`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   23:14:42 09/22/2013
// Design Name:   binary_word_string
// Module Name:   /home/joel/cs3710/vga/binary_word_string_test.v
// Project Name:  vga
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: binary_word_string
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module binary_word_string_test;

	// Inputs
	reg [4:0] row;
	reg [6:0] col;
	reg enable;
	reg [15:0] data;

	// Outputs
	wire char_p;
	wor [7:0] char;

  assign char = char_p ? 8'b0 : ".";
  
	// Instantiate the Unit Under Test (UUT)
	binary_word_string #(.ROW(3), .COL(5)) uut (
		.row(row), 
		.col(col), 
		.enable(enable), 
		.data(data), 
		.char_p(char_p), 
		.char(char)
	);

  integer i, j;
	initial begin
		// Initialize Inputs
		row = 0;
		col = 0;
		enable = 1;
		data = 16'b10010110_10100101;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    for(i=0;i<16;i=i+1)
    begin
      for(j=0;j<32;j=j+1)
      begin
        col = j;
        row = i;
        #10;
        $write("%c", char);
      end
      $write("\n");
    end
	end
      
endmodule

