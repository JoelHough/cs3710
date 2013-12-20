`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    14:31:22 09/04/2013 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [WORD_WIDTH-1:0] alu_a,
    input [WORD_WIDTH-1:0] alu_b,
    input [OPCODE_WIDTH-1:0] alu_op,
    output reg [WORD_WIDTH-1:0] alu_result,
    output reg [NUM_FLAGS-1:0] alu_flags
    );

/* widths */
parameter OPCODE_WIDTH = 4;
parameter WORD_WIDTH   = 16;
parameter NUM_FLAGS    = 5;

/* convenience parameters */
localparam SIGN_BIT = WORD_WIDTH - 1;

/* opcodes */
parameter ADD   = 'b0101;
parameter AND   = 'b0001;
parameter CMP   = 'b1011;
parameter LSH   = 'b1000;
parameter LUI   = 'b1111;
parameter MOV   = 'b1101;
parameter OR    = 'b0010;
parameter SUB   = 'b1001;
parameter XOR   = 'b0011;

/* flag bit positions */
parameter CARRY    = 0;
parameter LOW      = 1;
parameter FLAG     = 2;
parameter Z        = 3;
parameter NEGATIVE = 4;

/* flag bit masks */
localparam CARRY_BIT    = 1 << CARRY;
localparam LOW_BIT      = 1 << LOW;
localparam FLAG_BIT     = 1 << FLAG;
localparam Z_BIT        = 1 << Z;
localparam NEGATIVE_BIT = 1 << NEGATIVE;

/* functions */
function bits_equal;
  input a, b, c;
  bits_equal = (a == b) & (b == c);
endfunction

/* the good stuff */
/* all opcodes are exactly as described in the cr16 manual */
always @*
begin
  alu_flags = 0;
  alu_result = 0;
  case (alu_op)
    ADD: begin
      {alu_flags[CARRY],alu_result} = alu_a + alu_b;
      alu_flags[FLAG] = bits_equal(alu_a[SIGN_BIT], alu_b[SIGN_BIT], ~alu_result[SIGN_BIT]);
    end
    AND: alu_result = alu_a & alu_b;
    CMP: begin
      alu_flags[Z] = alu_a == alu_b;
      alu_flags[NEGATIVE] = $signed(alu_a) < $signed(alu_b);
      alu_flags[LOW] = alu_a < alu_b;
    end
    LSH: alu_result = alu_b[4] ? alu_a >> (~alu_b[3:0] + 4'd1) : alu_a << alu_b[3:0];
    LUI: alu_result = {alu_b[(WORD_WIDTH/2)-1:0], alu_a[(WORD_WIDTH/2)-1:0]};
    MOV: alu_result = alu_b;
    OR: alu_result = alu_a | alu_b;
    SUB: begin
      {alu_flags[CARRY],alu_result} = alu_a - alu_b;
      alu_flags[FLAG] = bits_equal(~alu_a[SIGN_BIT], alu_b[SIGN_BIT], alu_result[SIGN_BIT]);
    end
    XOR: alu_result = alu_a ^ alu_b;
  endcase
end
endmodule
