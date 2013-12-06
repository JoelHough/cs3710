`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
//
// Create Date:   00:12:14 12/02/2013
// Design Name:   interrupt_controller
// Module Name:   /home/joel/cs3710/main/interrupt_controller_test.v
// Project Name:  main
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: interrupt_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module interrupt_controller_test;

	// Inputs
	reg clk;
  reg handle_interrupt;
	reg clear_interrupt;
  reg [3:0] clear_interrupt_id;
	reg [15:0] interrupt_lines;

	// Outputs
	wire cpu_interrupt;
	wire [3:0] cpu_interrupt_id;

	// Instantiate the Unit Under Test (UUT)
	interrupt_controller uut (
		.clk(clk),
    .handle_interrupt(handle_interrupt),
		.clear_interrupt(clear_interrupt),
    .clear_interrupt_id(clear_interrupt_id),
		.interrupt_lines(interrupt_lines), 
		.cpu_interrupt(cpu_interrupt), 
		.cpu_interrupt_id(cpu_interrupt_id)
	);

  task clock;
  begin
    #5;
    clk = 1;
    #10;
    clk = 0;
    #5;
  end
  endtask

  task clock4;
  begin
    clock;clock;clock;clock;
  end
  endtask
  
  task one_shot_interrupt;
  input [15:0] interrupts;
  begin
    interrupt_lines = interrupts;
    clock;
    interrupt_lines = 0;
  end
  endtask
  
  task one_shot_clear_interrupt;
  input [3:0] id;
  begin
    clear_interrupt_id = id;
    clear_interrupt = 1'b1;
    clock;
    clear_interrupt = 1'b0;
  end
  endtask
  
	initial begin
		// Initialize Inputs
		clk = 0;
    handle_interrupt = 1;
		clear_interrupt = 0;
    clear_interrupt_id = 0;
		interrupt_lines = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    
    // no interrupt
    clock4;
    #20;
    
    // irq0, delay, clear irq0, delay
    one_shot_interrupt(2**0);
    clock4;
    one_shot_clear_interrupt(0);
    clock4;
    #20;
    
    // irq15, delay, clear irq15, delay
    one_shot_interrupt(2**15);
    clock4;
    one_shot_clear_interrupt(15);
    clock4;
    #20;
    
    // irq1, delay, irq2 interrupts irq1, delay, clear, delay, clear, delay
    one_shot_interrupt(2**1);
    clock4;
    one_shot_interrupt(2**2);
    clock4;
    one_shot_clear_interrupt(2);
    clock4;
    one_shot_clear_interrupt(1);
    clock4;
    #20
    
    // irq2, delay, irq1 queues up behind irq2, delay, clear (irq1 should fire), delay, clear, delay
    one_shot_interrupt(2**2);
    clock4;
    one_shot_interrupt(2**1);
    clock4;
    one_shot_clear_interrupt(2);
    clock4;
    one_shot_clear_interrupt(1);
    clock4;
    #20;
    
    // irq1 and irq2, delay, clear, delay, clear, delay
    one_shot_interrupt(2**1 + 2**2);
    clock4;
    one_shot_clear_interrupt(2);
    clock4;
    one_shot_clear_interrupt(1);
    clock4;
    #20;
    
    // irq0 held for retriggering
    interrupt_lines = 2**0;
    clock4;
    one_shot_clear_interrupt(0);
    clock4;
    one_shot_clear_interrupt(0);
    clock4;
    interrupt_lines = 0;
    clock4;
    one_shot_clear_interrupt(0);
    clock4;
    one_shot_clear_interrupt(0);
    clock4;
    #20;
    
    // irq1, irq2 immediately after, delay, clear, delay, clear
    one_shot_interrupt(2**1);
    one_shot_interrupt(2**2);
    clock4;
    one_shot_clear_interrupt(2);
    clock4;
    one_shot_clear_interrupt(1);
    clock4;
    #20;
    
    // irq2, irq1 immediately after, delay, clear, delay, clear
    one_shot_interrupt(2**2);
    one_shot_interrupt(2**1);
    clock4;
    one_shot_clear_interrupt(2);
    clock4;
    one_shot_clear_interrupt(1);
    clock4;
    #20;
    
    // irq2, handle and irq1 immediately after, delay, clear, handle + delay, clear
    handle_interrupt = 0;
    one_shot_interrupt(2**2);
    handle_interrupt = 1;
    one_shot_interrupt(2**1);
    handle_interrupt = 0;
    clock;
    handle_interrupt = 1;
    clock;
    handle_interrupt = 0;
    clock4;
    one_shot_clear_interrupt(2);
    handle_interrupt = 1;
    clock;
    handle_interrupt = 0;
    clock4;
    one_shot_clear_interrupt(1);
    clock4;
    #20;
    
    
	end
      
endmodule

