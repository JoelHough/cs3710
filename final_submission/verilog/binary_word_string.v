`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    20:40:31 09/22/2013 
// Design Name: 
// Module Name:    binary_word_string 
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
module binary_word_string #(
    parameter ROW = 0,
    parameter COL = 0
  ) (
    input [4:0] row,
    input [6:0] col,
    input enable,
    input [15:0] data,
    output char_p,
    output [7:0] char
    );

  localparam LENGTH = 18;
  wire [8*18-1:0] char_buf;
  assign char_buf[8*18-1:8*17] = "b";
  assign char_buf[8*9-1:8*8] = "_";

  genvar i;
  generate
    for(i=0;i<8;i=i+1) begin: lo_chars
      assign char_buf[i*8+:8] = data[i] + "0";
    end
    for(i=8;i<16;i=i+1) begin: hi_chars
      assign char_buf[(i+1)*8+:8] = data[i] + "0";
    end
  endgenerate

  assign char_p = enable & col >= COL & col < COL + LENGTH & row == ROW;
  assign char = char_p ? char_buf[(LENGTH + COL - 1 - col) * 8+:8] : 8'b0;
endmodule
