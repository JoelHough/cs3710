`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    01:16:33 09/23/2013 
// Design Name: 
// Module Name:    equiv_checker 
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
module equiv_checker(
    input [15:0] a,
    input [15:0] b,
    input [3:0] opcode,
    output equiv
    );

wire [15:0] z;
wire [4:0] flags;
wire [15:0] z_synthesis;
wire [4:0] flags_synthesis;

assign equiv = z == z_synthesis & flags == flags_synthesis;

alu uut (
  .a(a), 
  .b(b), 
  .opcode(opcode), 
  .result(z), 
  .flags(flags)
);

alu_synthesis uut_synthesis (
  .a(a),
  .b(b),
  .opcode(opcode),
  .result(z_synthesis),
  .flags(flags_synthesis)
);
endmodule
