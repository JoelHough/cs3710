`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    19:42:26 09/05/2013 
// Design Name: 
// Module Name:    dina_font_rom 
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
module dina_font_rom(
    input clk,
    input [7:0] char,
    input [2:0] x,
    input [3:0] y,
    output pixel
    );

  reg [7:0] characters[4095:0];
  reg [7:0] line;
  wire [11:0] read_address = {char, y};
  
  initial
    $readmemh("Dina_r400-10.bdf.hex", characters, 0, 4095);
  
  always @(posedge clk)
    line <= characters[read_address];

  assign pixel = line[~(3'd6 + x)]; // dirty timing and mirroring hack
endmodule
