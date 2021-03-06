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
    output blank
    );

  /* generates syncs, blank, and current visible pixel x and y from a pixel clock.
     defaults to 640x480 timings */
  wire hblank, vblank, new_line;
  
  //parameter pixel_clk_frequency = 25_175_000;
  
  /* hsync */
  parameter HORIZ_FRONT_PORCH = 16;
  parameter HORIZ_SYNC_PULSE  = 96;
  parameter HORIZ_BACK_PORCH  = 48;
  parameter HORIZ_PIXELS      = 640;
  
  vga_sync #(
    .VISIBLE(HORIZ_PIXELS),
    .FRONT_PORCH(HORIZ_FRONT_PORCH),
    .SYNC_PULSE(HORIZ_SYNC_PULSE),
    .BACK_PORCH(HORIZ_BACK_PORCH)
    ) h_sync (.clk(pixel_clk), .sync(hsync), .blank(hblank), .next(new_line));

  /* vsync
     note that this is clocked by the hsync new line signal, so all counts are in lines */
  parameter VERT_FRONT_PORCH = 11;
  parameter VERT_SYNC_PULSE  = 2;
  parameter VERT_BACK_PORCH  = 31;
  parameter VERT_PIXELS      = 480;
  
  vga_sync #(
    .VISIBLE(VERT_PIXELS),
    .FRONT_PORCH(VERT_FRONT_PORCH),
    .SYNC_PULSE(VERT_SYNC_PULSE),
    .BACK_PORCH(VERT_BACK_PORCH)
    ) v_sync (.clk(new_line), .sync(vsync), .blank(vblank), .next());  

  assign blank = hblank | vblank;
endmodule
