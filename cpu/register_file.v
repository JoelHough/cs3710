`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    22:18:42 11/29/2013 
// Design Name: 
// Module Name:    register_file 
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
module register_file(
                     input             clk,
                     input [3:0]       a_reg_sel,
                     input [3:0]       b_reg_sel,
                     input             a_reg_rd_en,
                     input             b_reg_rd_en,
                     input             a_reg_wr_en,
                     input [15:0]      a_reg_wr_data,
                     input             psr_wr_en,
                     input [15:0]      psr_wr_data,
                     output reg [15:0] psr_rd_data = 16'b0,
                     output reg [15:0] a_reg_rd_data = 16'b0,
                     output reg [15:0] b_reg_rd_data = 16'b0
                     );


   localparam NUM_GENERAL_REGS = 14;
   localparam PARAM_STACK_REG = 4'hF;
   localparam RETURN_STACK_REG = 4'hE;
   localparam PROGRAM_STATUS_REG = 4'hD;
   localparam WIDTH = 16;
   reg [15:0]                      regs [NUM_GENERAL_REGS-1:0];
   reg [15:0]                      a_reg_rd = 1'b0;
   reg [15:0]                      b_reg_rd = 1'b0;
   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [WIDTH-1:0]     param_stack_pop_data;   // From ParamStack of stack.v
   wire [WIDTH-1:0]     return_stack_pop_data;  // From ReturnStack of stack.v
   // End of automatics

   reg                  param_push, param_a_pop, param_b_pop, return_push, return_a_pop, return_b_pop, gen_wr_en, gen_a_rd_en, gen_b_rd_en, psr_internal_wr_en;
   
   always @* begin
      param_push = 1'b0;
      param_a_pop = 1'b0;
      return_push = 1'b0;
      return_a_pop = 1'b0;
      gen_wr_en = 1'b0;
      gen_a_rd_en = 1'b0;
      psr_internal_wr_en = 1'b0;
      case (a_reg_sel)
        PARAM_STACK_REG: begin
           param_push = a_reg_wr_en;
           param_a_pop = a_reg_rd_en;
           a_reg_rd_data = param_stack_pop_data;
        end
        RETURN_STACK_REG: begin
           return_push = a_reg_wr_en;
           return_a_pop = a_reg_rd_en;
           a_reg_rd_data = return_stack_pop_data;
        end
        PROGRAM_STATUS_REG: begin
           a_reg_rd_data = psr_rd_data;
           psr_internal_wr_en = 1'b1;
        end
        default: begin
           gen_wr_en = a_reg_wr_en;
           gen_a_rd_en = a_reg_rd_en;
           a_reg_rd_data = a_reg_rd;
        end
      endcase // case (a_reg_sel)
   end // always @ (a_reg_sel, a_reg_wr_en, a_reg_rd_en)

   always @* begin
      param_b_pop = 1'b0;
      return_b_pop = 1'b0;
      gen_b_rd_en = 1'b0;
      case (b_reg_sel)
        PARAM_STACK_REG: begin
           param_b_pop = b_reg_rd_en;
           b_reg_rd_data = param_stack_pop_data;
        end
        RETURN_STACK_REG: begin
           return_b_pop = b_reg_rd_en;
           b_reg_rd_data = return_stack_pop_data;
        end
        PROGRAM_STATUS_REG: b_reg_rd_data = psr_rd_data;
        default: begin
           gen_b_rd_en = b_reg_rd_en;
           b_reg_rd_data = b_reg_rd;
        end
      endcase // case (b_reg_sel)
   end

   always @(posedge clk) begin
      if (gen_wr_en) regs[a_reg_sel] <= a_reg_wr_data;
      if (gen_a_rd_en) a_reg_rd <= regs[a_reg_sel];
      if (gen_b_rd_en) b_reg_rd <= regs[b_reg_sel];
   end

   stack ParamStack (// Outputs
                     .pop_data          (param_stack_pop_data[WIDTH-1:0]),
                     // Inputs
                     .push              (param_push),
                     .pop               (param_a_pop | param_b_pop),
                     .push_data         (a_reg_wr_data),/*AUTOINST*/
                     // Inputs
                     .clk               (clk));

   stack ReturnStack (// Outputs
                      .pop_data          (return_stack_pop_data[WIDTH-1:0]),
                      // Inputs
                      .push              (return_push),
                      .pop               (return_a_pop | return_b_pop),
                      .push_data         (a_reg_wr_data),/*AUTOINST*/
                      // Inputs
                      .clk              (clk));

   always @(posedge clk)
      if (psr_internal_wr_en)
        psr_rd_data <= a_reg_wr_data;
      else if (psr_wr_en)
        psr_rd_data <= psr_wr_data;
        
endmodule
