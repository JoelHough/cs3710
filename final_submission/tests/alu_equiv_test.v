`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   18:12:06 09/04/2013
// Design Name:   alu
// Module Name:   /home/joel/alu/alu_equiv_test.v
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

module alu_equiv_test;

// Inputs
reg [15:0] a;
reg [15:0] b;
reg [3:0] opcode;

// Outputs
wire equiv;

// Locals
integer i;
integer errors = 0;
reg STOP_ON_ERROR = 1;

// Instantiate the Unit Under Test (UUT)
equiv_checker uut (
  .a(a), 
  .b(b), 
  .opcode(opcode), 
  .equiv(equiv)
);

function [alu.OPCODE_WIDTH-1:0] select_opcode;
  input [31:0] opcode_num;
  case (opcode_num)
        0 : begin
          select_opcode = alu.ADD;
        end
        1 : begin
          select_opcode = alu.AND;
        end
        2 : begin
          select_opcode = alu.CMP;
        end
        3 : begin
          select_opcode = alu.LSH;
        end
        4 : begin
          select_opcode = alu.OR;
        end
        5 : begin
          select_opcode = alu.SUB;
        end
        6 : begin
          select_opcode = alu.B;
        end
        default : begin
          select_opcode = alu.XOR;
        end
  endcase
endfunction

initial begin
  // Initialize Inputs
  a = 0;
  b = 0;
  opcode = 0;

  // Wait 100 ns for global reset to finish
  #100;

  /* equivalence tests */
  $display("BEGINNING EQUIVALENCE TESTS");
  for (i=0;i<100;i=i+1)
  begin
    a = $random % 16; b = $random % 16; opcode = select_opcode($random % 7);
    $display("a:%d, b:%d, opcode:%b", a, b, opcode);
    #10;
    if (~equiv) begin
      $display("ERROR: not equivalent");
      errors = errors + 1;
      if (STOP_ON_ERROR) $stop;
    end
  end
  $display("END OF EQUIVALENCE TESTS");
  
  $display("Test finished with %d error(s)", errors);
end
      
endmodule

