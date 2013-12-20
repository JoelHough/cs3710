`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    20:50:14 12/08/2013 
// Design Name: 
// Module Name:    lfsr 
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
module lfsr(
    input clk,
    input en,
    input rst,
    output [15:0] rd_data
    );

  reg [16:0] data = 17'h1BEEF;
  assign rd_data = data[15:0];
  
  always @(posedge clk)
    if (rst)
      data <= 17'hBEEF;
    else if (en)
      data <= {data[15:0], data[16] ^ data[13]};
endmodule
