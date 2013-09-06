`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    13:15:41 09/05/2013 
// Design Name: 
// Module Name:    vga_controller 
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
module vga_controller(
    input pixel_clk,
    output hsync,
    output vsync,
    output blank,
    output [$clog2(HORIZ_PIXELS)-1:0] x,
    output [$clog2(VERT_PIXELS)-1:0] y
    );

  wire hblank, vblank, new_line;
  wire [$clog2(HORIZ_PIXELS)-1:0] x_unblanked;
  
  //parameter pixel_clk_frequency = 25_175_000;
  
  parameter HORIZ_FRONT_PORCH = 16;
  parameter HORIZ_SYNC_PULSE  = 96;
  parameter HORIZ_BACK_PORCH  = 48;
  parameter HORIZ_PIXELS      = 640;
  
  vga_sync #(
    .VISIBLE(HORIZ_PIXELS),
    .FRONT_PORCH(HORIZ_FRONT_PORCH),
    .SYNC_PULSE(HORIZ_SYNC_PULSE),
    .BACK_PORCH(HORIZ_BACK_PORCH)
    ) h_sync (.clk(pixel_clk), .pixel(x_unblanked), .sync(hsync), .blank(hblank), .next(new_line));

  parameter VERT_FRONT_PORCH = 11;
  parameter VERT_SYNC_PULSE  = 2;
  parameter VERT_BACK_PORCH  = 31;
  parameter VERT_PIXELS      = 480;
  
  vga_sync #(
    .VISIBLE(VERT_PIXELS),
    .FRONT_PORCH(VERT_FRONT_PORCH),
    .SYNC_PULSE(VERT_SYNC_PULSE),
    .BACK_PORCH(VERT_BACK_PORCH)
    ) v_sync (.clk(new_line), .pixel(y), .sync(vsync), .blank(vblank), .next());  

  assign x = vblank ? 1'b0 : x_unblanked;
  assign blank = hblank | vblank;
endmodule
