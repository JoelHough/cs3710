`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:03:11 12/09/2013 
// Design Name: 
// Module Name:    tank_game_graphics 
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
module tank_game_graphics(
    input clk,
    input [2:0] addr,
    input wr_en,
    input [15:0] wr_data,
    input rd_en,
    output [15:0] rd_data,
    input new_frame,
    input pixel_rq,
    output reg [7:0] pixel_data,
    output reg pixel_rdy
    );

   wire [9:0] x;
   wire [9:0] wr_x;
   reg [9:0]  bullet_x;
   reg [9:0]  tank1_x;
   reg [9:0]  tank2_x;
   
   wire [8:0] y;
   wire [8:0] inv_y;
   wire [8:0] wr_y;
   reg [8:0]  bullet_y;
   reg [8:0]  tank1_y;
   reg [8:0]  tank2_y;
   reg [8:0]  ground_y [639:0];

   reg [9:0]  ground_index;
   /*reg [7:0]*/localparam  ground_color = 8'b00_011_100;
   
   reg [7:0] bullet_pixel = transparent_pixel;
   reg [7:0] tank1_pixel = transparent_pixel;
   reg [7:0] tank2_pixel = transparent_pixel;
   reg [7:0] ground_pixel = transparent_pixel;
   /*reg [7:0]*/localparam background_pixel = 8'b11_101_101;
   /*reg [7:0]*/localparam transparent_pixel = 8'b10_110_111;

   reg        counter_en = 1'b0;
   reg        counter_rst = 1'b1;
   wire       row_clk;   
   mod_counter #(.MAX(639)) pixel_col_counter (.clk(clk), .en(counter_en), .reset(counter_rst), .count(x), .rollover(row_clk));
   mod_counter #(.MAX(479)) pixel_row_counter (.clk(row_clk), .en(1'b1), .reset(counter_rst), .count(inv_y), .rollover());
   assign y = 9'd479 - inv_y;
   
   assign wr_x = wr_data[9:0];
   assign wr_y = wr_data[8:0];

   localparam RESET = 2'b00;
   localparam WAIT = 2'b01;
   localparam READ = 2'b10;
   localparam WRITE = 2'b11;
   reg [1:0] state = RESET;
   reg [1:0] next_state = RESET;
   reg       new_frame_ack = 1'b0;
   
   always @*
     case (state)
       RESET : next_state = WAIT;
       WAIT : next_state = pixel_rq ? READ : WAIT;
       READ : next_state = (new_frame & ~new_frame_ack) ? RESET : WRITE;
       WRITE : next_state = pixel_rq ? READ : WAIT;
     endcase // case (state)
   always @(state) begin
      counter_en = 1'b0;
      counter_rst = 1'b0;
      pixel_rdy = 1'b0;
      
      case (state)
        RESET : counter_rst = 1'b1;
        WRITE : begin
           counter_en = 1'b1;
           pixel_rdy = 1'b1;
        end
      endcase // case (state)
   end
   always @(posedge clk)
     state <= next_state;
   always @(posedge clk)
     if (~new_frame)
       new_frame_ack <= 1'b0;
     else if (state == RESET)
       new_frame_ack <= 1'b1;
   
   always @(posedge clk)
     ground_pixel <= ground_y[x] >= y ? ground_color : transparent_pixel;

   always @*
     if (bullet_pixel != transparent_pixel)
       pixel_data = bullet_pixel;
     else if (tank1_pixel != transparent_pixel)
       pixel_data = tank1_pixel;
     else if (tank2_pixel != transparent_pixel)
       pixel_data = tank2_pixel;
     else if (ground_pixel != transparent_pixel)
       pixel_data = ground_pixel;
     else
       pixel_data = background_pixel;

   always @(posedge clk)
     if (wr_en)
       case (addr)
         3'b000 : ground_index <= wr_x;
         3'b001 : ground_y[ground_index] <= wr_y;
         3'b010 : bullet_x <= wr_x;
         3'b011 : bullet_y <= wr_y;
         3'b100 : tank1_x <= wr_x;
         3'b101 : tank1_y <= wr_y;
         3'b110 : tank2_x <= wr_x;
         3'b111 : tank2_y <= wr_y;
       endcase // case (addr)

   assign rd_data = 16'hFAFF;
   
endmodule
