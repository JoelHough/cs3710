`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:52 12/11/2013 
// Design Name: 
// Module Name:    tank_glyph 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tank_glyph(
						input    tank_y_flip,		// y_flip the tank
						input		tank_direction, 	//1:right, 0:left, x_flip the tank
						input 	[3:0] x_screen,
						input 	[3:0] y_screen,
						output 	output_pixel		//pixel value from memory
						);

//distb ram
   parameter RAM_WIDTH = 16;
   parameter RAM_ADDR_BITS = 4;

   //(* RAM_STYLE="{AUTO | DISTRIBUTED | PIPE_DISTRIBUTED}" *)
   reg [RAM_WIDTH-1:0] shape [(2**RAM_ADDR_BITS)-1:0];
		
	initial
      $readmemb("../tank_shape.bin", shape, 0, 15);
		
	wire 	[3:0] x_index, y_index;
	assign x_index = tank_direction ? 16-x_screen : x_screen;
	assign y_index = !tank_y_flip ? 16-y_screen : y_screen;
   assign output_pixel = shape[y_index][x_index];  

endmodule
