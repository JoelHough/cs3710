`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    16:03:47 09/05/2013 
// Design Name: 
// Module Name:    mod_counter 
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
module mod_counter(
    input clk,
    input reset,
    output reg [COUNTER_WIDTH:0] count = MIN,
    output reg rollover = 1'b0
    );

  parameter COUNTER_WIDTH = $clog2(MAX)-1;
  parameter MAX = 8'hFF;
  parameter MIN = 1'b0;

  always @(posedge clk, posedge reset) begin
    count <= (reset | count == MAX) ? MIN : count + 1'b1;
    rollover <= reset ? 0 : count == MAX;
  end
endmodule
