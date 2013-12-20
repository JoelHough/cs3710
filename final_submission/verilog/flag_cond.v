`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    05:47:57 10/17/2013 
// Design Name: 
// Module Name:    flag_cond 
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
module flag_cond(
    input [3:0] cond,
    input [4:0] alu_flags_reg,
    output reg cond_p
    );

  localparam EQ = 4'b0000;
  localparam NE = 4'b0001;
  localparam CS = 4'b0010;
  localparam CC = 4'b0011;
  localparam HI = 4'b0100;
  localparam LS = 4'b0101;
  localparam GT = 4'b0110;
  localparam LE = 4'b0111;
  localparam FS = 4'b1000;
  localparam FC = 4'b1001;
  localparam LO = 4'b1010;
  localparam HS = 4'b1011;
  localparam LT = 4'b1100;
  localparam GE = 4'b1101;
  localparam UC = 4'b1110;
  
  wire n, z, f, l, c;
  assign {n,z,f,l,c} = alu_flags_reg;

  always @(cond, z,n,c,l,f)
    case (cond)
      EQ: cond_p = z;
      NE: cond_p = ~z;
      GE: cond_p = n | z;
      CS: cond_p = c;
      CC: cond_p = ~c;
      HI: cond_p = l;
      LS: cond_p = ~l;
      LO: cond_p = ~(l | z);
      HS: cond_p = l | z;
      GT: cond_p = n;
      LE: cond_p = ~n;
      FS: cond_p = f;
      FC: cond_p = ~f;
      LT: cond_p = ~(n | z);
      UC: cond_p = 1'b1;
      default: cond_p = 1'b0;
    endcase
endmodule
