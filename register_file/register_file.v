`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    17:00:54 09/17/2013 
// Design Name: 
// Module Name:    register_file 
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
module register_file #(
    parameter WIDTH = 16,
    parameter NUM_REGS = 16
  ) (
    input wr_en,
    input [$clog2(NUM_REGS)-1:0] wr_reg,
    input reset,
    input clk,
    input [WIDTH-1:0] data_in,
    output [(NUM_REGS*WIDTH)-1:0] data_out
    );
  /* note that data in is always written to the enabled register on a clk */
  wire [NUM_REGS-1:0] enable_bits;
  assign enable_bits = {NUM_REGS{wr_en}} & 2'b10 ** wr_reg;
  register #(.WIDTH(WIDTH)) r[NUM_REGS-1:0](.enable(enable_bits), .reset(reset), .clk(clk), .data_in(data_in), .data_out(data_out));

endmodule
