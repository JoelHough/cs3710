`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    16:01:22 09/17/2013 
// Design Name: 
// Module Name:    register 
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
module register #(
    parameter WIDTH = 16,
    parameter DEFAULT = {WIDTH{1'b0}}
    ) (
    input enable,
    input reset,
    input clk,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out = DEFAULT
    );

  always @(posedge clk or posedge reset)
    if (reset)
      data_out <= DEFAULT;
    else if (enable)
      data_out <= data_in;

endmodule
