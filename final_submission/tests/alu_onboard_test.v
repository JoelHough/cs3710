`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joel Hough
// 
// Create Date:    01:58:50 09/06/2013 
// Design Name: 
// Module Name:    alu_onboard_test 
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
module alu_onboard_test(
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
    
    /* switches encode one byte. buttons load this byte into a and b registers as follows:
       left  -> a hi
       up    -> a lo
       down  -> b hi
       right -> b lo */
    always @(posedge left) a[15:8] <= sw;
    always @(posedge up) a[7:0] <= sw;
    always @(posedge down) b[15:8] <= sw;
    always @(posedge right) b[7:0] <= sw;
    
    /* wire up the alu */
    reg [15:0] a = 16'hCAFE;
    reg [15:0] b = 16'h1234;
    reg [alu.OPCODE_WIDTH-1:0] opcode = 0;
    wire [15:0] result;
    wire [4:0] flags;
    reg [7:0] opchar = " ";
    alu uut (.a(a), .b(b), .opcode(opcode), .result(result), .flags(flags));
    
    /* cycle through the ops on a button press */
    wire [2:0] op_count;
    mod_counter #(.MAX(7)) op_counter (.clk(center), .count(op_count), .reset(1'b0), .rollover());

    /* set the opcode for the alu and a char to display for it */
    always @(op_count)
      case (op_count)
        0 : begin
          opcode = uut.ADD;
          opchar = "+";
        end
        1 : begin
          opcode = uut.AND;
          opchar = "&";
        end
        2 : begin
          opcode = uut.CMP;
          opchar = 8'd177;
        end
        3 : begin
          opcode = uut.LSH;
          opchar = 8'd171;
        end
        4 : begin
          opcode = uut.OR;
          opchar = "|";
        end
        5 : begin
          opcode = uut.SUB;
          opchar = "-";
        end
        6 : begin
          opcode = uut.B;
          opchar = "B";
        end
        default : begin
          opcode = uut.XOR;
          opchar = "^";
        end
      endcase

    /* screen display elements */
    char_string #(.ROW(9), .COL(37), .LENGTH(5), .STRING("CLFZN"))
      flag_labels (.row(screen_y), .col(screen_x), .enable(1'b1),
        .char_p(display_char_p), .char(display_char));
    binary_string #(.ROW(10), .COL(37), .WIDTH(5))
      flag_vals (.row(screen_y), .col(screen_x), .enable(1'b1),
        .char_p(display_char_p), .char(display_char),
        .data({flags[uut.CARRY], flags[uut.LOW], flags[uut.FLAG], flags[uut.Z], flags[uut.NEGATIVE]}));
    
    hex_string #(.ROW(12), .COL(17))
      a_hex (.row(screen_y), .col(screen_x), .enable(1'b1),
        .char_p(display_char_p), .char(display_char),
        .data(a));
    hex_string #(.ROW(13), .COL(17))
      b_hex (.row(screen_y), .col(screen_x), .enable(1'b1),
        .char_p(display_char_p), .char(display_char),
        .data(b));
    hex_string #(.ROW(14), .COL(17))
      result_hex (.row(screen_y), .col(screen_x), .enable(1'b1),
        .char_p(display_char_p), .char(display_char),
        .data(result));
    
    /* display the opchar next to the hex display and the bin display */
    wire op_char_p;
    assign op_char_p = screen_y == 13 && (screen_x == 15 || screen_x == 48);
    assign display_char =  op_char_p ? opchar : 1'b0;
    assign display_char_p = op_char_p;
    
    binary_word_string #(.ROW(12), .COL(50))
      a_binary_word (.row(screen_y), .col(screen_x), .enable(1'b1),
        .char_p(display_char_p), .char(display_char),
        .data(a));
    binary_word_string #(.ROW(13), .COL(50))
      b_binary_word (.row(screen_y), .col(screen_x), .enable(1'b1),
        .char_p(display_char_p), .char(display_char),
        .data(b));
    binary_word_string #(.ROW(14), .COL(50))
      result_binary_word (.row(screen_y), .col(screen_x), .enable(1'b1),
        .char_p(display_char_p), .char(display_char),
        .data(result));

endmodule
