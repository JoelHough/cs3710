`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    03:52:53 10/20/2013 
// Design Name: 
// Module Name:    mem_mapped_reg 
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
module mem_mapped_reg(
    input clk,
    input [15:0] mem_addr,
    input mem_wr_en,
    input mem_rd_en,
    input [15:0] data_in,
    output reg [15:0] data_out,
    output [15:0] reg_out
    );

  parameter DEFAULT = 16'b0;
  parameter ADDR = 16'b0;

  reg [15:0] r = DEFAULT;
  assign reg_out = r;

  always @(posedge clk)
    if (mem_addr == ADDR) begin
      if (mem_wr_en) r <= data_in;
      if (mem_rd_en) data_out <= r;
    end
    else
      data_out <= 16'b0;
endmodule
