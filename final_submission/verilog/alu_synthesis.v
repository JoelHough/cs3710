////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: alu_synthesis.v
// /___/   /\     Timestamp: Mon Sep 23 02:58:57 2013
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
  input [3 : 0] opcode;
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
  wire opcode_3_IBUF_31;
  wire opcode_2_IBUF_32;
  wire opcode_1_IBUF_33;
  wire opcode_0_IBUF_34;
  wire \a[15]_b[15]_equal_5_o ;
  wire result_15_OBUF_69;
  wire result_14_OBUF_70;
  wire result_13_OBUF_71;
  wire result_12_OBUF_72;
  wire result_11_OBUF_73;
  wire result_10_OBUF_74;
  wire result_9_OBUF_75;
  wire result_8_OBUF_76;
  wire result_7_OBUF_77;
  wire result_6_OBUF_78;
  wire result_5_OBUF_79;
  wire result_4_OBUF_80;
  wire result_3_OBUF_81;
  wire result_2_OBUF_82;
  wire result_1_OBUF_83;
  wire result_0_OBUF_84;
  wire flags_4_OBUF_85;
  wire flags_3_OBUF_86;
  wire flags_2_OBUF_87;
  wire flags_1_OBUF_88;
  wire flags_0_OBUF_89;
  wire N0;
  wire N1;
  wire Sh;
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
  wire Sh42_107;
  wire Sh43;
  wire Sh44;
  wire Sh45;
  wire Sh46;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<0>_112 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<0>_113 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<1>_114 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<1>_115 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<2>_116 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<2>_117 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<3>_118 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<3>_119 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<4>_120 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<4>_121 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<5>_122 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi_123 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>_124 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>_125 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1_126 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>_127 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>_128 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2_129 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>_130 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>_131 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3_132 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>_133 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>_134 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4_135 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>_136 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>_137 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5_138 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>_139 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>_140 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6_141 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>_142 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>_143 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>_144 ;
  wire \Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ;
  wire \Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi_211 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>_212 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>_213 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1_214 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>_215 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>_216 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2_217 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>_218 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>_219 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3_220 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>_221 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>_222 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4_223 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>_224 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>_225 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5_226 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>_227 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>_228 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6_229 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>_230 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>_231 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>_232 ;
  wire Sh101_233;
  wire Sh141;
  wire \result<0>2_235 ;
  wire \result<0>3_236 ;
  wire \result<0>4 ;
  wire Sh311;
  wire Sh481_239;
  wire Sh491_240;
  wire Sh501_241;
  wire Sh511;
  wire Sh421_243;
  wire Sh441_244;
  wire \flags<2>1 ;
  wire \result<1>221 ;
  wire \result<1>212 ;
  wire N5;
  wire \result<10>1_249 ;
  wire \result<10>4_250 ;
  wire \result<10>5_251 ;
  wire \result<11>1_252 ;
  wire \result<11>4_253 ;
  wire \result<11>5_254 ;
  wire \result<11>6_255 ;
  wire \result<8>1_256 ;
  wire \result<8>2_257 ;
  wire \result<8>8_258 ;
  wire \result<9>1_259 ;
  wire \result<9>2_260 ;
  wire \result<9>6_261 ;
  wire \result<9>7_262 ;
  wire \result<9>8_263 ;
  wire \result<9>9_264 ;
  wire \result<9>10_265 ;
  wire \result<12>1_266 ;
  wire \result<12>2 ;
  wire \result<12>5_268 ;
  wire \result<12>6_269 ;
  wire \result<12>7_270 ;
  wire \result<4>1_271 ;
  wire \result<4>2_272 ;
  wire \result<4>4_273 ;
  wire \result<4>5_274 ;
  wire \result<4>6_275 ;
  wire \result<4>7_276 ;
  wire \result<5>1_277 ;
  wire \result<5>7_278 ;
  wire \result<14>1_279 ;
  wire \result<14>3_280 ;
  wire \result<14>4_281 ;
  wire \result<14>5_282 ;
  wire \result<14>6_283 ;
  wire \result<14>7_284 ;
  wire \result<14>8_285 ;
  wire \result<6>1_286 ;
  wire \result<6>7_287 ;
  wire \result<7>1_288 ;
  wire \result<7>7_289 ;
  wire \result<1>1_290 ;
  wire \result<1>3_291 ;
  wire \result<1>4_292 ;
  wire \result<1>5_293 ;
  wire \result<1>6_294 ;
  wire \result<1>7_295 ;
  wire \result<1>8_296 ;
  wire \result<0>1_297 ;
  wire \result<0>5 ;
  wire \result<0>6_299 ;
  wire \result<0>9 ;
  wire \result<0>10 ;
  wire \result<2>1_302 ;
  wire \result<2>3_303 ;
  wire \result<2>4_304 ;
  wire \result<2>5_305 ;
  wire \result<2>6_306 ;
  wire \result<2>7_307 ;
  wire \result<2>8_308 ;
  wire \result<3>1_309 ;
  wire \result<3>3_310 ;
  wire \result<3>4_311 ;
  wire \result<3>5_312 ;
  wire \result<3>6_313 ;
  wire \result<3>7_314 ;
  wire \result<3>8_315 ;
  wire N7;
  wire N9;
  wire \result<13>1_318 ;
  wire \result<13>3_319 ;
  wire \result<13>4_320 ;
  wire \result<13>5_321 ;
  wire \result<13>6_322 ;
  wire \result<13>7_323 ;
  wire \result<13>8_324 ;
  wire \result<13>9_325 ;
  wire N11;
  wire Sh5111_327;
  wire \result<15>7_328 ;
  wire \result<15>8_329 ;
  wire \result<15>9_330 ;
  wire \result<15>10_331 ;
  wire \result<15>11_332 ;
  wire N15;
  wire N17;
  wire N19;
  wire N20;
  wire N21;
  wire N22;
  wire N23;
  wire N24;
  wire N25;
  wire N26;
  wire N27;
  wire N28;
  wire N29;
  wire N30;
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
  wire N41;
  wire N42;
  wire [16 : 0] GND_1_o_GND_1_o_sub_14_OUT;
  wire [15 : 0] n0058;
  wire [15 : 0] Msub_GND_1_o_GND_1_o_sub_14_OUT_lut;
  wire [15 : 0] Msub_GND_1_o_GND_1_o_sub_14_OUT_cy;
  wire [15 : 0] Madd_n0058_lut;
  wire [15 : 0] Madd_n0058_cy;
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<0>_112 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<0>_112 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<0>_113 )
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<1>_114 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<1>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<0>_113 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<1>_114 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<1>_115 )
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<2>_116 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<2>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<1>_115 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<2>_116 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<2>_117 )
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<3>_118 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<3>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<2>_117 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<3>_118 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<3>_119 )
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<4>_120 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<4>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<3>_119 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<4>_120 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<4>_121 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_a[15]_b[15]_equal_5_o_lut<5>  (
    .I0(a_15_IBUF_0),
    .I1(b_15_IBUF_16),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<5>_122 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<5>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<4>_121 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<5>_122 ),
    .O(\a[15]_b[15]_equal_5_o )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_0_IBUF_15),
    .I3(a_1_IBUF_14),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi_123 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(b_1_IBUF_30),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>_124 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>  (
    .CI(N0),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi_123 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>_124 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>_125 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(a_2_IBUF_13),
    .I3(a_3_IBUF_12),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1_126 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>  (
    .I0(a_2_IBUF_13),
    .I1(b_2_IBUF_29),
    .I2(a_3_IBUF_12),
    .I3(b_3_IBUF_28),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>_127 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>_125 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1_126 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>_127 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>_128 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2  (
    .I0(b_5_IBUF_26),
    .I1(b_4_IBUF_27),
    .I2(a_4_IBUF_11),
    .I3(a_5_IBUF_10),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2_129 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>  (
    .I0(a_4_IBUF_11),
    .I1(b_4_IBUF_27),
    .I2(a_5_IBUF_10),
    .I3(b_5_IBUF_26),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>_130 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>_128 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2_129 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>_130 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>_131 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3  (
    .I0(b_7_IBUF_24),
    .I1(b_6_IBUF_25),
    .I2(a_6_IBUF_9),
    .I3(a_7_IBUF_8),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3_132 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .I2(a_7_IBUF_8),
    .I3(b_7_IBUF_24),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>_133 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>_131 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3_132 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>_133 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>_134 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4  (
    .I0(b_9_IBUF_22),
    .I1(b_8_IBUF_23),
    .I2(a_8_IBUF_7),
    .I3(a_9_IBUF_6),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4_135 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>  (
    .I0(a_8_IBUF_7),
    .I1(b_8_IBUF_23),
    .I2(a_9_IBUF_6),
    .I3(b_9_IBUF_22),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>_136 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>_134 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4_135 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>_136 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>_137 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5  (
    .I0(b_11_IBUF_20),
    .I1(b_10_IBUF_21),
    .I2(a_10_IBUF_5),
    .I3(a_11_IBUF_4),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5_138 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>  (
    .I0(a_10_IBUF_5),
    .I1(b_10_IBUF_21),
    .I2(a_11_IBUF_4),
    .I3(b_11_IBUF_20),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>_139 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>_137 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5_138 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>_139 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>_140 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6  (
    .I0(b_13_IBUF_18),
    .I1(b_12_IBUF_19),
    .I2(a_12_IBUF_3),
    .I3(a_13_IBUF_2),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6_141 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .I2(a_13_IBUF_2),
    .I3(b_13_IBUF_18),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>_142 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>_140 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6_141 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>_142 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>_143 )
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
  \Madd_n0058_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(Madd_n0058_lut[0])
  );
  MUXCY   \Madd_n0058_cy<0>  (
    .CI(N1),
    .DI(a_0_IBUF_15),
    .S(Madd_n0058_lut[0]),
    .O(Madd_n0058_cy[0])
  );
  XORCY   \Madd_n0058_xor<0>  (
    .CI(N1),
    .LI(Madd_n0058_lut[0]),
    .O(n0058[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<1>  (
    .I0(a_1_IBUF_14),
    .I1(b_1_IBUF_30),
    .O(Madd_n0058_lut[1])
  );
  MUXCY   \Madd_n0058_cy<1>  (
    .CI(Madd_n0058_cy[0]),
    .DI(a_1_IBUF_14),
    .S(Madd_n0058_lut[1]),
    .O(Madd_n0058_cy[1])
  );
  XORCY   \Madd_n0058_xor<1>  (
    .CI(Madd_n0058_cy[0]),
    .LI(Madd_n0058_lut[1]),
    .O(n0058[1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<2>  (
    .I0(a_2_IBUF_13),
    .I1(b_2_IBUF_29),
    .O(Madd_n0058_lut[2])
  );
  MUXCY   \Madd_n0058_cy<2>  (
    .CI(Madd_n0058_cy[1]),
    .DI(a_2_IBUF_13),
    .S(Madd_n0058_lut[2]),
    .O(Madd_n0058_cy[2])
  );
  XORCY   \Madd_n0058_xor<2>  (
    .CI(Madd_n0058_cy[1]),
    .LI(Madd_n0058_lut[2]),
    .O(n0058[2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<3>  (
    .I0(a_3_IBUF_12),
    .I1(b_3_IBUF_28),
    .O(Madd_n0058_lut[3])
  );
  MUXCY   \Madd_n0058_cy<3>  (
    .CI(Madd_n0058_cy[2]),
    .DI(a_3_IBUF_12),
    .S(Madd_n0058_lut[3]),
    .O(Madd_n0058_cy[3])
  );
  XORCY   \Madd_n0058_xor<3>  (
    .CI(Madd_n0058_cy[2]),
    .LI(Madd_n0058_lut[3]),
    .O(n0058[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<4>  (
    .I0(a_4_IBUF_11),
    .I1(b_4_IBUF_27),
    .O(Madd_n0058_lut[4])
  );
  MUXCY   \Madd_n0058_cy<4>  (
    .CI(Madd_n0058_cy[3]),
    .DI(a_4_IBUF_11),
    .S(Madd_n0058_lut[4]),
    .O(Madd_n0058_cy[4])
  );
  XORCY   \Madd_n0058_xor<4>  (
    .CI(Madd_n0058_cy[3]),
    .LI(Madd_n0058_lut[4]),
    .O(n0058[4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<5>  (
    .I0(a_5_IBUF_10),
    .I1(b_5_IBUF_26),
    .O(Madd_n0058_lut[5])
  );
  MUXCY   \Madd_n0058_cy<5>  (
    .CI(Madd_n0058_cy[4]),
    .DI(a_5_IBUF_10),
    .S(Madd_n0058_lut[5]),
    .O(Madd_n0058_cy[5])
  );
  XORCY   \Madd_n0058_xor<5>  (
    .CI(Madd_n0058_cy[4]),
    .LI(Madd_n0058_lut[5]),
    .O(n0058[5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<6>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .O(Madd_n0058_lut[6])
  );
  MUXCY   \Madd_n0058_cy<6>  (
    .CI(Madd_n0058_cy[5]),
    .DI(a_6_IBUF_9),
    .S(Madd_n0058_lut[6]),
    .O(Madd_n0058_cy[6])
  );
  XORCY   \Madd_n0058_xor<6>  (
    .CI(Madd_n0058_cy[5]),
    .LI(Madd_n0058_lut[6]),
    .O(n0058[6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<7>  (
    .I0(a_7_IBUF_8),
    .I1(b_7_IBUF_24),
    .O(Madd_n0058_lut[7])
  );
  MUXCY   \Madd_n0058_cy<7>  (
    .CI(Madd_n0058_cy[6]),
    .DI(a_7_IBUF_8),
    .S(Madd_n0058_lut[7]),
    .O(Madd_n0058_cy[7])
  );
  XORCY   \Madd_n0058_xor<7>  (
    .CI(Madd_n0058_cy[6]),
    .LI(Madd_n0058_lut[7]),
    .O(n0058[7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<8>  (
    .I0(a_8_IBUF_7),
    .I1(b_8_IBUF_23),
    .O(Madd_n0058_lut[8])
  );
  MUXCY   \Madd_n0058_cy<8>  (
    .CI(Madd_n0058_cy[7]),
    .DI(a_8_IBUF_7),
    .S(Madd_n0058_lut[8]),
    .O(Madd_n0058_cy[8])
  );
  XORCY   \Madd_n0058_xor<8>  (
    .CI(Madd_n0058_cy[7]),
    .LI(Madd_n0058_lut[8]),
    .O(n0058[8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<9>  (
    .I0(a_9_IBUF_6),
    .I1(b_9_IBUF_22),
    .O(Madd_n0058_lut[9])
  );
  MUXCY   \Madd_n0058_cy<9>  (
    .CI(Madd_n0058_cy[8]),
    .DI(a_9_IBUF_6),
    .S(Madd_n0058_lut[9]),
    .O(Madd_n0058_cy[9])
  );
  XORCY   \Madd_n0058_xor<9>  (
    .CI(Madd_n0058_cy[8]),
    .LI(Madd_n0058_lut[9]),
    .O(n0058[9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<10>  (
    .I0(a_10_IBUF_5),
    .I1(b_10_IBUF_21),
    .O(Madd_n0058_lut[10])
  );
  MUXCY   \Madd_n0058_cy<10>  (
    .CI(Madd_n0058_cy[9]),
    .DI(a_10_IBUF_5),
    .S(Madd_n0058_lut[10]),
    .O(Madd_n0058_cy[10])
  );
  XORCY   \Madd_n0058_xor<10>  (
    .CI(Madd_n0058_cy[9]),
    .LI(Madd_n0058_lut[10]),
    .O(n0058[10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<11>  (
    .I0(a_11_IBUF_4),
    .I1(b_11_IBUF_20),
    .O(Madd_n0058_lut[11])
  );
  MUXCY   \Madd_n0058_cy<11>  (
    .CI(Madd_n0058_cy[10]),
    .DI(a_11_IBUF_4),
    .S(Madd_n0058_lut[11]),
    .O(Madd_n0058_cy[11])
  );
  XORCY   \Madd_n0058_xor<11>  (
    .CI(Madd_n0058_cy[10]),
    .LI(Madd_n0058_lut[11]),
    .O(n0058[11])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<12>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .O(Madd_n0058_lut[12])
  );
  MUXCY   \Madd_n0058_cy<12>  (
    .CI(Madd_n0058_cy[11]),
    .DI(a_12_IBUF_3),
    .S(Madd_n0058_lut[12]),
    .O(Madd_n0058_cy[12])
  );
  XORCY   \Madd_n0058_xor<12>  (
    .CI(Madd_n0058_cy[11]),
    .LI(Madd_n0058_lut[12]),
    .O(n0058[12])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<13>  (
    .I0(a_13_IBUF_2),
    .I1(b_13_IBUF_18),
    .O(Madd_n0058_lut[13])
  );
  MUXCY   \Madd_n0058_cy<13>  (
    .CI(Madd_n0058_cy[12]),
    .DI(a_13_IBUF_2),
    .S(Madd_n0058_lut[13]),
    .O(Madd_n0058_cy[13])
  );
  XORCY   \Madd_n0058_xor<13>  (
    .CI(Madd_n0058_cy[12]),
    .LI(Madd_n0058_lut[13]),
    .O(n0058[13])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<14>  (
    .I0(a_14_IBUF_1),
    .I1(b_14_IBUF_17),
    .O(Madd_n0058_lut[14])
  );
  MUXCY   \Madd_n0058_cy<14>  (
    .CI(Madd_n0058_cy[13]),
    .DI(a_14_IBUF_1),
    .S(Madd_n0058_lut[14]),
    .O(Madd_n0058_cy[14])
  );
  XORCY   \Madd_n0058_xor<14>  (
    .CI(Madd_n0058_cy[13]),
    .LI(Madd_n0058_lut[14]),
    .O(n0058[14])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0058_lut<15>  (
    .I0(a_15_IBUF_0),
    .I1(b_15_IBUF_16),
    .O(Madd_n0058_lut[15])
  );
  MUXCY   \Madd_n0058_cy<15>  (
    .CI(Madd_n0058_cy[14]),
    .DI(a_15_IBUF_0),
    .S(Madd_n0058_lut[15]),
    .O(Madd_n0058_cy[15])
  );
  XORCY   \Madd_n0058_xor<15>  (
    .CI(Madd_n0058_cy[14]),
    .LI(Madd_n0058_lut[15]),
    .O(n0058[15])
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_0_IBUF_15),
    .I3(a_1_IBUF_14),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi_211 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(b_1_IBUF_30),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>_212 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>  (
    .CI(N0),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi_211 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>_212 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>_213 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(a_2_IBUF_13),
    .I3(a_3_IBUF_12),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1_214 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>  (
    .I0(a_2_IBUF_13),
    .I1(b_2_IBUF_29),
    .I2(a_3_IBUF_12),
    .I3(b_3_IBUF_28),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>_215 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>_213 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1_214 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>_215 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>_216 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2  (
    .I0(b_5_IBUF_26),
    .I1(b_4_IBUF_27),
    .I2(a_4_IBUF_11),
    .I3(a_5_IBUF_10),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2_217 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>  (
    .I0(a_4_IBUF_11),
    .I1(b_4_IBUF_27),
    .I2(a_5_IBUF_10),
    .I3(b_5_IBUF_26),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>_218 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>_216 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2_217 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>_218 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>_219 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3  (
    .I0(b_7_IBUF_24),
    .I1(b_6_IBUF_25),
    .I2(a_6_IBUF_9),
    .I3(a_7_IBUF_8),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3_220 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .I2(a_7_IBUF_8),
    .I3(b_7_IBUF_24),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>_221 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>_219 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3_220 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>_221 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>_222 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4  (
    .I0(b_9_IBUF_22),
    .I1(b_8_IBUF_23),
    .I2(a_8_IBUF_7),
    .I3(a_9_IBUF_6),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4_223 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>  (
    .I0(a_8_IBUF_7),
    .I1(b_8_IBUF_23),
    .I2(a_9_IBUF_6),
    .I3(b_9_IBUF_22),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>_224 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>_222 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4_223 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>_224 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>_225 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5  (
    .I0(b_11_IBUF_20),
    .I1(b_10_IBUF_21),
    .I2(a_10_IBUF_5),
    .I3(a_11_IBUF_4),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5_226 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>  (
    .I0(a_10_IBUF_5),
    .I1(b_10_IBUF_21),
    .I2(a_11_IBUF_4),
    .I3(b_11_IBUF_20),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>_227 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>_225 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5_226 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>_227 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>_228 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6  (
    .I0(b_13_IBUF_18),
    .I1(b_12_IBUF_19),
    .I2(a_12_IBUF_3),
    .I3(a_13_IBUF_2),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6_229 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .I2(a_13_IBUF_2),
    .I3(b_13_IBUF_18),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>_230 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>_228 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6_229 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>_230 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>_231 )
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
  Sh1011 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(a_9_IBUF_6),
    .I2(a_10_IBUF_5),
    .O(Sh101_233)
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
    .INIT ( 16'h0004 ))
  \result<0>31  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_3_IBUF_31),
    .I2(opcode_0_IBUF_34),
    .I3(opcode_1_IBUF_33),
    .O(\result<0>3_236 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  Sh3111 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(a_0_IBUF_15),
    .I2(a_1_IBUF_14),
    .O(Sh311)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  Sh4211 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(a_11_IBUF_4),
    .I2(a_12_IBUF_3),
    .O(Sh421_243)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  Sh4411 (
    .I0(b_1_IBUF_30),
    .I1(a_13_IBUF_2),
    .I2(a_15_IBUF_0),
    .O(Sh441_244)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \flags<2>11  (
    .I0(opcode_0_IBUF_34),
    .I1(opcode_3_IBUF_31),
    .I2(opcode_1_IBUF_33),
    .O(\flags<2>1 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \flags<4>1  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[16]),
    .I1(opcode_2_IBUF_32),
    .I2(\flags<2>1 ),
    .I3(\result<0>2_235 ),
    .I4(Madd_n0058_cy[15]),
    .O(flags_0_OBUF_89)
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
  LUT3 #(
    .INIT ( 8'h01 ))
  \result<1>2121  (
    .I0(b_3_IBUF_28),
    .I1(b_4_IBUF_27),
    .I2(b_2_IBUF_29),
    .O(\result<1>212 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \result<0>21  (
    .I0(opcode_1_IBUF_33),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_3_IBUF_31),
    .I3(opcode_2_IBUF_32),
    .O(\result<0>2_235 )
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
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh42 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_2_IBUF_13),
    .I3(a_1_IBUF_14),
    .I4(a_3_IBUF_12),
    .I5(a_4_IBUF_11),
    .O(Sh4)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh51 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_3_IBUF_12),
    .I3(a_2_IBUF_13),
    .I4(a_4_IBUF_11),
    .I5(a_5_IBUF_10),
    .O(Sh5)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh61 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_4_IBUF_11),
    .I3(a_3_IBUF_12),
    .I4(a_5_IBUF_10),
    .I5(a_6_IBUF_9),
    .O(Sh6)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh71 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_5_IBUF_10),
    .I3(a_4_IBUF_11),
    .I4(a_6_IBUF_9),
    .I5(a_7_IBUF_8),
    .O(Sh7)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh411 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_11_IBUF_4),
    .I3(a_10_IBUF_5),
    .I4(a_12_IBUF_3),
    .I5(a_9_IBUF_6),
    .O(Sh41)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh81 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_6_IBUF_9),
    .I3(a_5_IBUF_10),
    .I4(a_7_IBUF_8),
    .I5(a_8_IBUF_7),
    .O(Sh8)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh91 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_7_IBUF_8),
    .I3(a_6_IBUF_9),
    .I4(a_8_IBUF_7),
    .I5(a_9_IBUF_6),
    .O(Sh9)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh111 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_9_IBUF_6),
    .I3(a_8_IBUF_7),
    .I4(a_10_IBUF_5),
    .I5(a_11_IBUF_4),
    .O(Sh11)
  );
  LUT5 #(
    .INIT ( 32'h00000040 ))
  \_n0082<0>1  (
    .I0(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>_232 ),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_0_IBUF_34),
    .I3(opcode_3_IBUF_31),
    .I4(opcode_2_IBUF_32),
    .O(flags_4_OBUF_85)
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \_n0082<1>1  (
    .I0(\a[15]_b[15]_equal_5_o ),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_0_IBUF_34),
    .I3(opcode_3_IBUF_31),
    .I4(opcode_2_IBUF_32),
    .O(flags_3_OBUF_86)
  );
  LUT5 #(
    .INIT ( 32'h00000040 ))
  \_n0082<3>1  (
    .I0(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>_144 ),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_0_IBUF_34),
    .I3(opcode_3_IBUF_31),
    .I4(opcode_2_IBUF_32),
    .O(flags_1_OBUF_88)
  );
  LUT5 #(
    .INIT ( 32'hAAAA2000 ))
  \result<10>1  (
    .I0(b_10_IBUF_21),
    .I1(opcode_2_IBUF_32),
    .I2(a_10_IBUF_5),
    .I3(\flags<2>1 ),
    .I4(\result<0>3_236 ),
    .O(\result<10>1_249 )
  );
  LUT6 #(
    .INIT ( 64'h1505140411011000 ))
  \result<10>4  (
    .I0(b_4_IBUF_27),
    .I1(b_2_IBUF_29),
    .I2(b_3_IBUF_28),
    .I3(Sh2),
    .I4(Sh10),
    .I5(Sh6),
    .O(\result<10>4_250 )
  );
  LUT6 #(
    .INIT ( 64'hF8F8F8F8FFF8F8F8 ))
  \result<10>6  (
    .I0(n0058[10]),
    .I1(\result<0>2_235 ),
    .I2(\result<10>1_249 ),
    .I3(\result<10>5_251 ),
    .I4(opcode_2_IBUF_32),
    .I5(opcode_3_IBUF_31),
    .O(result_10_OBUF_74)
  );
  LUT5 #(
    .INIT ( 32'hAAAA2000 ))
  \result<11>1  (
    .I0(b_11_IBUF_20),
    .I1(opcode_2_IBUF_32),
    .I2(a_11_IBUF_4),
    .I3(\flags<2>1 ),
    .I4(\result<0>3_236 ),
    .O(\result<11>1_252 )
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  \result<11>5  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh7),
    .I3(Sh11),
    .I4(Sh3),
    .O(\result<11>5_254 )
  );
  LUT6 #(
    .INIT ( 64'hAEAEFEAE04045404 ))
  \result<11>6  (
    .I0(opcode_1_IBUF_33),
    .I1(\result<11>5_254 ),
    .I2(b_4_IBUF_27),
    .I3(\result<11>4_253 ),
    .I4(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I5(GND_1_o_GND_1_o_sub_14_OUT[11]),
    .O(\result<11>6_255 )
  );
  LUT5 #(
    .INIT ( 32'hAAAA2000 ))
  \result<8>1  (
    .I0(b_8_IBUF_23),
    .I1(opcode_2_IBUF_32),
    .I2(a_8_IBUF_7),
    .I3(\flags<2>1 ),
    .I4(\result<0>3_236 ),
    .O(\result<8>1_256 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \result<8>3  (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .O(\result<12>2 )
  );
  LUT6 #(
    .INIT ( 64'h0010100000001000 ))
  \result<9>1  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(b_9_IBUF_22),
    .I3(opcode_3_IBUF_31),
    .I4(opcode_1_IBUF_33),
    .I5(a_9_IBUF_6),
    .O(\result<9>1_259 )
  );
  LUT4 #(
    .INIT ( 16'h0020 ))
  \result<9>6  (
    .I0(b_2_IBUF_29),
    .I1(b_4_IBUF_27),
    .I2(Sh5),
    .I3(b_3_IBUF_28),
    .O(\result<9>6_261 )
  );
  LUT6 #(
    .INIT ( 64'h8088800800800000 ))
  \result<9>7  (
    .I0(b_3_IBUF_28),
    .I1(b_4_IBUF_27),
    .I2(b_2_IBUF_29),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ),
    .I4(Sh41),
    .I5(Sh45),
    .O(\result<9>7_262 )
  );
  LUT6 #(
    .INIT ( 64'h5555555555551110 ))
  \result<9>10  (
    .I0(opcode_1_IBUF_33),
    .I1(b_2_IBUF_29),
    .I2(\result<9>8_263 ),
    .I3(\result<9>9_264 ),
    .I4(\result<9>6_261 ),
    .I5(\result<9>7_262 ),
    .O(\result<9>10_265 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<12>1  (
    .I0(b_12_IBUF_19),
    .I1(\result<0>3_236 ),
    .I2(a_12_IBUF_3),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[12]),
    .O(\result<12>1_266 )
  );
  LUT6 #(
    .INIT ( 64'h5545544411011000 ))
  \result<12>6  (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(b_1_IBUF_30),
    .I3(Sh101_233),
    .I4(Sh421_243),
    .I5(Sh4),
    .O(\result<12>6_269 )
  );
  LUT6 #(
    .INIT ( 64'h5555111011101110 ))
  \result<12>7  (
    .I0(opcode_1_IBUF_33),
    .I1(b_4_IBUF_27),
    .I2(\result<12>5_268 ),
    .I3(\result<12>6_269 ),
    .I4(\result<1>221 ),
    .I5(Sh44),
    .O(\result<12>7_270 )
  );
  LUT6 #(
    .INIT ( 64'h0010100000001000 ))
  \result<4>1  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(b_4_IBUF_27),
    .I3(opcode_3_IBUF_31),
    .I4(opcode_1_IBUF_33),
    .I5(a_4_IBUF_11),
    .O(\result<4>1_271 )
  );
  LUT5 #(
    .INIT ( 32'h7D282828 ))
  \result<4>4  (
    .I0(opcode_0_IBUF_34),
    .I1(a_4_IBUF_11),
    .I2(b_4_IBUF_27),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[4]),
    .I4(opcode_1_IBUF_33),
    .O(\result<4>4_273 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \result<4>5  (
    .I0(b_4_IBUF_27),
    .I1(opcode_0_IBUF_34),
    .I2(b_3_IBUF_28),
    .O(\result<4>5_274 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFA280A280A280 ))
  \result<4>6  (
    .I0(\result<4>5_274 ),
    .I1(b_2_IBUF_29),
    .I2(Sh),
    .I3(Sh4),
    .I4(a_4_IBUF_11),
    .I5(opcode_0_IBUF_34),
    .O(\result<4>6_275 )
  );
  LUT6 #(
    .INIT ( 64'hA88A088008800880 ))
  \result<4>7  (
    .I0(b_4_IBUF_27),
    .I1(Sh481_239),
    .I2(b_2_IBUF_29),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ),
    .I4(Sh40),
    .I5(b_3_IBUF_28),
    .O(\result<4>7_276 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAA2220 ))
  \result<4>8  (
    .I0(\result<12>2 ),
    .I1(opcode_1_IBUF_33),
    .I2(\result<4>7_276 ),
    .I3(\result<4>6_275 ),
    .I4(\result<4>4_273 ),
    .I5(\result<4>2_272 ),
    .O(result_4_OBUF_80)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<5>1  (
    .I0(b_5_IBUF_26),
    .I1(\result<0>3_236 ),
    .I2(a_5_IBUF_10),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[5]),
    .O(\result<5>1_277 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<14>1  (
    .I0(b_14_IBUF_17),
    .I1(\result<0>3_236 ),
    .I2(a_14_IBUF_1),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[14]),
    .O(\result<14>1_279 )
  );
  LUT4 #(
    .INIT ( 16'h2A88 ))
  \result<14>3  (
    .I0(opcode_0_IBUF_34),
    .I1(b_14_IBUF_17),
    .I2(opcode_1_IBUF_33),
    .I3(a_14_IBUF_1),
    .O(\result<14>3_280 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \result<14>4  (
    .I0(GND_1_o_GND_1_o_sub_14_OUT[14]),
    .I1(opcode_1_IBUF_33),
    .O(\result<14>4_281 )
  );
  LUT4 #(
    .INIT ( 16'hA820 ))
  \result<14>5  (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(Sh10),
    .I3(Sh2),
    .O(\result<14>5_282 )
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  \result<14>6  (
    .I0(b_1_IBUF_30),
    .I1(a_11_IBUF_4),
    .I2(a_13_IBUF_2),
    .O(\result<14>6_283 )
  );
  LUT6 #(
    .INIT ( 64'h5545544411011000 ))
  \result<14>7  (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(\result<14>6_283 ),
    .I4(Sh141),
    .I5(Sh6),
    .O(\result<14>7_284 )
  );
  LUT6 #(
    .INIT ( 64'h5555111011101110 ))
  \result<14>8  (
    .I0(opcode_1_IBUF_33),
    .I1(b_4_IBUF_27),
    .I2(\result<14>5_282 ),
    .I3(\result<14>7_284 ),
    .I4(\result<1>221 ),
    .I5(Sh46),
    .O(\result<14>8_285 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAA2220 ))
  \result<14>9  (
    .I0(\result<12>2 ),
    .I1(opcode_0_IBUF_34),
    .I2(\result<14>8_285 ),
    .I3(\result<14>4_281 ),
    .I4(\result<14>3_280 ),
    .I5(\result<14>1_279 ),
    .O(result_14_OBUF_70)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<6>1  (
    .I0(b_6_IBUF_25),
    .I1(\result<0>3_236 ),
    .I2(a_6_IBUF_9),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[6]),
    .O(\result<6>1_286 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<7>1  (
    .I0(b_7_IBUF_24),
    .I1(\result<0>3_236 ),
    .I2(a_7_IBUF_8),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[7]),
    .O(\result<7>1_288 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<1>1  (
    .I0(b_1_IBUF_30),
    .I1(\result<0>3_236 ),
    .I2(a_1_IBUF_14),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[1]),
    .O(\result<1>1_290 )
  );
  LUT5 #(
    .INIT ( 32'h7D282828 ))
  \result<1>3  (
    .I0(opcode_0_IBUF_34),
    .I1(a_1_IBUF_14),
    .I2(b_1_IBUF_30),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[1]),
    .I4(opcode_1_IBUF_33),
    .O(\result<1>3_291 )
  );
  LUT5 #(
    .INIT ( 32'hB391A280 ))
  \result<1>4  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_2_IBUF_13),
    .I3(a_3_IBUF_12),
    .I4(a_1_IBUF_14),
    .O(\result<1>4_292 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \result<1>5  (
    .I0(a_1_IBUF_14),
    .I1(opcode_0_IBUF_34),
    .I2(\result<1>221 ),
    .I3(\result<1>4_292 ),
    .O(\result<1>5_293 )
  );
  LUT6 #(
    .INIT ( 64'h5555555544400400 ))
  \result<1>8  (
    .I0(opcode_0_IBUF_34),
    .I1(b_4_IBUF_27),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(\result<1>7_295 ),
    .I4(Sh491_240),
    .I5(\result<1>6_294 ),
    .O(\result<1>8_296 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAA2220 ))
  \result<1>9  (
    .I0(\result<12>2 ),
    .I1(opcode_1_IBUF_33),
    .I2(\result<1>8_296 ),
    .I3(\result<1>5_293 ),
    .I4(\result<1>3_291 ),
    .I5(\result<1>1_290 ),
    .O(result_1_OBUF_83)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<0>1  (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(\result<0>3_236 ),
    .I2(a_0_IBUF_15),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[0]),
    .O(\result<0>1_297 )
  );
  LUT5 #(
    .INIT ( 32'h7D282828 ))
  \result<0>2  (
    .I0(opcode_0_IBUF_34),
    .I1(a_0_IBUF_15),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[0]),
    .I4(opcode_1_IBUF_33),
    .O(\result<0>5 )
  );
  LUT5 #(
    .INIT ( 32'hAAAA0020 ))
  \result<0>3  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(\result<1>212 ),
    .I3(b_1_IBUF_30),
    .I4(opcode_0_IBUF_34),
    .O(\result<0>6_299 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF0A8A0080 ))
  \result<0>7  (
    .I0(b_4_IBUF_27),
    .I1(Sh481_239),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(opcode_0_IBUF_34),
    .I4(\result<0>9 ),
    .I5(\result<0>6_299 ),
    .O(\result<0>10 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF20202220 ))
  \result<0>8  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_3_IBUF_31),
    .I2(\result<0>5 ),
    .I3(\result<0>10 ),
    .I4(opcode_1_IBUF_33),
    .I5(\result<0>1_297 ),
    .O(result_0_OBUF_84)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<2>1  (
    .I0(b_2_IBUF_29),
    .I1(\result<0>3_236 ),
    .I2(a_2_IBUF_13),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[2]),
    .O(\result<2>1_302 )
  );
  LUT5 #(
    .INIT ( 32'h7D282828 ))
  \result<2>3  (
    .I0(opcode_0_IBUF_34),
    .I1(a_2_IBUF_13),
    .I2(b_2_IBUF_29),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[2]),
    .I4(opcode_1_IBUF_33),
    .O(\result<2>3_303 )
  );
  LUT5 #(
    .INIT ( 32'hAAAA0020 ))
  \result<2>4  (
    .I0(a_2_IBUF_13),
    .I1(b_1_IBUF_30),
    .I2(\result<1>221 ),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(opcode_0_IBUF_34),
    .O(\result<2>4_304 )
  );
  LUT5 #(
    .INIT ( 32'hEC64A820 ))
  \result<2>6  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_4_IBUF_11),
    .I3(a_3_IBUF_12),
    .I4(a_5_IBUF_10),
    .O(\result<2>6_306 )
  );
  LUT6 #(
    .INIT ( 64'h5555555544400400 ))
  \result<2>8  (
    .I0(opcode_0_IBUF_34),
    .I1(b_4_IBUF_27),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(\result<2>7_307 ),
    .I4(Sh501_241),
    .I5(\result<2>5_305 ),
    .O(\result<2>8_308 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAA2220 ))
  \result<2>9  (
    .I0(\result<12>2 ),
    .I1(opcode_1_IBUF_33),
    .I2(\result<2>8_308 ),
    .I3(\result<2>4_304 ),
    .I4(\result<2>3_303 ),
    .I5(\result<2>1_302 ),
    .O(result_2_OBUF_82)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<3>1  (
    .I0(b_3_IBUF_28),
    .I1(\result<0>3_236 ),
    .I2(a_3_IBUF_12),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[3]),
    .O(\result<3>1_309 )
  );
  LUT5 #(
    .INIT ( 32'h7D282828 ))
  \result<3>3  (
    .I0(opcode_0_IBUF_34),
    .I1(a_3_IBUF_12),
    .I2(b_3_IBUF_28),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[3]),
    .I4(opcode_1_IBUF_33),
    .O(\result<3>3_310 )
  );
  LUT5 #(
    .INIT ( 32'hAAAA0020 ))
  \result<3>4  (
    .I0(a_3_IBUF_12),
    .I1(b_1_IBUF_30),
    .I2(\result<1>221 ),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(opcode_0_IBUF_34),
    .O(\result<3>4_311 )
  );
  LUT5 #(
    .INIT ( 32'hEC64A820 ))
  \result<3>6  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_5_IBUF_10),
    .I3(a_4_IBUF_11),
    .I4(a_6_IBUF_9),
    .O(\result<3>6_313 )
  );
  LUT6 #(
    .INIT ( 64'h5555555544444000 ))
  \result<3>8  (
    .I0(opcode_0_IBUF_34),
    .I1(b_4_IBUF_27),
    .I2(Sh511),
    .I3(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I4(\result<3>7_314 ),
    .I5(\result<3>5_312 ),
    .O(\result<3>8_315 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAA2220 ))
  \result<3>9  (
    .I0(\result<12>2 ),
    .I1(opcode_1_IBUF_33),
    .I2(\result<3>8_315 ),
    .I3(\result<3>4_311 ),
    .I4(\result<3>3_310 ),
    .I5(\result<3>1_309 ),
    .O(result_3_OBUF_81)
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
    .O(N7)
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
    .O(N9)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  \result<13>1  (
    .I0(b_13_IBUF_18),
    .I1(\result<0>3_236 ),
    .I2(a_13_IBUF_2),
    .I3(\result<0>4 ),
    .I4(\result<0>2_235 ),
    .I5(n0058[13]),
    .O(\result<13>1_318 )
  );
  LUT5 #(
    .INIT ( 32'h7D282828 ))
  \result<13>3  (
    .I0(opcode_0_IBUF_34),
    .I1(a_13_IBUF_2),
    .I2(b_13_IBUF_18),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[13]),
    .I4(opcode_1_IBUF_33),
    .O(\result<13>3_319 )
  );
  LUT4 #(
    .INIT ( 16'hEA40 ))
  \result<13>4  (
    .I0(opcode_0_IBUF_34),
    .I1(\result<1>221 ),
    .I2(Sh45),
    .I3(a_13_IBUF_2),
    .O(\result<13>4_320 )
  );
  LUT5 #(
    .INIT ( 32'h00000100 ))
  \result<13>5  (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(a_13_IBUF_2),
    .I4(b_1_IBUF_30),
    .O(\result<13>5_321 )
  );
  LUT5 #(
    .INIT ( 32'h2A220800 ))
  \result<13>6  (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(b_1_IBUF_30),
    .I3(Sh311),
    .I4(Sh9),
    .O(\result<13>6_322 )
  );
  LUT5 #(
    .INIT ( 32'hEC64A820 ))
  \result<13>7  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_11_IBUF_4),
    .I3(a_10_IBUF_5),
    .I4(a_12_IBUF_3),
    .O(\result<13>7_323 )
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  \result<13>8  (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(\result<13>7_323 ),
    .I3(Sh5),
    .O(\result<13>8_324 )
  );
  LUT5 #(
    .INIT ( 32'h55551110 ))
  \result<13>9  (
    .I0(b_4_IBUF_27),
    .I1(opcode_0_IBUF_34),
    .I2(\result<13>6_322 ),
    .I3(\result<13>8_324 ),
    .I4(\result<13>5_321 ),
    .O(\result<13>9_325 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAA2220 ))
  \result<13>10  (
    .I0(\result<12>2 ),
    .I1(opcode_1_IBUF_33),
    .I2(\result<13>9_325 ),
    .I3(\result<13>4_320 ),
    .I4(\result<13>3_319 ),
    .I5(\result<13>1_318 ),
    .O(result_13_OBUF_71)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh501_SW0 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_8_IBUF_7),
    .I3(a_7_IBUF_8),
    .I4(a_9_IBUF_6),
    .I5(a_6_IBUF_9),
    .O(N11)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh5111 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_9_IBUF_6),
    .I3(a_8_IBUF_7),
    .I4(a_10_IBUF_5),
    .I5(a_7_IBUF_8),
    .O(Sh5111_327)
  );
  LUT6 #(
    .INIT ( 64'hA8A8A8A8A8A8ECA8 ))
  \result<15>7  (
    .I0(opcode_0_IBUF_34),
    .I1(a_15_IBUF_0),
    .I2(b_15_IBUF_16),
    .I3(\result<1>221 ),
    .I4(b_1_IBUF_30),
    .I5(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(\result<15>7_328 )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \result<15>8  (
    .I0(b_4_IBUF_27),
    .I1(opcode_0_IBUF_34),
    .O(\result<15>8_329 )
  );
  LUT5 #(
    .INIT ( 32'hEFEA4540 ))
  \result<15>9  (
    .I0(b_3_IBUF_28),
    .I1(Sh141),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(Sh441_244),
    .I4(Sh7),
    .O(\result<15>9_330 )
  );
  LUT6 #(
    .INIT ( 64'hAAA22A2288800800 ))
  \result<15>10  (
    .I0(\result<15>8_329 ),
    .I1(b_2_IBUF_29),
    .I2(b_3_IBUF_28),
    .I3(Sh11),
    .I4(Sh3),
    .I5(\result<15>9_330 ),
    .O(\result<15>10_331 )
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
  IBUF   opcode_3_IBUF (
    .I(opcode[3]),
    .O(opcode_3_IBUF_31)
  );
  IBUF   opcode_2_IBUF (
    .I(opcode[2]),
    .O(opcode_2_IBUF_32)
  );
  IBUF   opcode_1_IBUF (
    .I(opcode[1]),
    .O(opcode_1_IBUF_33)
  );
  IBUF   opcode_0_IBUF (
    .I(opcode[0]),
    .O(opcode_0_IBUF_34)
  );
  OBUF   result_15_OBUF (
    .I(result_15_OBUF_69),
    .O(result[15])
  );
  OBUF   result_14_OBUF (
    .I(result_14_OBUF_70),
    .O(result[14])
  );
  OBUF   result_13_OBUF (
    .I(result_13_OBUF_71),
    .O(result[13])
  );
  OBUF   result_12_OBUF (
    .I(result_12_OBUF_72),
    .O(result[12])
  );
  OBUF   result_11_OBUF (
    .I(result_11_OBUF_73),
    .O(result[11])
  );
  OBUF   result_10_OBUF (
    .I(result_10_OBUF_74),
    .O(result[10])
  );
  OBUF   result_9_OBUF (
    .I(result_9_OBUF_75),
    .O(result[9])
  );
  OBUF   result_8_OBUF (
    .I(result_8_OBUF_76),
    .O(result[8])
  );
  OBUF   result_7_OBUF (
    .I(result_7_OBUF_77),
    .O(result[7])
  );
  OBUF   result_6_OBUF (
    .I(result_6_OBUF_78),
    .O(result[6])
  );
  OBUF   result_5_OBUF (
    .I(result_5_OBUF_79),
    .O(result[5])
  );
  OBUF   result_4_OBUF (
    .I(result_4_OBUF_80),
    .O(result[4])
  );
  OBUF   result_3_OBUF (
    .I(result_3_OBUF_81),
    .O(result[3])
  );
  OBUF   result_2_OBUF (
    .I(result_2_OBUF_82),
    .O(result[2])
  );
  OBUF   result_1_OBUF (
    .I(result_1_OBUF_83),
    .O(result[1])
  );
  OBUF   result_0_OBUF (
    .I(result_0_OBUF_84),
    .O(result[0])
  );
  OBUF   flags_4_OBUF (
    .I(flags_4_OBUF_85),
    .O(flags[4])
  );
  OBUF   flags_3_OBUF (
    .I(flags_3_OBUF_86),
    .O(flags[3])
  );
  OBUF   flags_2_OBUF (
    .I(flags_2_OBUF_87),
    .O(flags[2])
  );
  OBUF   flags_1_OBUF (
    .I(flags_1_OBUF_88),
    .O(flags[1])
  );
  OBUF   flags_0_OBUF (
    .I(flags_0_OBUF_89),
    .O(flags[0])
  );
  LUT5 #(
    .INIT ( 32'hF7733110 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>  (
    .I0(a_14_IBUF_1),
    .I1(a_15_IBUF_0),
    .I2(b_14_IBUF_17),
    .I3(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>_143 ),
    .I4(b_15_IBUF_16),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>_144 )
  );
  LUT5 #(
    .INIT ( 32'hF7733110 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>  (
    .I0(a_14_IBUF_1),
    .I1(b_15_IBUF_16),
    .I2(b_14_IBUF_17),
    .I3(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>_231 ),
    .I4(a_15_IBUF_0),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>_232 )
  );
  LUT6 #(
    .INIT ( 64'h4445545555555555 ))
  \result<10>5_SW0  (
    .I0(\result<10>4_250 ),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(Sh42_107),
    .I4(Sh46),
    .I5(b_4_IBUF_27),
    .O(N15)
  );
  LUT6 #(
    .INIT ( 64'h7DA828A87DFD28FD ))
  \result<10>5  (
    .I0(opcode_0_IBUF_34),
    .I1(a_10_IBUF_5),
    .I2(b_10_IBUF_21),
    .I3(opcode_1_IBUF_33),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[10]),
    .I5(N15),
    .O(\result<10>5_251 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh401 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_1_IBUF_30),
    .I2(a_11_IBUF_4),
    .I3(a_9_IBUF_6),
    .I4(a_10_IBUF_5),
    .I5(a_8_IBUF_7),
    .O(Sh40)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh431 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_13_IBUF_2),
    .I3(a_12_IBUF_3),
    .I4(a_14_IBUF_1),
    .I5(a_11_IBUF_4),
    .O(Sh43)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh421 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_1_IBUF_30),
    .I2(a_13_IBUF_2),
    .I3(a_11_IBUF_4),
    .I4(a_12_IBUF_3),
    .I5(a_10_IBUF_5),
    .O(Sh42_107)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh441 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_14_IBUF_1),
    .I3(a_13_IBUF_2),
    .I4(a_15_IBUF_0),
    .I5(a_12_IBUF_3),
    .O(Sh44)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh31 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_1_IBUF_30),
    .I2(a_2_IBUF_13),
    .I3(a_0_IBUF_15),
    .I4(a_1_IBUF_14),
    .I5(a_3_IBUF_12),
    .O(Sh3)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh101 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_8_IBUF_7),
    .I3(a_7_IBUF_8),
    .I4(a_9_IBUF_6),
    .I5(a_10_IBUF_5),
    .O(Sh10)
  );
  LUT6 #(
    .INIT ( 64'h028032B002800E8C ))
  \flags<2>  (
    .I0(\result<0>2_235 ),
    .I1(a_15_IBUF_0),
    .I2(b_15_IBUF_16),
    .I3(n0058[15]),
    .I4(N5),
    .I5(GND_1_o_GND_1_o_sub_14_OUT[15]),
    .O(flags_2_OBUF_87)
  );
  LUT4 #(
    .INIT ( 16'hFFBF ))
  \flags<2>_SW0  (
    .I0(opcode_0_IBUF_34),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_2_IBUF_32),
    .I3(opcode_3_IBUF_31),
    .O(N5)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00000020 ))
  \result<8>2  (
    .I0(n0058[8]),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_0_IBUF_34),
    .I3(opcode_3_IBUF_31),
    .I4(opcode_2_IBUF_32),
    .I5(\result<8>1_256 ),
    .O(\result<8>2_257 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00000020 ))
  \result<9>2  (
    .I0(n0058[9]),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_0_IBUF_34),
    .I3(opcode_3_IBUF_31),
    .I4(opcode_2_IBUF_32),
    .I5(\result<9>1_259 ),
    .O(\result<9>2_260 )
  );
  LUT6 #(
    .INIT ( 64'h1111115100000040 ))
  \result<9>8  (
    .I0(b_3_IBUF_28),
    .I1(b_4_IBUF_27),
    .I2(Sh41),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I5(Sh9),
    .O(\result<9>8_263 )
  );
  LUT6 #(
    .INIT ( 64'h0202020000020000 ))
  \result<9>9  (
    .I0(b_3_IBUF_28),
    .I1(b_1_IBUF_30),
    .I2(b_4_IBUF_27),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(a_1_IBUF_14),
    .I5(a_0_IBUF_15),
    .O(\result<9>9_264 )
  );
  LUT6 #(
    .INIT ( 64'h222A222200080000 ))
  \result<12>5  (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(a_0_IBUF_15),
    .I5(Sh8),
    .O(\result<12>5_268 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00000020 ))
  \result<4>2  (
    .I0(n0058[4]),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_0_IBUF_34),
    .I3(opcode_3_IBUF_31),
    .I4(opcode_2_IBUF_32),
    .I5(\result<4>1_271 ),
    .O(\result<4>2_272 )
  );
  LUT5 #(
    .INIT ( 32'h22200200 ))
  \result<1>6  (
    .I0(\result<1>212 ),
    .I1(b_1_IBUF_30),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(a_1_IBUF_14),
    .I4(a_0_IBUF_15),
    .O(\result<1>6_294 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \result<2>5  (
    .I0(b_3_IBUF_28),
    .I1(Sh2),
    .I2(b_4_IBUF_27),
    .I3(b_2_IBUF_29),
    .O(\result<2>5_305 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \result<3>5  (
    .I0(b_3_IBUF_28),
    .I1(Sh3),
    .I2(b_4_IBUF_27),
    .I3(b_2_IBUF_29),
    .O(\result<3>5_312 )
  );
  LUT4 #(
    .INIT ( 16'h7D28 ))
  \result<15>11  (
    .I0(opcode_0_IBUF_34),
    .I1(a_15_IBUF_0),
    .I2(b_15_IBUF_16),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[15]),
    .O(\result<15>11_332 )
  );
  LUT5 #(
    .INIT ( 32'h28FD28A8 ))
  \result<11>7_SW0  (
    .I0(opcode_2_IBUF_32),
    .I1(a_11_IBUF_4),
    .I2(b_11_IBUF_20),
    .I3(opcode_1_IBUF_33),
    .I4(n0058[11]),
    .O(N17)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF51404040 ))
  \result<11>7  (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_0_IBUF_34),
    .I2(N17),
    .I3(\result<11>6_255 ),
    .I4(opcode_2_IBUF_32),
    .I5(\result<11>1_252 ),
    .O(result_11_OBUF_73)
  );
  LUT5 #(
    .INIT ( 32'h888E8884 ))
  \result<11>4  (
    .I0(b_2_IBUF_29),
    .I1(Sh43),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(a_15_IBUF_0),
    .O(\result<11>4_253 )
  );
  LUT3 #(
    .INIT ( 8'h56 ))
  \Madd_b[3]_GND_1_o_add_8_OUT_xor<2>11  (
    .I0(b_2_IBUF_29),
    .I1(b_1_IBUF_30),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(\b[3]_GND_1_o_add_8_OUT<2>1 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \result<0>41  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_0_IBUF_34),
    .I3(opcode_3_IBUF_31),
    .O(\result<0>4 )
  );
  LUT5 #(
    .INIT ( 32'h80808002 ))
  \result<1>2211  (
    .I0(b_4_IBUF_27),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(\result<1>221 )
  );
  LUT6 #(
    .INIT ( 64'hDDDDDDDE88888884 ))
  \result<2>7  (
    .I0(b_3_IBUF_28),
    .I1(\result<2>6_306 ),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I5(Sh42_107),
    .O(\result<2>7_307 )
  );
  LUT6 #(
    .INIT ( 64'h7777777B22222221 ))
  Sh481 (
    .I0(b_3_IBUF_28),
    .I1(N7),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(b_2_IBUF_29),
    .I5(Sh44),
    .O(Sh481_239)
  );
  LUT6 #(
    .INIT ( 64'h7777777B22222221 ))
  Sh491 (
    .I0(b_3_IBUF_28),
    .I1(N9),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(b_2_IBUF_29),
    .I5(Sh45),
    .O(Sh491_240)
  );
  LUT6 #(
    .INIT ( 64'hDDDDDDDE88888884 ))
  Sh501 (
    .I0(b_3_IBUF_28),
    .I1(N11),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I5(Sh46),
    .O(Sh501_241)
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
  LUT6 #(
    .INIT ( 64'hE1E101E0E0010000 ))
  \result<3>7  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(b_2_IBUF_29),
    .I3(b_3_IBUF_28),
    .I4(\result<3>6_313 ),
    .I5(Sh43),
    .O(\result<3>7_314 )
  );
  LUT6 #(
    .INIT ( 64'h22EE222822222228 ))
  \result<1>7  (
    .I0(Sh41),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I5(a_4_IBUF_11),
    .O(\result<1>7_295 )
  );
  LUT6 #(
    .INIT ( 64'h888888DE88888884 ))
  Sh5112 (
    .I0(b_3_IBUF_28),
    .I1(Sh5111_327),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I5(a_15_IBUF_0),
    .O(Sh511)
  );
  MUXF7   \result<5>7  (
    .I0(N19),
    .I1(N20),
    .S(b_4_IBUF_27),
    .O(\result<5>7_278 )
  );
  LUT6 #(
    .INIT ( 64'h0111010100100000 ))
  \result<5>7_F  (
    .I0(opcode_1_IBUF_33),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(Sh311),
    .I5(Sh5),
    .O(N19)
  );
  LUT6 #(
    .INIT ( 64'h1055551010000010 ))
  \result<5>7_G  (
    .I0(opcode_1_IBUF_33),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(Sh41),
    .I3(b_2_IBUF_29),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ),
    .I5(Sh491_240),
    .O(N20)
  );
  MUXF7   \result<6>7  (
    .I0(N21),
    .I1(N22),
    .S(b_4_IBUF_27),
    .O(\result<6>7_287 )
  );
  LUT5 #(
    .INIT ( 32'h11100100 ))
  \result<6>7_F  (
    .I0(opcode_1_IBUF_33),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(Sh6),
    .I4(Sh2),
    .O(N21)
  );
  LUT6 #(
    .INIT ( 64'h1055551010000010 ))
  \result<6>7_G  (
    .I0(opcode_1_IBUF_33),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(Sh42_107),
    .I3(b_2_IBUF_29),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ),
    .I5(Sh501_241),
    .O(N22)
  );
  MUXF7   \result<7>7  (
    .I0(N23),
    .I1(N24),
    .S(b_4_IBUF_27),
    .O(\result<7>7_289 )
  );
  LUT5 #(
    .INIT ( 32'h11100100 ))
  \result<7>7_F  (
    .I0(opcode_1_IBUF_33),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(Sh7),
    .I4(Sh3),
    .O(N23)
  );
  LUT6 #(
    .INIT ( 64'h1055551010000010 ))
  \result<7>7_G  (
    .I0(opcode_1_IBUF_33),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(Sh43),
    .I3(b_2_IBUF_29),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ),
    .I5(Sh511),
    .O(N24)
  );
  MUXF7   \result<8>8  (
    .I0(N25),
    .I1(N26),
    .S(b_4_IBUF_27),
    .O(\result<8>8_258 )
  );
  LUT6 #(
    .INIT ( 64'h1505140411011000 ))
  \result<8>8_F  (
    .I0(opcode_1_IBUF_33),
    .I1(b_2_IBUF_29),
    .I2(b_3_IBUF_28),
    .I3(Sh),
    .I4(Sh8),
    .I5(Sh4),
    .O(N25)
  );
  LUT6 #(
    .INIT ( 64'h1111011010010000 ))
  \result<8>8_G  (
    .I0(opcode_1_IBUF_33),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(b_2_IBUF_29),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_cy<1> ),
    .I4(Sh44),
    .I5(Sh40),
    .O(N26)
  );
  MUXF7   \result<8>9  (
    .I0(N27),
    .I1(N28),
    .S(opcode_0_IBUF_34),
    .O(result_8_OBUF_76)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF44444000 ))
  \result<8>9_F  (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .I2(GND_1_o_GND_1_o_sub_14_OUT[8]),
    .I3(opcode_1_IBUF_33),
    .I4(\result<8>8_258 ),
    .I5(\result<8>2_257 ),
    .O(N27)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF02202220 ))
  \result<8>9_G  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_3_IBUF_31),
    .I2(a_8_IBUF_7),
    .I3(b_8_IBUF_23),
    .I4(opcode_1_IBUF_33),
    .I5(\result<8>2_257 ),
    .O(N28)
  );
  MUXF7   \result<9>11  (
    .I0(N29),
    .I1(N30),
    .S(opcode_0_IBUF_34),
    .O(result_9_OBUF_75)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF44444000 ))
  \result<9>11_F  (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .I2(GND_1_o_GND_1_o_sub_14_OUT[9]),
    .I3(opcode_1_IBUF_33),
    .I4(\result<9>10_265 ),
    .I5(\result<9>2_260 ),
    .O(N29)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF02202220 ))
  \result<9>11_G  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_3_IBUF_31),
    .I2(a_9_IBUF_6),
    .I3(b_9_IBUF_22),
    .I4(opcode_1_IBUF_33),
    .I5(\result<9>2_260 ),
    .O(N30)
  );
  MUXF7   \result<12>8  (
    .I0(N31),
    .I1(N32),
    .S(opcode_0_IBUF_34),
    .O(result_12_OBUF_72)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF44444000 ))
  \result<12>8_F  (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .I2(GND_1_o_GND_1_o_sub_14_OUT[12]),
    .I3(opcode_1_IBUF_33),
    .I4(\result<12>7_270 ),
    .I5(\result<12>1_266 ),
    .O(N31)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF02202220 ))
  \result<12>8_G  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_3_IBUF_31),
    .I2(a_12_IBUF_3),
    .I3(b_12_IBUF_19),
    .I4(opcode_1_IBUF_33),
    .I5(\result<12>1_266 ),
    .O(N32)
  );
  MUXF7   \result<5>8  (
    .I0(N33),
    .I1(N34),
    .S(opcode_0_IBUF_34),
    .O(result_5_OBUF_79)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF44444000 ))
  \result<5>8_F  (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .I2(GND_1_o_GND_1_o_sub_14_OUT[5]),
    .I3(opcode_1_IBUF_33),
    .I4(\result<5>7_278 ),
    .I5(\result<5>1_277 ),
    .O(N33)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF02202220 ))
  \result<5>8_G  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_3_IBUF_31),
    .I2(a_5_IBUF_10),
    .I3(b_5_IBUF_26),
    .I4(opcode_1_IBUF_33),
    .I5(\result<5>1_277 ),
    .O(N34)
  );
  MUXF7   \result<0>6  (
    .I0(N35),
    .I1(N36),
    .S(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(\result<0>9 )
  );
  LUT6 #(
    .INIT ( 64'h1010FEBA10105410 ))
  \result<0>6_F  (
    .I0(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I1(b_1_IBUF_30),
    .I2(a_0_IBUF_15),
    .I3(a_2_IBUF_13),
    .I4(opcode_0_IBUF_34),
    .I5(Sh40),
    .O(N35)
  );
  LUT6 #(
    .INIT ( 64'h51405140FBEA5140 ))
  \result<0>6_G  (
    .I0(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I1(b_1_IBUF_30),
    .I2(a_1_IBUF_14),
    .I3(a_3_IBUF_12),
    .I4(Sh40),
    .I5(opcode_0_IBUF_34),
    .O(N36)
  );
  MUXF7   \result<6>8  (
    .I0(N37),
    .I1(N38),
    .S(opcode_0_IBUF_34),
    .O(result_6_OBUF_78)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF44444000 ))
  \result<6>8_F  (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .I2(GND_1_o_GND_1_o_sub_14_OUT[6]),
    .I3(opcode_1_IBUF_33),
    .I4(\result<6>7_287 ),
    .I5(\result<6>1_286 ),
    .O(N37)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF02202220 ))
  \result<6>8_G  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_3_IBUF_31),
    .I2(a_6_IBUF_9),
    .I3(b_6_IBUF_25),
    .I4(opcode_1_IBUF_33),
    .I5(\result<6>1_286 ),
    .O(N38)
  );
  MUXF7   \result<7>8  (
    .I0(N39),
    .I1(N40),
    .S(opcode_0_IBUF_34),
    .O(result_7_OBUF_77)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF44444000 ))
  \result<7>8_F  (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .I2(GND_1_o_GND_1_o_sub_14_OUT[7]),
    .I3(opcode_1_IBUF_33),
    .I4(\result<7>7_289 ),
    .I5(\result<7>1_288 ),
    .O(N39)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF02202220 ))
  \result<7>8_G  (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_3_IBUF_31),
    .I2(a_7_IBUF_8),
    .I3(b_7_IBUF_24),
    .I4(opcode_1_IBUF_33),
    .I5(\result<7>1_288 ),
    .O(N40)
  );
  MUXF7   \result<15>12  (
    .I0(N41),
    .I1(N42),
    .S(opcode_2_IBUF_32),
    .O(result_15_OBUF_69)
  );
  LUT6 #(
    .INIT ( 64'h022C002C02200020 ))
  \result<15>12_F  (
    .I0(b_15_IBUF_16),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_3_IBUF_31),
    .I3(opcode_1_IBUF_33),
    .I4(a_15_IBUF_0),
    .I5(n0058[15]),
    .O(N41)
  );
  LUT5 #(
    .INIT ( 32'h55541110 ))
  \result<15>12_G  (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_1_IBUF_33),
    .I2(\result<15>7_328 ),
    .I3(\result<15>10_331 ),
    .I4(\result<15>11_332 ),
    .O(N42)
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

