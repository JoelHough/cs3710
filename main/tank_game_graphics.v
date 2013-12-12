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
    output reg [15:0] rd_data,
    input new_frame,
    input pixel_rq,
    output reg [7:0] pixel_data,
    output reg pixel_rdy
    );

   wire [9:0] x;
   wire [9:0] wr_x;
   reg [9:0]  bullet_x;
   reg [9:0]  tank1_x=100;//test value of 100
   reg [9:0]  tank2_x=400;//test value of 400
   
	wire y_flip; //signal to y_flip the tank
   wire [8:0] y;
   wire [8:0] inv_y;
   wire [8:0] wr_y;
   reg [8:0]  bullet_y;
   reg [8:0]  tank1_y=130;//test value of 130
   reg [8:0]  tank2_y=170;//test value of 170
	reg 		  tank1_y_flip, tank2_y_flip;
   reg [8:0]  ground_y [639:0];
   reg        counter_en = 1'b0;
   reg        counter_rst = 1'b1;
   wire       row_clk;   
   wire [15:0] rnd;
   lfsr Lfsr (.clk(clk), .en(counter_en), .rst(x == 0 && inv_y == 0), .rd_data(rnd));
   
   reg [9:0]  ground_index;
   reg [7:0] ground_color;
   always @(posedge clk)
      ground_color <= {2'b0,2'b01,rnd[0],3'b100 + rnd[1]};//8'b00_011_100;
   
   reg [7:0] bullet_pixel = transparent_pixel;
   reg [7:0] tank1_pixel = transparent_pixel;
   reg [7:0] tank2_pixel = transparent_pixel;
   reg [7:0] ground_pixel = transparent_pixel;
   /*reg [7:0]*/localparam background_pixel = 8'b11_101_101;
   /*reg [7:0]*/localparam transparent_pixel = 8'b10_110_111;
	//BB_GGG_RRR;
   localparam bullet_color = 8'b0;
	localparam tank1_color = 8'b11_000_000;
	localparam tank2_color = 8'b00_000_111;
  
   mod_counter #(.MAX(639)) pixel_col_counter (.clk(clk), .en(counter_en), .reset(counter_rst), .count(x), .rollover(row_clk));
   mod_counter #(.MAX(479)) pixel_row_counter (.clk(row_clk), .en(1'b1), .reset(counter_rst), .count(inv_y), .rollover());
   assign y = 9'd479 - inv_y;
   
   assign wr_x = wr_data[9:0];
	assign y_flip = wr_data[15]; //bit to y_flip the tank
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
   
	wire tank1_pixel_color, tank2_pixel_color;
	wire [3:0] tank1_glyph_x, tank1_glyph_y, tank2_glyph_x, tank2_glyph_y;
	
	assign tank1_glyph_x = x-tank1_x;
	assign tank1_glyph_y = y-tank1_y;
	assign tank2_glyph_x = x-tank2_x;
	assign tank2_glyph_y = y-tank2_y;
	
	tank_glyph tank_1(
						.tank_y_flip(tank1_y_flip),
						.tank_direction(1'b1),
						.x_screen(tank1_glyph_x[3:0]),
						.y_screen(tank1_glyph_y[3:0]),
						.output_pixel(tank1_pixel_color)
						);
	tank_glyph tank_2(
						.tank_y_flip(tank2_y_flip),
						.tank_direction(1'b0),
						.x_screen(tank2_glyph_x[3:0]),
						.y_screen(tank2_glyph_y[3:0]),
						.output_pixel(tank2_pixel_color)
						);					
	
   always @(posedge clk) begin
		//draw bullet
      bullet_pixel <= (bullet_x == x || bullet_x + 1 == x) && (bullet_y == y || bullet_y + 1 == y) ? bullet_color : transparent_pixel;
      //draw ground
		ground_pixel <= ground_y[x] >= y ? ground_color : transparent_pixel;
		//draw tanks
		if((tank1_y >= y && tank1_y <= y+15)&&(tank1_x >= x && tank1_x <= x+15)&& tank1_pixel_color)
			tank1_pixel	 <= tank1_color;
		else
			tank1_pixel <= transparent_pixel;
		if((tank2_y >= y && tank2_y <= y+15)&&(tank2_x >= x && tank2_x <= x+15)&& tank2_pixel_color)
			tank2_pixel	 <= tank2_color;	
		else
			tank2_pixel <= transparent_pixel;
	end
   
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
         3'b101 : begin
							tank1_y <= wr_y;
							tank1_y_flip <= y_flip;
						end
         3'b110 : tank2_x <= wr_x;
         3'b111 : begin
							tank2_y <= wr_y;
							tank2_y_flip <= y_flip;
						end	
       endcase // case (addr)

   always @(posedge clk)
     if (rd_en)
       case (addr)
         3'b000 : rd_data <= {6'b0,ground_index};
         3'b001 : rd_data <= {7'b0,ground_y[ground_index]};
         3'b010 : rd_data <= {6'b0,bullet_x};
         3'b011 : rd_data <= {7'b0,bullet_y};
         3'b100 : rd_data <= {6'b0,tank1_x};
         3'b101 : rd_data <= {7'b0,tank1_y};
         3'b110 : rd_data <= {6'b0,tank2_x};
         3'b111 : rd_data <= {7'b0,tank2_y};
       endcase
         
endmodule
