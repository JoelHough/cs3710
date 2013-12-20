`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   18:12:06 09/04/2013
// Design Name:   alu
// Module Name:   /home/joel/alu/alu_random_test.v
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

module alu_random_test;

// Inputs
reg [15:0] a;
reg [15:0] b;
reg [3:0] opcode;

// Outputs
wire [15:0] z;
wire [4:0] flags;

// Locals
integer errors = 0;
reg STOP_ON_ERROR = 1;

// Instantiate the Unit Under Test (UUT)
alu uut (
  .a(a), 
  .b(b), 
  .opcode(opcode), 
  .result(z), 
  .flags(flags)
);

function ASSERT_FLAG_EQUAL;
  input expected, actual;
  input [(12*8):0] name;
  begin
    ASSERT_FLAG_EQUAL = actual != expected;
    if (ASSERT_FLAG_EQUAL) $display("ERROR: expected %s to be %b, got %b", name, expected, actual);
  end
endfunction

function ASSERT_FLAGS_EQUAL;
  input [uut.NUM_FLAGS-1:0] expected_flags;
  begin
    ASSERT_FLAGS_EQUAL =  ASSERT_FLAG_EQUAL(expected_flags[uut.Z], flags[uut.Z], "Z") |
                          ASSERT_FLAG_EQUAL(expected_flags[uut.CARRY], flags[uut.CARRY], "CARRY") |
                          ASSERT_FLAG_EQUAL(expected_flags[uut.FLAG], flags[uut.FLAG], "FLAG") |
                          ASSERT_FLAG_EQUAL(expected_flags[uut.LOW], flags[uut.LOW], "LOW") |
                          ASSERT_FLAG_EQUAL(expected_flags[uut.NEGATIVE], flags[uut.NEGATIVE], "NEGATIVE");
  end
endfunction

function ASSERT_RESULT_EQUAL;
  input [uut.WORD_WIDTH-1:0] expected_result;
  begin
    ASSERT_RESULT_EQUAL = z != expected_result;
    if (ASSERT_RESULT_EQUAL) $display("ERROR: expected result %0d (b%b), got %0d (b%b)", expected_result, expected_result, z, z);
  end
endfunction

function ASSERT;
  input [uut.WORD_WIDTH-1:0] expected_result;
  input [uut.NUM_FLAGS-1:0] expected_flags;
  begin
    ASSERT = ASSERT_RESULT_EQUAL(expected_result) | ASSERT_FLAGS_EQUAL(expected_flags);
    if (ASSERT) begin
      errors = errors + 1;
      if (STOP_ON_ERROR) $stop;
    end
  end
endfunction

function [uut.OPCODE_WIDTH-1:0] select_opcode;
  input [31:0] opcode_num;
  case (opcode_num)
        0 : begin
          select_opcode = uut.ADD;
        end
        1 : begin
          select_opcode = uut.AND;
        end
        2 : begin
          select_opcode = uut.CMP;
        end
        3 : begin
          select_opcode = uut.LSH;
        end
        4 : begin
          select_opcode = uut.OR;
        end
        5 : begin
          select_opcode = uut.SUB;
        end
        6 : begin
          select_opcode = uut.B;
        end
        default : begin
          select_opcode = uut.XOR;
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
  $monitor("a: %0d, b: %0d, z: %0d, flags: {z:%b,c:%b,f:%b,l:%b,n:%b}, time: %0d",
    a, b, z,
    flags[uut.Z], flags[uut.CARRY], flags[uut.FLAG], flags[uut.LOW], flags[uut.NEGATIVE],
    $time);

  /* random tests */
  $display("BEGINNING RANDOM TESTS");
  for (i=0;i<100;i=i+1)
  begin
    a = $random % 16; b = $random % 16; opcode = select_opcode($random % 7);
    $display("opcode:%b", opcode);
    #10;
  end
  $display("END OF RANDOM TESTS");
  
  $display("Test finished with %d error(s)", errors);
end
      
endmodule

