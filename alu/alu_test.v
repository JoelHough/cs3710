`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:12:06 09/04/2013
// Design Name:   alu
// Module Name:   /home/joel/alu/alu_test.v
// Project Name:  alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [16:0] A;
	reg [16:0] B;
	reg [8:0] Opcode;
	reg Carry;

	// Outputs
	wire [16:0] Z;
	wire [5:0] Flags;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.Opcode(Opcode), 
		.Carry(Carry), 
		.Z(Z), 
		.Flags(Flags)
	);

	initial begin
		// Initialize Inputs
		A = uut.WIDTH;
		B = 0;
		Opcode = 0;
		Carry = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

