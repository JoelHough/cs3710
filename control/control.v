`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    00:21:16 10/17/2013 
// Design Name: 
// Module Name:    control 
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
module control(
    input [15:0] inst,
    
    /*** decode/execute ***/
    output [4:0] alu_op,
    output [3:0] a_reg, // also dest_reg, cond, link_reg, src_reg for stor
    output [1:0] pc_op, // +0, +1, +imm, =reg
    output pc_cond, // pc <- pc_cond & ~cond ? +1 : pc_op

    /* input bus (alu b) */
    output [3:0] b_reg, // also src_reg, addr_reg, target_reg
    output [7:0] imm,
    output imm_en,
    output mem_rd_en,

    /*** store ***/
    /* result bus */
    output alu_result_en,
    output pc_result_en, // for pc->reg
    output reg_wr_en,
    output mem_wr_en,
    
    output alu_flag_en
    );

/* ops
  arith   {0000   rdest aluop rsrc}
  arithI  {aluop  rdest immh  imml}
  LSH     {1000   rdest 0100  ramnt}
  LSHI    {1000   rdest 000s  imm}
  CMP     {0000   rdest 1011  rsrc}
  CMPI    {1011   rdest immh  imml}
  LUI     {1111   rdest immh  imml}
  LOAD    {0100   rdest 0000  raddr}
  STORE   {0100   rsrc  0100  raddr}
  Bcond   {1100   cond  disph displ}
  Jcond   {0100   cond  1100  rtrgt}
  JAL     {0100   rlink 1000  rtrgt}
*/
  /* ops */
  localparam BCOND = 4'b1100;
  localparam SPECIAL = 4'b0100;

  /* op exts */
  localparam JCOND = 4'b1100;
  localparam JAL = 4'b1000;
  
  /* pc ops */
  localparam INC = 2'b1;
  localparam BRANCH = 2'b10;
  localparam JMP = 2'b11;
  
  wire [3:0] op;
  wire [3:0] dest;
  wire [3:0] ext;
  wire [3:0] src;
  assign {op,dest,ext,src} = inst;
  
  assign a_reg = dest;
  assign alu_op = op == 4'b0 ? ext : op;
  assign b_reg = src;
  assign imm = {ext,src};
  
  /* pc_cond and pc_op */
  always @(op, ext)
    if op == BCOND begin
      pc_cond = 1'b1;
      pc_op = BRANCH;
    end
    else if op == SPECIAL & ext == JCOND begin
      pc_cond = 1'b1;
      pc_op = JMP;
    else if op == SPECIAL & ext == JAL begin
      pc_cond = 1'b0;
      pc_op = JMP;
    end
    else begin
      pc_cond = 1'b0;
      pc_op = INC;
    end
  endcase
  
  // need to assign: imm_en mem_rd_en alu_result_en pc_result_en reg_wr_en mem_wr_en alu_flag_en
  
endmodule
