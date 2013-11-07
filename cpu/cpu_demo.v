`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    02:29:58 10/20/2013 
// Design Name: 
// Module Name:    cpu_demo 
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
module cpu_demo(
    input clk,
    output [7:0] vgaColor,
    output Hsync,
    output Vsync
    );

  wor [15:0] mem_out;
  wire [15:0] mem_in;
  wire [15:0] mem_addr;
  wire mem_wr_en, mem_rd_en;

  cpu uut (
		.clk(clk), 
		.en(1'b1),
		.reset(1'b0), 
		.mem_data_in(mem_out), 
		.mem_addr(mem_addr), 
		.mem_wr_en(mem_wr_en), 
		.mem_rd_en(mem_rd_en), 
		.mem_data_out(mem_in)
	);

  wire base_en; wire [15:0] base_out; wire [9:0] base_addr;
  mem_map #(.START(16'h0), .SIZE(16'h3FF), .ADDR_BITS(10))
    base (.clk(clk), .mem_addr(mem_addr), .data_in(base_out), .data_out(mem_out), .addr(base_addr), .en(base_en));
  
  wire [15:0] char_row_col;
  mem_mapped_reg #(.ADDR(16'h400)) char_addr_reg
    (.clk(clk), .mem_addr(mem_addr), .mem_wr_en(mem_wr_en), .mem_rd_en(mem_rd_en), .data_in(mem_in), .data_out(mem_out), .reg_out(char_row_col));
  /*wire rand_en; wire [15:0] rand_out; wire [9:0] rand_addr;
  mem_map #(.START(base.END), .SIZE(16'hF), .ADDR_BITS(4))
    rand (.clk(clk), .mem_addr(mem_addr), .data_in(rand_out), .data_out(mem_out), .addr(rand_addr), .en(rand_en));
  
  wire char_en; wire [15:0] char_out; wire [9:0] char_addr;
  mem_map #(.START(rand.END), .SIZE(16'h12c0), .ADDR_BITS(13))
    char (.clk(clk), .mem_addr(mem_addr), .data_in(char_out), .data_out(mem_out), .addr(char_addr), .en(char_en));
*/
  base_rom rom (
    .clk(clk),
    .en(mem_rd_en & base_en),
    .addr(base_addr),
    .data(base_out));

  wire pixel_clk;
  reg [1:0] clock_counter = 2'b0;
  assign pixel_clk = clock_counter[1];
  always @(posedge clk)
    clock_counter <= clock_counter + 1'b1;

  reg vga_wr_clk;
  always @(posedge clk) begin
    vga_wr_clk <= mem_addr == 16'h401 & mem_wr_en;
  end
  vga_character_display display (.write_clk(vga_wr_clk), .row(char_row_col[12:8]), .col(char_row_col[6:0]), .char(mem_in[7:0]),
    .pixel_clk(pixel_clk), .color(vgaColor), .hsync(Hsync), .vsync(Vsync));
endmodule
