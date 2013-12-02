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
           input         interrupt,
           input [3:0]   interrupt_id,
           output [15:0] mem_addr,
           output        mem_wr_en,
           output        mem_rd_en,
           output [15:0] mem_wr_data,
           output        request_interrupt,
           output        clear_interrupt
           /*AUTOARG*/);

   localparam WORD_WIDTH = 16;
   localparam WIDTH = WORD_WIDTH;
   
   localparam NUM_FLAGS = 5;
   localparam OPCODE_WIDTH = 4;
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [15:0]          a_reg_rd_data;          // From RegisterFile of register_file.v
   wire [NUM_FLAGS-1:0] alu_flags;              // From Alu of alu.v
   wire [WORD_WIDTH-1:0] alu_result;            // From Alu of alu.v
   wire [15:0]          b_reg_rd_data;          // From RegisterFile of register_file.v
   wire                 b_to_mem_addr;          // From Control of control.v
   wire                 cond_p;                 // From Cond of flag_cond.v
   wire                 imm_to_b;               // From Control of control.v
   wire                 mem_to_decode;          // From Control of control.v
   wire                 mem_to_inst_reg;        // From Control of control.v
   wire                 mem_to_reg_file;        // From Control of control.v
   wire [15:0]          pc;                     // From Pc of program_counter.v
   wire [1:0]           pc_op;                  // From Control of control.v
   wire                 pc_to_reg_file;         // From Control of control.v
   wire                 reg_file_a_rd_en;       // From Control of control.v
   wire                 reg_file_b_rd_en;       // From Control of control.v
   wire                 reg_file_wr_en;         // From Control of control.v
   wire                 set_alu_result;         // From Control of control.v
   wire                 set_flags;              // From Control of control.v
   wire                 vector_to_pc;           // From Control of control.v
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
   reg [15:0]            reg_wr_data = 16'b0;
   reg                   pending_interrupt = 1'b0;
   reg [3:0]             pending_interrupt_id = 4'b0;
   
   assign {op,dest,ext,src} = inst_reg;
   assign a_reg_sel = return_stack_dest ? 4'hE : dest;
   assign b_reg_sel = src;

   assign mem_addr = b_to_mem_addr ? b_reg_rd_data : pc;
   assign mem_wr_data = a_reg_rd_data;
   assign cond = mem_to_decode ? mem_rd_data[11:8] : dest;
   assign decode_op = mem_to_decode ? mem_rd_data[15:12] : op;
   assign decode_ext = mem_to_decode ? mem_rd_data[7:4] : ext;

   always @*
     case ({mem_to_reg_file,pc_to_reg_file})
       2'b10 : reg_wr_data = mem_rd_data;
       2'b01 : reg_wr_data = pc;
       default : reg_wr_data = alu_result_reg; // 2'b00 :
     endcase // case {mem_to_reg_file,pc_to_reg_file}

   register_file RegisterFile(.a_reg_rd_en     (reg_file_a_rd_en),
                              .b_reg_rd_en     (reg_file_b_rd_en),
                              .a_reg_wr_en     (reg_file_wr_en),
                              .a_reg_wr_data   (reg_wr_data[15:0]),
                              /*AUTOINST*/
                              // Outputs
                              .a_reg_rd_data    (a_reg_rd_data[15:0]),
                              .b_reg_rd_data    (b_reg_rd_data[15:0]),
                              // Inputs
                              .clk              (clk),
                              .a_reg_sel        (a_reg_sel[3:0]),
                              .b_reg_sel        (b_reg_sel[3:0]));

   always @(posedge clk) begin
      if (set_flags) alu_flags_reg <= alu_flags;
      if (set_alu_result) alu_result_reg <= alu_result;
      if (mem_to_inst_reg) inst_reg <= mem_rd_data;
      if (interrupt) begin
         pending_interrupt <= interrupt;
         pending_interrupt_id <= interrupt_id;
      end      
      else if (request_interrupt)
        pending_interrupt <= 1'b0;
   end

   wire [15:0] alu_a;
   wire [15:0] alu_b;
   wire [3:0]  alu_op;
   assign alu_a = a_reg_rd_data;
   assign alu_b = imm_to_b ? {{8{ext[3]}},ext,src} : b_reg_rd_data;   
   assign alu_op = op == 4'b0 ? ext : op;
   alu Alu (/*AUTOINST*/
            // Outputs
            .alu_result                 (alu_result[WORD_WIDTH-1:0]),
            .alu_flags                  (alu_flags[NUM_FLAGS-1:0]),
            // Inputs
            .alu_a                      (alu_a[WORD_WIDTH-1:0]),
            .alu_b                      (alu_b[WORD_WIDTH-1:0]),
            .alu_op                     (alu_op[OPCODE_WIDTH-1:0]));
   flag_cond Cond (/*AUTOINST*/
                   // Outputs
                   .cond_p              (cond_p),
                   // Inputs
                   .cond                (cond[3:0]),
                   .alu_flags_reg       (alu_flags_reg[4:0]));

   wire [15:0] pc_a = vector_to_pc ? pending_interrupt_id : alu_b;
   program_counter #(.INITIAL_PC(16'd16)) Pc (/*AUTOINST*/
                                              // Outputs
                                              .pc              (pc[15:0]),
                                              // Inputs
                                              .clk             (clk),
                                              .pc_op           (pc_op[1:0]),
                                              .pc_a            (pc_a[15:0]));
   
   
   control Control (.op                 (decode_op[3:0]),
                    .ext                (decode_ext[3:0]),
                    .interrupt          (pending_interrupt),
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
                    .request_interrupt  (request_interrupt),
                    .clear_interrupt    (clear_interrupt),
                    .return_stack_dest  (return_stack_dest),
                    .vector_to_pc       (vector_to_pc),
                    // Inputs
                    .clk                (clk),
                    .en                 (en),
                    .cond_p             (cond_p));

endmodule

// Local Variables:
// verilog-library-directories:("../cpu" "../register_file" "../alu" "../control" "../vga")
// End:
