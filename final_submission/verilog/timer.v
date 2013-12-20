`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    23:04:08 12/08/2013 
// Design Name: 
// Module Name:    timer 
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
module timer(
    input clk,
    input cnt_en,
    input wr_en,
    input [15:0] wr_data,
    output done
    );

  reg [15:0] count = 16'b0;
  assign done = count == 16'b0;
  
  always @(posedge clk)
    if (wr_en)
      count <= wr_data;
    else if (cnt_en & ~done)
      count <= count - 1'b1;
endmodule
