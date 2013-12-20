`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    20:40:31 09/22/2013 
// Design Name: 
// Module Name:    hex_string 
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
module hex_string #(
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

  localparam LENGTH = 6;
  wire [8*6-1:0] char_buf;
  assign char_buf[47:32] = "0x";
  
  genvar i;
  generate
    for(i=0;i<4;i=i+1) begin: chars
      assign char_buf[i*8+:8] = data[i*4+:4] <= 4'd9 ? "0" + data[i*4+:4] : "A" - 4'd10 + data[i*4+:4];
    end
  endgenerate

  assign char_p = enable & col >= COL & col < COL + LENGTH & row == ROW;
  assign char = char_p ? char_buf[(LENGTH + COL - 1 - col) * 8+:8] : 8'b0;
endmodule
