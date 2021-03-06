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
    input en,
    input [7:0] char, // ascii character to display
    
    /* pixel in that character */
    input [2:0] x,
    input [3:0] y,
    
    output reg pixel // the value at that pixel
    );

  /* character data comes out an 8-bit line at a time
     we select a bit from that later */
  reg [7:0] characters[4095:0];
  reg [7:0] line;
  wire [11:0] read_address = {char, y};
  
  initial
    $readmemh("Dina_r400-10.bdf.hex", characters, 0, 4095);
  
  always @(posedge clk)
    if (en) begin
      line <= characters[read_address];
      pixel = line[~(3'd6 + x)]; // dirty timing and mirroring hack
    end
    
endmodule
