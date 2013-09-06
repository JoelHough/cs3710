////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: alu_synthesis.v
// /___/   /\     Timestamp: Fri Sep  6 04:16:11 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim alu.ngc alu_synthesis.v 
// Device	: xc6slx16-3-csg324
// Input file	: alu.ngc
// Output file	: /home/joel/cs3710/alu/netgen/synthesis/alu_synthesis.v
// # of Modules	: 1
// Design Name	: alu
// Xilinx        : /home/joel/Xilinx/14.6/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module alu_synthesis (
a, b, opcode, result, flags
);
  input [15 : 0] a;
  input [15 : 0] b;
  input [7 : 0] opcode;
  output [15 : 0] result;
  output [4 : 0] flags;
  wire a_15_IBUF_0;
  wire a_14_IBUF_1;
  wire a_13_IBUF_2;
  wire a_12_IBUF_3;
  wire a_11_IBUF_4;
  wire a_10_IBUF_5;
  wire a_9_IBUF_6;
  wire a_8_IBUF_7;
  wire a_7_IBUF_8;
  wire a_6_IBUF_9;
  wire a_5_IBUF_10;
  wire a_4_IBUF_11;
  wire a_3_IBUF_12;
  wire a_2_IBUF_13;
  wire a_1_IBUF_14;
  wire a_0_IBUF_15;
  wire b_15_IBUF_16;
  wire b_14_IBUF_17;
  wire b_13_IBUF_18;
  wire b_12_IBUF_19;
  wire b_11_IBUF_20;
  wire b_10_IBUF_21;
  wire b_9_IBUF_22;
  wire b_8_IBUF_23;
  wire b_7_IBUF_24;
  wire b_6_IBUF_25;
  wire b_5_IBUF_26;
  wire b_4_IBUF_27;
  wire b_3_IBUF_28;
  wire b_2_IBUF_29;
  wire b_1_IBUF_30;
  wire opcode_7_IBUF_31;
  wire opcode_6_IBUF_32;
  wire opcode_5_IBUF_33;
  wire opcode_4_IBUF_34;
  wire opcode_3_IBUF_35;
  wire opcode_2_IBUF_36;
  wire opcode_1_IBUF_37;
  wire opcode_0_IBUF_38;
  wire \a[15]_b[15]_equal_5_o ;
  wire result_15_OBUF_73;
  wire result_14_OBUF_74;
  wire result_13_OBUF_75;
  wire result_12_OBUF_76;
  wire result_11_OBUF_77;
  wire result_10_OBUF_78;
  wire result_9_OBUF_79;
  wire result_8_OBUF_80;
  wire result_7_OBUF_81;
  wire result_6_OBUF_82;
  wire result_5_OBUF_83;
  wire result_4_OBUF_84;
  wire result_3_OBUF_85;
  wire result_2_OBUF_86;
  wire result_1_OBUF_87;
  wire result_0_OBUF_88;
  wire \opcode[7]_PWR_1_o_equal_21_o ;
  wire \opcode[7]_GND_1_o_equal_23_o ;
  wire \opcode[7]_GND_1_o_equal_18_o ;
  wire \opcode[7]_GND_1_o_equal_22_o ;
  wire \opcode[7]_GND_1_o_equal_24_o ;
  wire \opcode[7]_GND_1_o_equal_19_o ;
  wire flags_4_OBUF_95;
  wire flags_3_OBUF_96;
  wire flags_2_OBUF_97;
  wire flags_1_OBUF_98;
  wire flags_0_OBUF_99;
  wire N0;
  wire N1;
  wire Sh;
  wire Sh1;
  wire Sh2;
  wire Sh3;
  wire Sh4;
  wire Sh5;
  wire Sh6;
  wire Sh7;
  wire Sh8;
  wire Sh9;
  wire Sh10;
  wire Sh11;
  wire \b[3]_GND_1_o_add_8_OUT<2>1 ;
  wire \b[3]_GND_1_o_add_8_OUT<3>1 ;
  wire Sh40;
  wire Sh41;
  wire Sh42_118;
  wire Sh43;
  wire Sh44;
  wire Sh45;
  wire Sh46;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<0>_123 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<0>_124 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<1>_125 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<1>_126 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<2>_127 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<2>_128 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<3>_129 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<3>_130 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<4>_131 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<4>_132 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<5>_133 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi_134 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>_135 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>_136 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1_137 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>_138 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>_139 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2_140 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>_141 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>_142 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3_143 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>_144 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>_145 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4_146 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>_147 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>_148 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5_149 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>_150 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>_151 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6_152 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>_153 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>_154 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>_155 ;
  wire \Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ;
  wire \Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi_222 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>_223 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>_224 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1_225 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>_226 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>_227 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2_228 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>_229 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>_230 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3_231 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>_232 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>_233 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4_234 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>_235 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>_236 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5_237 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>_238 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>_239 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6_240 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>_241 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>_242 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>_243 ;
  wire Sh141;
  wire \opcode[7]_GND_1_o_equal_19_o<7>1 ;
  wire Sh281;
  wire Sh481_247;
  wire Sh491_248;
  wire Sh501_249;
  wire Sh511;
  wire \opcode[7]_GND_1_o_equal_18_o<7>1 ;
  wire \opcode[7]_GND_1_o_equal_22_o<7>1_252 ;
  wire \result<12>31 ;
  wire \result<4>1_254 ;
  wire \result<4>4_255 ;
  wire \result<10>1_256 ;
  wire \result<10>2_257 ;
  wire \result<11>1_258 ;
  wire \result<11>2_259 ;
  wire \result<11>3_260 ;
  wire \result<11>4_261 ;
  wire \result<8>3_262 ;
  wire \result<8>4_263 ;
  wire \result<9>3_264 ;
  wire \result<9>4_265 ;
  wire \result<12>2_266 ;
  wire \result<12>5_267 ;
  wire \result<12>6_268 ;
  wire \result<5>1_269 ;
  wire \result<5>2_270 ;
  wire \result<5>5_271 ;
  wire \result<14>2_272 ;
  wire \result<14>5_273 ;
  wire \result<14>6_274 ;
  wire \result<14>7_275 ;
  wire \result<6>1_276 ;
  wire \result<6>2_277 ;
  wire \result<6>5_278 ;
  wire \result<7>1_279 ;
  wire \result<7>2_280 ;
  wire \result<7>5_281 ;
  wire \result<15>1_282 ;
  wire \result<15>4_283 ;
  wire \result<15>5_284 ;
  wire \result<15>6_285 ;
  wire \result<15>7_286 ;
  wire \result<15>8_287 ;
  wire \result<15>9_288 ;
  wire N5;
  wire N7;
  wire \result<13>1_291 ;
  wire \result<13>2_292 ;
  wire \result<13>3_293 ;
  wire \result<13>4_294 ;
  wire N9;
  wire Sh5111_296;
  wire \result<1>2_297 ;
  wire \result<1>4_298 ;
  wire \result<1>5_299 ;
  wire \result<1>6_300 ;
  wire \result<0>1_301 ;
  wire \result<0>2_302 ;
  wire \result<0>3_303 ;
  wire \result<0>4_304 ;
  wire \result<0>5_305 ;
  wire \result<2>2_306 ;
  wire \result<2>4_307 ;
  wire \result<2>5_308 ;
  wire \result<2>6_309 ;
  wire \result<3>2_310 ;
  wire \result<3>4_311 ;
  wire \result<3>5_312 ;
  wire \result<3>6_313 ;
  wire N11;
  wire N13;
  wire N15;
  wire N17;
  wire N19;
  wire N21;
  wire N27;
  wire N29;
  wire N31;
  wire N32;
  wire N33;
  wire N34;
  wire N35;
  wire N36;
  wire N37;
  wire N38;
  wire N39;
  wire N40;
  wire [16 : 0] GND_1_o_GND_1_o_sub_14_OUT;
  wire [15 : 0] n0057;
  wire [15 : 0] Msub_GND_1_o_GND_1_o_sub_14_OUT_lut;
  wire [15 : 0] Msub_GND_1_o_GND_1_o_sub_14_OUT_cy;
  wire [15 : 0] Madd_n0057_lut;
  wire [15 : 0] Madd_n0057_cy;
  VCC   XST_VCC (
    .P(N0)
  );
  GND   XST_GND (
    .G(N1)
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \Mcompar_a[15]_b[15]_equal_5_o_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(b_1_IBUF_30),
    .I4(a_2_IBUF_13),
    .I5(b_2_IBUF_29),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<0>_123 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<0>_123 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<0>_124 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \Mcompar_a[15]_b[15]_equal_5_o_lut<1>  (
    .I0(a_3_IBUF_12),
    .I1(b_3_IBUF_28),
    .I2(a_4_IBUF_11),
    .I3(b_4_IBUF_27),
    .I4(a_5_IBUF_10),
    .I5(b_5_IBUF_26),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<1>_125 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<1>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<0>_124 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<1>_125 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<1>_126 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \Mcompar_a[15]_b[15]_equal_5_o_lut<2>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .I2(a_7_IBUF_8),
    .I3(b_7_IBUF_24),
    .I4(a_8_IBUF_7),
    .I5(b_8_IBUF_23),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<2>_127 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<2>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<1>_126 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<2>_127 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<2>_128 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \Mcompar_a[15]_b[15]_equal_5_o_lut<3>  (
    .I0(a_9_IBUF_6),
    .I1(b_9_IBUF_22),
    .I2(a_10_IBUF_5),
    .I3(b_10_IBUF_21),
    .I4(a_11_IBUF_4),
    .I5(b_11_IBUF_20),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<3>_129 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<3>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<2>_128 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<3>_129 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<3>_130 )
  );
  LUT6 #(
    .INIT ( 64'h9009000000009009 ))
  \Mcompar_a[15]_b[15]_equal_5_o_lut<4>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .I2(a_13_IBUF_2),
    .I3(b_13_IBUF_18),
    .I4(a_14_IBUF_1),
    .I5(b_14_IBUF_17),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<4>_131 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<4>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<3>_130 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<4>_131 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<4>_132 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_a[15]_b[15]_equal_5_o_lut<5>  (
    .I0(a_15_IBUF_0),
    .I1(b_15_IBUF_16),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<5>_133 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<5>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<4>_132 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<5>_133 ),
    .O(\a[15]_b[15]_equal_5_o )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_0_IBUF_15),
    .I3(a_1_IBUF_14),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi_134 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(b_1_IBUF_30),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>_135 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>  (
    .CI(N0),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi_134 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>_135 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>_136 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(a_2_IBUF_13),
    .I3(a_3_IBUF_12),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1_137 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>  (
    .I0(a_2_IBUF_13),
    .I1(b_2_IBUF_29),
    .I2(a_3_IBUF_12),
    .I3(b_3_IBUF_28),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>_138 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>_136 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1_137 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>_138 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>_139 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2  (
    .I0(b_5_IBUF_26),
    .I1(b_4_IBUF_27),
    .I2(a_4_IBUF_11),
    .I3(a_5_IBUF_10),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2_140 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>  (
    .I0(a_4_IBUF_11),
    .I1(b_4_IBUF_27),
    .I2(a_5_IBUF_10),
    .I3(b_5_IBUF_26),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>_141 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>_139 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2_140 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>_141 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>_142 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3  (
    .I0(b_7_IBUF_24),
    .I1(b_6_IBUF_25),
    .I2(a_6_IBUF_9),
    .I3(a_7_IBUF_8),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3_143 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .I2(a_7_IBUF_8),
    .I3(b_7_IBUF_24),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>_144 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>_142 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3_143 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>_144 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>_145 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4  (
    .I0(b_9_IBUF_22),
    .I1(b_8_IBUF_23),
    .I2(a_8_IBUF_7),
    .I3(a_9_IBUF_6),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4_146 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>  (
    .I0(a_8_IBUF_7),
    .I1(b_8_IBUF_23),
    .I2(a_9_IBUF_6),
    .I3(b_9_IBUF_22),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>_147 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>_145 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4_146 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>_147 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>_148 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5  (
    .I0(b_11_IBUF_20),
    .I1(b_10_IBUF_21),
    .I2(a_10_IBUF_5),
    .I3(a_11_IBUF_4),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5_149 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>  (
    .I0(a_10_IBUF_5),
    .I1(b_10_IBUF_21),
    .I2(a_11_IBUF_4),
    .I3(b_11_IBUF_20),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>_150 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>_148 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5_149 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>_150 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>_151 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6  (
    .I0(b_13_IBUF_18),
    .I1(b_12_IBUF_19),
    .I2(a_12_IBUF_3),
    .I3(a_13_IBUF_2),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6_152 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .I2(a_13_IBUF_2),
    .I3(b_13_IBUF_18),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>_153 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>_151 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6_152 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>_153 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>_154 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[0])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<0>  (
    .CI(N0),
    .DI(a_0_IBUF_15),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[0]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[0])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<0>  (
    .CI(N0),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[0]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[0])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<1>  (
    .I0(a_1_IBUF_14),
    .I1(b_1_IBUF_30),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[1])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<1>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[0]),
    .DI(a_1_IBUF_14),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[1]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[1])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<1>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[0]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[1]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[1])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<2>  (
    .I0(a_2_IBUF_13),
    .I1(b_2_IBUF_29),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[2])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<2>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[1]),
    .DI(a_2_IBUF_13),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[2]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[2])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<2>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[1]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[2]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[2])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<3>  (
    .I0(a_3_IBUF_12),
    .I1(b_3_IBUF_28),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[3])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<3>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[2]),
    .DI(a_3_IBUF_12),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[3]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[3])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<3>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[2]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[3]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[3])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<4>  (
    .I0(a_4_IBUF_11),
    .I1(b_4_IBUF_27),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[4])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<4>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[3]),
    .DI(a_4_IBUF_11),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[4]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[4])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<4>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[3]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[4]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[4])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<5>  (
    .I0(a_5_IBUF_10),
    .I1(b_5_IBUF_26),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[5])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<5>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[4]),
    .DI(a_5_IBUF_10),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[5]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[5])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<5>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[4]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[5]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[5])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<6>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[6])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<6>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[5]),
    .DI(a_6_IBUF_9),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[6]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[6])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<6>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[5]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[6]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[6])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<7>  (
    .I0(a_7_IBUF_8),
    .I1(b_7_IBUF_24),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[7])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<7>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[6]),
    .DI(a_7_IBUF_8),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[7]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[7])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<7>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[6]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[7]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[7])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<8>  (
    .I0(a_8_IBUF_7),
    .I1(b_8_IBUF_23),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[8])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<8>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[7]),
    .DI(a_8_IBUF_7),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[8]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[8])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<8>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[7]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[8]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[8])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<9>  (
    .I0(a_9_IBUF_6),
    .I1(b_9_IBUF_22),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[9])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<9>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[8]),
    .DI(a_9_IBUF_6),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[9]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[9])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<9>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[8]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[9]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[9])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<10>  (
    .I0(a_10_IBUF_5),
    .I1(b_10_IBUF_21),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[10])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<10>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[9]),
    .DI(a_10_IBUF_5),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[10]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[10])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<10>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[9]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[10]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[10])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<11>  (
    .I0(a_11_IBUF_4),
    .I1(b_11_IBUF_20),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[11])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<11>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[10]),
    .DI(a_11_IBUF_4),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[11]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[11])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<11>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[10]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[11]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[11])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<12>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[12])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<12>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[11]),
    .DI(a_12_IBUF_3),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[12]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[12])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<12>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[11]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[12]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[12])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<13>  (
    .I0(a_13_IBUF_2),
    .I1(b_13_IBUF_18),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[13])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<13>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[12]),
    .DI(a_13_IBUF_2),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[13]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[13])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<13>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[12]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[13]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[13])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<14>  (
    .I0(a_14_IBUF_1),
    .I1(b_14_IBUF_17),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[14])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<14>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[13]),
    .DI(a_14_IBUF_1),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[14]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[14])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<14>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[13]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[14]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[14])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_1_o_GND_1_o_sub_14_OUT_lut<15>  (
    .I0(a_15_IBUF_0),
    .I1(b_15_IBUF_16),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[15])
  );
  MUXCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_cy<15>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[14]),
    .DI(a_15_IBUF_0),
    .S(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[15]),
    .O(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[15])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<15>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[14]),
    .LI(Msub_GND_1_o_GND_1_o_sub_14_OUT_lut[15]),
    .O(GND_1_o_GND_1_o_sub_14_OUT[15])
  );
  XORCY   \Msub_GND_1_o_GND_1_o_sub_14_OUT_xor<16>  (
    .CI(Msub_GND_1_o_GND_1_o_sub_14_OUT_cy[15]),
    .LI(N0),
    .O(GND_1_o_GND_1_o_sub_14_OUT[16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(Madd_n0057_lut[0])
  );
  MUXCY   \Madd_n0057_cy<0>  (
    .CI(N1),
    .DI(a_0_IBUF_15),
    .S(Madd_n0057_lut[0]),
    .O(Madd_n0057_cy[0])
  );
  XORCY   \Madd_n0057_xor<0>  (
    .CI(N1),
    .LI(Madd_n0057_lut[0]),
    .O(n0057[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<1>  (
    .I0(a_1_IBUF_14),
    .I1(b_1_IBUF_30),
    .O(Madd_n0057_lut[1])
  );
  MUXCY   \Madd_n0057_cy<1>  (
    .CI(Madd_n0057_cy[0]),
    .DI(a_1_IBUF_14),
    .S(Madd_n0057_lut[1]),
    .O(Madd_n0057_cy[1])
  );
  XORCY   \Madd_n0057_xor<1>  (
    .CI(Madd_n0057_cy[0]),
    .LI(Madd_n0057_lut[1]),
    .O(n0057[1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<2>  (
    .I0(a_2_IBUF_13),
    .I1(b_2_IBUF_29),
    .O(Madd_n0057_lut[2])
  );
  MUXCY   \Madd_n0057_cy<2>  (
    .CI(Madd_n0057_cy[1]),
    .DI(a_2_IBUF_13),
    .S(Madd_n0057_lut[2]),
    .O(Madd_n0057_cy[2])
  );
  XORCY   \Madd_n0057_xor<2>  (
    .CI(Madd_n0057_cy[1]),
    .LI(Madd_n0057_lut[2]),
    .O(n0057[2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<3>  (
    .I0(a_3_IBUF_12),
    .I1(b_3_IBUF_28),
    .O(Madd_n0057_lut[3])
  );
  MUXCY   \Madd_n0057_cy<3>  (
    .CI(Madd_n0057_cy[2]),
    .DI(a_3_IBUF_12),
    .S(Madd_n0057_lut[3]),
    .O(Madd_n0057_cy[3])
  );
  XORCY   \Madd_n0057_xor<3>  (
    .CI(Madd_n0057_cy[2]),
    .LI(Madd_n0057_lut[3]),
    .O(n0057[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<4>  (
    .I0(a_4_IBUF_11),
    .I1(b_4_IBUF_27),
    .O(Madd_n0057_lut[4])
  );
  MUXCY   \Madd_n0057_cy<4>  (
    .CI(Madd_n0057_cy[3]),
    .DI(a_4_IBUF_11),
    .S(Madd_n0057_lut[4]),
    .O(Madd_n0057_cy[4])
  );
  XORCY   \Madd_n0057_xor<4>  (
    .CI(Madd_n0057_cy[3]),
    .LI(Madd_n0057_lut[4]),
    .O(n0057[4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<5>  (
    .I0(a_5_IBUF_10),
    .I1(b_5_IBUF_26),
    .O(Madd_n0057_lut[5])
  );
  MUXCY   \Madd_n0057_cy<5>  (
    .CI(Madd_n0057_cy[4]),
    .DI(a_5_IBUF_10),
    .S(Madd_n0057_lut[5]),
    .O(Madd_n0057_cy[5])
  );
  XORCY   \Madd_n0057_xor<5>  (
    .CI(Madd_n0057_cy[4]),
    .LI(Madd_n0057_lut[5]),
    .O(n0057[5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<6>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .O(Madd_n0057_lut[6])
  );
  MUXCY   \Madd_n0057_cy<6>  (
    .CI(Madd_n0057_cy[5]),
    .DI(a_6_IBUF_9),
    .S(Madd_n0057_lut[6]),
    .O(Madd_n0057_cy[6])
  );
  XORCY   \Madd_n0057_xor<6>  (
    .CI(Madd_n0057_cy[5]),
    .LI(Madd_n0057_lut[6]),
    .O(n0057[6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<7>  (
    .I0(a_7_IBUF_8),
    .I1(b_7_IBUF_24),
    .O(Madd_n0057_lut[7])
  );
  MUXCY   \Madd_n0057_cy<7>  (
    .CI(Madd_n0057_cy[6]),
    .DI(a_7_IBUF_8),
    .S(Madd_n0057_lut[7]),
    .O(Madd_n0057_cy[7])
  );
  XORCY   \Madd_n0057_xor<7>  (
    .CI(Madd_n0057_cy[6]),
    .LI(Madd_n0057_lut[7]),
    .O(n0057[7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<8>  (
    .I0(a_8_IBUF_7),
    .I1(b_8_IBUF_23),
    .O(Madd_n0057_lut[8])
  );
  MUXCY   \Madd_n0057_cy<8>  (
    .CI(Madd_n0057_cy[7]),
    .DI(a_8_IBUF_7),
    .S(Madd_n0057_lut[8]),
    .O(Madd_n0057_cy[8])
  );
  XORCY   \Madd_n0057_xor<8>  (
    .CI(Madd_n0057_cy[7]),
    .LI(Madd_n0057_lut[8]),
    .O(n0057[8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<9>  (
    .I0(a_9_IBUF_6),
    .I1(b_9_IBUF_22),
    .O(Madd_n0057_lut[9])
  );
  MUXCY   \Madd_n0057_cy<9>  (
    .CI(Madd_n0057_cy[8]),
    .DI(a_9_IBUF_6),
    .S(Madd_n0057_lut[9]),
    .O(Madd_n0057_cy[9])
  );
  XORCY   \Madd_n0057_xor<9>  (
    .CI(Madd_n0057_cy[8]),
    .LI(Madd_n0057_lut[9]),
    .O(n0057[9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<10>  (
    .I0(a_10_IBUF_5),
    .I1(b_10_IBUF_21),
    .O(Madd_n0057_lut[10])
  );
  MUXCY   \Madd_n0057_cy<10>  (
    .CI(Madd_n0057_cy[9]),
    .DI(a_10_IBUF_5),
    .S(Madd_n0057_lut[10]),
    .O(Madd_n0057_cy[10])
  );
  XORCY   \Madd_n0057_xor<10>  (
    .CI(Madd_n0057_cy[9]),
    .LI(Madd_n0057_lut[10]),
    .O(n0057[10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<11>  (
    .I0(a_11_IBUF_4),
    .I1(b_11_IBUF_20),
    .O(Madd_n0057_lut[11])
  );
  MUXCY   \Madd_n0057_cy<11>  (
    .CI(Madd_n0057_cy[10]),
    .DI(a_11_IBUF_4),
    .S(Madd_n0057_lut[11]),
    .O(Madd_n0057_cy[11])
  );
  XORCY   \Madd_n0057_xor<11>  (
    .CI(Madd_n0057_cy[10]),
    .LI(Madd_n0057_lut[11]),
    .O(n0057[11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<12>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .O(Madd_n0057_lut[12])
  );
  MUXCY   \Madd_n0057_cy<12>  (
    .CI(Madd_n0057_cy[11]),
    .DI(a_12_IBUF_3),
    .S(Madd_n0057_lut[12]),
    .O(Madd_n0057_cy[12])
  );
  XORCY   \Madd_n0057_xor<12>  (
    .CI(Madd_n0057_cy[11]),
    .LI(Madd_n0057_lut[12]),
    .O(n0057[12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<13>  (
    .I0(a_13_IBUF_2),
    .I1(b_13_IBUF_18),
    .O(Madd_n0057_lut[13])
  );
  MUXCY   \Madd_n0057_cy<13>  (
    .CI(Madd_n0057_cy[12]),
    .DI(a_13_IBUF_2),
    .S(Madd_n0057_lut[13]),
    .O(Madd_n0057_cy[13])
  );
  XORCY   \Madd_n0057_xor<13>  (
    .CI(Madd_n0057_cy[12]),
    .LI(Madd_n0057_lut[13]),
    .O(n0057[13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<14>  (
    .I0(a_14_IBUF_1),
    .I1(b_14_IBUF_17),
    .O(Madd_n0057_lut[14])
  );
  MUXCY   \Madd_n0057_cy<14>  (
    .CI(Madd_n0057_cy[13]),
    .DI(a_14_IBUF_1),
    .S(Madd_n0057_lut[14]),
    .O(Madd_n0057_cy[14])
  );
  XORCY   \Madd_n0057_xor<14>  (
    .CI(Madd_n0057_cy[13]),
    .LI(Madd_n0057_lut[14]),
    .O(n0057[14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0057_lut<15>  (
    .I0(a_15_IBUF_0),
    .I1(b_15_IBUF_16),
    .O(Madd_n0057_lut[15])
  );
  MUXCY   \Madd_n0057_cy<15>  (
    .CI(Madd_n0057_cy[14]),
    .DI(a_15_IBUF_0),
    .S(Madd_n0057_lut[15]),
    .O(Madd_n0057_cy[15])
  );
  XORCY   \Madd_n0057_xor<15>  (
    .CI(Madd_n0057_cy[14]),
    .LI(Madd_n0057_lut[15]),
    .O(n0057[15])
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_0_IBUF_15),
    .I3(a_1_IBUF_14),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi_222 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(b_1_IBUF_30),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>_223 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>  (
    .CI(N0),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi_222 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>_223 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>_224 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(a_2_IBUF_13),
    .I3(a_3_IBUF_12),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1_225 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>  (
    .I0(a_2_IBUF_13),
    .I1(b_2_IBUF_29),
    .I2(a_3_IBUF_12),
    .I3(b_3_IBUF_28),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>_226 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>_224 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1_225 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>_226 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>_227 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2  (
    .I0(b_5_IBUF_26),
    .I1(b_4_IBUF_27),
    .I2(a_4_IBUF_11),
    .I3(a_5_IBUF_10),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2_228 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>  (
    .I0(a_4_IBUF_11),
    .I1(b_4_IBUF_27),
    .I2(a_5_IBUF_10),
    .I3(b_5_IBUF_26),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>_229 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>_227 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2_228 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>_229 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>_230 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3  (
    .I0(b_7_IBUF_24),
    .I1(b_6_IBUF_25),
    .I2(a_6_IBUF_9),
    .I3(a_7_IBUF_8),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3_231 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .I2(a_7_IBUF_8),
    .I3(b_7_IBUF_24),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>_232 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>_230 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3_231 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>_232 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>_233 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4  (
    .I0(b_9_IBUF_22),
    .I1(b_8_IBUF_23),
    .I2(a_8_IBUF_7),
    .I3(a_9_IBUF_6),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4_234 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>  (
    .I0(a_8_IBUF_7),
    .I1(b_8_IBUF_23),
    .I2(a_9_IBUF_6),
    .I3(b_9_IBUF_22),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>_235 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>_233 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4_234 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>_235 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>_236 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5  (
    .I0(b_11_IBUF_20),
    .I1(b_10_IBUF_21),
    .I2(a_10_IBUF_5),
    .I3(a_11_IBUF_4),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5_237 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>  (
    .I0(a_10_IBUF_5),
    .I1(b_10_IBUF_21),
    .I2(a_11_IBUF_4),
    .I3(b_11_IBUF_20),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>_238 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>_236 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5_237 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>_238 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>_239 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6  (
    .I0(b_13_IBUF_18),
    .I1(b_12_IBUF_19),
    .I2(a_12_IBUF_3),
    .I3(a_13_IBUF_2),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6_240 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .I2(a_13_IBUF_2),
    .I3(b_13_IBUF_18),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>_241 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>_239 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6_240 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>_241 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>_242 )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  Sh641 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_0_IBUF_15),
    .O(Sh)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \Madd_b[3]_GND_1_o_add_8_OUT_cy<1>11  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> )
  );
  LUT4 #(
    .INIT ( 16'h9810 ))
  Sh461 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_1_IBUF_30),
    .I2(a_14_IBUF_1),
    .I3(a_15_IBUF_0),
    .O(Sh46)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  Sh1411 (
    .I0(b_1_IBUF_30),
    .I1(a_12_IBUF_3),
    .I2(a_14_IBUF_1),
    .O(Sh141)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \opcode[7]_GND_1_o_equal_19_o<7>2  (
    .I0(opcode_0_IBUF_38),
    .I1(opcode_1_IBUF_37),
    .I2(opcode_3_IBUF_35),
    .I3(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(\opcode[7]_GND_1_o_equal_19_o )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \opcode[7]_PWR_1_o_equal_21_o<7>1  (
    .I0(opcode_0_IBUF_38),
    .I1(opcode_7_IBUF_31),
    .I2(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .O(\opcode[7]_PWR_1_o_equal_21_o )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \opcode[7]_GND_1_o_equal_18_o<7>2  (
    .I0(opcode_7_IBUF_31),
    .I1(opcode_0_IBUF_38),
    .I2(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .O(\opcode[7]_GND_1_o_equal_18_o )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \opcode[7]_GND_1_o_equal_22_o<7>11  (
    .I0(opcode_3_IBUF_35),
    .I1(opcode_1_IBUF_37),
    .I2(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(\opcode[7]_GND_1_o_equal_22_o<7>1_252 )
  );
  LUT5 #(
    .INIT ( 32'hB391A280 ))
  Sh451 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_14_IBUF_1),
    .I3(a_15_IBUF_0),
    .I4(a_13_IBUF_2),
    .O(Sh45)
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \opcode[7]_GND_1_o_equal_19_o<7>11  (
    .I0(opcode_2_IBUF_36),
    .I1(opcode_7_IBUF_31),
    .I2(opcode_6_IBUF_32),
    .I3(opcode_5_IBUF_33),
    .I4(opcode_4_IBUF_34),
    .O(\opcode[7]_GND_1_o_equal_19_o<7>1 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000004 ))
  \opcode[7]_GND_1_o_equal_18_o<7>11  (
    .I0(opcode_1_IBUF_37),
    .I1(opcode_2_IBUF_36),
    .I2(opcode_3_IBUF_35),
    .I3(opcode_6_IBUF_32),
    .I4(opcode_5_IBUF_33),
    .I5(opcode_4_IBUF_34),
    .O(\opcode[7]_GND_1_o_equal_18_o<7>1 )
  );
  LUT4 #(
    .INIT ( 16'h4000 ))
  \opcode[7]_GND_1_o_equal_23_o<7>1  (
    .I0(opcode_1_IBUF_37),
    .I1(opcode_3_IBUF_35),
    .I2(opcode_0_IBUF_38),
    .I3(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(\opcode[7]_GND_1_o_equal_23_o )
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  Sh12 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(a_0_IBUF_15),
    .O(Sh1)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh441 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_14_IBUF_1),
    .I3(a_13_IBUF_2),
    .I4(a_12_IBUF_3),
    .I5(a_15_IBUF_0),
    .O(Sh44)
  );
  LUT5 #(
    .INIT ( 32'h40000000 ))
  \_n0079<0>1  (
    .I0(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>_243 ),
    .I1(opcode_1_IBUF_37),
    .I2(opcode_3_IBUF_35),
    .I3(opcode_0_IBUF_38),
    .I4(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(flags_4_OBUF_95)
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \_n0079<1>1  (
    .I0(\a[15]_b[15]_equal_5_o ),
    .I1(opcode_1_IBUF_37),
    .I2(opcode_3_IBUF_35),
    .I3(opcode_0_IBUF_38),
    .I4(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(flags_3_OBUF_96)
  );
  LUT5 #(
    .INIT ( 32'h40000000 ))
  \_n0079<3>1  (
    .I0(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>_155 ),
    .I1(opcode_1_IBUF_37),
    .I2(opcode_3_IBUF_35),
    .I3(opcode_0_IBUF_38),
    .I4(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(flags_1_OBUF_98)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh31 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(a_0_IBUF_15),
    .I4(a_3_IBUF_12),
    .I5(a_2_IBUF_13),
    .O(Sh3)
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  Sh21 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_1_IBUF_30),
    .I2(a_0_IBUF_15),
    .I3(a_2_IBUF_13),
    .I4(a_1_IBUF_14),
    .O(Sh2)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh42 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_2_IBUF_13),
    .I3(a_1_IBUF_14),
    .I4(a_4_IBUF_11),
    .I5(a_3_IBUF_12),
    .O(Sh4)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh51 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_3_IBUF_12),
    .I3(a_2_IBUF_13),
    .I4(a_5_IBUF_10),
    .I5(a_4_IBUF_11),
    .O(Sh5)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh61 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_4_IBUF_11),
    .I3(a_3_IBUF_12),
    .I4(a_6_IBUF_9),
    .I5(a_5_IBUF_10),
    .O(Sh6)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh71 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_5_IBUF_10),
    .I3(a_4_IBUF_11),
    .I4(a_7_IBUF_8),
    .I5(a_6_IBUF_9),
    .O(Sh7)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh411 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_11_IBUF_4),
    .I3(a_10_IBUF_5),
    .I4(a_9_IBUF_6),
    .I5(a_12_IBUF_3),
    .O(Sh41)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh81 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_6_IBUF_9),
    .I3(a_5_IBUF_10),
    .I4(a_8_IBUF_7),
    .I5(a_7_IBUF_8),
    .O(Sh8)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh91 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_7_IBUF_8),
    .I3(a_6_IBUF_9),
    .I4(a_9_IBUF_6),
    .I5(a_8_IBUF_7),
    .O(Sh9)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh111 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_9_IBUF_6),
    .I3(a_8_IBUF_7),
    .I4(a_11_IBUF_4),
    .I5(a_10_IBUF_5),
    .O(Sh11)
  );
  LUT6 #(
    .INIT ( 64'hFFFFF888F888F888 ))
  \result<4>1  (
    .I0(n0057[4]),
    .I1(\opcode[7]_GND_1_o_equal_18_o ),
    .I2(a_4_IBUF_11),
    .I3(\opcode[7]_GND_1_o_equal_22_o ),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[4]),
    .I5(\opcode[7]_GND_1_o_equal_23_o ),
    .O(\result<4>1_254 )
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  \result<10>1  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh6),
    .I3(Sh10),
    .I4(Sh2),
    .O(\result<10>1_256 )
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  \result<10>2  (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(Sh42_118),
    .I4(Sh46),
    .I5(\result<10>1_256 ),
    .O(\result<10>2_257 )
  );
  LUT6 #(
    .INIT ( 64'h1505140411011000 ))
  \result<11>1  (
    .I0(b_4_IBUF_27),
    .I1(b_2_IBUF_29),
    .I2(b_3_IBUF_28),
    .I3(Sh3),
    .I4(Sh11),
    .I5(Sh7),
    .O(\result<11>1_258 )
  );
  LUT5 #(
    .INIT ( 32'hAAAA0080 ))
  \result<11>3  (
    .I0(\opcode[7]_PWR_1_o_equal_21_o ),
    .I1(\result<11>2_259 ),
    .I2(b_4_IBUF_27),
    .I3(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I4(\result<11>1_258 ),
    .O(\result<11>3_260 )
  );
  LUT5 #(
    .INIT ( 32'hFAFAE848 ))
  \result<11>4  (
    .I0(a_11_IBUF_4),
    .I1(\opcode[7]_GND_1_o_equal_24_o ),
    .I2(b_11_IBUF_20),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_22_o ),
    .O(\result<11>4_261 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFEEEFEEEFEEE ))
  \result<11>5  (
    .I0(\result<11>4_261 ),
    .I1(\result<11>3_260 ),
    .I2(n0057[11]),
    .I3(\opcode[7]_GND_1_o_equal_18_o ),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[11]),
    .I5(\opcode[7]_GND_1_o_equal_23_o ),
    .O(result_11_OBUF_77)
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  \result<8>3  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh4),
    .I3(Sh8),
    .I4(Sh),
    .O(\result<8>3_262 )
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  \result<8>4  (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(Sh40),
    .I4(Sh44),
    .I5(\result<8>3_262 ),
    .O(\result<8>4_263 )
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  \result<9>3  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh5),
    .I3(Sh9),
    .I4(Sh1),
    .O(\result<9>3_264 )
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  \result<9>4  (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(Sh41),
    .I4(Sh45),
    .I5(\result<9>3_264 ),
    .O(\result<9>4_265 )
  );
  LUT5 #(
    .INIT ( 32'hFAFAE848 ))
  \result<12>2  (
    .I0(a_12_IBUF_3),
    .I1(\opcode[7]_GND_1_o_equal_24_o ),
    .I2(b_12_IBUF_19),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_22_o ),
    .O(\result<12>2_266 )
  );
  LUT6 #(
    .INIT ( 64'h5545544411011000 ))
  \result<12>6  (
    .I0(b_4_IBUF_27),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(Sh8),
    .I4(\result<12>5_267 ),
    .I5(Sh281),
    .O(\result<12>6_268 )
  );
  LUT5 #(
    .INIT ( 32'hE8E848C8 ))
  \result<5>1  (
    .I0(a_5_IBUF_10),
    .I1(\opcode[7]_GND_1_o_equal_22_o<7>1_252 ),
    .I2(b_5_IBUF_26),
    .I3(opcode_0_IBUF_38),
    .I4(\opcode[7]_GND_1_o_equal_19_o ),
    .O(\result<5>1_269 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF0A800080 ))
  \result<5>6  (
    .I0(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .I1(n0057[5]),
    .I2(opcode_0_IBUF_38),
    .I3(opcode_7_IBUF_31),
    .I4(\result<5>5_271 ),
    .I5(\result<5>2_270 ),
    .O(result_5_OBUF_83)
  );
  LUT5 #(
    .INIT ( 32'hFAFAE848 ))
  \result<14>2  (
    .I0(a_14_IBUF_1),
    .I1(\opcode[7]_GND_1_o_equal_24_o ),
    .I2(b_14_IBUF_17),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_22_o ),
    .O(\result<14>2_272 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \result<14>5  (
    .I0(b_1_IBUF_30),
    .I1(a_11_IBUF_4),
    .I2(a_13_IBUF_2),
    .O(\result<14>5_273 )
  );
  LUT5 #(
    .INIT ( 32'hEFEA4540 ))
  \result<14>6  (
    .I0(b_3_IBUF_28),
    .I1(\result<14>5_273 ),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(Sh141),
    .I4(Sh6),
    .O(\result<14>6_274 )
  );
  LUT6 #(
    .INIT ( 64'h5551151144400400 ))
  \result<14>7  (
    .I0(b_4_IBUF_27),
    .I1(b_2_IBUF_29),
    .I2(b_3_IBUF_28),
    .I3(Sh10),
    .I4(Sh2),
    .I5(\result<14>6_274 ),
    .O(\result<14>7_275 )
  );
  LUT5 #(
    .INIT ( 32'hE8E848C8 ))
  \result<6>1  (
    .I0(a_6_IBUF_9),
    .I1(\opcode[7]_GND_1_o_equal_22_o<7>1_252 ),
    .I2(b_6_IBUF_25),
    .I3(opcode_0_IBUF_38),
    .I4(\opcode[7]_GND_1_o_equal_19_o ),
    .O(\result<6>1_276 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF0A800080 ))
  \result<6>6  (
    .I0(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .I1(n0057[6]),
    .I2(opcode_0_IBUF_38),
    .I3(opcode_7_IBUF_31),
    .I4(\result<6>5_278 ),
    .I5(\result<6>2_277 ),
    .O(result_6_OBUF_82)
  );
  LUT5 #(
    .INIT ( 32'hE8E848C8 ))
  \result<7>1  (
    .I0(a_7_IBUF_8),
    .I1(\opcode[7]_GND_1_o_equal_22_o<7>1_252 ),
    .I2(b_7_IBUF_24),
    .I3(opcode_0_IBUF_38),
    .I4(\opcode[7]_GND_1_o_equal_19_o ),
    .O(\result<7>1_279 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF0A800080 ))
  \result<7>6  (
    .I0(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .I1(n0057[7]),
    .I2(opcode_0_IBUF_38),
    .I3(opcode_7_IBUF_31),
    .I4(\result<7>5_281 ),
    .I5(\result<7>2_280 ),
    .O(result_7_OBUF_81)
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \result<15>1  (
    .I0(\opcode[7]_GND_1_o_equal_19_o ),
    .I1(a_15_IBUF_0),
    .I2(b_15_IBUF_16),
    .I3(\opcode[7]_GND_1_o_equal_23_o ),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[15]),
    .O(\result<15>1_282 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \result<15>4  (
    .I0(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .I1(opcode_7_IBUF_31),
    .O(\result<15>4_283 )
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \result<15>5  (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(Sh11),
    .I3(Sh3),
    .O(\result<15>5_284 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \result<15>6  (
    .I0(b_1_IBUF_30),
    .I1(a_13_IBUF_2),
    .I2(a_15_IBUF_0),
    .O(\result<15>6_285 )
  );
  LUT6 #(
    .INIT ( 64'h5545544411011000 ))
  \result<15>7  (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(Sh141),
    .I4(\result<15>6_285 ),
    .I5(Sh7),
    .O(\result<15>7_286 )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \result<15>8  (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_1_IBUF_30),
    .I2(a_15_IBUF_0),
    .O(\result<15>8_287 )
  );
  LUT6 #(
    .INIT ( 64'hAAAA222022202220 ))
  \result<15>9  (
    .I0(\result<15>4_283 ),
    .I1(b_4_IBUF_27),
    .I2(\result<15>7_286 ),
    .I3(\result<15>5_284 ),
    .I4(\result<15>8_287 ),
    .I5(\result<12>31 ),
    .O(\result<15>9_288 )
  );
  LUT6 #(
    .INIT ( 64'h02A207A752F257F7 ))
  Sh481_SW0 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(a_7_IBUF_8),
    .I2(b_1_IBUF_30),
    .I3(a_5_IBUF_10),
    .I4(a_4_IBUF_11),
    .I5(a_6_IBUF_9),
    .O(N5)
  );
  LUT6 #(
    .INIT ( 64'h02A207A752F257F7 ))
  Sh491_SW0 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(a_8_IBUF_7),
    .I2(b_1_IBUF_30),
    .I3(a_6_IBUF_9),
    .I4(a_5_IBUF_10),
    .I5(a_7_IBUF_8),
    .O(N7)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  \result<13>1  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_11_IBUF_4),
    .I3(a_10_IBUF_5),
    .I4(a_13_IBUF_2),
    .I5(a_12_IBUF_3),
    .O(\result<13>1_291 )
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  \result<13>2  (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(Sh9),
    .I3(Sh1),
    .I4(\result<13>1_291 ),
    .I5(Sh5),
    .O(\result<13>2_292 )
  );
  LUT5 #(
    .INIT ( 32'hAA080808 ))
  \result<13>3  (
    .I0(\opcode[7]_PWR_1_o_equal_21_o ),
    .I1(\result<13>2_292 ),
    .I2(b_4_IBUF_27),
    .I3(Sh45),
    .I4(\result<12>31 ),
    .O(\result<13>3_293 )
  );
  LUT5 #(
    .INIT ( 32'hFAFAE848 ))
  \result<13>4  (
    .I0(a_13_IBUF_2),
    .I1(\opcode[7]_GND_1_o_equal_24_o ),
    .I2(b_13_IBUF_18),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_22_o ),
    .O(\result<13>4_294 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFEEEFEEEFEEE ))
  \result<13>5  (
    .I0(\result<13>4_294 ),
    .I1(\result<13>3_293 ),
    .I2(n0057[13]),
    .I3(\opcode[7]_GND_1_o_equal_18_o ),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[13]),
    .I5(\opcode[7]_GND_1_o_equal_23_o ),
    .O(result_13_OBUF_75)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh501_SW0 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_8_IBUF_7),
    .I3(a_7_IBUF_8),
    .I4(a_6_IBUF_9),
    .I5(a_9_IBUF_6),
    .O(N9)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh5111 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_9_IBUF_6),
    .I3(a_8_IBUF_7),
    .I4(a_7_IBUF_8),
    .I5(a_10_IBUF_5),
    .O(Sh5111_296)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  \result<1>4  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_3_IBUF_12),
    .I3(a_2_IBUF_13),
    .I4(a_1_IBUF_14),
    .I5(a_4_IBUF_11),
    .O(\result<1>4_298 )
  );
  LUT6 #(
    .INIT ( 64'hAA8AA88822022000 ))
  \result<1>5  (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh41),
    .I4(\result<1>4_298 ),
    .I5(Sh491_248),
    .O(\result<1>5_299 )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \result<1>6  (
    .I0(Sh1),
    .I1(b_4_IBUF_27),
    .I2(b_2_IBUF_29),
    .I3(b_3_IBUF_28),
    .O(\result<1>6_300 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFADAE8C8 ))
  \result<0>2  (
    .I0(a_0_IBUF_15),
    .I1(\opcode[7]_GND_1_o_equal_22_o ),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_24_o ),
    .I5(\result<0>1_301 ),
    .O(\result<0>2_302 )
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  \result<0>3  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_2_IBUF_13),
    .I3(a_1_IBUF_14),
    .I4(a_0_IBUF_15),
    .I5(a_3_IBUF_12),
    .O(\result<0>3_303 )
  );
  LUT6 #(
    .INIT ( 64'hAA8AA88822022000 ))
  \result<0>4  (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh40),
    .I4(\result<0>3_303 ),
    .I5(Sh481_247),
    .O(\result<0>4_304 )
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  \result<2>4  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_4_IBUF_11),
    .I3(a_3_IBUF_12),
    .I4(a_2_IBUF_13),
    .I5(a_5_IBUF_10),
    .O(\result<2>4_307 )
  );
  LUT6 #(
    .INIT ( 64'hAA8AA88822022000 ))
  \result<2>5  (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh42_118),
    .I4(\result<2>4_307 ),
    .I5(Sh501_249),
    .O(\result<2>5_308 )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \result<2>6  (
    .I0(Sh2),
    .I1(b_3_IBUF_28),
    .I2(b_4_IBUF_27),
    .I3(b_2_IBUF_29),
    .O(\result<2>6_309 )
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  \result<3>4  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_5_IBUF_10),
    .I3(a_4_IBUF_11),
    .I4(a_3_IBUF_12),
    .I5(a_6_IBUF_9),
    .O(\result<3>4_311 )
  );
  LUT6 #(
    .INIT ( 64'hAA8AA88822022000 ))
  \result<3>5  (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh43),
    .I4(\result<3>4_311 ),
    .I5(Sh511),
    .O(\result<3>5_312 )
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \result<3>6  (
    .I0(Sh3),
    .I1(b_3_IBUF_28),
    .I2(b_4_IBUF_27),
    .I3(b_2_IBUF_29),
    .O(\result<3>6_313 )
  );
  IBUF   a_15_IBUF (
    .I(a[15]),
    .O(a_15_IBUF_0)
  );
  IBUF   a_14_IBUF (
    .I(a[14]),
    .O(a_14_IBUF_1)
  );
  IBUF   a_13_IBUF (
    .I(a[13]),
    .O(a_13_IBUF_2)
  );
  IBUF   a_12_IBUF (
    .I(a[12]),
    .O(a_12_IBUF_3)
  );
  IBUF   a_11_IBUF (
    .I(a[11]),
    .O(a_11_IBUF_4)
  );
  IBUF   a_10_IBUF (
    .I(a[10]),
    .O(a_10_IBUF_5)
  );
  IBUF   a_9_IBUF (
    .I(a[9]),
    .O(a_9_IBUF_6)
  );
  IBUF   a_8_IBUF (
    .I(a[8]),
    .O(a_8_IBUF_7)
  );
  IBUF   a_7_IBUF (
    .I(a[7]),
    .O(a_7_IBUF_8)
  );
  IBUF   a_6_IBUF (
    .I(a[6]),
    .O(a_6_IBUF_9)
  );
  IBUF   a_5_IBUF (
    .I(a[5]),
    .O(a_5_IBUF_10)
  );
  IBUF   a_4_IBUF (
    .I(a[4]),
    .O(a_4_IBUF_11)
  );
  IBUF   a_3_IBUF (
    .I(a[3]),
    .O(a_3_IBUF_12)
  );
  IBUF   a_2_IBUF (
    .I(a[2]),
    .O(a_2_IBUF_13)
  );
  IBUF   a_1_IBUF (
    .I(a[1]),
    .O(a_1_IBUF_14)
  );
  IBUF   a_0_IBUF (
    .I(a[0]),
    .O(a_0_IBUF_15)
  );
  IBUF   b_15_IBUF (
    .I(b[15]),
    .O(b_15_IBUF_16)
  );
  IBUF   b_14_IBUF (
    .I(b[14]),
    .O(b_14_IBUF_17)
  );
  IBUF   b_13_IBUF (
    .I(b[13]),
    .O(b_13_IBUF_18)
  );
  IBUF   b_12_IBUF (
    .I(b[12]),
    .O(b_12_IBUF_19)
  );
  IBUF   b_11_IBUF (
    .I(b[11]),
    .O(b_11_IBUF_20)
  );
  IBUF   b_10_IBUF (
    .I(b[10]),
    .O(b_10_IBUF_21)
  );
  IBUF   b_9_IBUF (
    .I(b[9]),
    .O(b_9_IBUF_22)
  );
  IBUF   b_8_IBUF (
    .I(b[8]),
    .O(b_8_IBUF_23)
  );
  IBUF   b_7_IBUF (
    .I(b[7]),
    .O(b_7_IBUF_24)
  );
  IBUF   b_6_IBUF (
    .I(b[6]),
    .O(b_6_IBUF_25)
  );
  IBUF   b_5_IBUF (
    .I(b[5]),
    .O(b_5_IBUF_26)
  );
  IBUF   b_4_IBUF (
    .I(b[4]),
    .O(b_4_IBUF_27)
  );
  IBUF   b_3_IBUF (
    .I(b[3]),
    .O(b_3_IBUF_28)
  );
  IBUF   b_2_IBUF (
    .I(b[2]),
    .O(b_2_IBUF_29)
  );
  IBUF   b_1_IBUF (
    .I(b[1]),
    .O(b_1_IBUF_30)
  );
  IBUF   b_0_IBUF (
    .I(b[0]),
    .O(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> )
  );
  IBUF   opcode_7_IBUF (
    .I(opcode[7]),
    .O(opcode_7_IBUF_31)
  );
  IBUF   opcode_6_IBUF (
    .I(opcode[6]),
    .O(opcode_6_IBUF_32)
  );
  IBUF   opcode_5_IBUF (
    .I(opcode[5]),
    .O(opcode_5_IBUF_33)
  );
  IBUF   opcode_4_IBUF (
    .I(opcode[4]),
    .O(opcode_4_IBUF_34)
  );
  IBUF   opcode_3_IBUF (
    .I(opcode[3]),
    .O(opcode_3_IBUF_35)
  );
  IBUF   opcode_2_IBUF (
    .I(opcode[2]),
    .O(opcode_2_IBUF_36)
  );
  IBUF   opcode_1_IBUF (
    .I(opcode[1]),
    .O(opcode_1_IBUF_37)
  );
  IBUF   opcode_0_IBUF (
    .I(opcode[0]),
    .O(opcode_0_IBUF_38)
  );
  OBUF   result_15_OBUF (
    .I(result_15_OBUF_73),
    .O(result[15])
  );
  OBUF   result_14_OBUF (
    .I(result_14_OBUF_74),
    .O(result[14])
  );
  OBUF   result_13_OBUF (
    .I(result_13_OBUF_75),
    .O(result[13])
  );
  OBUF   result_12_OBUF (
    .I(result_12_OBUF_76),
    .O(result[12])
  );
  OBUF   result_11_OBUF (
    .I(result_11_OBUF_77),
    .O(result[11])
  );
  OBUF   result_10_OBUF (
    .I(result_10_OBUF_78),
    .O(result[10])
  );
  OBUF   result_9_OBUF (
    .I(result_9_OBUF_79),
    .O(result[9])
  );
  OBUF   result_8_OBUF (
    .I(result_8_OBUF_80),
    .O(result[8])
  );
  OBUF   result_7_OBUF (
    .I(result_7_OBUF_81),
    .O(result[7])
  );
  OBUF   result_6_OBUF (
    .I(result_6_OBUF_82),
    .O(result[6])
  );
  OBUF   result_5_OBUF (
    .I(result_5_OBUF_83),
    .O(result[5])
  );
  OBUF   result_4_OBUF (
    .I(result_4_OBUF_84),
    .O(result[4])
  );
  OBUF   result_3_OBUF (
    .I(result_3_OBUF_85),
    .O(result[3])
  );
  OBUF   result_2_OBUF (
    .I(result_2_OBUF_86),
    .O(result[2])
  );
  OBUF   result_1_OBUF (
    .I(result_1_OBUF_87),
    .O(result[1])
  );
  OBUF   result_0_OBUF (
    .I(result_0_OBUF_88),
    .O(result[0])
  );
  OBUF   flags_4_OBUF (
    .I(flags_4_OBUF_95),
    .O(flags[4])
  );
  OBUF   flags_3_OBUF (
    .I(flags_3_OBUF_96),
    .O(flags[3])
  );
  OBUF   flags_2_OBUF (
    .I(flags_2_OBUF_97),
    .O(flags[2])
  );
  OBUF   flags_1_OBUF (
    .I(flags_1_OBUF_98),
    .O(flags[1])
  );
  OBUF   flags_0_OBUF (
    .I(flags_0_OBUF_99),
    .O(flags[0])
  );
  LUT5 #(
    .INIT ( 32'hF7733110 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>  (
    .I0(a_14_IBUF_1),
    .I1(a_15_IBUF_0),
    .I2(b_14_IBUF_17),
    .I3(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>_154 ),
    .I4(b_15_IBUF_16),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>_155 )
  );
  LUT5 #(
    .INIT ( 32'hF7733110 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>  (
    .I0(a_14_IBUF_1),
    .I1(b_15_IBUF_16),
    .I2(b_14_IBUF_17),
    .I3(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>_242 ),
    .I4(a_15_IBUF_0),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>_243 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF40404000 ))
  \result<1>7_SW0  (
    .I0(opcode_0_IBUF_38),
    .I1(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .I2(opcode_7_IBUF_31),
    .I3(\result<1>5_299 ),
    .I4(\result<1>6_300 ),
    .I5(\result<1>2_297 ),
    .O(N11)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFADAE8C8 ))
  \result<1>7  (
    .I0(b_1_IBUF_30),
    .I1(\opcode[7]_GND_1_o_equal_22_o ),
    .I2(a_1_IBUF_14),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_24_o ),
    .I5(N11),
    .O(result_1_OBUF_87)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF40404000 ))
  \result<2>7_SW0  (
    .I0(opcode_0_IBUF_38),
    .I1(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .I2(opcode_7_IBUF_31),
    .I3(\result<2>5_308 ),
    .I4(\result<2>6_309 ),
    .I5(\result<2>2_306 ),
    .O(N13)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFADAE8C8 ))
  \result<2>7  (
    .I0(b_2_IBUF_29),
    .I1(\opcode[7]_GND_1_o_equal_22_o ),
    .I2(a_2_IBUF_13),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_24_o ),
    .I5(N13),
    .O(result_2_OBUF_86)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF40404000 ))
  \result<3>7_SW0  (
    .I0(opcode_0_IBUF_38),
    .I1(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .I2(opcode_7_IBUF_31),
    .I3(\result<3>5_312 ),
    .I4(\result<3>6_313 ),
    .I5(\result<3>2_310 ),
    .O(N15)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFADAE8C8 ))
  \result<3>7  (
    .I0(b_3_IBUF_28),
    .I1(\opcode[7]_GND_1_o_equal_22_o ),
    .I2(a_3_IBUF_12),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_24_o ),
    .I5(N15),
    .O(result_3_OBUF_85)
  );
  LUT6 #(
    .INIT ( 64'hFFFFF888F888F888 ))
  \result<10>5_SW0  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[10]),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(n0057[10]),
    .I3(\opcode[7]_GND_1_o_equal_18_o ),
    .I4(\opcode[7]_PWR_1_o_equal_21_o ),
    .I5(\result<10>2_257 ),
    .O(N17)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFADAE8C8 ))
  \result<10>5  (
    .I0(b_10_IBUF_21),
    .I1(\opcode[7]_GND_1_o_equal_22_o ),
    .I2(a_10_IBUF_5),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_24_o ),
    .I5(N17),
    .O(result_10_OBUF_78)
  );
  LUT6 #(
    .INIT ( 64'hFFFFF888F888F888 ))
  \result<8>5_SW0  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[8]),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(n0057[8]),
    .I3(\opcode[7]_GND_1_o_equal_18_o ),
    .I4(\opcode[7]_PWR_1_o_equal_21_o ),
    .I5(\result<8>4_263 ),
    .O(N19)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFADAE8C8 ))
  \result<8>5  (
    .I0(b_8_IBUF_23),
    .I1(\opcode[7]_GND_1_o_equal_22_o ),
    .I2(a_8_IBUF_7),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_24_o ),
    .I5(N19),
    .O(result_8_OBUF_80)
  );
  LUT6 #(
    .INIT ( 64'hFFFFF888F888F888 ))
  \result<9>5_SW0  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[9]),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(n0057[9]),
    .I3(\opcode[7]_GND_1_o_equal_18_o ),
    .I4(\opcode[7]_PWR_1_o_equal_21_o ),
    .I5(\result<9>4_265 ),
    .O(N21)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFADAE8C8 ))
  \result<9>5  (
    .I0(b_9_IBUF_22),
    .I1(\opcode[7]_GND_1_o_equal_22_o ),
    .I2(a_9_IBUF_6),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_24_o ),
    .I5(N21),
    .O(result_9_OBUF_79)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh401 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_1_IBUF_30),
    .I2(a_11_IBUF_4),
    .I3(a_9_IBUF_6),
    .I4(a_8_IBUF_7),
    .I5(a_10_IBUF_5),
    .O(Sh40)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh431 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_13_IBUF_2),
    .I3(a_12_IBUF_3),
    .I4(a_11_IBUF_4),
    .I5(a_14_IBUF_1),
    .O(Sh43)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh421 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_1_IBUF_30),
    .I2(a_13_IBUF_2),
    .I3(a_11_IBUF_4),
    .I4(a_10_IBUF_5),
    .I5(a_12_IBUF_3),
    .O(Sh42_118)
  );
  LUT6 #(
    .INIT ( 64'h54C4108032A21080 ))
  \flags<2>1  (
    .I0(a_15_IBUF_0),
    .I1(b_15_IBUF_16),
    .I2(\opcode[7]_GND_1_o_equal_18_o ),
    .I3(n0057[15]),
    .I4(\opcode[7]_GND_1_o_equal_23_o ),
    .I5(GND_1_o_GND_1_o_sub_14_OUT[15]),
    .O(flags_2_OBUF_97)
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  Sh101 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_8_IBUF_7),
    .I3(a_7_IBUF_8),
    .I4(a_10_IBUF_5),
    .I5(a_9_IBUF_6),
    .O(Sh10)
  );
  LUT6 #(
    .INIT ( 64'h282A080A20220002 ))
  \result<4>4  (
    .I0(\opcode[7]_PWR_1_o_equal_21_o ),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(N5),
    .I4(Sh40),
    .I5(Sh44),
    .O(\result<4>4_255 )
  );
  LUT6 #(
    .INIT ( 64'h88F8888888888888 ))
  \flags<4>1  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[16]),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(Madd_n0057_cy[15]),
    .I3(opcode_7_IBUF_31),
    .I4(opcode_0_IBUF_38),
    .I5(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .O(flags_0_OBUF_99)
  );
  LUT3 #(
    .INIT ( 8'h56 ))
  \Madd_b[3]_GND_1_o_add_8_OUT_xor<2>11  (
    .I0(b_2_IBUF_29),
    .I1(b_1_IBUF_30),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(\b[3]_GND_1_o_add_8_OUT<2>1 )
  );
  LUT5 #(
    .INIT ( 32'h44444E44 ))
  Sh2811 (
    .I0(b_2_IBUF_29),
    .I1(Sh4),
    .I2(b_1_IBUF_30),
    .I3(a_0_IBUF_15),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(Sh281)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  \opcode[7]_GND_1_o_equal_22_o<7>1  (
    .I0(opcode_1_IBUF_37),
    .I1(opcode_0_IBUF_38),
    .I2(opcode_3_IBUF_35),
    .I3(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(\opcode[7]_GND_1_o_equal_22_o )
  );
  LUT4 #(
    .INIT ( 16'h4000 ))
  \opcode[7]_GND_1_o_equal_24_o<7>1  (
    .I0(opcode_3_IBUF_35),
    .I1(opcode_0_IBUF_38),
    .I2(opcode_1_IBUF_37),
    .I3(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(\opcode[7]_GND_1_o_equal_24_o )
  );
  LUT6 #(
    .INIT ( 64'hAEAAAAAAAAAAAAAA ))
  \result<5>2  (
    .I0(\result<5>1_269 ),
    .I1(GND_1_o_GND_1_o_sub_14_OUT[5]),
    .I2(opcode_1_IBUF_37),
    .I3(opcode_3_IBUF_35),
    .I4(opcode_0_IBUF_38),
    .I5(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(\result<5>2_270 )
  );
  LUT6 #(
    .INIT ( 64'hAEAAAAAAAAAAAAAA ))
  \result<6>2  (
    .I0(\result<6>1_276 ),
    .I1(GND_1_o_GND_1_o_sub_14_OUT[6]),
    .I2(opcode_1_IBUF_37),
    .I3(opcode_3_IBUF_35),
    .I4(opcode_0_IBUF_38),
    .I5(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(\result<6>2_277 )
  );
  LUT6 #(
    .INIT ( 64'hAEAAAAAAAAAAAAAA ))
  \result<7>2  (
    .I0(\result<7>1_279 ),
    .I1(GND_1_o_GND_1_o_sub_14_OUT[7]),
    .I2(opcode_1_IBUF_37),
    .I3(opcode_3_IBUF_35),
    .I4(opcode_0_IBUF_38),
    .I5(\opcode[7]_GND_1_o_equal_19_o<7>1 ),
    .O(\result<7>2_280 )
  );
  LUT6 #(
    .INIT ( 64'h88F8888888888888 ))
  \result<1>2  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[1]),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(n0057[1]),
    .I3(opcode_7_IBUF_31),
    .I4(opcode_0_IBUF_38),
    .I5(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .O(\result<1>2_297 )
  );
  LUT6 #(
    .INIT ( 64'h88F8888888888888 ))
  \result<0>1  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[0]),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(n0057[0]),
    .I3(opcode_7_IBUF_31),
    .I4(opcode_0_IBUF_38),
    .I5(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .O(\result<0>1_301 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000004 ))
  \result<0>5  (
    .I0(b_1_IBUF_30),
    .I1(a_0_IBUF_15),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(b_4_IBUF_27),
    .I4(b_2_IBUF_29),
    .I5(b_3_IBUF_28),
    .O(\result<0>5_305 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF40404000 ))
  \result<0>6  (
    .I0(opcode_0_IBUF_38),
    .I1(opcode_7_IBUF_31),
    .I2(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .I3(\result<0>4_304 ),
    .I4(\result<0>5_305 ),
    .I5(\result<0>2_302 ),
    .O(result_0_OBUF_88)
  );
  LUT6 #(
    .INIT ( 64'h88F8888888888888 ))
  \result<2>2  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[2]),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(n0057[2]),
    .I3(opcode_7_IBUF_31),
    .I4(opcode_0_IBUF_38),
    .I5(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .O(\result<2>2_306 )
  );
  LUT6 #(
    .INIT ( 64'h88F8888888888888 ))
  \result<3>2  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[3]),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(n0057[3]),
    .I3(opcode_7_IBUF_31),
    .I4(opcode_0_IBUF_38),
    .I5(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .O(\result<3>2_310 )
  );
  LUT6 #(
    .INIT ( 64'hFD75EC64B931A820 ))
  \result<12>5  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_10_IBUF_5),
    .I3(a_9_IBUF_6),
    .I4(a_12_IBUF_3),
    .I5(a_11_IBUF_4),
    .O(\result<12>5_267 )
  );
  LUT6 #(
    .INIT ( 64'h6666622244444000 ))
  \result<12>7_SW1  (
    .I0(opcode_0_IBUF_38),
    .I1(opcode_7_IBUF_31),
    .I2(Sh44),
    .I3(\result<12>31 ),
    .I4(\result<12>6_268 ),
    .I5(n0057[12]),
    .O(N27)
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \result<12>7  (
    .I0(\result<12>2_266 ),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(GND_1_o_GND_1_o_sub_14_OUT[12]),
    .I3(N27),
    .I4(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .O(result_12_OBUF_76)
  );
  LUT6 #(
    .INIT ( 64'h6666622244444000 ))
  \result<14>8_SW1  (
    .I0(opcode_0_IBUF_38),
    .I1(opcode_7_IBUF_31),
    .I2(Sh46),
    .I3(\result<12>31 ),
    .I4(\result<14>7_275 ),
    .I5(n0057[14]),
    .O(N29)
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  \result<14>8  (
    .I0(\result<14>2_272 ),
    .I1(\opcode[7]_GND_1_o_equal_23_o ),
    .I2(GND_1_o_GND_1_o_sub_14_OUT[14]),
    .I3(N29),
    .I4(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .O(result_14_OBUF_74)
  );
  LUT5 #(
    .INIT ( 32'h888E8884 ))
  \result<11>2  (
    .I0(b_2_IBUF_29),
    .I1(Sh43),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(a_15_IBUF_0),
    .O(\result<11>2_259 )
  );
  LUT4 #(
    .INIT ( 16'h5556 ))
  \Madd_b[3]_GND_1_o_add_8_OUT_xor<3>11  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(\b[3]_GND_1_o_add_8_OUT<3>1 )
  );
  LUT5 #(
    .INIT ( 32'h80808002 ))
  \result<12>311  (
    .I0(b_4_IBUF_27),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(\result<12>31 )
  );
  LUT6 #(
    .INIT ( 64'h7777777B22222221 ))
  Sh491 (
    .I0(b_3_IBUF_28),
    .I1(N7),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(b_2_IBUF_29),
    .I5(Sh45),
    .O(Sh491_248)
  );
  LUT6 #(
    .INIT ( 64'hDDDDDDDE88888884 ))
  Sh501 (
    .I0(b_3_IBUF_28),
    .I1(N9),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I5(Sh46),
    .O(Sh501_249)
  );
  LUT6 #(
    .INIT ( 64'h888888DE88888884 ))
  Sh5112 (
    .I0(b_3_IBUF_28),
    .I1(Sh5111_296),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I5(a_15_IBUF_0),
    .O(Sh511)
  );
  LUT6 #(
    .INIT ( 64'h7777777B22222221 ))
  Sh481 (
    .I0(b_3_IBUF_28),
    .I1(N5),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(b_2_IBUF_29),
    .I5(Sh44),
    .O(Sh481_247)
  );
  MUXF7   \result<5>5  (
    .I0(N31),
    .I1(N32),
    .S(b_4_IBUF_27),
    .O(\result<5>5_271 )
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  \result<5>5_F  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh5),
    .I3(Sh1),
    .O(N31)
  );
  LUT5 #(
    .INIT ( 32'hEB282828 ))
  \result<5>5_G  (
    .I0(Sh491_248),
    .I1(b_2_IBUF_29),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ),
    .I3(Sh41),
    .I4(b_3_IBUF_28),
    .O(N32)
  );
  MUXF7   \result<6>5  (
    .I0(N33),
    .I1(N34),
    .S(b_4_IBUF_27),
    .O(\result<6>5_278 )
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  \result<6>5_F  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh6),
    .I3(Sh2),
    .O(N33)
  );
  LUT5 #(
    .INIT ( 32'hEB282828 ))
  \result<6>5_G  (
    .I0(Sh501_249),
    .I1(b_2_IBUF_29),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ),
    .I3(Sh42_118),
    .I4(b_3_IBUF_28),
    .O(N34)
  );
  MUXF7   \result<7>5  (
    .I0(N35),
    .I1(N36),
    .S(b_4_IBUF_27),
    .O(\result<7>5_281 )
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  \result<7>5_F  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh7),
    .I3(Sh3),
    .O(N35)
  );
  LUT5 #(
    .INIT ( 32'hEB282828 ))
  \result<7>5_G  (
    .I0(Sh511),
    .I1(b_2_IBUF_29),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ),
    .I3(Sh43),
    .I4(b_3_IBUF_28),
    .O(N36)
  );
  MUXF7   \result<4>5  (
    .I0(N37),
    .I1(N38),
    .S(b_4_IBUF_27),
    .O(result_4_OBUF_84)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFF080808 ))
  \result<4>5_F  (
    .I0(Sh281),
    .I1(\opcode[7]_PWR_1_o_equal_21_o ),
    .I2(b_3_IBUF_28),
    .I3(a_4_IBUF_11),
    .I4(\opcode[7]_GND_1_o_equal_24_o ),
    .I5(\result<4>1_254 ),
    .O(N37)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFEFFEEE ))
  \result<4>5_G  (
    .I0(\result<4>4_255 ),
    .I1(\opcode[7]_GND_1_o_equal_22_o ),
    .I2(a_4_IBUF_11),
    .I3(\opcode[7]_GND_1_o_equal_19_o ),
    .I4(\opcode[7]_GND_1_o_equal_24_o ),
    .I5(\result<4>1_254 ),
    .O(N38)
  );
  MUXF7   \result<15>10  (
    .I0(N39),
    .I1(N40),
    .S(opcode_0_IBUF_38),
    .O(result_15_OBUF_73)
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFA8 ))
  \result<15>10_F  (
    .I0(\opcode[7]_GND_1_o_equal_22_o<7>1_252 ),
    .I1(a_15_IBUF_0),
    .I2(b_15_IBUF_16),
    .I3(\result<15>9_288 ),
    .I4(\result<15>1_282 ),
    .O(N39)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF2222F222 ))
  \result<15>10_G  (
    .I0(\opcode[7]_GND_1_o_equal_22_o<7>1_252 ),
    .I1(\Mcompar_a[15]_b[15]_equal_5_o_lut<5>_133 ),
    .I2(\opcode[7]_GND_1_o_equal_18_o<7>1 ),
    .I3(n0057[15]),
    .I4(opcode_7_IBUF_31),
    .I5(\result<15>1_282 ),
    .O(N40)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

