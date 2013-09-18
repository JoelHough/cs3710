`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    17:00:54 09/17/2013 
// Design Name: 
// Module Name:    register_file 
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
module register_file(
    input [$clog2(NUM_REGS)-1:0] enable,
    input reset,
    input clk,
    input [WIDTH-1:0] data_in,
    output [(NUM_REGS*WIDTH)-1:0] data_out
    );
parameter WIDTH = 16;
parameter NUM_REGS = 16;

  genvar i;
  generate
  for (i=0;i<NUM_REGS;i=i+1) begin: data_out_reg
    register r(.enable(enable == i), .reset(reset), .clk(clk), .data_in(data_in), .data_out(data_out[i*WIDTH+:WIDTH]));
  end
  endgenerate

endmodule
