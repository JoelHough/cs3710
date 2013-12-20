`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    16:41:06 09/19/2013 
// Design Name: 
// Module Name:    alu_regfile
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
module alu_regfile(
    input clk,
    input reset,
    input [2:0] a_reg,
    input [2:0] b_reg,
    input [2:0] dest_reg,
    input [15:0] immediate,
    input immediate_p,
    input [alu.OPCODE_WIDTH-1:0] alu_op,
    output [15:0] alu_bus,
    output [15:0] alu_a_in,
    output [15:0] alu_b_in,
    output [4:0] flags,
    output [(16*8)-1:0] reg_bus
    );

  //wire [(16*8)-1:0] reg_bus; // for now we run this external for display
  wire [15:0] reg_b_out;

  /* reg or imm mux for b */
  assign alu_b_in = immediate_p ? immediate : reg_b_out;
  
  /* wire up alu, regfile, and mux's for a and b */
  alu al (.a(alu_a_in), .b(alu_b_in), .opcode(alu_op), .result(alu_bus), .flags(flags));
  register_file #(.NUM_REGS(8)) rf (.enable(dest_reg), .reset(reset), .clk(clk), .data_in(alu_bus), .data_out(reg_bus));
  reg_mux #(.NUM_REGS(8)) a_mux (.data_in(reg_bus), .select(a_reg), .data_out(alu_a_in));
  reg_mux #(.NUM_REGS(8)) b_mux (.data_in(reg_bus), .select(b_reg), .data_out(reg_b_out));
  
endmodule
