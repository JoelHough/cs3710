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
    output [3:0] alu_op,
    output [3:0] a_reg, // also dest_reg, cond, link_reg, src_reg for stor
    output reg [1:0] pc_op, // +0, +1, +imm, =reg
    output reg pc_cond, // pc <- pc_cond & ~cond ? +1 : pc_op

    /* input bus (alu b) */
    output [3:0] b_reg, // also src_reg, addr_reg, target_reg
    output [7:0] imm,
    output reg imm_en,
    
    /*** store ***/
    /* result bus */
    output reg mem_rd_en, // mem@b_reg->a_reg
    output reg alu_result_en,
    output reg pc_result_en, // pc->a_reg
    output reg reg_wr_en,
    output reg mem_wr_en, // a_reg->mem@b_reg 
    
    output reg alu_flag_en
    );

/* ops
  arith   {0000   rdest aluop rsrc}
  arithI  {aluop  rdest immh  imml}
  LSH     {1000   rdest 0100  ramnt}
  LSHI    {1000   rdest 000s  imm}
  CMP     {0000   rdest 1011  rsrc}
  CMPI    {1011   rdest immh  imml}
  LOAD    {0100   rdest 0000  raddr}
  STORE   {0100   rsrc  0100  raddr}
  Bcond   {1100   cond  disph displ}
  Jcond   {0100   cond  1100  rtrgt}
  JAL     {0100   rlink 1000  rtrgt}
*/
  /* ops */
  localparam BCOND = 4'b1100;
  localparam CMPI = 4'b1011;
  localparam REGISTER = 4'b0000;
  localparam SHIFT = 4'b1000;
  localparam SPECIAL = 4'b0100;

  /* op exts */
  localparam CMP = 4'b1011;
  localparam JCOND = 4'b1100;
  localparam JAL = 4'b1000;
  localparam LSH = 4'b0100;
  localparam LOAD = 4'b0000;
  localparam STORE = 4'b0100;
  
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
  
  task immediate; imm_en = 1'b1; endtask;
  task conditionally; pc_cond = 1'b1; endtask;
  task branch; pc_op = BRANCH; endtask;
  task jmp; pc_op = JMP; endtask;
  task set_flags; alu_flag_en = 1'b1; endtask;
  task to_reg; reg_wr_en = 1'b1; endtask;
  task to_mem; mem_wr_en = 1'b1; endtask;
  task from_mem; mem_rd_en = 1'b1; endtask;
  task from_alu; alu_result_en = 1'b1; endtask;
  task from_pc; pc_result_en = 1'b1; endtask;
  
  // need to assign: pc_cond pc_op imm_en mem_rd_en alu_result_en pc_result_en reg_wr_en mem_wr_en alu_flag_en
  always @(op, ext) begin
    pc_cond = 1'b0;
    pc_op = INC;
    imm_en = 1'b0;
    mem_rd_en = 1'b0;
    alu_result_en = 1'b0;
    pc_result_en = 1'b0;
    reg_wr_en = 1'b0;
    mem_wr_en = 1'b0;
    alu_flag_en = 1'b0;
    
    case (op)
      BCOND: begin
        conditionally; branch; immediate;
      end
      CMPI: begin
        immediate;
        set_flags;
      end
      SHIFT: begin
        if (ext != LSH) immediate;
        from_alu; to_reg;       
      end
      SPECIAL: begin
        case (ext)
          JCOND: begin
            conditionally; jmp;
          end
          JAL: begin
            from_pc; to_reg;
            jmp;
          end
          LOAD: begin
            from_mem; to_reg;
          end
          STORE: begin
            to_mem;
          end
          default: begin // bad op
          end
        endcase
      end
      REGISTER: begin
        case (ext)
          CMP: begin
            set_flags;
          end
          default: begin // assume a register alu op
            set_flags;
            from_alu; to_reg;
          end
        endcase
      end
      default: begin // assume an immediate alu op
        immediate;
        set_flags;
        from_alu; to_reg;
      end
    endcase
  end
endmodule
