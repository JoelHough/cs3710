`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    14:50:00 09/05/2013 
// Design Name: 
// Module Name:    vga_sync 
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
module vga_sync(
    input clk,
    output blank,
    output sync,
    output next
    );

  /* example parameters for 640x480@60Hz vsync. find more at http://www-mtl.mit.edu/Courses/6.111/labkit/vga.shtml */
  parameter VISIBLE     = 480;
  parameter FRONT_PORCH = 11;
  parameter SYNC_PULSE  = 2;
  parameter BACK_PORCH  = 31;
  localparam SYNC_ON = VISIBLE + FRONT_PORCH;
  localparam SYNC_OFF = SYNC_ON + SYNC_PULSE;
  localparam TOTAL = VISIBLE + FRONT_PORCH + SYNC_PULSE + BACK_PORCH;
  
  wire [$clog2(TOTAL)-1:0] count;
  mod_counter #(.MAX(TOTAL-1)) counter(.clk(clk), .en(1'b1), .reset(1'b0), .count(count), .rollover(next));
  
  assign blank = count >= VISIBLE;
  assign sync = count < SYNC_ON | count >= SYNC_OFF;
endmodule
