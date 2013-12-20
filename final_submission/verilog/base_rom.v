`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    19:02:56 10/19/2013 
// Design Name: 
// Module Name:    base_rom 
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
module base_rom(
    input clk,
    input en,
    input [9:0] addr,
    output reg [15:0] data
    );


   parameter ROM_WIDTH = 16;
   parameter ROM_ADDR_BITS = 10;

   reg [ROM_WIDTH-1:0] rom [(2**ROM_ADDR_BITS)-1:0];

   initial
      $readmemh("../demo.hex", rom, 0, 'h3FF);

   always @(posedge clk)
      if (en)
         data <= rom[addr];
endmodule
