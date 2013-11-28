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
           input         clk,
           input         en,
           input [15:0]  mem_rd_data,
           output [15:0] mem_addr,
           output        mem_wr_en,
           output        mem_rd_en,
           output [15:0] mem_wr_data
           /*AUTOARG*/);

   localparam WORD_WIDTH = 16;
   localparam WIDTH = WORD_WIDTH;
   
   localparam NUM_FLAGS = 5;
   localparam OPCODE_WIDTH = 4;
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [NUM_FLAGS-1:0]  alu_flags;              // From Alu of alu.v
   wire [WORD_WIDTH-1:0] alu_result;            // From Alu of alu.v
   wire                  b_to_mem_addr;          // From Control of control.v
   wire                  cond_p;                 // From Cond of flag_cond.v
   wire                  imm_to_b;               // From Control of control.v
   wire                  mem_to_decode;          // From Control of control.v
   wire                  mem_to_inst_reg;        // From Control of control.v
   wire                  mem_to_reg_file;        // From Control of control.v
   wire [WIDTH-1:0]      param_stack_pop_data;   // From ParamStack of stack.v
   wire [15:0]           pc;                     // From Pc of program_counter.v
   wire [1:0]            pc_op;                  // From Control of control.v
   wire                  pc_to_reg_file;         // From Control of control.v
   wire                  reg_file_a_rd_en;       // From Control of control.v
   wire                  reg_file_b_rd_en;       // From Control of control.v
   wire                  reg_file_wr_en;         // From Control of control.v
   wire [WIDTH-1:0]      return_stack_pop_data;  // From ReturnStack of stack.v
   wire                  set_alu_result;         // From Control of control.v
   wire                  set_flags;              // From Control of control.v
   // End of automatics

   reg [4:0]             alu_flags_reg = 1'b0;
   reg [15:0]            alu_result_reg = 1'b0;
   reg [15:0]            inst_reg = 16'b0101_0000_0000_0001; // ADDI 1, R0
   wire [3:0]            op;
   wire [3:0]            decode_op;           
   wire [3:0]            dest;
   wire [3:0]            cond;   
   wire [3:0]            a_reg_sel; // also dest_reg, cond, link_reg, src_reg for stor
   wire [3:0]            ext;
   wire [3:0]            decode_ext;
   wire [3:0]            src;
   wire [3:0]            b_reg_sel; // also src_reg, addr_reg, target_reg
   reg [15:0]            reg_wr_data;
   
   assign {op,dest,ext,src} = inst_reg;
   assign a_reg_sel = dest;
   assign b_reg_sel = src;

   assign mem_addr = b_to_mem_addr ? b_reg : pc;
   assign mem_wr_data = a_reg;
   assign cond = mem_to_decode ? mem_rd_data[11:8] : dest;
   assign decode_op = mem_to_decode ? mem_rd_data[15:12] : op;
   assign decode_ext = mem_to_decode ? mem_rd_data[7:4] : ext;

   always @*
     (* PARALLEL_CASE, FULL_CASE *)
     case ({mem_to_reg_file,pc_to_reg_file})
       2'b10 : reg_wr_data = mem_rd_data;
       2'b01 : reg_wr_data = pc;
       2'b00 : reg_wr_data = alu_result_reg;
     endcase // case {mem_to_reg_file,pc_to_reg_file}
   
   always @(posedge clk) begin
      if (set_flags) alu_flags_reg <= alu_flags;
      if (set_alu_result) alu_result_reg <= alu_result;
      if (mem_to_inst_reg) inst_reg <= mem_rd_data;
   end

   wire [15:0] alu_a;
   wire [15:0] alu_b;
   wire [3:0]  alu_op;
   assign alu_a = a_reg;
   assign alu_b = imm_to_b ? {{8{ext[3]}},ext,src} : b_reg;   
   assign alu_op = op == 4'b0 ? ext : op;
   alu Alu (/*AUTOINST*/
            // Outputs
            .alu_result                 (alu_result[WORD_WIDTH-1:0]),
            .alu_flags                  (alu_flags[NUM_FLAGS-1:0]),
            // Inputs
            .alu_a                      (alu_a[WORD_WIDTH-1:0]),
            .alu_b                      (alu_b[WORD_WIDTH-1:0]),
            .alu_op                     (alu_op[OPCODE_WIDTH-1:0]));

   localparam NUM_GENERAL_REGS = 14;
   reg [15:0]  regs [NUM_GENERAL_REGS-1:0];
   reg [15:0]  a_reg = 1'b0;
   reg [15:0]  b_reg = 1'b0;
   always @(posedge clk) begin
      if (reg_file_wr_en && dest < NUM_GENERAL_REGS) regs[dest] <= reg_wr_data;
      if (reg_file_a_rd_en)
        (* PARALLEL_CASE, FULL_CASE *)
        case (a_reg_sel)
          PARAM_STACK_REG : a_reg <= param_stack_pop_data;
          RETURN_STACK_REG : a_reg <= return_stack_pop_data;
          default : a_reg <= regs[a_reg_sel];
        endcase // case (a_reg_sel)
      if (reg_file_b_rd_en)
        (* PARALLEL_CASE, FULL_CASE *)
        case (b_reg_sel)
          PARAM_STACK_REG : b_reg <= param_stack_pop_data;
          RETURN_STACK_REG : b_reg <= return_stack_pop_data;
          default : b_reg <= regs[b_reg_sel];
        endcase // case (b_reg_sel)
   end

   function reading_reg;
      input reg_sel;
      reading_reg = (reg_file_a_rd_en & a_reg_sel == reg_sel) | (reg_file_b_rd_en & b_reg_sel == reg_sel);
   endfunction
   function writing_reg;
      input reg_sel;
      writing_reg = reg_file_wr_en && dest == reg_sel;
   endfunction;

   localparam PARAM_STACK_REG = 4'hF;
   stack ParamStack (// Outputs
                     .pop_data          (param_stack_pop_data[WIDTH-1:0]),
                     // Inputs
                     .push              (writing_reg(PARAM_STACK_REG)),
                     .pop               (reading_reg(PARAM_STACK_REG)),
                     .push_data         (reg_wr_data),/*AUTOINST*/
                     // Inputs
                     .clk               (clk));

   localparam RETURN_STACK_REG = 4'hE;
   stack ReturnStack (// Outputs
                      .pop_data          (return_stack_pop_data[WIDTH-1:0]),
                      // Inputs
                      .push              (writing_reg(RETURN_STACK_REG)),
                      .pop               (reading_reg(RETURN_STACK_REG)),
                      .push_data         (reg_wr_data),/*AUTOINST*/
                      // Inputs
                      .clk              (clk));
   
   flag_cond Cond (/*AUTOINST*/
                   // Outputs
                   .cond_p              (cond_p),
                   // Inputs
                   .cond                (cond[3:0]),
                   .alu_flags_reg       (alu_flags_reg[4:0]));

   wire [15:0] pc_a = alu_b;
   program_counter Pc (/*AUTOINST*/
                       // Outputs
                       .pc              (pc[15:0]),
                       // Inputs
                       .clk             (clk),
                       .pc_op           (pc_op[1:0]),
                       .pc_a            (pc_a[15:0]));
   
   
   control Control (.op                 (decode_op[3:0]),
                    .ext                (decode_ext[3:0]),
                    /*AUTOINST*/
                    // Outputs
                    .mem_rd_en          (mem_rd_en),
                    .mem_wr_en          (mem_wr_en),
                    .reg_file_wr_en     (reg_file_wr_en),
                    .reg_file_a_rd_en   (reg_file_a_rd_en),
                    .reg_file_b_rd_en   (reg_file_b_rd_en),
                    .set_flags          (set_flags),
                    .set_alu_result     (set_alu_result),
                    .imm_to_b           (imm_to_b),
                    .pc_op              (pc_op[1:0]),
                    .pc_to_reg_file     (pc_to_reg_file),
                    .mem_to_reg_file    (mem_to_reg_file),
                    .mem_to_inst_reg    (mem_to_inst_reg),
                    .mem_to_decode      (mem_to_decode),
                    .b_to_mem_addr      (b_to_mem_addr),
                    // Inputs
                    .clk                (clk),
                    .en                 (en),
                    .cond_p             (cond_p));

endmodule

// Local Variables:
// verilog-library-directories:("../cpu" "../register_file" "../alu" "../control" "../vga")
// End:
