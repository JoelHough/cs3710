`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    23:11:05 12/08/2013 
// Design Name: 
// Module Name:    one_shot 
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
module one_shot(
    input clk,
    input signal,
    output strobe
    );
  localparam DELAY = 1;
  reg [DELAY:0] buffer = {DELAY+1{1'b1}};
  assign strobe = buffer == {1'b0, {DELAY{1'b1}}};
  
  always @(posedge clk)
    buffer <= {buffer[DELAY-1:0], signal};
endmodule
