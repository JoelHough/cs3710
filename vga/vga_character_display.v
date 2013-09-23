`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    22:15:51 09/05/2013 
// Design Name: 
// Module Name:    vga_character_display 
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
module vga_character_display(
    input write_clk,
    input [4:0] row,
    input [6:0] col,
    input [7:0] char,
    input pixel_clk,
    output [7:0] color,
    output hsync,
    output vsync
    );

  wire [9:0] x;
  wire [8:0] y;
  reg counter_en = 1'b0;
  reg counter_rst = 1'b1;
  wire row_clk;
  mod_counter #(.MAX(639)) pixel_col_counter (.clk(pixel_clk), .en(counter_en), .reset(counter_rst), .count(x), .rollover(row_clk));
  mod_counter #(.MAX(479)) pixel_row_counter (.clk(row_clk), .en(1'b1), .reset(counter_rst), .count(y), .rollover());
  
  wire [7:0] display_char;
  wire [2:0] display_char_x;
  wire [3:0] display_char_y;
  assign display_char_x = x[2:0];
  assign display_char_y = y[3:0];
  wire pixel;
  dina_font_rom characters (.clk(pixel_clk), .en(counter_en), .char(display_char), .x(display_char_x), .y(display_char_y), .pixel(pixel));

  wire [6:0] screen_x;
  wire [4:0] screen_y;
  assign screen_x = x[9:3];
  assign screen_y = y[8:4];
  character_buffer buffer (.write_clk(write_clk), .write_en(1'b1), .write_row(row), .write_col(col), .write_char(char),
    .read_clk(pixel_clk), .read_en(counter_en), .read_row(screen_y), .read_col(screen_x), .read_char(display_char));

  reg wr_en = 1'b0;
  wire wr_rq;
  wire resync;
  wire [7:0] wr_pixel;
  assign wr_pixel = pixel ? 8'b11_111_111 : 8'b10_010_010;//y[8] ? x[7:0] : y[7:0];//
  pixel_buffer_vga_controller controller (.pixel(wr_pixel), .wr_clk(pixel_clk), .wr_en(wr_en), .pixel_clk(pixel_clk),
    .wr_rq(wr_rq), .resync(resync), .color(color), .hsync(hsync), .vsync(vsync));

  parameter RESET = 2'h0;
  parameter PRIMING = 2'h1;
  parameter WAITING = 2'h2;
  parameter RUNNING = 2'h3;
  reg [1:0] priming_delay = 2'b10;
  reg [1:0] state = RESET;
  reg resync_ack = 1'b0;
  always @(posedge pixel_clk) begin
    case (state)
      RESET: state <= PRIMING;
      PRIMING: state <= priming_delay == 2'b0 ? (wr_rq ? RUNNING : WAITING) : PRIMING;
      WAITING: state <= wr_rq ? RUNNING : WAITING;
      RUNNING: if (resync & ~resync_ack) state <= RESET;
        else if (~wr_rq) state <= WAITING;
        else state <= RUNNING;
    endcase
  end
  
  always @(posedge pixel_clk) begin
    case (state)
      RESET: begin
        resync_ack <= 1'b1;
        counter_en <= 1'b0;
        counter_rst <= 1'b1;
        wr_en <= 1'b0;
        priming_delay <= 2'b10;
      end
      PRIMING: begin
        counter_en <= 1'b1;
        counter_rst <= 1'b0;
        priming_delay <= priming_delay - 2'b1;
      end
      WAITING: begin
        counter_en <= 1'b0;
        counter_rst <= 1'b0;
        wr_en <= 1'b0;
      end
      RUNNING: begin
        counter_en <= 1'b1;
        counter_rst <= 1'b0;
        wr_en <= 1'b1;
        if (~resync) resync_ack <= 1'b0;
      end
    endcase
  end
endmodule
