////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.68d
//  \   \         Application: netgen
//  /   /         Filename: alu_synthesis.v
// /___/   /\     Timestamp: Mon Sep 23 01:26:30 2013
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
  wire Sh42_108;
  wire Sh43;
  wire Sh44;
  wire Sh45;
  wire Sh46;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<0>_113 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<0>_114 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<1>_115 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<1>_116 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<2>_117 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<2>_118 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<3>_119 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<3>_120 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<4>_121 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_cy<4>_122 ;
  wire \Mcompar_a[15]_b[15]_equal_5_o_lut<5>_123 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi_124 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>_125 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>_126 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1_127 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>_128 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>_129 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2_130 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>_131 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>_132 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3_133 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>_134 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>_135 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4_136 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>_137 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>_138 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5_139 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>_140 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>_141 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6_142 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>_143 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>_144 ;
  wire \Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>_145 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi_210 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>_211 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>_212 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1_213 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>_214 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>_215 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2_216 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>_217 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>_218 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3_219 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>_220 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>_221 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4_222 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>_223 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>_224 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5_225 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>_226 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>_227 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6_228 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>_229 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>_230 ;
  wire \Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>_231 ;
  wire \Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ;
  wire Sh101_233;
  wire Sh141;
  wire Mmux__n007317;
  wire Mmux__n007318;
  wire Mmux__n007319;
  wire Mmux__n0073110;
  wire Mmux__n0073111;
  wire Sh312;
  wire Sh481_241;
  wire Sh491_242;
  wire Sh501_243;
  wire Sh511;
  wire Sh421_245;
  wire Sh441_246;
  wire Mmux_result4131;
  wire Mmux_result14_248;
  wire Mmux_result141_249;
  wire Mmux_result142_250;
  wire Mmux_result143_251;
  wire Mmux_result73;
  wire Mmux_result74_253;
  wire Mmux_result75_254;
  wire Mmux_result42;
  wire Mmux_result43_256;
  wire Mmux_result44_257;
  wire Mmux_result45_258;
  wire Mmux_result6;
  wire Mmux_result61_260;
  wire Mmux_result62_261;
  wire Mmux_result63_262;
  wire Mmux_result64_263;
  wire N5;
  wire N7;
  wire N9;
  wire Sh5111_267;
  wire Mmux_result11_268;
  wire Mmux_result111_269;
  wire Mmux_result112_270;
  wire Mmux_result113_271;
  wire Mmux_result114_272;
  wire Mmux_result115_273;
  wire Mmux_result116_274;
  wire Mmux_result5;
  wire Mmux_result51_276;
  wire Mmux_result52_277;
  wire Mmux_result53_278;
  wire Mmux_result54_279;
  wire Mmux_result8;
  wire Mmux_result81_281;
  wire Mmux_result82_282;
  wire Mmux_result83_283;
  wire Mmux_result84_284;
  wire Mmux_result1;
  wire Mmux_result12;
  wire Mmux_result13;
  wire Mmux_result15;
  wire Mmux_result16;
  wire Mmux_result9;
  wire Mmux_result91_291;
  wire Mmux_result92_292;
  wire Mmux_result93_293;
  wire Mmux_result94_294;
  wire Mmux_result10;
  wire Mmux_result101_296;
  wire Mmux_result102_297;
  wire Mmux_result103_298;
  wire Mmux_result104_299;
  wire Mmux_result161_300;
  wire Mmux_result162_301;
  wire Mmux_result163_302;
  wire Mmux_result164_303;
  wire Mmux_result151_304;
  wire Mmux_result152_305;
  wire Mmux_result153_306;
  wire Mmux_result154_307;
  wire Mmux_result3;
  wire Mmux_result31_309;
  wire Mmux_result32_310;
  wire Mmux_result33_311;
  wire Mmux_result34_312;
  wire Mmux_result2;
  wire Mmux_result21_314;
  wire Mmux_result22_315;
  wire Mmux_result23_316;
  wire Mmux_result121_317;
  wire Mmux_result122_318;
  wire Mmux_result123_319;
  wire Mmux_result124_320;
  wire Mmux_result131_321;
  wire Mmux_result132_322;
  wire Mmux_result133_323;
  wire Mmux_result134_324;
  wire N11;
  wire N12;
  wire N13;
  wire N14;
  wire N15;
  wire N16;
  wire [16 : 0] GND_1_o_GND_1_o_sub_14_OUT;
  wire [15 : 0] n0057;
  wire [15 : 0] Madd_n0057_lut;
  wire [15 : 0] Madd_n0057_cy;
  wire [15 : 0] Msub_GND_1_o_GND_1_o_sub_14_OUT_lut;
  wire [15 : 0] Msub_GND_1_o_GND_1_o_sub_14_OUT_cy;
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<0>_113 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<0>  (
    .CI(N0),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<0>_113 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<0>_114 )
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<1>_115 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<1>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<0>_114 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<1>_115 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<1>_116 )
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<2>_117 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<2>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<1>_116 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<2>_117 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<2>_118 )
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<3>_119 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<3>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<2>_118 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<3>_119 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<3>_120 )
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
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<4>_121 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<4>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<3>_120 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<4>_121 ),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_cy<4>_122 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Mcompar_a[15]_b[15]_equal_5_o_lut<5>  (
    .I0(a_15_IBUF_0),
    .I1(b_15_IBUF_16),
    .O(\Mcompar_a[15]_b[15]_equal_5_o_lut<5>_123 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_equal_5_o_cy<5>  (
    .CI(\Mcompar_a[15]_b[15]_equal_5_o_cy<4>_122 ),
    .DI(N1),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<5>_123 ),
    .O(\a[15]_b[15]_equal_5_o )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_0_IBUF_15),
    .I3(a_1_IBUF_14),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi_124 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(b_1_IBUF_30),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>_125 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>  (
    .CI(N0),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi_124 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<0>_125 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>_126 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(a_2_IBUF_13),
    .I3(a_3_IBUF_12),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1_127 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>  (
    .I0(a_2_IBUF_13),
    .I1(b_2_IBUF_29),
    .I2(a_3_IBUF_12),
    .I3(b_3_IBUF_28),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>_128 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<0>_126 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi1_127 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<1>_128 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>_129 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2  (
    .I0(b_5_IBUF_26),
    .I1(b_4_IBUF_27),
    .I2(a_4_IBUF_11),
    .I3(a_5_IBUF_10),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2_130 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>  (
    .I0(a_4_IBUF_11),
    .I1(b_4_IBUF_27),
    .I2(a_5_IBUF_10),
    .I3(b_5_IBUF_26),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>_131 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<1>_129 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi2_130 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<2>_131 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>_132 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3  (
    .I0(b_7_IBUF_24),
    .I1(b_6_IBUF_25),
    .I2(a_6_IBUF_9),
    .I3(a_7_IBUF_8),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3_133 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .I2(a_7_IBUF_8),
    .I3(b_7_IBUF_24),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>_134 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<2>_132 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi3_133 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<3>_134 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>_135 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4  (
    .I0(b_9_IBUF_22),
    .I1(b_8_IBUF_23),
    .I2(a_8_IBUF_7),
    .I3(a_9_IBUF_6),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4_136 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>  (
    .I0(a_8_IBUF_7),
    .I1(b_8_IBUF_23),
    .I2(a_9_IBUF_6),
    .I3(b_9_IBUF_22),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>_137 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<3>_135 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi4_136 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<4>_137 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>_138 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5  (
    .I0(b_11_IBUF_20),
    .I1(b_10_IBUF_21),
    .I2(a_10_IBUF_5),
    .I3(a_11_IBUF_4),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5_139 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>  (
    .I0(a_10_IBUF_5),
    .I1(b_10_IBUF_21),
    .I2(a_11_IBUF_4),
    .I3(b_11_IBUF_20),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>_140 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<4>_138 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi5_139 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<5>_140 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>_141 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6  (
    .I0(b_13_IBUF_18),
    .I1(b_12_IBUF_19),
    .I2(a_12_IBUF_3),
    .I3(a_13_IBUF_2),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6_142 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .I2(a_13_IBUF_2),
    .I3(b_13_IBUF_18),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>_143 )
  );
  MUXCY   \Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>  (
    .CI(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<5>_141 ),
    .DI(\Mcompar_b[15]_a[15]_LessThan_7_o_lutdi6_142 ),
    .S(\Mcompar_b[15]_a[15]_LessThan_7_o_lut<6>_143 ),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>_144 )
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
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi  (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_0_IBUF_15),
    .I3(a_1_IBUF_14),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi_210 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>  (
    .I0(a_0_IBUF_15),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(b_1_IBUF_30),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>_211 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>  (
    .CI(N0),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi_210 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<0>_211 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>_212 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(a_2_IBUF_13),
    .I3(a_3_IBUF_12),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1_213 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>  (
    .I0(a_2_IBUF_13),
    .I1(b_2_IBUF_29),
    .I2(a_3_IBUF_12),
    .I3(b_3_IBUF_28),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>_214 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<0>_212 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi1_213 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<1>_214 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>_215 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2  (
    .I0(b_5_IBUF_26),
    .I1(b_4_IBUF_27),
    .I2(a_4_IBUF_11),
    .I3(a_5_IBUF_10),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2_216 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>  (
    .I0(a_4_IBUF_11),
    .I1(b_4_IBUF_27),
    .I2(a_5_IBUF_10),
    .I3(b_5_IBUF_26),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>_217 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<1>_215 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi2_216 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<2>_217 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>_218 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3  (
    .I0(b_7_IBUF_24),
    .I1(b_6_IBUF_25),
    .I2(a_6_IBUF_9),
    .I3(a_7_IBUF_8),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3_219 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>  (
    .I0(a_6_IBUF_9),
    .I1(b_6_IBUF_25),
    .I2(a_7_IBUF_8),
    .I3(b_7_IBUF_24),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>_220 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<2>_218 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi3_219 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<3>_220 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>_221 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4  (
    .I0(b_9_IBUF_22),
    .I1(b_8_IBUF_23),
    .I2(a_8_IBUF_7),
    .I3(a_9_IBUF_6),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4_222 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>  (
    .I0(a_8_IBUF_7),
    .I1(b_8_IBUF_23),
    .I2(a_9_IBUF_6),
    .I3(b_9_IBUF_22),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>_223 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<3>_221 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi4_222 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<4>_223 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>_224 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5  (
    .I0(b_11_IBUF_20),
    .I1(b_10_IBUF_21),
    .I2(a_10_IBUF_5),
    .I3(a_11_IBUF_4),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5_225 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>  (
    .I0(a_10_IBUF_5),
    .I1(b_10_IBUF_21),
    .I2(a_11_IBUF_4),
    .I3(b_11_IBUF_20),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>_226 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<4>_224 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi5_225 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<5>_226 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>_227 )
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6  (
    .I0(b_13_IBUF_18),
    .I1(b_12_IBUF_19),
    .I2(a_12_IBUF_3),
    .I3(a_13_IBUF_2),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6_228 )
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>  (
    .I0(a_12_IBUF_3),
    .I1(b_12_IBUF_19),
    .I2(a_13_IBUF_2),
    .I3(b_13_IBUF_18),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>_229 )
  );
  MUXCY   \Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>  (
    .CI(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<5>_227 ),
    .DI(\Mcompar_a[15]_b[15]_LessThan_6_o_lutdi6_228 ),
    .S(\Mcompar_a[15]_b[15]_LessThan_6_o_lut<6>_229 ),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>_230 )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  Sh641 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_0_IBUF_15),
    .O(Sh)
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
  LUT3 #(
    .INIT ( 8'h20 ))
  Mmux__n0073171 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_1_IBUF_33),
    .O(Mmux__n007317)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  Mmux__n0073181 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_0_IBUF_34),
    .O(Mmux__n007318)
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  Mmux__n0073191 (
    .I0(opcode_0_IBUF_34),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_2_IBUF_32),
    .O(Mmux__n007319)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  Mmux__n00731101 (
    .I0(opcode_0_IBUF_34),
    .I1(opcode_1_IBUF_33),
    .I2(opcode_2_IBUF_32),
    .O(Mmux__n0073110)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  Mmux__n00731111 (
    .I0(opcode_0_IBUF_34),
    .I1(opcode_2_IBUF_32),
    .I2(opcode_1_IBUF_33),
    .O(Mmux__n0073111)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  Sh3121 (
    .I0(b_2_IBUF_29),
    .I1(Sh3),
    .I2(Sh7),
    .O(Sh312)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  Sh4211 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(a_11_IBUF_4),
    .I2(a_12_IBUF_3),
    .O(Sh421_245)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  Sh4411 (
    .I0(b_1_IBUF_30),
    .I1(a_13_IBUF_2),
    .I2(a_15_IBUF_0),
    .O(Sh441_246)
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
  LUT6 #(
    .INIT ( 64'h1004100000040000 ))
  Mmux_flags11 (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_1_IBUF_33),
    .I3(opcode_2_IBUF_32),
    .I4(Madd_n0057_cy[15]),
    .I5(GND_1_o_GND_1_o_sub_14_OUT[16]),
    .O(flags_0_OBUF_89)
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
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh31 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_1_IBUF_14),
    .I3(a_0_IBUF_15),
    .I4(a_2_IBUF_13),
    .I5(a_3_IBUF_12),
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
    .INIT ( 32'h01000000 ))
  Mmux_flags51 (
    .I0(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>_231 ),
    .I1(opcode_3_IBUF_31),
    .I2(opcode_2_IBUF_32),
    .I3(opcode_0_IBUF_34),
    .I4(opcode_1_IBUF_33),
    .O(flags_4_OBUF_85)
  );
  LUT5 #(
    .INIT ( 32'h02000000 ))
  Mmux_flags41 (
    .I0(\a[15]_b[15]_equal_5_o ),
    .I1(opcode_3_IBUF_31),
    .I2(opcode_2_IBUF_32),
    .I3(opcode_0_IBUF_34),
    .I4(opcode_1_IBUF_33),
    .O(flags_3_OBUF_86)
  );
  LUT5 #(
    .INIT ( 32'h01000000 ))
  Mmux_flags21 (
    .I0(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>_145 ),
    .I1(opcode_3_IBUF_31),
    .I2(opcode_2_IBUF_32),
    .I3(opcode_0_IBUF_34),
    .I4(opcode_1_IBUF_33),
    .O(flags_1_OBUF_88)
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
    .INIT ( 16'h5556 ))
  \Madd_b[3]_GND_1_o_add_8_OUT_xor<3>11  (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(\b[3]_GND_1_o_add_8_OUT<3>1 )
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  Mmux_result142 (
    .I0(Mmux_result14_248),
    .I1(Mmux__n007318),
    .I2(n0057[7]),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[7]),
    .I4(Mmux__n007317),
    .O(Mmux_result141_249)
  );
  LUT6 #(
    .INIT ( 64'h88A888A8DDFD88A8 ))
  Mmux_result144 (
    .I0(b_4_IBUF_27),
    .I1(Mmux_result142_250),
    .I2(Sh511),
    .I3(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I4(Sh312),
    .I5(b_3_IBUF_28),
    .O(Mmux_result143_251)
  );
  LUT6 #(
    .INIT ( 64'hA8A8A8A8A8A8ECA8 ))
  Mmux_result74 (
    .I0(opcode_0_IBUF_34),
    .I1(a_15_IBUF_0),
    .I2(b_15_IBUF_16),
    .I3(Mmux_result4131),
    .I4(b_1_IBUF_30),
    .I5(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(Mmux_result73)
  );
  LUT6 #(
    .INIT ( 64'h5545544411011000 ))
  Mmux_result75 (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(Sh141),
    .I4(Sh441_246),
    .I5(Sh11),
    .O(Mmux_result74_253)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF11111000 ))
  Mmux_result76 (
    .I0(b_4_IBUF_27),
    .I1(opcode_0_IBUF_34),
    .I2(b_3_IBUF_28),
    .I3(Sh312),
    .I4(Mmux_result74_253),
    .I5(Mmux_result73),
    .O(Mmux_result75_254)
  );
  LUT6 #(
    .INIT ( 64'h5545544411011000 ))
  Mmux_result45 (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(b_1_IBUF_30),
    .I3(Sh101_233),
    .I4(Sh421_245),
    .I5(Sh4),
    .O(Mmux_result44_257)
  );
  LUT6 #(
    .INIT ( 64'hFFFFBBBA55551110 ))
  Mmux_result46 (
    .I0(opcode_1_IBUF_33),
    .I1(b_4_IBUF_27),
    .I2(Mmux_result44_257),
    .I3(Mmux_result43_256),
    .I4(Mmux_result42),
    .I5(GND_1_o_GND_1_o_sub_14_OUT[12]),
    .O(Mmux_result45_258)
  );
  LUT5 #(
    .INIT ( 32'hFFEAEAEA ))
  Mmux_result62 (
    .I0(Mmux_result6),
    .I1(Mmux__n007318),
    .I2(n0057[14]),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[14]),
    .I4(Mmux__n007317),
    .O(Mmux_result61_260)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  Mmux_result63 (
    .I0(b_1_IBUF_30),
    .I1(a_11_IBUF_4),
    .I2(a_13_IBUF_2),
    .O(Mmux_result62_261)
  );
  LUT5 #(
    .INIT ( 32'hEFEA4540 ))
  Mmux_result64 (
    .I0(b_3_IBUF_28),
    .I1(Mmux_result62_261),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(Sh141),
    .I4(Sh6),
    .O(Mmux_result63_262)
  );
  LUT6 #(
    .INIT ( 64'h5551151144400400 ))
  Mmux_result65 (
    .I0(b_4_IBUF_27),
    .I1(b_2_IBUF_29),
    .I2(b_3_IBUF_28),
    .I3(Sh10),
    .I4(Sh2),
    .I5(Mmux_result63_262),
    .O(Mmux_result64_263)
  );
  LUT6 #(
    .INIT ( 64'h5555555544444000 ))
  Mmux_result66 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux__n0073110),
    .I2(Sh46),
    .I3(Mmux_result4131),
    .I4(Mmux_result64_263),
    .I5(Mmux_result61_260),
    .O(result_14_OBUF_70)
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
    .INIT ( 64'hFD75B931EC64A820 ))
  Sh501_SW0 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_8_IBUF_7),
    .I3(a_7_IBUF_8),
    .I4(a_9_IBUF_6),
    .I5(a_6_IBUF_9),
    .O(N9)
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
    .O(Sh5111_267)
  );
  LUT6 #(
    .INIT ( 64'h1404040410000000 ))
  Mmux_result111 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_1_IBUF_33),
    .I3(b_4_IBUF_27),
    .I4(a_4_IBUF_11),
    .I5(n0057[4]),
    .O(Mmux_result11_268)
  );
  LUT5 #(
    .INIT ( 32'h7D282828 ))
  Mmux_result112 (
    .I0(opcode_0_IBUF_34),
    .I1(a_4_IBUF_11),
    .I2(b_4_IBUF_27),
    .I3(GND_1_o_GND_1_o_sub_14_OUT[4]),
    .I4(opcode_1_IBUF_33),
    .O(Mmux_result111_269)
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  Mmux_result113 (
    .I0(b_4_IBUF_27),
    .I1(opcode_0_IBUF_34),
    .I2(b_3_IBUF_28),
    .O(Mmux_result112_270)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA280A280A280 ))
  Mmux_result114 (
    .I0(Mmux_result112_270),
    .I1(b_2_IBUF_29),
    .I2(Sh),
    .I3(Sh4),
    .I4(a_4_IBUF_11),
    .I5(opcode_0_IBUF_34),
    .O(Mmux_result113_271)
  );
  LUT5 #(
    .INIT ( 32'h08080880 ))
  Mmux_result115 (
    .I0(Sh40),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(b_1_IBUF_30),
    .O(Mmux_result114_272)
  );
  LUT3 #(
    .INIT ( 8'hA9 ))
  Mmux_result116 (
    .I0(b_2_IBUF_29),
    .I1(b_1_IBUF_30),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(Mmux_result115_273)
  );
  LUT6 #(
    .INIT ( 64'h5555555544444000 ))
  Mmux_result117 (
    .I0(opcode_1_IBUF_33),
    .I1(b_4_IBUF_27),
    .I2(Mmux_result115_273),
    .I3(Sh481_241),
    .I4(Mmux_result114_272),
    .I5(Mmux_result113_271),
    .O(Mmux_result116_274)
  );
  LUT5 #(
    .INIT ( 32'h55554440 ))
  Mmux_result118 (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .I2(Mmux_result116_274),
    .I3(Mmux_result111_269),
    .I4(Mmux_result11_268),
    .O(result_4_OBUF_80)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Mmux_result51 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_11_IBUF_4),
    .I3(a_10_IBUF_5),
    .I4(a_12_IBUF_3),
    .I5(a_13_IBUF_2),
    .O(Mmux_result5)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Mmux_result52 (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(Sh9),
    .I3(Sh1),
    .I4(Sh5),
    .I5(Mmux_result5),
    .O(Mmux_result51_276)
  );
  LUT5 #(
    .INIT ( 32'hAA080808 ))
  Mmux_result53 (
    .I0(Mmux__n0073110),
    .I1(Mmux_result51_276),
    .I2(b_4_IBUF_27),
    .I3(Sh45),
    .I4(Mmux_result4131),
    .O(Mmux_result52_277)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result54 (
    .I0(a_13_IBUF_2),
    .I1(Mmux__n007319),
    .I2(b_13_IBUF_18),
    .I3(Mmux__n0073111),
    .I4(n0057[13]),
    .I5(Mmux__n007318),
    .O(Mmux_result53_278)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result55 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_13_IBUF_2),
    .I3(b_13_IBUF_18),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[13]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result54_279)
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  Mmux_result56 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux_result54_279),
    .I2(Mmux_result52_277),
    .I3(Mmux_result53_278),
    .O(result_13_OBUF_71)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result81 (
    .I0(a_1_IBUF_14),
    .I1(Mmux__n007319),
    .I2(b_1_IBUF_30),
    .I3(Mmux__n0073111),
    .I4(n0057[1]),
    .I5(Mmux__n007318),
    .O(Mmux_result8)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result82 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_1_IBUF_14),
    .I3(b_1_IBUF_30),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[1]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result81_281)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Mmux_result83 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_3_IBUF_12),
    .I3(a_2_IBUF_13),
    .I4(a_4_IBUF_11),
    .I5(a_1_IBUF_14),
    .O(Mmux_result82_282)
  );
  LUT6 #(
    .INIT ( 64'hAA8AA88822022000 ))
  Mmux_result84 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh41),
    .I4(Mmux_result82_282),
    .I5(Sh491_242),
    .O(Mmux_result83_283)
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  Mmux_result85 (
    .I0(Sh1),
    .I1(b_4_IBUF_27),
    .I2(b_2_IBUF_29),
    .I3(b_3_IBUF_28),
    .O(Mmux_result84_284)
  );
  LUT6 #(
    .INIT ( 64'h5555555555554440 ))
  Mmux_result86 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux__n0073110),
    .I2(Mmux_result84_284),
    .I3(Mmux_result83_283),
    .I4(Mmux_result8),
    .I5(Mmux_result81_281),
    .O(result_1_OBUF_83)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result11 (
    .I0(a_0_IBUF_15),
    .I1(Mmux__n007319),
    .I2(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I3(Mmux__n0073111),
    .I4(n0057[0]),
    .I5(Mmux__n007318),
    .O(Mmux_result1)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result14 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_0_IBUF_15),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[0]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result12)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Mmux_result17 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_2_IBUF_13),
    .I3(a_1_IBUF_14),
    .I4(a_3_IBUF_12),
    .I5(a_0_IBUF_15),
    .O(Mmux_result13)
  );
  LUT6 #(
    .INIT ( 64'hAA8AA88822022000 ))
  Mmux_result18 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh40),
    .I4(Mmux_result13),
    .I5(Sh481_241),
    .O(Mmux_result15)
  );
  LUT6 #(
    .INIT ( 64'h5555555555554440 ))
  Mmux_result110 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux__n0073110),
    .I2(Mmux_result16),
    .I3(Mmux_result15),
    .I4(Mmux_result1),
    .I5(Mmux_result12),
    .O(result_0_OBUF_84)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result91 (
    .I0(a_2_IBUF_13),
    .I1(Mmux__n007319),
    .I2(b_2_IBUF_29),
    .I3(Mmux__n0073111),
    .I4(n0057[2]),
    .I5(Mmux__n007318),
    .O(Mmux_result9)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result92 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_2_IBUF_13),
    .I3(b_2_IBUF_29),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[2]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result91_291)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Mmux_result93 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_4_IBUF_11),
    .I3(a_3_IBUF_12),
    .I4(a_5_IBUF_10),
    .I5(a_2_IBUF_13),
    .O(Mmux_result92_292)
  );
  LUT6 #(
    .INIT ( 64'hAA8AA88822022000 ))
  Mmux_result94 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh42_108),
    .I4(Mmux_result92_292),
    .I5(Sh501_243),
    .O(Mmux_result93_293)
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  Mmux_result95 (
    .I0(Sh2),
    .I1(b_3_IBUF_28),
    .I2(b_4_IBUF_27),
    .I3(b_2_IBUF_29),
    .O(Mmux_result94_294)
  );
  LUT6 #(
    .INIT ( 64'h5555555555554440 ))
  Mmux_result96 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux__n0073110),
    .I2(Mmux_result94_294),
    .I3(Mmux_result93_293),
    .I4(Mmux_result9),
    .I5(Mmux_result91_291),
    .O(result_2_OBUF_82)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result101 (
    .I0(a_3_IBUF_12),
    .I1(Mmux__n007319),
    .I2(b_3_IBUF_28),
    .I3(Mmux__n0073111),
    .I4(n0057[3]),
    .I5(Mmux__n007318),
    .O(Mmux_result10)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result102 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_3_IBUF_12),
    .I3(b_3_IBUF_28),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[3]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result101_296)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  Mmux_result103 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(a_5_IBUF_10),
    .I3(a_4_IBUF_11),
    .I4(a_6_IBUF_9),
    .I5(a_3_IBUF_12),
    .O(Mmux_result102_297)
  );
  LUT6 #(
    .INIT ( 64'hAA8AA88822022000 ))
  Mmux_result104 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh43),
    .I4(Mmux_result102_297),
    .I5(Sh511),
    .O(Mmux_result103_298)
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  Mmux_result105 (
    .I0(Sh3),
    .I1(b_3_IBUF_28),
    .I2(b_4_IBUF_27),
    .I3(b_2_IBUF_29),
    .O(Mmux_result104_299)
  );
  LUT6 #(
    .INIT ( 64'h5555555555554440 ))
  Mmux_result106 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux__n0073110),
    .I2(Mmux_result104_299),
    .I3(Mmux_result103_298),
    .I4(Mmux_result10),
    .I5(Mmux_result101_296),
    .O(result_3_OBUF_81)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result161 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_9_IBUF_6),
    .I3(b_9_IBUF_22),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[9]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result161_300)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result162 (
    .I0(a_9_IBUF_6),
    .I1(Mmux__n007319),
    .I2(b_9_IBUF_22),
    .I3(Mmux__n0073111),
    .I4(n0057[9]),
    .I5(Mmux__n007318),
    .O(Mmux_result162_301)
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  Mmux_result163 (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh5),
    .I3(Sh9),
    .I4(Sh1),
    .O(Mmux_result163_302)
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  Mmux_result164 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(Sh41),
    .I4(Sh45),
    .I5(Mmux_result163_302),
    .O(Mmux_result164_303)
  );
  LUT5 #(
    .INIT ( 32'h55555444 ))
  Mmux_result165 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux_result161_300),
    .I2(Mmux_result164_303),
    .I3(Mmux__n0073110),
    .I4(Mmux_result162_301),
    .O(result_9_OBUF_75)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result151 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_8_IBUF_7),
    .I3(b_8_IBUF_23),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[8]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result151_304)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result152 (
    .I0(a_8_IBUF_7),
    .I1(Mmux__n007319),
    .I2(b_8_IBUF_23),
    .I3(Mmux__n0073111),
    .I4(n0057[8]),
    .I5(Mmux__n007318),
    .O(Mmux_result152_305)
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  Mmux_result153 (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh4),
    .I3(Sh8),
    .I4(Sh),
    .O(Mmux_result153_306)
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  Mmux_result154 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(Sh40),
    .I4(Sh44),
    .I5(Mmux_result153_306),
    .O(Mmux_result154_307)
  );
  LUT5 #(
    .INIT ( 32'h55555444 ))
  Mmux_result155 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux_result151_304),
    .I2(Mmux_result154_307),
    .I3(Mmux__n0073110),
    .I4(Mmux_result152_305),
    .O(result_8_OBUF_76)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result31 (
    .I0(a_11_IBUF_4),
    .I1(Mmux__n007319),
    .I2(b_11_IBUF_20),
    .I3(Mmux__n0073111),
    .I4(n0057[11]),
    .I5(Mmux__n007318),
    .O(Mmux_result3)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result32 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_11_IBUF_4),
    .I3(b_11_IBUF_20),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[11]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result31_309)
  );
  LUT6 #(
    .INIT ( 64'h1505140411011000 ))
  Mmux_result33 (
    .I0(b_4_IBUF_27),
    .I1(b_2_IBUF_29),
    .I2(b_3_IBUF_28),
    .I3(Sh3),
    .I4(Sh11),
    .I5(Sh7),
    .O(Mmux_result32_310)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  Mmux_result34 (
    .I0(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I1(b_1_IBUF_30),
    .O(Mmux_result33_311)
  );
  LUT6 #(
    .INIT ( 64'h2202020220000000 ))
  Mmux_result35 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(Mmux_result33_311),
    .I4(a_15_IBUF_0),
    .I5(Sh43),
    .O(Mmux_result34_312)
  );
  LUT6 #(
    .INIT ( 64'h5555555555554440 ))
  Mmux_result36 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux__n0073110),
    .I2(Mmux_result34_312),
    .I3(Mmux_result32_310),
    .I4(Mmux_result3),
    .I5(Mmux_result31_309),
    .O(result_11_OBUF_73)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result21 (
    .I0(a_10_IBUF_5),
    .I1(Mmux__n007319),
    .I2(b_10_IBUF_21),
    .I3(Mmux__n0073111),
    .I4(n0057[10]),
    .I5(Mmux__n007318),
    .O(Mmux_result2)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result22 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_10_IBUF_5),
    .I3(b_10_IBUF_21),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[10]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result21_314)
  );
  LUT5 #(
    .INIT ( 32'h73625140 ))
  Mmux_result23 (
    .I0(b_3_IBUF_28),
    .I1(b_2_IBUF_29),
    .I2(Sh6),
    .I3(Sh10),
    .I4(Sh2),
    .O(Mmux_result22_315)
  );
  LUT6 #(
    .INIT ( 64'h7775575522200200 ))
  Mmux_result24 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I3(Sh42_108),
    .I4(Sh46),
    .I5(Mmux_result22_315),
    .O(Mmux_result23_316)
  );
  LUT5 #(
    .INIT ( 32'h55555444 ))
  Mmux_result25 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux_result21_314),
    .I2(Mmux_result23_316),
    .I3(Mmux__n0073110),
    .I4(Mmux_result2),
    .O(result_10_OBUF_74)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result121 (
    .I0(a_5_IBUF_10),
    .I1(Mmux__n007319),
    .I2(b_5_IBUF_26),
    .I3(Mmux__n0073111),
    .I4(n0057[5]),
    .I5(Mmux__n007318),
    .O(Mmux_result121_317)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result122 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_5_IBUF_10),
    .I3(b_5_IBUF_26),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[5]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result122_318)
  );
  LUT5 #(
    .INIT ( 32'h11100100 ))
  Mmux_result123 (
    .I0(b_3_IBUF_28),
    .I1(b_4_IBUF_27),
    .I2(b_2_IBUF_29),
    .I3(Sh5),
    .I4(Sh1),
    .O(Mmux_result123_319)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF2A220800 ))
  Mmux_result124 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh41),
    .I4(Sh491_242),
    .I5(Mmux_result123_319),
    .O(Mmux_result124_320)
  );
  LUT5 #(
    .INIT ( 32'h55555444 ))
  Mmux_result125 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux_result122_318),
    .I2(Mmux_result124_320),
    .I3(Mmux__n0073110),
    .I4(Mmux_result121_317),
    .O(result_5_OBUF_79)
  );
  LUT6 #(
    .INIT ( 64'hFFFFA888A888A888 ))
  Mmux_result131 (
    .I0(a_6_IBUF_9),
    .I1(Mmux__n007319),
    .I2(b_6_IBUF_25),
    .I3(Mmux__n0073111),
    .I4(n0057[6]),
    .I5(Mmux__n007318),
    .O(Mmux_result131_321)
  );
  LUT6 #(
    .INIT ( 64'h2AA2088008800880 ))
  Mmux_result132 (
    .I0(opcode_2_IBUF_32),
    .I1(opcode_0_IBUF_34),
    .I2(a_6_IBUF_9),
    .I3(b_6_IBUF_25),
    .I4(GND_1_o_GND_1_o_sub_14_OUT[6]),
    .I5(opcode_1_IBUF_33),
    .O(Mmux_result132_322)
  );
  LUT5 #(
    .INIT ( 32'h11100100 ))
  Mmux_result133 (
    .I0(b_3_IBUF_28),
    .I1(b_4_IBUF_27),
    .I2(b_2_IBUF_29),
    .I3(Sh6),
    .I4(Sh2),
    .O(Mmux_result133_323)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF2A220800 ))
  Mmux_result134 (
    .I0(b_4_IBUF_27),
    .I1(\b[3]_GND_1_o_add_8_OUT<2>1 ),
    .I2(\b[3]_GND_1_o_add_8_OUT<3>1 ),
    .I3(Sh42_108),
    .I4(Sh501_243),
    .I5(Mmux_result133_323),
    .O(Mmux_result134_324)
  );
  LUT5 #(
    .INIT ( 32'h55555444 ))
  Mmux_result135 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux_result132_322),
    .I2(Mmux_result134_324),
    .I3(Mmux__n0073110),
    .I4(Mmux_result131_321),
    .O(result_6_OBUF_78)
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
    .I3(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<6>_144 ),
    .I4(b_15_IBUF_16),
    .O(\Mcompar_b[15]_a[15]_LessThan_7_o_cy<7>_145 )
  );
  LUT5 #(
    .INIT ( 32'hF7733110 ))
  \Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>  (
    .I0(a_14_IBUF_1),
    .I1(b_15_IBUF_16),
    .I2(b_14_IBUF_17),
    .I3(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<6>_230 ),
    .I4(a_15_IBUF_0),
    .O(\Mcompar_a[15]_b[15]_LessThan_6_o_cy<7>_231 )
  );
  LUT5 #(
    .INIT ( 32'h80808002 ))
  Mmux_result41311 (
    .I0(b_4_IBUF_27),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(Mmux_result4131)
  );
  LUT6 #(
    .INIT ( 64'h888888DE88888884 ))
  Sh5112 (
    .I0(b_3_IBUF_28),
    .I1(Sh5111_267),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I5(a_15_IBUF_0),
    .O(Sh511)
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
    .O(Sh42_108)
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
    .INIT ( 64'h4444445444444444 ))
  Mmux_result145 (
    .I0(opcode_3_IBUF_31),
    .I1(Mmux_result141_249),
    .I2(Mmux_result143_251),
    .I3(opcode_0_IBUF_34),
    .I4(opcode_1_IBUF_33),
    .I5(opcode_2_IBUF_32),
    .O(result_7_OBUF_77)
  );
  LUT6 #(
    .INIT ( 64'h222A222200080000 ))
  Mmux_result44 (
    .I0(b_2_IBUF_29),
    .I1(b_3_IBUF_28),
    .I2(b_1_IBUF_30),
    .I3(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I4(a_0_IBUF_15),
    .I5(Sh8),
    .O(Mmux_result43_256)
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
    .O(Sh481_241)
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
    .O(Sh491_242)
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
    .O(Sh501_243)
  );
  LUT6 #(
    .INIT ( 64'h0000000100000000 ))
  Mmux_result19 (
    .I0(b_1_IBUF_30),
    .I1(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .I2(b_4_IBUF_27),
    .I3(b_2_IBUF_29),
    .I4(b_3_IBUF_28),
    .I5(a_0_IBUF_15),
    .O(Mmux_result16)
  );
  LUT5 #(
    .INIT ( 32'h4280C080 ))
  Mmux_result141 (
    .I0(b_7_IBUF_24),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_2_IBUF_32),
    .I3(a_7_IBUF_8),
    .I4(opcode_1_IBUF_33),
    .O(Mmux_result14_248)
  );
  LUT5 #(
    .INIT ( 32'h4280C080 ))
  Mmux_result61 (
    .I0(b_14_IBUF_17),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_2_IBUF_32),
    .I3(a_14_IBUF_1),
    .I4(opcode_1_IBUF_33),
    .O(Mmux_result6)
  );
  LUT5 #(
    .INIT ( 32'h08080880 ))
  Mmux_result143 (
    .I0(Sh43),
    .I1(b_3_IBUF_28),
    .I2(b_2_IBUF_29),
    .I3(b_1_IBUF_30),
    .I4(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(Mmux_result142_250)
  );
  LUT6 #(
    .INIT ( 64'h8000800080000008 ))
  Mmux_result43 (
    .I0(b_4_IBUF_27),
    .I1(Sh44),
    .I2(b_3_IBUF_28),
    .I3(b_2_IBUF_29),
    .I4(b_1_IBUF_30),
    .I5(\Madd_b[3]_GND_1_o_add_8_OUT_lut<0> ),
    .O(Mmux_result42)
  );
  MUXF7   Mmux_result47 (
    .I0(N11),
    .I1(N12),
    .S(opcode_2_IBUF_32),
    .O(result_12_OBUF_72)
  );
  LUT6 #(
    .INIT ( 64'h1404040410000000 ))
  Mmux_result47_F (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_1_IBUF_33),
    .I3(b_12_IBUF_19),
    .I4(a_12_IBUF_3),
    .I5(n0057[12]),
    .O(N11)
  );
  LUT6 #(
    .INIT ( 64'h1555515104444040 ))
  Mmux_result47_G (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_0_IBUF_34),
    .I2(b_12_IBUF_19),
    .I3(opcode_1_IBUF_33),
    .I4(a_12_IBUF_3),
    .I5(Mmux_result45_258),
    .O(N12)
  );
  MUXF7   Mmux_flags33 (
    .I0(N13),
    .I1(N14),
    .S(\Mcompar_a[15]_b[15]_equal_5_o_lut<5>_123 ),
    .O(flags_2_OBUF_87)
  );
  LUT6 #(
    .INIT ( 64'h1000000000001000 ))
  Mmux_flags33_F (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_1_IBUF_33),
    .I3(opcode_2_IBUF_32),
    .I4(b_15_IBUF_16),
    .I5(GND_1_o_GND_1_o_sub_14_OUT[15]),
    .O(N13)
  );
  LUT6 #(
    .INIT ( 64'h0000000400040000 ))
  Mmux_flags33_G (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_0_IBUF_34),
    .I2(opcode_1_IBUF_33),
    .I3(opcode_2_IBUF_32),
    .I4(b_15_IBUF_16),
    .I5(n0057[15]),
    .O(N14)
  );
  MUXF7   Mmux_result77 (
    .I0(N15),
    .I1(N16),
    .S(opcode_1_IBUF_33),
    .O(result_15_OBUF_69)
  );
  LUT5 #(
    .INIT ( 32'h54441000 ))
  Mmux_result77_F (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .I2(opcode_0_IBUF_34),
    .I3(n0057[15]),
    .I4(Mmux_result75_254),
    .O(N15)
  );
  LUT6 #(
    .INIT ( 64'h0544440401404000 ))
  Mmux_result77_G (
    .I0(opcode_3_IBUF_31),
    .I1(opcode_2_IBUF_32),
    .I2(opcode_0_IBUF_34),
    .I3(b_15_IBUF_16),
    .I4(a_15_IBUF_0),
    .I5(GND_1_o_GND_1_o_sub_14_OUT[15]),
    .O(N16)
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

