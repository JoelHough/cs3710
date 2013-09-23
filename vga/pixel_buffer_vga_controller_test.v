`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:33:24 09/23/2013
// Design Name:   pixel_buffer_vga_controller
// Module Name:   /home/joel/cs3710/vga/pixel_buffer_vga_controller_test.v
// Project Name:  vga
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pixel_buffer_vga_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pixel_buffer_vga_controller_test;

	// Inputs
	reg [7:0] pixel;
	reg wr_clk;
	reg wr_en;
	reg pixel_clk;

	// Outputs
	wire wr_rq;
	wire resync;
	wire [7:0] color;
	wire hsync;
	wire vsync;

	// Instantiate the Unit Under Test (UUT)
	pixel_buffer_vga_controller uut (
		.pixel(pixel), 
		.wr_clk(wr_clk), 
		.wr_en(wr_en), 
		.pixel_clk(pixel_clk), 
		.wr_rq(wr_rq), 
		.resync(resync), 
		.color(color), 
		.hsync(hsync), 
		.vsync(vsync)
	);

  integer i;
	initial begin
		// Initialize Inputs
		pixel = 0;
		wr_clk = 0;
		wr_en = 0;
		pixel_clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    for(i=0;i < 640 * 480 * 3; i = i + 1) begin
      pixel_clk = 1;
      wr_clk = 1;
      #10;
      if (wr_en) begin
        pixel = pixel + 1;
      end
      wr_en = wr_rq;
      
      pixel_clk = 0;
      wr_clk = 0;
      #10;
    end
	end
      
endmodule

