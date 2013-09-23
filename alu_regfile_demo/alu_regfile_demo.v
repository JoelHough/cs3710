`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    16:41:06 09/19/2013 
// Design Name: 
// Module Name:    alu_regfile_demo 
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
module alu_regfile_demo(
    input clk
    );

  wire [2:0] a_reg, b_reg, dest_reg;
  wire [15:0] immediate;
  wire immediate_p;
  wire [7:0] alu_op;
  wire [15:0] alu_bus, alu_a_in, alu_b_in;
  wire [4:0] flags;
  wire reset;

  assign reset = 1'b0;

  alu_regfile uut (.clk(clk), .reset(reset),
    .a_reg(a_reg), .b_reg(b_reg), .dest_reg(dest_reg),
    .immediate(immediate), .immediate_p(immediate_p),
    .alu_op(alu_op),
    .alu_bus(alu_bus), .alu_a_in(alu_a_in), .alu_b_in(alu_b_in), .flags(flags));
  
  fib_machine fib (.clk(clk), .reset(reset),
    .a_reg(a_reg), .b_reg(b_reg), .dest_reg(dest_reg),
    .immediate(immediate), .immediate_p(immediate_p),
    .alu_op(alu_op));
  
  
endmodule
