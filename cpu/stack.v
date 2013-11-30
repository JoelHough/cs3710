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
             input              clk,
             input              push,
             input              pop,
             input [WIDTH-1:0]  push_data,
             output reg [WIDTH-1:0] pop_data
             );

   parameter WIDTH = 16;
   parameter INDEX_BITS = 6;

   reg [INDEX_BITS-1:0]         top_of_stack = 1'b0;
   (* RAM_STYLE="AUTO" *)
   reg [WIDTH-1:0]              stack_memory [(2**INDEX_BITS)-1:0];

   wire [INDEX_BITS-1:0]        index;

   assign index = pop ? top_of_stack : (top_of_stack + 1'b1);
   
   always @(posedge clk)
     if (push & pop) begin
        stack_memory[index] <= push_data;
        pop_data <= push_data;
     end
     else if (pop) begin
        top_of_stack <= top_of_stack - 1'b1;
        pop_data <= stack_memory[index];
     end
     else if (push) begin
        stack_memory[index] <= push_data;
        top_of_stack <= index;
        pop_data <= push_data;
     end
endmodule
