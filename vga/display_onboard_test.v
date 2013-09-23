`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    23:41:55 09/05/2013 
// Design Name: 
// Module Name:    display_onboard_test 
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
module display_onboard_test(
    input clk,
    output [7:0] vgaColor,
    output Hsync,
    output Vsync
    );
 
    wire pixel_clk;
    wire char_clk;
    reg [22:0] clock_counter = 23'h000000;
    assign pixel_clk = clock_counter[1];
    assign char_clk = clock_counter[22];
    always @(posedge clk)
      clock_counter <= clock_counter + 1'b1;
    
    wire [4:0] row;
    wire [6:0] col;
    wire next_col;
    reg [7:0] char = 8'h0;
    mod_counter #(.MAX(29)) row_counter (.clk(~char_clk), .en(1'b1), .reset(1'b0), .count(row), .rollover(next_col));
    mod_counter #(.MAX(79)) col_counter (.clk(next_col), .en(1'b1), .reset(1'b0), .count(col), .rollover());
    always @(negedge char_clk)
      char <= char + 1'b1;
      
    /* // Solid color test
    wire blank;
    vga_controller controller ( .pixel_clk(pixel_clk),
                              .hsync(Hsync),
                              .vsync(Vsync),
                              .blank(blank),
                              .x(),
                              .y());
    assign vgaColor = blank ? 8'b0 : 8'b00_100_000;*/
    vga_character_display display (.write_clk(char_clk), .row(row), .col(col), .char(char),
      .pixel_clk(pixel_clk), .color(vgaColor), .hsync(Hsync), .vsync(Vsync));
endmodule
