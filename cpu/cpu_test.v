`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   18:39:00 10/19/2013
// Design Name:   cpu
// Module Name:   /home/joel/cs3710/cpu/cpu_test.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_test;

	// Inputs
	reg clk = 0;
	reg en;
	reg reset;
	wire [15:0] mem_data_in;

	// Outputs
	wire [15:0] mem_addr;
	wire mem_wr_en;
	wire mem_rd_en;
	wire [15:0] mem_data_out;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.clk(clk), 
		.en(en), 
		.reset(reset), 
		.mem_data_in(mem_data_in), 
		.mem_addr(mem_addr), 
		.mem_wr_en(mem_wr_en), 
		.mem_rd_en(mem_rd_en), 
		.mem_data_out(mem_data_out)
	);

  block_ram ram (
    .clk(clk),
    .en(mem_rd_en | mem_wr_en),
    .wr_en(mem_wr_en),
    .addr(mem_addr[10:0]),
    .data_in(mem_data_out),
    .data_out(mem_data_in));
    
  always begin
    #10; clk = ~clk;
  end
	
  initial begin
		// Initialize Inputs
		en = 1;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

