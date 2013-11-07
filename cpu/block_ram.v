`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    01:38:24 11/07/2013 
// Design Name: 
// Module Name:    block_ram 
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
module block_ram(
  input clk,
  input en,
  input wr_en,
  input [RAM_ADDR_BITS-1:0] addr,
  input [RAM_WIDTH-1:0] data_in,
  output reg [RAM_WIDTH-1:0] data_out
    );

   parameter RAM_WIDTH = 16;
   parameter RAM_ADDR_BITS = 11;
   
   (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
   reg [RAM_WIDTH-1:0] ram [(2**RAM_ADDR_BITS)-1:0];
   
   initial
      $readmemh("../demo.hex", ram, 0, 'h3FF);

   always @(posedge clk)
      if (en) begin
         if (wr_en)
            ram[addr] <= data_in;
         data_out <= ram[addr];
      end
endmodule