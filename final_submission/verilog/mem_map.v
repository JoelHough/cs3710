`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    03:13:31 10/20/2013 
// Design Name: 
// Module Name:    mem_map 
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
module mem_map(
    input clk,
    input [15:0] mem_addr,
    input [15:0] data_in,
    output [15:0] data_out,
    output [ADDR_BITS-1:0] addr,
    output en
    );

  parameter ADDR_BITS = 16;
  parameter START = 16'b0;
  parameter SIZE = 16'b0;
  localparam END = START + SIZE;

  reg out_en = 1'b0;
  wire [15:0] mapped_addr;
  assign mapped_addr = mem_addr - START;
  assign en = addr >= START & addr < END;
  assign addr = mapped_addr[ADDR_BITS-1:0];
  assign data_out = out_en ? data_in : 16'b0;

  always @(posedge clk)
    out_en <= en;
endmodule
