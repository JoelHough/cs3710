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
    input [4:0] flags,
    output reg p
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
  
  wire z, n, c, l, f;
  assign {z,n,c,l,f} = flags;

  always @(cond, z,n,c,l,f)
    case (cond)
      EQ: p = z;
      NE: p = ~z;
      GE: p = n | z;
      CS: p = c;
      CC: p = ~c;
      HI: p = l;
      LS: p = ~l;
      LO: p = ~(l | z);
      HS: p = l | z;
      GT: p = n;
      LE: p = ~n;
      FS: p = f;
      FC: p = ~f;
      LT: p = ~(n | z);
      UC: p = 1'b1;
      default: p = 1'b0;
    endcase
endmodule
