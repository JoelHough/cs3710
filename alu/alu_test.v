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
reg [15:0] a;
reg [15:0] b;
reg [7:0] opcode;
//reg carry;

// Outputs
wire [15:0] z;
wire [4:0] flags;

// Locals
integer i;
integer errors = 0;
reg STOP_ON_ERROR = 1;

// Instantiate the Unit Under Test (UUT)
alu uut (
  .a(a), 
  .b(b), 
  .opcode(opcode), 
  //.carry(carry), 
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

initial begin
  // Initialize Inputs
  a = 0;
  b = 0;
  opcode = 0;
  //carry = 0;

  // Wait 100 ns for global reset to finish
  #100;
  $monitor("a: %0d, b: %0d, z: %0d, flags: {z:%b,c:%b,f:%b,l:%b,n:%b}, time: %0d",
    a, b, z,
    flags[uut.Z], flags[uut.CARRY], flags[uut.FLAG], flags[uut.LOW], flags[uut.NEGATIVE],
    $time);

  // Corner Cases
  opcode = uut.ADD;
  a = 0; b = 0;// carry = 0;
  #10;
  ASSERT(0, uut.Z_BIT);
  
  a = 1; b = 1;
  #10;
  ASSERT(2, 0);

  //opcode = uut.MUL;
  
  opcode = uut.SUB;
  
  opcode = uut.CMP;
  
  opcode = uut.AND;
  
  opcode = uut.OR;
  
  opcode = uut.XOR;

  // Random Tests
  
  for (i=0;i<10;i=i+1)
  begin
    a = $random % 16; b = $random % 16;// carry = $random % 1;
    #10;
  end

  // Equivalence Tests

  $display("Test finished with %d error(s)", errors);
end
      
endmodule

