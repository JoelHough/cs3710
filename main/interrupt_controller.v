`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    21:46:31 12/01/2013 
// Design Name: 
// Module Name:    interrupt_controller 
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
module interrupt_controller(
                            input        clk,
                            input        handle_interrupt,
                            input        clear_interrupt,
                            input [3:0]  clear_interrupt_id,
                            input [15:0] interrupt_lines,
                            output reg   cpu_interrupt,
                            output [3:0] cpu_interrupt_id
                            );
   initial begin
      cpu_interrupt = 1'b0;
   end
   
   reg [15:0]  handling = 16'b0;
   reg [15:0]  pending = 16'b0;
   reg [15:0]  highest_pending_bit = 16'b0;
   reg [3:0]   handling_id = 4'b0;
   wire        trigger;
   wire [15:0] clear_interrupt_bit = 2**clear_interrupt_id;

   assign cpu_interrupt_id = handling_id;
   assign trigger = highest_pending_bit > handling;

   always @(posedge clk)
     if (handle_interrupt && trigger)
       pending <= (pending & ~highest_pending_bit) | interrupt_lines;
     else
       pending <= pending | interrupt_lines;
       
   always @(posedge clk)
     if (clear_interrupt)
       cpu_interrupt <= 1'b0;
     else
       cpu_interrupt <= trigger;
   
   always @(posedge clk)
     if (clear_interrupt)
       handling <= handling & ~clear_interrupt_bit;
     else if (handle_interrupt && trigger)
       handling <= handling | highest_pending_bit;
   
   always @(pending)
     casez (pending)
       16'b0000_0000_0000_0000 : highest_pending_bit = 16'h0;
       16'b0000_0000_0000_0001 : highest_pending_bit = 16'h1;
       16'b0000_0000_0000_001z : highest_pending_bit = 16'h2;
       16'b0000_0000_0000_01zz : highest_pending_bit = 16'h4;
       16'b0000_0000_0000_1zzz : highest_pending_bit = 16'h8;
       16'b0000_0000_0001_zzzz : highest_pending_bit = 16'h10;
       16'b0000_0000_001z_zzzz : highest_pending_bit = 16'h20;
       16'b0000_0000_01zz_zzzz : highest_pending_bit = 16'h40;
       16'b0000_0000_1zzz_zzzz : highest_pending_bit = 16'h80;
       16'b0000_0001_zzzz_zzzz : highest_pending_bit = 16'h100;
       16'b0000_001z_zzzz_zzzz : highest_pending_bit = 16'h200;
       16'b0000_01zz_zzzz_zzzz : highest_pending_bit = 16'h400;
       16'b0000_1zzz_zzzz_zzzz : highest_pending_bit = 16'h800;
       16'b0001_zzzz_zzzz_zzzz : highest_pending_bit = 16'h1000;
       16'b001z_zzzz_zzzz_zzzz : highest_pending_bit = 16'h2000;
       16'b01zz_zzzz_zzzz_zzzz : highest_pending_bit = 16'h4000;
       16'b1zzz_zzzz_zzzz_zzzz : highest_pending_bit = 16'h8000;
     endcase // casez (pending)
   
   always @(handling)
     casez (handling)
       16'b0000_0000_0000_000z : handling_id = 4'd0;
       16'b0000_0000_0000_001z : handling_id = 4'd1;
       16'b0000_0000_0000_01zz : handling_id = 4'd2;
       16'b0000_0000_0000_1zzz : handling_id = 4'd3;
       16'b0000_0000_0001_zzzz : handling_id = 4'd4;
       16'b0000_0000_001z_zzzz : handling_id = 4'd5;
       16'b0000_0000_01zz_zzzz : handling_id = 4'd6;
       16'b0000_0000_1zzz_zzzz : handling_id = 4'd7;
       16'b0000_0001_zzzz_zzzz : handling_id = 4'd8;
       16'b0000_001z_zzzz_zzzz : handling_id = 4'd9;
       16'b0000_01zz_zzzz_zzzz : handling_id = 4'd10;
       16'b0000_1zzz_zzzz_zzzz : handling_id = 4'd11;
       16'b0001_zzzz_zzzz_zzzz : handling_id = 4'd12;
       16'b001z_zzzz_zzzz_zzzz : handling_id = 4'd13;
       16'b01zz_zzzz_zzzz_zzzz : handling_id = 4'd14;
       16'b1zzz_zzzz_zzzz_zzzz : handling_id = 4'd15;
     endcase // case (handling)
endmodule
