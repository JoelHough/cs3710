`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    16:41:06 09/19/2013 
// Design Name: 
// Module Name:    alu_regfile_demo 
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
module alu_regfile_demo(
    input clk,
    input btnUp,
    input btnDown,
    input btnLeft,
    input btnRight,
    input btnCenter,
    input [7:0] sw,
    output [7:0] Led,
    output [7:0] vgaColor,
    output Hsync,
    output Vsync
    );

    /* light the switch leds to show that we see the switches */
    assign Led = sw;
    
    /* divide the clock. 100MHz in, 25MHz pixel clock and a much slower debounce clock out */
    wire pixel_clk, db_clk;
    reg [15:0] clock_counter = 16'b0;
    assign pixel_clk = clock_counter[1];
    assign db_clk = clock_counter[15];
    always @(posedge clk)
      clock_counter <= clock_counter + 1'b1;
    
    /* all the display elements have their output or'd and run to the font rom on this bus.
       they set their output to 0 when not displaying so they don't or with other chars.
       if no elements are displaying (~display_char_p) then default to " " */
    wor [7:0] display_char;
    wor display_char_p;
    assign display_char = display_char_p ? 8'b0 : " ";
    
    /* screen coords and status */
    wire [2:0] display_char_x; // aka. column
    wire [3:0] display_char_y; // aka. row
    wire pixel; // whether the current pixel is on or not
    wire blank; // as in screen blank

    /* set the screen. white on, blue off, black during blanking */
    assign vgaColor = blank ? 8'b0 : (pixel ? 8'b11_111_111 : 8'b10_010_010);

    /* current pixel coords */
    wire [6:0] screen_x;
    wire [4:0] screen_y;
    
    dina_font_rom characters (.clk(pixel_clk), .char(display_char), .x(display_char_x), .y(display_char_y), .pixel(pixel));
    
    vga_controller controller ( .pixel_clk(pixel_clk),
                                .hsync(Hsync),
                                .vsync(Vsync),
                                .blank(blank),
                                .x({screen_x, display_char_x}),
                                .y({screen_y, display_char_y}));

    /* pushbutton wires and debouncing */
    wire up;
    wire down;
    wire left;
    wire right;
    wire center;
    
    debounce db_up (.clk(db_clk), .bouncy(btnUp), .debounced(up));
    debounce db_down (.clk(db_clk), .bouncy(btnDown), .debounced(down));
    debounce db_left (.clk(db_clk), .bouncy(btnLeft), .debounced(left));
    debounce db_right (.clk(db_clk), .bouncy(btnRight), .debounced(right));
    debounce db_center (.clk(db_clk), .bouncy(btnCenter), .debounced(center));
    
    wire [2:0] a_reg, b_reg, dest_reg;
    wire [15:0] immediate;
    wire immediate_p;
    wire [3:0] alu_op;
    wire [15:0] alu_bus, alu_a_in, alu_b_in;
    wire [4:0] flags;
    wire reset;
    wire [8*16-1:0] reg_bus;
    
    assign reset = down;

    alu_regfile uut (.clk(center), .reset(reset),
      .a_reg(a_reg), .b_reg(b_reg), .dest_reg(dest_reg),
      .immediate(immediate), .immediate_p(immediate_p),
      .alu_op(alu_op),
      .alu_bus(alu_bus), .alu_a_in(alu_a_in), .alu_b_in(alu_b_in), .flags(flags), .reg_bus(reg_bus));
    
    fib_machine fib (.clk(center), .reset(reset),
      .a_reg(a_reg), .b_reg(b_reg), .dest_reg(dest_reg),
      .immediate(immediate), .immediate_p(immediate_p),
      .alu_op(alu_op));
    
    reg [7:0] opchar;
    /* set the char for the current opcode */
    always @(alu_op)
      case (alu_op)
        uut.al.ADD : opchar = "+";
        uut.al.AND : opchar = "&";
        uut.al.B   : opchar = "B";
        uut.al.CMP : opchar = 8'd177;
        uut.al.LSH : opchar = 8'd171;
        uut.al.OR  : opchar = "|";
        uut.al.SUB : opchar = "-";
        default : opchar = "?";
      endcase
    
    /* display the current op */
    char_string #(.ROW(14), .COL(22), .LENGTH(3), .STRING("OP:"))
          op_label (.row(screen_y), .col(screen_x), .enable(1'b1),
          .char_p(display_char_p), .char(display_char));
    wire op_char_p;
    assign op_char_p = screen_y == 14 && screen_x == 26;
    assign display_char =  op_char_p ? opchar : 1'b0;
    assign display_char_p = op_char_p;
    
    char_string #(.ROW(8), .COL(35), .LENGTH(4), .STRING("B <-"))
          b_imm_label (.row(screen_y), .col(screen_x), .enable(immediate_p),
          .char_p(display_char_p), .char(display_char));
        
    char_string #(.ROW(8), .COL(40), .LENGTH(9), .STRING("Immediate"))
          imm_label (.row(screen_y), .col(screen_x), .enable(1'b1),
          .char_p(display_char_p), .char(display_char));
        
    hex_string #(.ROW(8), .COL(50))
          imm_hex (.row(screen_y), .col(screen_x), .enable(1'b1),
            .char_p(display_char_p), .char(display_char),
            .data(immediate));
            
    /* display registers and reg indicators */
    genvar i;
    generate
      for(i=0;i<8;i=i+1) begin: reg_display
        hex_string #(.ROW(10 + i), .COL(50))
          result_hex (.row(screen_y), .col(screen_x), .enable(1'b1),
            .char_p(display_char_p), .char(display_char),
            .data(reg_bus[i*16+:16]));
        char_string #(.ROW(10 + i), .COL(45), .LENGTH(4), .STRING("A <-"))
          a_reg_label (.row(screen_y), .col(screen_x), .enable(a_reg == i),
          .char_p(display_char_p), .char(display_char));
        char_string #(.ROW(10 + i), .COL(40), .LENGTH(4), .STRING("B <-"))
          b_reg_label (.row(screen_y), .col(screen_x), .enable(b_reg == i & ~immediate_p),
          .char_p(display_char_p), .char(display_char));
        char_string #(.ROW(10 + i), .COL(57), .LENGTH(6), .STRING("<- ALU"))
          dest_reg_label (.row(screen_y), .col(screen_x), .enable(dest_reg == i),
          .char_p(display_char_p), .char(display_char));
      end
    endgenerate
endmodule
