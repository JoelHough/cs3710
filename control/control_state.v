`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    17:38:58 10/19/2013 
// Design Name: 
// Module Name:    control_state 
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
module control_state(
    input clk,
    input en,
    input reset,
    output fetch,
    output execute,
    output store
    );

  localparam RESET = 2'b00; // is this a useful thing to have?
  localparam FETCH = 2'b01;
  localparam EXECUTE = 2'b10; // separate decode and execute?
  localparam STORE = 2'b11;

  reg [1:0] state = RESET;

  always @(posedge clk or posedge reset)
    if (reset) state <= RESET;
    else if (en)
      case (state)
        RESET: state <= FETCH;
        FETCH: state <= EXECUTE;
        EXECUTE: state <= STORE;
        STORE: state <= FETCH;
      endcase

  reg [2:0] sef = 3'b000;
  assign {store,execute,fetch} = sef;
  always @(posedge clk or posedge reset)
    if (reset) sef <= 3'b000;
    else if (en)
      case (state)
        RESET: sef <= 3'b000;
        FETCH: sef <= 3'b001;
        EXECUTE: sef <= 3'b010;
        STORE: sef <= 3'b100;
      endcase
endmodule
