`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    21:46:31 12/01/2013 
// Design Name: 
// Module Name:    interrupt 
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
module interrupt(
                 input  clk,
                 input  set_pending,
                 input  clear_in_process,
                 input  handle,
                 output clear_in_process_carry, 
                 output handle_carry,
                 output handling
                 );
   
   reg                  pending = 1'b0;
   reg                  in_process = 1'b0;

   assign clear_in_process_carry = clear_in_process & ~in_process;
   assign handle_carry = handle & ~pending & ~in_process;
   assign handling = handle & pending & ~in_process;
   
   always @(posedge clk) begin
      if (clear_in_process)
        in_process <= 1'b0;
      else if (pending & handle)
        in_process <= 1'b1;
      
      if (set_pending)
        pending <= 1'b1;
      else if (handle & ~in_process)
        pending <= 1'b0;
   end
endmodule
