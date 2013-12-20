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
    input             clk,
    input [1:0]       pc_op,
    input [15:0]      pc_a,
    output reg [15:0] pc = INITIAL_PC
    );

   parameter INITIAL_PC = 16'b0;
   
  always @(posedge clk)
    case (pc_op)
      2'b00: pc <= pc;
      2'b01: pc <= pc + 1'b1;
      2'b10: pc <= pc + pc_a - 1'b1; // -1 because we increment before branching
      2'b11: pc <= pc_a;
    endcase
endmodule
