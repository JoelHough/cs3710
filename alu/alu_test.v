`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
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

// Outputs
wire [15:0] z;
wire [4:0] flags;
wire [15:0] z_synthesis;
wire [4:0] flags_synthesis;

// Locals
integer i;
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

alu_synthesis uut_synthesis (
  .a(a),
  .b(b),
  .opcode(opcode),
  .result(z_synthesis),
  .flags(flags_sythesis));

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

  /* corner cases */
  $display("BEGINNING CORNER CASE TESTS");
  /* ADD */
  $display("ADD");
  opcode = uut.ADD;
  a = 0; b = 0;
  #10;
  ASSERT(0, 0);
  
  a = 1; b = 1;
  #10;
  ASSERT(2, 0);

  // 16384 + 16384 = -32768
  a = 16'h4000; b = 16'h4000;
  #10;
  ASSERT(16'h8000, uut.FLAG_BIT);

  // -32768 + -32768 = 0
  a = 16'h8000; b = 16'h8000;
  #10;
  ASSERT(16'h0000, uut.FLAG_BIT | uut.CARRY_BIT);

  // -1 + 1 = 0
  a = 16'hFFFF; b = 16'h0001;
  #10;
  ASSERT(16'h0000, uut.CARRY_BIT);

  /* AND */
  $display("AND");
  opcode = uut.AND;
  a = 0; b = 0;
  #10;
  ASSERT(0, 0);
  
  a = 0; b = 16'hFFFF;
  #10;
  ASSERT(0, 0);
  
  a = 16'hAA55; b = 16'hA5A5;
  #10;
  ASSERT(16'hA005, 0);
  
  /* CMP */
  $display("CMP");
  opcode = uut.CMP;
  a = 0; b = 0;
  #10;
  ASSERT(0, uut.Z_BIT);
  
  a = 16'h7FFF; b = 16'h7FFF;
  #10;
  ASSERT(0, uut.Z_BIT);
  
  a = 16'hFFFF; b = 16'hFFFF;
  #10;
  ASSERT(0, uut.Z_BIT);
  
  a = 16'hFFFF; b = 16'hFFFE;
  #10;
  ASSERT(0, uut.LOW_BIT | uut.NEGATIVE_BIT);
  
  a = 16'h7FFF; b = 16'h7FFE;
  #10;
  ASSERT(0, uut.LOW_BIT | uut.NEGATIVE_BIT);
  
  a = 16'h8000; b = 16'h7FFF;
  #10;
  ASSERT(0, uut.LOW_BIT);
  
  a = 16'h7FFF; b = 16'h8000;
  #10;
  ASSERT(0, uut.NEGATIVE_BIT);
  
  /* LSH */
  $display("LSH");
  opcode = uut.LSH;
  a = 0; b = 0;
  #10;
  ASSERT(0, 0);
  
  a = 1; b = 0;
  #10;
  ASSERT(1, 0);
  
  a = 1; b = 1;
  #10;
  ASSERT(16'h0002, 0);
  
  a = 16'hFFFF; b = 1;
  #10;
  ASSERT(16'hFFFE, 0);
  
  a = 16'hFFFF; b = 16'h1F;
  #10;
  ASSERT(16'h7FFF, 0);
  
  a = 16'hFFFF; b = 16'h11;
  #10;
  ASSERT(1, 0);
  
  a = 16'hFFFF; b = 16'hF;
  #10;
  ASSERT(16'h8000, 0);
  
  a = 16'hFFFF; b = 16'hFFE0;
  #10;
  ASSERT(16'hFFFF, 0);
  
  /* MUL */
  $display("MUL - no MUL yet");
  //opcode = uut.MUL;
  
  /* OR */
  $display("OR");
  opcode = uut.OR;
  a = 0; b = 0;
  #10;
  ASSERT(0, 0);
  
  a = 0; b = 16'hFFFF;
  #10;
  ASSERT(16'hFFFF, 0);
  
  a = 16'hAA55; b = 16'hA5A5;
  #10;
  ASSERT(16'hAFF5, 0);
  
  /* SUB */
  $display("SUB");
  opcode = uut.SUB;
  a = 0; b = 0;
  #10;
  ASSERT(0, 0);
  
  a = 1; b = 1;
  #10;
  ASSERT(0, 0);

  // -2 - 32767 = 32767
  a = 16'hFFFE; b = 16'h7FFF;
  #10;
  ASSERT(16'h7FFF, uut.FLAG_BIT);

  // 0 - -32768 = -32768
  a = 16'h0000; b = 16'h8000;
  #10;
  ASSERT(16'h8000, uut.FLAG_BIT | uut.CARRY_BIT);

  // 0 - 1 = -1
  a = 16'h0000; b = 16'h0001;
  #10;
  ASSERT(16'hFFFF, uut.CARRY_BIT);

  /* XOR */
  $display("XOR");
  opcode = uut.XOR;
  a = 0; b = 0;
  #10;
  ASSERT(0, 0);
  
  a = 0; b = 16'hFFFF;
  #10;
  ASSERT(16'hFFFF, 0);
  
  a = 16'hAA55; b = 16'hA5A5;
  #10;
  ASSERT(16'h0FF0, 0);
  $display("END OF CORNER CASE TESTS");

  /* random tests */
  $display("BEGINNING RANDOM TESTS");
  for (i=0;i<10;i=i+1)
  begin
    a = $random % 16; b = $random % 16; opcode = select_opcode($random % 6);
    $display("opcode:%b", opcode);
    #10;
  end
  $display("END OF RANDOM TESTS");
  
  /* equivalence tests */
  $display("BEGINNING EQUIVALENCE TESTS");
  for (i=0;i<10;i=i+1)
  begin
    a = $random % 16; b = $random % 16; opcode = select_opcode($random % 6);
    $display("opcode:%b", opcode);
    #10;
    ASSERT(z_synthesis, flags_synthesis);
  end
  $display("END OF EQUIVALENCE TESTS");
  
  $display("Test finished with %d error(s)", errors);
end
      
endmodule

