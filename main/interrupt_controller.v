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
                            input            clk,
                            input            handle_interrupt,
                            input            clear_interrupt,
                            input [15:0]     interrupt_lines,
                            output reg       cpu_interrupt,
                            output reg [3:0] cpu_interrupt_id
                            );
   initial begin
      cpu_interrupt = 1'b0;
      cpu_interrupt_id = 4'b0;
   end
   
   wire [16:0]                           handle;
   wire [16:0]                           clear_in_process;
   wire [15:0]                           handling;
   reg [3:0]                             handling_id = 4'b0;
   wire                                  trigger;

   assign handle[16] = handle_interrupt;
   assign clear_in_process[16] = clear_interrupt;
   assign trigger = |handling;
   
   interrupt Interrupts[15:0] (.clk(clk),
                               .set_pending(interrupt_lines),
                               .clear_in_process(clear_in_process[16:1]),
                               .handle(handle[16:1]),
                               .clear_in_process_carry(clear_in_process[15:0]),
                               .handle_carry(handle[15:0]),
                               .handling(handling));
   
   always @(handling) begin
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
   end // always @ (handling)

   always @(posedge clk) begin
      cpu_interrupt <= trigger;
      cpu_interrupt_id <= handling_id;
   end
   /*
   always @(posedge clk) begin
      
      // mssb = most significant set bit
      // if (clear_interrupt)
      //   unset mssb in in_process_interrupts
      // if (pending_mssb > in_process_mssb)
      //   unset pending_mssb
      //   trigger pending_mssb
      //   set new in_process_mssb
      pending_interrupts <= pending_interrupts | interrupt_lines;
      cpu_interrupt_id <= priority_interrupt;
      cpu_interrupt <= priority_interrupt > cpu_interrupt_id | pending_interrupts[0];
   end
    */
endmodule
