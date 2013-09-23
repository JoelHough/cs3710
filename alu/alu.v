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
    input [WORD_WIDTH-1:0] a,
    input [WORD_WIDTH-1:0] b,
    input [OPCODE_WIDTH-1:0] opcode,
    output reg [WORD_WIDTH-1:0] result,
    output reg [NUM_FLAGS-1:0] flags
    );

/* widths */
parameter OPCODE_WIDTH = 4;
parameter WORD_WIDTH   = 16;
parameter NUM_FLAGS    = 5;

/* convenience parameters */
localparam SIGN_BIT = WORD_WIDTH - 1;

/* opcodes */
parameter ADD   = 'b1;
parameter AND   = 'b10;
parameter B     = 'b1000;
parameter CMP   = 'b11;
parameter LSH   = 'b100;
parameter OR    = 'b101;
parameter SUB   = 'b110;
parameter XOR   = 'b111;

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
/* all opcodes are exactly as described in the cr16 manual, except the added B
   op. B sets the result to the b input and sets no flags. useful for mov and
   load and such. */
always @*
begin
  flags = 0;
  result = 0;
  case (opcode)
    ADD: begin
      {flags[CARRY],result} = a + b;
      flags[FLAG] = bits_equal(a[SIGN_BIT], b[SIGN_BIT], ~result[SIGN_BIT]);
    end
    AND: result = a & b;
    B: result = b;
    CMP: begin
      flags[Z] = a == b;
      flags[NEGATIVE] = $signed(a) > $signed(b);
      flags[LOW] = a > b;
    end
    LSH: result = b[4] ? a >> (~b[3:0] + 4'd1) : a << b[3:0];
    OR: result = a | b;
    SUB: begin
      {flags[CARRY],result} = a - b;
      flags[FLAG] = bits_equal(~a[SIGN_BIT], b[SIGN_BIT], result[SIGN_BIT]);
    end
    XOR: result = a ^ b;
  endcase
end
endmodule
