`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:38 09/22/2013
// Design Name:   alu_regfile
// Module Name:   /home/joel/cs3710/alu_regfile_demo/fib_test.v
// Project Name:  alu_regfile_demo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_regfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fib_test;

	// Inputs
	reg clk;
	reg reset;
	
  // Outputs
	wire [2:0] a_reg, b_reg, dest_reg;
  wire [15:0] immediate;
  wire immediate_p;
  wire [7:0] alu_op;
  wire [15:0] alu_bus, alu_a_in, alu_b_in;
  wire [4:0] flags;

	// Instantiate the Unit Under Test (UUT)
  alu_regfile uut (.clk(clk), .reset(reset),
    .a_reg(a_reg), .b_reg(b_reg), .dest_reg(dest_reg),
    .immediate(immediate), .immediate_p(immediate_p),
    .alu_op(alu_op),
    .alu_bus(alu_bus), .alu_a_in(alu_a_in), .alu_b_in(alu_b_in), .flags(flags));
  
  fib_machine fib (.clk(clk), .reset(reset),
    .a_reg(a_reg), .b_reg(b_reg), .dest_reg(dest_reg),
    .immediate(immediate), .immediate_p(immediate_p),
    .alu_op(alu_op));

  integer i;
  
	initial begin
    $monitor("a_in:%d, b_in:%d, result:%d, flags:%b, regs:%x", alu_a_in, alu_b_in, alu_bus, flags, uut.reg_bus);
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
    reset = 0;
		// Add stimulus here
    for (i=0;i<64;i=i+1) begin
      clk = 1'b1;
      #10;
      clk = 1'b0;
      #10;
    end
	end
      
endmodule

