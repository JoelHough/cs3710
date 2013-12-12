`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:02:28 12/12/2013 
// Design Name: 
// Module Name:    SNES_control 
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
module SNES_control(
						input clk,						//100MHz clock
						input  serial_data,			//signal from SNES controller
						output data_latch,			//required signal to the SNS controller
						output reg interrupt,				//interrupt pulse when a btn state changes
						output reg data_clock,		//required signal to the SNS controller
						output reg [15:0] buttons	//register that contains the buttons values
						);


reg clk_60;
reg [15:0] old_reg;
wire data_clk_en; //signal which enables data_clock to the controller
integer i, count_60, count_6us;

initial
begin
	interrupt 	= 1'b0;
	data_clock 	= 1'b1;
	buttons 		= 16'hFFFF;
	old_reg 		= 16'hFFFF;    
   i				= 15;
   count_60		= 0;
   count_6us	= 0;
   clk_60 		= 1'b0;
end

//clock 60Hz divider
always@(posedge clk)
begin
	if(count_60<833500)  //period 16.67ms
		count_60=count_60+1;    
   else
   begin
		clk_60 =~clk_60;
		count_60=0; 
	end
end

assign data_latch = (count_60<=1200 & clk_60); //12us wide pulse every 60Hz
assign data_clk_en = (count_60>1200 & count_60<20400  & clk_60); //interval for 16 pulses

always@(posedge clk)
begin
	if(data_clk_en) 
	begin
		if(count_6us<600)
			count_6us=count_6us+1; //16x 12us-wide-50%-duty pulses
		else
		begin
			data_clock=~data_clock;
			count_6us=0;
		end
	end
	else //just to ensure
	begin
		count_6us=0;
		data_clock=1'b1;    
	end
	
	if(count_60==21000 && old_reg!=buttons && clk_60)
	begin
		old_reg=buttons;
		interrupt = 1'b1;
	end
	else
		interrupt = 1'b0;
end

always@(negedge data_clock)
begin
	//initial i=15
	buttons[i]=serial_data;
	if(i==0)
		i=15;
	else
		i=i-1;
end


endmodule
