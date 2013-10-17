`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    05:46:46 10/17/2013 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter(
    input clk,
    input en,
    input rst,
    input [1:0] op,
    input [15:0] a,
    output reg [15:0] pc = 16'b0
    );

  always @(posedge clk or posedge rst)
    if (rst) pc <= 16'b0;
    else if (en)
      case (op)
        2'b00: pc <= pc;
        2'b01: pc <= pc + 1'b1;
        2'b10: pc <= pc + a;
        2'b11: pc <= a;
      endcase
endmodule
