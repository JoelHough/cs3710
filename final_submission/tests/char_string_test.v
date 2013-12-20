`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   21:02:52 09/22/2013
// Design Name:   char_string
// Module Name:   /home/joel/cs3710/vga/char_string_test.v
// Project Name:  vga
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: char_string
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module char_string_test;
  integer i, j;

	// Inputs
	reg [4:0] row;
	reg [6:0] col;
  reg enable;
  
	// Outputs
	wor [7:0] char;
  wire char_p;

  assign char = char_p ? 8'b0 : ".";
	// Instantiate the Unit Under Test (UUT)
	char_string #(.ROW(3), .COL(5)) uut (
		.row(row), 
		.col(col),
    .enable(enable),
    .char_p(char_p),
		.char(char)
	);

	initial begin
		// Initialize Inputs
		row = 0;
		col = 0;
    enable = 1;
		// Wait 100 ns for global reset to finish
		#10;
        
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

