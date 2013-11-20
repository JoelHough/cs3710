`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    16:21:06 11/14/2013 
// Design Name: 
// Module Name:    stack 
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
module stack(
    input clk,
    input push,
    input pop,
    input [WIDTH-1:0] data_in,
    output [WIDTH-1:0] data_out
    );

  parameter WIDTH = 16;
  parameter INDEX_BITS = 6;

  reg [INDEX_BITS-1:0] index = 1'b0;
  (* RAM_STYLE="AUTO" *)
  reg [WIDTH-1:0] data [(2**INDEX_BITS)-1:0];

  always @(posedge clk)
    if (push & pop)
      data[index] <= data_in;
    else if (pop)
      index <= index - 1'b1;
    else if (push) begin
      data[index+1'b1] <= data_in;
      index <= index + 1'b1;
    end

  assign data_out = data[index];
endmodule
