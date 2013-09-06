`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    22:15:51 09/05/2013 
// Design Name: 
// Module Name:    vga_character_display 
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
module vga_character_display(
    input write_clk,
    input [4:0] row,
    input [6:0] col,
    input [7:0] char,
    input pixel_clk,
    output [7:0] color,
    output hsync,
    output vsync
    );

  wire [7:0] display_char;
  wire [2:0] display_char_x;
  wire [3:0] display_char_y;
  wire pixel;
  wire blank;
  
  wire [6:0] screen_x;
  wire [4:0] screen_y;
  
  dina_font_rom characters (.clk(pixel_clk), .char(display_char), .x(display_char_x), .y(display_char_y), .pixel(pixel));
  
  character_buffer buffer (.write_clk(write_clk), .write_row(row), .write_col(col), .write_char(char),
    .read_clk(pixel_clk), .read_row(screen_y), .read_col(screen_x), .read_char(display_char));
  
  vga_controller controller ( .pixel_clk(pixel_clk),
                              .hsync(hsync),
                              .vsync(vsync),
                              .blank(blank),
                              .x({screen_x, display_char_x}),
                              .y({screen_y, display_char_y}));
  
  assign color = blank ? 8'b0 : (pixel ? 8'b11_111_111 : 8'b10_010_010);
endmodule
