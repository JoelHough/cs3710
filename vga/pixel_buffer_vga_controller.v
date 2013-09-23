`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    08:11:17 09/23/2013 
// Design Name: 
// Module Name:    pixel_buffer_vga_controller 
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
module pixel_buffer_vga_controller(
  input [7:0] pixel,
  input wr_clk,
  input wr_en,
  input pixel_clk,
  output wr_rq,
  output reg resync = 1'b1,
  output [7:0] color,
  output hsync,
  output vsync
    );

  wire empty, rd_en;
  wire [7:0] dout;
  wire prog_full;
  assign wr_rq = ~prog_full;
  
  pixel_buffer buffer (
    .wr_clk(wr_clk), // input wr_clk
    .rd_clk(pixel_clk), // input rd_clk
    .din(pixel), // input [7 : 0] din
    .wr_en(wr_en), // input wr_en
    .rd_en(rd_en), // input rd_en
    .dout(dout), // output [7 : 0] dout
    .full(), // output full
    .empty(empty), // output empty
    .prog_full(prog_full)
  );
  
  wire blank;
  vga_controller controller ( .pixel_clk(pixel_clk),
                              .hsync(hsync),
                              .vsync(vsync),
                              .blank(blank));
  
  assign color = blank ? 8'b0 : ((resync | empty) ? 8'b10_101_111 : dout);
  assign rd_en = (~empty & ~blank & ~resync);

  always @(posedge pixel_clk) begin
    if (empty) resync <= 1'b1;
    else if (~vsync) resync <= 1'b0;
  end   
endmodule
