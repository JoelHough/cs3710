`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:11:34 09/06/2013
// Design Name:   display_onboard_test
// Module Name:   /home/joel/cs3710/vga/display_test.v
// Project Name:  vga
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: display_onboard_test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module display_test;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] vgaColor;
	wire Hsync;
	wire Vsync;

  integer i;
  
	// Instantiate the Unit Under Test (UUT)
	display_onboard_test uut (
		.clk(clk), 
		.vgaColor(vgaColor), 
		.Hsync(Hsync), 
		.Vsync(Vsync)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    for(i=0;i<100000;i=i+1) begin
      #10;
      clk = 1;
      #10;
      clk = 0;
      
    end
	end
      
endmodule

