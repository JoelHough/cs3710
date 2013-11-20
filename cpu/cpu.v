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
    input [15:0] mem_data_in,
    output [15:0] mem_addr,
    output mem_wr_en,
    output mem_rd_en,
    output [15:0] mem_data_out
    );

  wire [15:0] alu_a_in;
  wire [15:0] alu_b_in;
  wire [3:0] alu_op;
  wire [15:0] alu_result;
  wire [4:0] alu_flag_out;
  alu alu_module (.a(alu_a_in), .b(alu_b_in), .opcode(alu_op), .result(alu_result), .flags(alu_flag_out));
  
  wand reg_wr_en;
  wire [3:0] wr_reg;
  wor [15:0] reg_data_in;
  localparam REG_BITS = 16*16;
  wire [REG_BITS-1:0] regs_out;
  localparam NUM_GENERAL_REGS = 14;
  wire [NUM_GENERAL_REGS*16-1:0] reg_file_out;
  register_file #(.NUM_REGS(NUM_GENERAL_REGS)) register_file_module (.wr_en(reg_wr_en), .wr_reg(wr_reg), .reset(reset), .clk(clk), .data_in(reg_data_in), .data_out(reg_file_out));
  
  wire [3:0] a_reg_sel;
  wire [3:0] b_reg_sel;
  function reading_reg;
    input [3:0] reg_num;
    begin
      reading_reg = ((alu_op != alu.MOV & ~pc_cond & a_reg_sel == reg_num) | (~imm_en & b_reg_sel == reg_num)) & store;
    end
  endfunction

  function writing_reg;
    input [3:0] reg_num;
    begin
      writing_reg = wr_reg == reg_num & reg_wr_en & store;
    end
  endfunction
  
  localparam PARAM_STACK_REG = 4'hF;
  wire [15:0] param_stack_out;
  stack param_stack_module (.clk(clk), .push(writing_reg(PARAM_STACK_REG)), .pop(reading_reg(PARAM_STACK_REG)), .data_in(reg_data_in), .data_out(param_stack_out));
  
  localparam RETURN_STACK_REG = 4'hE;
  wire [15:0] return_stack_out;
  stack return_stack_module (.clk(clk), .push(writing_reg(RETURN_STACK_REG)), .pop(reading_reg(RETURN_STACK_REG)), .data_in(reg_data_in), .data_out(return_stack_out));
  
  wire [15:0] a_reg;
  wire [15:0] b_reg;
  reg_mux a_mux_module (.data_in({regs_out}), .select(a_reg_sel), .data_out(a_reg));
  reg_mux b_mux_module (.data_in({regs_out}), .select(b_reg_sel), .data_out(b_reg));
  
  assign regs_out = {param_stack_out, return_stack_out, reg_file_out};

  wire pc_cond;
  wire cond_p;
  reg [4:0] alu_flags;
  flag_cond cond_module (.cond(a_reg_sel), .flags(alu_flags), .p(cond_p));

  wire pc_en;
  wire [1:0] pc_op;
  wire [15:0] pc;
  program_counter pc_module (
    .clk(clk),
    .en(pc_en),
    .rst(reset),
    .op(pc_cond & ~cond_p ? 2'b1 : pc_op),
    .a(alu_b_in),
    .pc(pc));

  reg [15:0] inst_reg = 16'b0101_0000_0000_0001; // ADDI 1, R0
  wire [15:0] inst;
  wire [7:0] imm;
  wire imm_en;
  wire mem_rd_cntrl_en, mem_wr_cntrl_en;
  wand alu_result_en, alu_flag_en;
  control control_module (
    .inst(inst),
    .alu_op(alu_op),
    .a_reg(a_reg_sel),
    .pc_op(pc_op),
    .pc_cond(pc_cond),
    .b_reg(b_reg_sel),
    .imm(imm),
    .imm_en(imm_en),
    .mem_rd_en(mem_rd_cntrl_en),
    .alu_result_en(alu_result_en),
    .pc_result_en(pc_result_en),
    .reg_wr_en(reg_wr_en),
    .mem_wr_en(mem_wr_cntrl_en),
    .alu_flag_en(alu_flag_en));

  wire fetch, execute, store;
  control_state control_state_module (.clk(clk), .en(en), .reset(reset), .fetch(fetch), .execute(execute), .store(store));

  assign pc_en = store;
  assign alu_a_in = a_reg;
  assign alu_b_in = imm_en ? {{8{imm[7]}},imm} : b_reg;
  assign wr_reg = a_reg_sel;
  assign reg_data_in = alu_result_en ? alu_result : 16'b0;
  assign reg_data_in = mem_rd_cntrl_en ? mem_data_in : 16'b0;
  assign reg_data_in = pc_result_en ? pc : 16'b0;
  assign mem_addr = fetch ? pc : b_reg;
  assign mem_data_out = a_reg;
  assign mem_rd_en = fetch | (mem_rd_cntrl_en & execute);
  assign mem_wr_en = mem_wr_cntrl_en & store;
  assign reg_wr_en = store;
  assign inst = execute ? mem_data_in : inst_reg;

  always @(posedge clk)
    if (execute) begin
      if (alu_flag_en) alu_flags <= alu_flag_out;
      inst_reg <= mem_data_in;
    end
endmodule
