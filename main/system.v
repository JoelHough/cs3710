`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    21:22:23 12/01/2013 
// Design Name: 
// Module Name:    system 
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
module system(
              input clk,
              output reg [15:0] mem_rd_data = 16'b0
              );

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 clear_interrupt;        // From Cpu of cpu.v
   wire [3:0]           clear_interrupt_id;     // From Cpu of cpu.v
   wire                 cpu_interrupt;          // From InterruptController of interrupt_controller.v
   wire [3:0]           cpu_interrupt_id;       // From InterruptController of interrupt_controller.v
   wire [15:0]          mem_addr;               // From Cpu of cpu.v
   wire                 mem_rd_en;              // From Cpu of cpu.v
   wire [15:0]          mem_wr_data;            // From Cpu of cpu.v
   wire                 mem_wr_en;              // From Cpu of cpu.v
   wire                 request_interrupt;      // From Cpu of cpu.v
   // End of automatics

   //reg [15:0]           mem_rd_data = 16'b0;
   reg [15:0]           last_addr_read = 16'hFFFF;
   reg                  block_ram_en = 1'b0;
   reg                  interrupt_control_en = 1'b0;
   reg [15:0]           interrupt_lines = 16'b0;
   wire [15:0]          block_ram_rd_data;
   wire [15:0]          prng_rd_data;
   wire pixel_clk, timer_clk;
   wire                 en;
   assign en = 1'b1;
   
   clock_manager ClockManager (.clk(clk), .sys_clk(sys_clk), .pixel_clk(pixel_clk), .timer_clk(timer_clk));

   cpu Cpu (.interrupt                  (cpu_interrupt),
            .interrupt_id               (cpu_interrupt_id),
            /*AUTOINST*/
            // Outputs
            .mem_addr                   (mem_addr[15:0]),
            .mem_wr_en                  (mem_wr_en),
            .mem_rd_en                  (mem_rd_en),
            .mem_wr_data                (mem_wr_data[15:0]),
            .request_interrupt          (request_interrupt),
            .clear_interrupt            (clear_interrupt),
            .clear_interrupt_id         (clear_interrupt_id[3:0]),
            // Inputs
            .clk                        (sys_clk),
            .en                         (en),
            .mem_rd_data                (mem_rd_data[15:0]));

   always @(posedge sys_clk)
     if (interrupt_control_en & mem_wr_en)
       interrupt_lines <= mem_wr_data;
     else
       interrupt_lines <= 16'b0;
   

   lfsr Lfsr (.clk(sys_clk), .rd_data(prng_rd_data));
   
   interrupt_controller InterruptController(.clk                (sys_clk),
                                            .handle_interrupt   (request_interrupt),
                                            /*AUTOINST*/
                                            // Outputs
                                            .cpu_interrupt      (cpu_interrupt),
                                            .cpu_interrupt_id   (cpu_interrupt_id[3:0]),
                                            // Inputs
                                            .clear_interrupt    (clear_interrupt),
                                            .clear_interrupt_id (clear_interrupt_id[3:0]),
                                            .interrupt_lines    (interrupt_lines[15:0]));

   block_ram BlockRam (.en       (block_ram_en),
                       .wr_en    (block_ram_en & mem_wr_en),
                       .data_out (block_ram_rd_data),
                       .clk      (sys_clk),
                       .addr     (mem_addr[11:0]),
                       .data_in  (mem_wr_data));
   
   localparam BLOCK_RAM_ADDR = 16'h0zzz; //16'b0000_zzzz_zzzz_zzzz;
   localparam INTERRUPT_CONTROL_ADDR = 16'h1001;
   localparam PRNG_ADDR = 16'h1002;
   
   /* memory map enables */
   always @(mem_addr) begin
      block_ram_en = 1'b0;
      interrupt_control_en = 1'b0;
      casez (mem_addr)
        BLOCK_RAM_ADDR : block_ram_en = 1'b1;
        INTERRUPT_CONTROL_ADDR : interrupt_control_en = 1'b1;
      endcase // casez (mem_addr)
   end

   /* memory map read data */
   always @(posedge sys_clk)
     if (mem_rd_en)
       last_addr_read <= mem_addr;
   
   always @*
     casez (last_addr_read)
       BLOCK_RAM_ADDR : mem_rd_data = block_ram_rd_data;
       PRNG_ADDR : mem_rd_data = prng_rd_data;
       default : mem_rd_data = 16'hDEAF;
     endcase // casez (last_addr_read)
   
endmodule

// Local Variables:
// verilog-library-directories:("../main" "../cpu" "../register_file" "../alu" "../control" "../vga")
// End:
