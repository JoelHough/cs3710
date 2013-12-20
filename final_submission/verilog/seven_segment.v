`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:31 12/11/2013 
// Design Name: 
// Module Name:    seven_segment 
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
module seven_segment(
    input clk,
    input [15:0] data,
    output reg [7:0] seg,
    output reg [3:0] an = 4'b1110
    );

  reg [3:0] nibble;
  
  always @(posedge clk)
    case (an)
      4'b1110 : an = 4'b1101;
      4'b1101 : an = 4'b1011;
      4'b1011 : an = 4'b0111;
      4'b0111 : an = 4'b1110;
      default : an = 4'b1110;
    endcase
  
  always @*
    case (an)
      4'b1110 : nibble = data[3:0];
      4'b1101 : nibble = data[7:4];
      4'b1011 : nibble = data[11:8];
      4'b0111 : nibble = data[15:12];
      default : nibble = 4'hA;
    endcase

  always @*
    case (nibble)
      4'h0 : seg = 8'b00000011;
      4'h1 : seg = 8'b10011111;
      4'h2 : seg = 8'b00100101;
      4'h3 : seg = 8'b00001101;
      4'h4 : seg = 8'b10011001;
      4'h5 : seg = 8'b01001001;
      4'h6 : seg = 8'b01000001;
      4'h7 : seg = 8'b00011111;
      4'h8 : seg = 8'b00000001;
      4'h9 : seg = 8'b00011001;
      4'hA : seg = 8'b00010001;
      4'hB : seg = 8'b11000001;
      4'hC : seg = 8'b11100101;
      4'hD : seg = 8'b10000101;
      4'hE : seg = 8'b01100001;
      4'hF : seg = 8'b01110001;
    endcase
      
endmodule
