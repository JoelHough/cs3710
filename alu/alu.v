`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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
    input carry,
    output reg [WORD_WIDTH-1:0] z,
    output reg [4:0] flags
    );
parameter OPCODE_WIDTH = 8;
parameter WORD_WIDTH   = 16;

/* opcodes */
parameter ADD   = 'b101;
parameter SUB   = 'b1001;
parameter CMP   = 'b1011;
parameter AND   = 'b1;
parameter OR    = 'b10;
parameter XOR   = 'b11;
parameter MOV   = 'b1101;
parameter LSH   = 'b1000_0100;

always @*
begin
	z = a + b;
	flags = 5'b00000;
end

endmodule
