`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:49:41 09/05/2013
// Design Name:   dina_font_rom
// Module Name:   /home/joel/cs3710/vga/dina_font_rom_test.v
// Project Name:  vga
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dina_font_rom
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dina_font_rom_test;

	// Inputs
	reg [7:0] char;
	reg [2:0] x;
	reg [3:0] y;

	// Outputs
	wire pixel;
  
  reg should_be;
  
	// Instantiate the Unit Under Test (UUT)
	dina_font_rom uut (
		.char(char), 
		.x(x), 
		.y(y), 
		.pixel(pixel)
	);

	initial begin
		// Initialize Inputs
    $monitor("char:%d, x:%d, y:%d, pixel:%b-%b", char, x, y, pixel, should_be);
		char = 0;
		x = 0;
		y = 0;
    should_be = 1;
    
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    x = 2; // should be 1
    should_be = 0;
    clk = 1;
    #10;
    clk = 0;
	end
      
endmodule

