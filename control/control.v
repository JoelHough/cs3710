`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    17:38:58 10/19/2013 
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
	       input 		clk,
	       input 		en,

	       input [3:0] 	op,
	       input [3:0] 	ext,
	       input 		cond_p,

	       output reg 	mem_rd_en,
	       output reg 	mem_wr_en,

	       output reg 	reg_file_wr_en,
	       output reg 	reg_file_a_rd_en,
	       output reg 	reg_file_b_rd_en,

	       output reg 	set_flags,
	       output reg 	imm_to_b, 

	       output reg [1:0] pc_op, 
	       output reg 	pc_to_reg_file,

	       output reg 	mem_to_reg_file,
	       output reg 	mem_to_inst_reg,
	       output reg 	mem_to_decode,

	       output reg 	b_to_mem_addr
	       /*AUTOARG*/);

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
   localparam BCOND	= 4'b1100;
   localparam CMPI	= 4'b1011;
   localparam MOVI	= 4'b1101;
   localparam REGISTER	= 4'b0000;
   localparam SHIFT	= 4'b1000;
   localparam SPECIAL	= 4'b0100;
   
   /* op exts */
   localparam CMP	= 4'b1011;
   localparam JCOND	= 4'b1100;
   localparam JAL	= 4'b1000;
   localparam LSH	= 4'b0100;
   localparam LOAD	= 4'b0000;
   localparam MOV	= 4'b1101;
   localparam STORE	= 4'b0100;
   
   /* states */
   // fetch
   localparam FETCH		= 4'd0;

   // decode
   localparam DECODE		= 4'd1;
   
   // load
   localparam LOAD_A_B		= 4'd2;
   localparam LOAD_A		= 4'd3;
   localparam LOAD_B		= 4'd4;

   // execute and store
   localparam IMM_ALU_OP	= 4'd5;
   localparam ALU_OP		= 4'd6;
   localparam ALU_FLAG_OP	= 4'd7;
   localparam IMM_ALU_FLAG_OP	= 4'd8;
   localparam BRANCH		= 4'd9;
   localparam LOAD_FROM_MEM	= 4'd10;
   localparam STORE_TO_MEM	= 4'd11;
   localparam JUMP		= 4'd12;
   localparam JUMP_AND_LINK	= 4'd13;

   // memory load
   localparam MEM_TO_REG_FILE	= 4'd14;
   
   reg [3:0] 		   state = FETCH;
   reg [3:0] 		   next_state;

   always @(posedge clk)
     if (en) state <= next_state;

   /* state transitions */
   always @(/*AS*/cond_p or ext or op or state)
     case (state)
       // fetch
       FETCH  : next_state = DECODE;

       // decode
       DECODE : case (op)
		  BCOND : next_state = cond_p ? BRANCH : FETCH;
		  MOVI	: next_state = IMM_ALU_OP;
		  REGISTER : case (ext)
			       MOV	: next_state = LOAD_B;
			       default	: next_state = LOAD_A_B;
			     endcase // case (ext)
		  SHIFT : case (ext)
			    LSH		: next_state = LOAD_A_B;
			    default	: next_state = LOAD_A; // LSHI
			  endcase // case (ext)
		  SPECIAL : case (ext)
			      JAL	: next_state = LOAD_B;
			      JCOND	: next_state = cond_p ? LOAD_B : FETCH;
			      LOAD	: next_state = LOAD_B;
			      STORE	: next_state = LOAD_A_B;
			      default	: next_state = FETCH; // bad op
			    endcase // case (ext)
		  default : next_state = LOAD_A; // assume an immediate alu op
		endcase // case (op)

       // load
       LOAD_A_B : case (op)
		    SPECIAL : next_state = STORE_TO_MEM;
		    default : case (ext)
				CMP	: next_state = ALU_FLAG_OP;
				default : next_state = ALU_OP;
			      endcase // case (ext)
		  endcase // case (op)
       LOAD_A : next_state = ext == CMPI ? IMM_ALU_FLAG_OP : IMM_ALU_OP;
       LOAD_B : case (op)
		  REGISTER : next_state = ALU_OP;
		  default : case (ext)
			      JAL	: next_state = JUMP_AND_LINK;
			      JCOND	: next_state = JUMP;
			      LOAD	: next_state = LOAD_FROM_MEM;
			      default   : next_state = FETCH; // bad state 
			    endcase // case (ext)
		endcase // case (op)

       // execute and store
       IMM_ALU_OP	: next_state = FETCH;
       ALU_OP		: next_state = FETCH;
       ALU_FLAG_OP	: next_state = FETCH;
       IMM_ALU_FLAG_OP	: next_state = FETCH;
       BRANCH		: next_state = FETCH;
       LOAD_FROM_MEM	: next_state = MEM_TO_REG_FILE;
       STORE_TO_MEM	: next_state = FETCH;
       JUMP		: next_state = FETCH;
       JUMP_AND_LINK	: next_state = FETCH;

       // memory load
       MEM_TO_REG_FILE  : next_state = FETCH;
       default : next_state = FETCH; // bad state
     endcase // case (state)

   /* outputs */
   always @(/*AS*/state) begin
      mem_rd_en = 1'b0;
      mem_wr_en = 1'b0;
      
      reg_file_wr_en = 1'b0;
      reg_file_a_rd_en = 1'b0;
      reg_file_b_rd_en = 1'b0;

      set_flags = 1'b0;
      imm_to_b = 1'b0;

      pc_op = 2'b0;
      pc_to_reg_file = 1'b0;

      mem_to_reg_file = 1'b0;
      mem_to_inst_reg = 1'b0;
      mem_to_decode = 1'b0;
      
      b_to_mem_addr = 1'b0;
      
      case (state)
	// fetch
	FETCH : begin
	   // this is the default: pc_to_mem_addr = 1'b1;
	   mem_rd_en = 1'b1;
	end

	// decode
	DECODE : begin
	   mem_to_inst_reg = 1'b1;
	   mem_to_decode = 1'b1;
	   pc_op = 2'b1;
	end

	// load
	LOAD_A_B : begin
	   reg_file_a_rd_en = 1'b1;
	   reg_file_b_rd_en = 1'b1;
	end
	LOAD_A : reg_file_a_rd_en = 1'b1;
	LOAD_B : reg_file_b_rd_en = 1'b1;

	// execute and store
	IMM_ALU_OP : begin
	   imm_to_b = 1'b1;
	   set_flags = 1'b1;
	   // this is the default: alu_result_to_reg_file = 1'b1;
	   reg_file_wr_en = 1'b1;
	end
	ALU_OP : begin
	   set_flags = 1'b1;
	   // this is the default: alu_result_to_reg_file = 1'b1;
	   reg_file_wr_en = 1'b1;
	end
	ALU_FLAG_OP : begin
	   set_flags = 1'b1;
	end
	IMM_ALU_FLAG_OP : begin
	   imm_to_b = 1'b1;
	   set_flags = 1'b1;
	end
	BRANCH : begin
	   imm_to_b	= 1'b1;
	   pc_op	= 2'b10;
	end
	LOAD_FROM_MEM : begin
	   b_to_mem_addr = 1'b1;
	   mem_rd_en = 1'b1;
	end
	STORE_TO_MEM : begin
	   b_to_mem_addr = 1'b1;
	   // this is the default: b_to_mem_data_in = 1'b1;
	   mem_wr_en = 1'b1;
	end
	JUMP : begin
	   pc_op	= 2'b11;
	end
	JUMP_AND_LINK : begin
	   pc_op          = 2'b11;
	   pc_to_reg_file = 1'b1;
	   reg_file_wr_en = 1'b1;
	end

	// memory load
	MEM_TO_REG_FILE : begin
	   mem_to_reg_file = 1'b1;
	   reg_file_wr_en = 1'b1;
	end
      endcase // case (state)
   end // always @ (...
endmodule // control
