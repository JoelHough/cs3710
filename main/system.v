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
module system(input clk,
              input [7:0]  sw,
              input [4:0]  btn,
				  input  serial_data,			//signal from SNES controller
				  output data_latch,				//required signal to the SNES controller
				  output data_clock,				//required signal to the SNES controller
              output reg [7:0] led,
              output [7:0] seg,
              output [3:0] an,
              output       Hsync,
              output       Vsync,
              output [7:0] vgaColor
              );

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 ack_interrupt;          // From Cpu of cpu.v
   wire [3:0]           ack_interrupt_id;       // From Cpu of cpu.v
   wire                 clear_interrupt;        // From Cpu of cpu.v
   wire                 cpu_interrupt;          // From InterruptController of interrupt_controller.v
   wire [3:0]           cpu_interrupt_id;       // From InterruptController of interrupt_controller.v
   wire [15:0]          mem_addr;               // From Cpu of cpu.v
   wire                 mem_rd_en;              // From Cpu of cpu.v
   wire [15:0]          mem_wr_data;            // From Cpu of cpu.v
   wire                 mem_wr_en;              // From Cpu of cpu.v
   wire                 request_interrupt;      // From Cpu of cpu.v
   // End of automatics

   reg [15:0]           mem_rd_data = 16'b0;
   reg [15:0]           last_addr_read = 16'hFFFF;
   reg                  block_ram_en = 1'b0;

   reg                  interrupt_control_en = 1'b0;
   wire [15:0]          interrupt_lines;
   reg [15:0]           memmap_interrupts = 16'b0;           

   wire [15:0]          block_ram_rd_data;

   wire [15:0]          prng_rd_data;

   reg [16:0]           ms_counter = 17'b0;
   wire                 pixel_clk;
   reg                  ms_strobe = 1'b0;

   reg [1:0]            timer_en = 2'b0;
   wire [1:0]           timer_done;
   wire [1:0]           timer_strobe;
   wire                 vsync_strobe;
   
	reg [15:0]				SNES_buttons;
	
   wire [7:0]           pixel;
   wire                 pixel_rdy, pixel_rq, new_frame;
   reg                  tgg_en = 1'b0;
   wire [15:0]          tgg_rd_data;
   reg                  led_en;
   reg                  seg_en;
   reg [15:0]           seg_hex = 16'b0;
	 wire                 en;
   assign en = 1'b1;
   
   clock_manager ClockManager (.clk(clk), .sys_clk(sys_clk), .pixel_clk(pixel_clk));

   cpu Cpu (.clk                        (sys_clk),
            .interrupt                  (cpu_interrupt),
            .interrupt_id               (cpu_interrupt_id),
            /*AUTOINST*/
            // Outputs
            .mem_addr                   (mem_addr[15:0]),
            .mem_wr_en                  (mem_wr_en),
            .mem_rd_en                  (mem_rd_en),
            .mem_wr_data                (mem_wr_data[15:0]),
            .request_interrupt          (request_interrupt),
            .clear_interrupt            (clear_interrupt),
            .ack_interrupt              (ack_interrupt),
            .ack_interrupt_id           (ack_interrupt_id[3:0]),
            // Inputs
            .en                         (en),
            .mem_rd_data                (mem_rd_data[15:0]));


   always @(posedge sys_clk) begin // 100Mhz * 100000 = 1ms
     ms_counter <= ms_counter == 17'd99999 ? 17'b0 : ms_counter + 1'b1;
     ms_strobe <= ms_counter == 17'b0;
   end

   timer Timer [1:0] (.clk(sys_clk), .cnt_en(ms_strobe), .wr_en(timer_en & {2{mem_wr_en}}), .wr_data(mem_wr_data), .done(timer_done));

   one_shot TimerOs [1:0] (.clk(sys_clk), .signal(timer_done), .strobe(timer_strobe));
   
   lfsr Lfsr (.clk(sys_clk), .rd_data(prng_rd_data));
	
	
   
	seven_segment SevenSegment (.clk(ms_strobe), .data(seg_hex), .seg(seg), .an(an));
	
	
	wire SNES_int; //int_pulse used by CPU
	
	SNES_control controller(
						.clk(sys_clk),							//100MHz clock
						.serial_data(serial_data),			//signal from SNES controller
						.data_latch(data_latch),			//required signal to the SNS controller
						.interrupt(SNES_int),				//interrupt pulse when a btn state changes
						.data_clock(data_clock)				//required signal to the SNS controller
						);
						
	//one_shot SNEScontrol (.clk(sys_clk), .signal(SNES_int), .strobe(SNES_strobe));

   always @(posedge sys_clk) begin
      if (led_en & mem_wr_en)
        led = mem_wr_data[7:0];
      if (seg_en & mem_wr_en)
        seg_hex = mem_wr_data;
   end
   
   interrupt_controller InterruptController(.clk                (sys_clk),
                                            /*AUTOINST*/
                                            // Outputs
                                            .cpu_interrupt      (cpu_interrupt),
                                            .cpu_interrupt_id   (cpu_interrupt_id[3:0]),
                                            // Inputs
                                            .clear_interrupt    (clear_interrupt),
                                            .ack_interrupt      (ack_interrupt),
                                            .ack_interrupt_id   (ack_interrupt_id[3:0]),
                                            .request_interrupt  (request_interrupt),
                                            .interrupt_lines    (interrupt_lines[15:0]));

   one_shot VsyncOs (.clk(sys_clk), .signal(Vsync), .strobe(vsync_strobe));
	// changed to 12'b0 and added SNES at first
   assign interrupt_lines = {12'b0, SNES_int, vsync_strobe, timer_strobe[1:0]} | memmap_interrupts;
   always @(posedge sys_clk)
     if (interrupt_control_en & mem_wr_en)
       memmap_interrupts <= mem_wr_data;
     else
       memmap_interrupts <= 16'b0;
   

   block_ram BlockRam (.en       (block_ram_en),
                       .wr_en    (block_ram_en & mem_wr_en),
                       .data_out (block_ram_rd_data),
                       .clk      (sys_clk),
                       .addr     (mem_addr[11:0]),
                       .data_in  (mem_wr_data));

   pixel_buffer_vga_controller PixelBufferVgaController (.pixel(pixel),
                                                         .wr_clk(sys_clk),
                                                         .wr_en(pixel_rdy),
                                                         .pixel_clk(pixel_clk),
                                                         .wr_rq(pixel_rq),
                                                         .resync(new_frame),
                                                         .color(vgaColor),
                                                         .hsync(Hsync),
                                                         .vsync(Vsync));
   //assign pixel_rdy = pixel_rq;
   //assign pixel = 8'b11_101_101;
   tank_game_graphics TankGameGraphics (.clk(sys_clk),
                                        .addr(mem_addr[2:0]),
                                        .wr_en(tgg_en & mem_wr_en),
                                        .wr_data(mem_wr_data),
                                        .rd_en(tgg_en),
                                        .rd_data(tgg_rd_data),
                                        .new_frame(new_frame),
                                        .pixel_rq(pixel_rq),
                                        .pixel_data(pixel),
                                        .pixel_rdy(pixel_rdy));

   localparam BLOCK_RAM_ADDR = 16'h0zzz; //16'b0000_zzzz_zzzz_zzzz;
   localparam INTERRUPT_CONTROL_ADDR = 16'h1001;
   localparam PRNG_ADDR = 16'h1002;
   localparam TIMER_ADDR = 16'b0001_0000_0000_010z;
   localparam TGG_ADDR = 16'b0001_0000_0000_1zzz;
   localparam SWITCHES_ADDR = 16'h1020;
   localparam LED_ADDR = 16'h1021;
   localparam SEG_ADDR = 16'h1022;
   localparam SNES_ADDR = 16'h1023;
	
   /* memory map enables */
   always @(mem_addr) begin
      block_ram_en = 1'b0;
      interrupt_control_en = 1'b0;
      timer_en = 2'b0;
      tgg_en = 1'b0;
      led_en = 1'b0;
      seg_en = 1'b0;
      casez (mem_addr)
        BLOCK_RAM_ADDR : block_ram_en = 1'b1;
        INTERRUPT_CONTROL_ADDR : interrupt_control_en = 1'b1;
        TIMER_ADDR : timer_en = mem_addr[0] + 2'b1;
        TGG_ADDR : tgg_en = 1'b1;
        LED_ADDR : led_en = 1'b1;
        SEG_ADDR : seg_en = 1'b1;
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
       TGG_ADDR : mem_rd_data = tgg_rd_data;
       SWITCHES_ADDR : mem_rd_data = {sw, 3'b0, btn};
		 SNES_ADDR : mem_rd_data = SNES_buttons;
		 
       default : mem_rd_data = 16'hDEAF;
     endcase // casez (last_addr_read)
   
endmodule

// Local Variables:
// verilog-library-directories:("../main" "../main/ipcore_dir" "../cpu" "../register_file" "../alu" "../control" "../vga")
// End:
