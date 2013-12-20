`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   16:50:41 09/05/2013
// Design Name:   vga_controller
// Module Name:   /home/joel/cs3710/vga/vga_controller_test.v
// Project Name:  vga
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_controller_test;

	// Inputs
	reg pixel_clk;

	// Outputs
	wire hsync;
	wire vsync;
	wire blank;
  localparam H_PIXELS = 10;
  localparam V_PIXELS = 5;
	wire [$clog2(H_PIXELS-1):0] x;
	wire [$clog2(V_PIXELS-1):0] y;

	// Instantiate the Unit Under Test (UUT)
	vga_controller #( .HORIZ_PIXELS(H_PIXELS),
                    .HORIZ_FRONT_PORCH(3),
                    .HORIZ_BACK_PORCH(4),
                    .HORIZ_SYNC_PULSE(2),
                    .VERT_PIXELS(V_PIXELS),
                    .VERT_FRONT_PORCH(1),
                    .VERT_BACK_PORCH(1),
                    .VERT_SYNC_PULSE(2)
                    ) uut (
		.pixel_clk(pixel_clk), 
		.hsync(hsync), 
		.vsync(vsync), 
		.blank(blank), 
		.x(x), 
		.y(y)
	);

  integer i;
	initial begin
		// Initialize Inputs
		pixel_clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
    
    // Add stimulus here
    for(i=0;i<1000;i=i+1) begin
      #20;
      pixel_clk = 1;
      #20;
      pixel_clk = 0;
    end
		
	end
      
endmodule

