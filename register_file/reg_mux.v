`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    16:13:57 09/17/2013 
// Design Name: 
// Module Name:    reg_mux 
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
module reg_mux(
    input [(WIDTH*NUM_REGS)-1:0] data_in,
    input [$clog2(NUM_REGS)-1:0] select,
    output [WIDTH-1:0] data_out
    );

parameter WIDTH = 16;
parameter NUM_REGS = 16;

  wire [WIDTH-1:0] data_in_array [NUM_REGS-1:0];

  genvar i;
  generate
    for (i=0;i<NUM_REGS;i=i+1) begin: data_in_reg
      assign data_in_array[i] = data_in[(i*WIDTH)+:WIDTH];
    end
  endgenerate

  assign data_out = data_in_array[select];

endmodule
