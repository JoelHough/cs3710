`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    21:46:13 10/17/2013 
// Design Name: 
// Module Name:    cpu 
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
module cpu(
    input clk,
    input en,
    input reset,
    input [0:0] mem_addr,
    input [0:0] mem_data_in,
    output [0:0] mem_data_out
    );

  wire [15:0] alu_a_in;
  wire [15:0] alu_b_in;
  wire [3:0] alu_op;
  wire [15:0] alu_result;
  wire [4:0] alu_flags;
  alu alu_module (.a(alu_a_in), .b(alu_b_in), .opcode(alu_op), .result(alu_result), .flags(alu_flags));
  
  wand reg_wr_en;
  wire [2:0] wr_reg;
  wor [15:0] reg_data_in;
  wire [8*15-1:0] regs_out;
  register_file #(.NUM_REGS(8)) register_file_module (.wr_en(reg_wr_en), .wr_reg(wr_reg), .reset(reset), .clk(clk), .data_in(reg_data_in), .data_out(regs_out));
  
  wire [2:0] a_reg_sel;
  wire [2:0] b_reg_sel;
  wire [15:0] a_reg;
  wire [15:0] b_reg;
  reg_mux #(.NUM_REGS(8)) a_mux_module (.data_in(regs_out), .select(a_reg_sel), .data_out(a_reg));
  reg_mux #(.NUM_REGS(8)) b_mux_module (.data_in(regs_out), .select(b_reg_sel), .data_out(b_reg));
  
  wire pc_en;
  wire [1:0] pc_op;
  wire [15:0] pc;
  program_counter pc_module (
    .clk(clk),
    .en(pc_en),
    .rst(reset),
    .op(pc_op),
    .a(alu_b_in),
    .pc(pc));
  
  wire [3:0] pc_cond;
  wire cond_p;
  flag_cond cond_module (.cond(pc_cond), .flags(alu_flags), .p(cond_p));

  reg [15:0] inst = 16'b0101_0000_0000_0001; // ADDI 1, R0
  wire [7:0] imm;
  wire imm_en;
  wand mem_rd_en, alu_result_en, mem_wr_en, alu_flag_en;
  control control_module (
    .inst(inst),
    .alu_op(alu_op),
    .a_reg(a_reg_sel),
    .pc_op(pc_op),
    .pc_cond(pc_cond),
    .b_reg(b_reg_sel),
    .imm(imm),
    .imm_en(imm_en),
    .mem_rd_en(mem_rd_en),
    .alu_result_en(alu_result_en),
    .pc_result_en(pc_result_en),
    .reg_wr_en(reg_wr_en),
    .mem_wr_en(mem_wr_en),
    .alu_flag_en(alu_flag_en));

  wire fetch, execute, store;
  control_state control_state_module (.clk(clk), .en(en), .reset(reset), .fetch(fetch), .execute(execute), .store(store));
endmodule
