`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    20:40:31 09/22/2013 
// Design Name: 
// Module Name:    binary_string 
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
module binary_string #(
    parameter ROW = 0,
    parameter COL = 0,
    parameter WIDTH = 8
  ) (
    input [4:0] row,
    input [6:0] col,
    input enable,
    input [WIDTH-1:0] data,
    output char_p,
    output [7:0] char
    );

  wire [8*WIDTH-1:0] char_buf;

  genvar i;
  generate
    for(i=0;i<WIDTH;i=i+1) begin: chars
      assign char_buf[i*8+:8] = data[i] + "0";
    end
  endgenerate

  assign char_p = enable & col >= COL & col < COL + WIDTH & row == ROW;
  assign char = char_p ? char_buf[(WIDTH + COL - 1 - col) * 8+:8] : 8'b0;
endmodule
