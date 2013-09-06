`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    20:31:53 09/05/2013 
// Design Name: 
// Module Name:    character_buffer 
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
module character_buffer(
  input write_clk,
  input [4:0] write_row,
  input [6:0] write_col,
  input [7:0] write_char,
  input read_clk,
  input [4:0] read_row,
  input [6:0] read_col,
  output reg [7:0] read_char
    );

  parameter ROWS = 30;
  parameter COLS = 80;

  reg [7:0] buffer[4095:0];
  wire [11:0] write_address = {write_row, write_col};
  wire [11:0] read_address = {read_row, read_col};
  
  always @(posedge write_clk)
    buffer[write_address] <= write_char;
  
  always @(posedge read_clk)
    read_char <= buffer[read_address];
endmodule
