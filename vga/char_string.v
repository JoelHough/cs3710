`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    20:40:31 09/22/2013 
// Design Name: 
// Module Name:    char_string 
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
module char_string #(
    parameter STRING = "I am a test string",
    parameter LENGTH = 18,
    parameter ROW = 0,
    parameter COL = 0
  ) (
    input [4:0] row,
    input [6:0] col,
    input enable,
    output char_p,
    output [7:0] char
    );

  assign char_p = enable & col >= COL & col < COL + LENGTH & row == ROW;
  assign char = char_p ? STRING[(LENGTH + COL - 1 - col) * 8+:8] : 8'b0;
endmodule
