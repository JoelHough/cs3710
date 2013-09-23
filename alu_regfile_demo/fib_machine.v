`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    15:58:06 09/22/2013 
// Design Name: 
// Module Name:    fib_machine 
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
module fib_machine(
    input clk,
    input reset,
    output reg [2:0] a_reg,
    output reg [2:0] b_reg,
    output reg [2:0] dest_reg,
    output reg [15:0] immediate,
    output reg immediate_p,
    output reg [alu.OPCODE_WIDTH-1:0] alu_op
    );

  localparam INIT = 2'b1;
  localparam RUN = 2'b10;
  
  reg [1:0] state = INIT;

  always @(posedge clk or posedge reset)
    if (reset)
      state <= INIT;
    else
      case (state)
        INIT: state <= dest_reg == 3'b1 ? RUN : INIT;
        RUN: state <= RUN;
      endcase


  always @(posedge clk or posedge reset)
    if (reset) begin
      a_reg <= 3'b111;
      b_reg <= 3'b0;
      dest_reg <= 3'b0;
      immediate <= 16'b1;
      immediate_p <= 1'b1;
      alu_op <= alu.B;
    end
    else
      case (state)
        INIT: dest_reg <= 3'b1;
        RUN: begin
          a_reg <= a_reg + 1'b1;
          b_reg <= b_reg + 1'b1;
          dest_reg <= dest_reg + 1'b1;
          alu_op <= alu.ADD;
          immediate <= 16'b0;
          immediate_p <= 1'b0;
        end
      endcase
    
endmodule
