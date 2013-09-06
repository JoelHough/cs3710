`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    01:43:30 09/06/2013 
// Design Name: 
// Module Name:    debounce 
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
module debounce(
    input clk,
    input bouncy,
    output debounced
    );

  reg [7:0] buffer = 8'b0;
  
  always @(posedge clk)
    buffer <= {buffer[6:0], bouncy};
  assign debounced = &buffer[7:1] & ~buffer[0];
endmodule
