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
 
    assign Led = sw;
    
    wire pixel_clk, db_clk;
    reg [15:0] clock_counter = 16'b0;
    assign pixel_clk = clock_counter[1];
    assign db_clk = clock_counter[15];
    always @(posedge clk)
      clock_counter <= clock_counter + 1'b1;
    
    reg [7:0] display_char;
    wire [2:0] display_char_x;
    wire [3:0] display_char_y;
    wire pixel;
    wire blank;
    
    wire [6:0] screen_x;
    wire [4:0] screen_y;
    
    dina_font_rom characters (.clk(pixel_clk), .char(display_char), .x(display_char_x), .y(display_char_y), .pixel(pixel));
    
    vga_controller controller ( .pixel_clk(pixel_clk),
                                .hsync(Hsync),
                                .vsync(Vsync),
                                .blank(blank),
                                .x({screen_x, display_char_x}),
                                .y({screen_y, display_char_y}));
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
    
    always @(posedge left) a[15:8] <= sw;
    always @(posedge up) a[7:0] <= sw;
    always @(posedge down) b[15:8] <= sw;
    always @(posedge right) b[7:0] <= sw;
    
    wire [2:0] op_count;
    mod_counter #(.MAX(6)) op_counter (.clk(center), .count(op_count), .reset(1'b0), .rollover());
    reg [15:0] a = 16'hCAFE;
    reg [15:0] b = 16'h1234;
    reg [7:0] opcode = 0;
    wire [15:0] result;
    wire [4:0] flags;
    reg [7:0] opchar = " ";
    alu uut (.a(a), .b(b), .opcode(opcode), .result(result), .flags(flags));
    
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
        default : begin
          opcode = uut.XOR;
          opchar = "^";
        end
      endcase
 
    parameter [11:0] ROW = 1 << 7;
    
    parameter [11:0] A_HEX = 17 | 12 * ROW;
    parameter [11:0] B_HEX = 17 | 13 * ROW;
    parameter [11:0] OP_HEX = 15 | 13 * ROW;
    parameter [11:0] RESULT_HEX = 17 | 14 * ROW;
    
    parameter [11:0] A_BIN = 50 | 12 * ROW;
    parameter [11:0] B_BIN = 50 | 13 * ROW;
    parameter [11:0] OP_BIN = 48 | 13 * ROW;
    parameter [11:0] RESULT_BIN = 50 | 14 * ROW;
    
    parameter [11:0] FLAGS = 37 | 9 * ROW;
    
    function [7:0] bin2hex;
      input [7:0] bin;
      bin2hex = bin <= 8'd9 ? "0" + bin : "A" - 8'd10 + bin;
    endfunction
    
    always @(screen_y, screen_x, a, b, opchar, flags, result) begin
      case ({screen_y, screen_x})
        FLAGS : display_char = "C";
        FLAGS+1 : display_char = "L";
        FLAGS+2 : display_char = "F";
        FLAGS+3 : display_char = "Z";
        FLAGS+4 : display_char = "N";
        FLAGS+ROW : display_char = "0" + flags[0];
        FLAGS+ROW+1 : display_char = "0" + flags[1];
        FLAGS+ROW+2 : display_char = "0" + flags[2];
        FLAGS+ROW+3 : display_char = "0" + flags[3];
        FLAGS+ROW+4 : display_char = "0" + flags[4];
        
        A_HEX : display_char = "0";
        A_HEX+1 : display_char = "x";
        A_HEX+2 : display_char = bin2hex(a[15:12]);
        A_HEX+3 : display_char = bin2hex(a[11:8]);
        A_HEX+4 : display_char = bin2hex(a[7:4]);
        A_HEX+5 : display_char = bin2hex(a[3:0]);
        
        B_HEX : display_char = "0";
        B_HEX+1 : display_char = "x";
        B_HEX+2 : display_char = bin2hex(b[15:12]);
        B_HEX+3 : display_char = bin2hex(b[11:8]);
        B_HEX+4 : display_char = bin2hex(b[7:4]);
        B_HEX+5 : display_char = bin2hex(b[3:0]);
        
        RESULT_HEX : display_char = "0";
        RESULT_HEX+1 : display_char = "x";
        RESULT_HEX+2 : display_char = bin2hex(result[15:12]);
        RESULT_HEX+3 : display_char = bin2hex(result[11:8]);
        RESULT_HEX+4 : display_char = bin2hex(result[7:4]);
        RESULT_HEX+5 : display_char = bin2hex(result[3:0]);
        
        OP_HEX : display_char = opchar;
        
        A_BIN : display_char = "b";
        A_BIN+1 : display_char = a[15] + "0";
        A_BIN+2 : display_char = a[14] + "0";
        A_BIN+3 : display_char = a[13] + "0";
        A_BIN+4 : display_char = a[12] + "0";
        A_BIN+5 : display_char = a[11] + "0";
        A_BIN+6 : display_char = a[10] + "0";
        A_BIN+7 : display_char = a[9] + "0";
        A_BIN+8 : display_char = a[8] + "0";
        A_BIN+9 : display_char = "_";
        A_BIN+10 : display_char = a[7] + "0";
        A_BIN+11 : display_char = a[6] + "0";
        A_BIN+12 : display_char = a[5] + "0";
        A_BIN+13 : display_char = a[4] + "0";
        A_BIN+14 : display_char = a[3] + "0";
        A_BIN+15 : display_char = a[2] + "0";
        A_BIN+16 : display_char = a[1] + "0";
        A_BIN+17 : display_char = a[0] + "0";
        
        B_BIN : display_char = "b";
        B_BIN+1 : display_char = b[15] + "0";
        B_BIN+2 : display_char = b[14] + "0";
        B_BIN+3 : display_char = b[13] + "0";
        B_BIN+4 : display_char = b[12] + "0";
        B_BIN+5 : display_char = b[11] + "0";
        B_BIN+6 : display_char = b[10] + "0";
        B_BIN+7 : display_char = b[9] + "0";
        B_BIN+8 : display_char = b[8] + "0";
        B_BIN+9 : display_char = "_";
        B_BIN+10 : display_char = b[7] + "0";
        B_BIN+11 : display_char = b[6] + "0";
        B_BIN+12 : display_char = b[5] + "0";
        B_BIN+13 : display_char = b[4] + "0";
        B_BIN+14 : display_char = b[3] + "0";
        B_BIN+15 : display_char = b[2] + "0";
        B_BIN+16 : display_char = b[1] + "0";
        B_BIN+17 : display_char = b[0] + "0";
        
        RESULT_BIN : display_char = "b";
        RESULT_BIN+1 : display_char = result[15] + "0";
        RESULT_BIN+2 : display_char = result[14] + "0";
        RESULT_BIN+3 : display_char = result[13] + "0";
        RESULT_BIN+4 : display_char = result[12] + "0";
        RESULT_BIN+5 : display_char = result[11] + "0";
        RESULT_BIN+6 : display_char = result[10] + "0";
        RESULT_BIN+7 : display_char = result[9] + "0";
        RESULT_BIN+8 : display_char = result[8] + "0";
        RESULT_BIN+9 : display_char = "_";
        RESULT_BIN+10 : display_char = result[7] + "0";
        RESULT_BIN+11 : display_char = result[6] + "0";
        RESULT_BIN+12 : display_char = result[5] + "0";
        RESULT_BIN+13 : display_char = result[4] + "0";
        RESULT_BIN+14 : display_char = result[3] + "0";
        RESULT_BIN+15 : display_char = result[2] + "0";
        RESULT_BIN+16 : display_char = result[1] + "0";
        RESULT_BIN+17 : display_char = result[0] + "0";
        
        OP_BIN : display_char = opchar;
        default : display_char = " ";
      endcase
    end
    
    assign vgaColor = blank ? 8'b0 : (pixel ? 8'b11_111_111 : 8'b10_010_010);

endmodule
