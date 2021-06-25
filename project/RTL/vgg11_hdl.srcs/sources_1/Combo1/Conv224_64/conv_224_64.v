`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 22/06/2021 21:52:19
// Design Name: 
// Module Name: conv_224_64
// Project Name: vgg11_hdl
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module conv_224_64
    #(
    parameter in_bias0 = 32'b00111110010001101000010100011101,
	parameter in_bias1 = 32'b00111110100110111100001010001010,
	parameter in_bias2 = 32'b00111110001110101110001111010111,
	parameter in_bias3 = 32'b10111111100011100101110001000010,
	parameter in_bias4 = 32'b00111101001101001101101010100111,
	parameter in_bias5 = 32'b10111101100010101100100110110001,
	parameter in_bias6 = 32'b00111110000001111000101111011111,
	parameter in_bias7 = 32'b10111111000101011010011010010010,
	parameter in_bias8 = 32'b00111110011000100101011110110010,
	parameter in_bias9 = 32'b10111100010101010001100101111111,
	parameter in_bias10 = 32'b10111110110000100011110010110111,
	parameter in_bias11 = 32'b00111110000000001001101010001100,
	parameter in_bias12 = 32'b00111110011101110101011100110110,
	parameter in_bias13 = 32'b00111110011111110001010011011111,
	parameter in_bias14 = 32'b10111111010010001111000110011100,
	parameter in_bias15 = 32'b10111111100001110101110010011011,
	parameter in_bias16 = 32'b00111110100001110000100000001000,
	parameter in_bias17 = 32'b10111110001111000011000110011100,
	parameter in_bias18 = 32'b00111110000111001111011001010010,
	parameter in_bias19 = 32'b10111111100100110000001001011001,
	parameter in_bias20 = 32'b00111100000110110001110000100101,
	parameter in_bias21 = 32'b10111111010111010011000001111101,
	parameter in_bias22 = 32'b10111110110001111101100100111100,
	parameter in_bias23 = 32'b10111110110011101101111000100101,
	parameter in_bias24 = 32'b00111111000100111101011100111010,
	parameter in_bias25 = 32'b00111110100000010111001000000011,
	parameter in_bias26 = 32'b00111101101110101001100010111000,
	parameter in_bias27 = 32'b00111110000111110010011000000000,
	parameter in_bias28 = 32'b10111110001110111010111101010110,
	parameter in_bias29 = 32'b10111110111101000000001100001011,
	parameter in_bias30 = 32'b10111110011100001100110010110010,
	parameter in_bias31 = 32'b10111111100011010100100000000110,
	parameter in_bias32 = 32'b10111111000101111010101000111010,
	parameter in_bias33 = 32'b00111110100101101000110001011101,
	parameter in_bias34 = 32'b00111110010000011011011001100010,
	parameter in_bias35 = 32'b00111110110101000001001111010011,
	parameter in_bias36 = 32'b10111100101101000101110011110101,
	parameter in_bias37 = 32'b00111110001110000100011101100111,
	parameter in_bias38 = 32'b10111111000011011001110010000111,
	parameter in_bias39 = 32'b00111110011100100010001101011010,
	parameter in_bias40 = 32'b00111110000111101000010100001010,
	parameter in_bias41 = 32'b10111111110110111011011000100011,
	parameter in_bias42 = 32'b10111101000000100010010101111010,
	parameter in_bias43 = 32'b00111101010010100111010111110100,
	parameter in_bias44 = 32'b00111110000000111010010111001110,
	parameter in_bias45 = 32'b00111110001111100111010010111000,
	parameter in_bias46 = 32'b00111110001101110010100010010101,
	parameter in_bias47 = 32'b00111110111011111001000011001000,
	parameter in_bias48 = 32'b10111011110101111100001000011111,
	parameter in_bias49 = 32'b10111101110000100001000000110010,
	parameter in_bias50 = 32'b10111111101111001000111001011100,
	parameter in_bias51 = 32'b10111111010000110000010001010001,
	parameter in_bias52 = 32'b10111111100110011011101111010011,
	parameter in_bias53 = 32'b00111110001101001100001011110010,
	parameter in_bias54 = 32'b00111110010011100100110001111001,
	parameter in_bias55 = 32'b10111101101010000110111110011011,
	parameter in_bias56 = 32'b00111110000101001101000011100101,
	parameter in_bias57 = 32'b00111100111011001010011111111010,
	parameter in_bias58 = 32'b10111111100110011110011111011100,
	parameter in_bias59 = 32'b00111110001000110101001011001010,
	parameter in_bias60 = 32'b10111111011000100111000010010100,
	parameter in_bias61 = 32'b10111011111101101010110111110011,
	parameter in_bias62 = 32'b00111110011010101010110100011010,
	parameter in_bias63 = 32'b10111111101100010001110101011110,
    parameter data_width = 32,
    parameter ram_depth = 8,
    parameter counter_depth = 10,
    parameter imgsize = 224
    )
    (
    counter,
    rowcounter,
    clk,
    rst,
    dataIn0,
    dataIn1,
    dataIn2,
    final_result0,
	final_result1,
	final_result2,
	final_result3,
	final_result4,
	final_result5,
	final_result6,
	final_result7,
	final_result8,
	final_result9,
	final_result10,
	final_result11,
	final_result12,
	final_result13,
	final_result14,
	final_result15,
	final_result16,
	final_result17,
	final_result18,
	final_result19,
	final_result20,
	final_result21,
	final_result22,
	final_result23,
	final_result24,
	final_result25,
	final_result26,
	final_result27,
	final_result28,
	final_result29,
	final_result30,
	final_result31,
	final_result32,
	final_result33,
	final_result34,
	final_result35,
	final_result36,
	final_result37,
	final_result38,
	final_result39,
	final_result40,
	final_result41,
	final_result42,
	final_result43,
	final_result44,
	final_result45,
	final_result46,
	final_result47,
	final_result48,
	final_result49,
	final_result50,
	final_result51,
	final_result52,
	final_result53,
	final_result54,
	final_result55,
	final_result56,
	final_result57,
	final_result58,
	final_result59,
	final_result60,
	final_result61,
	final_result62,
	final_result63
    );
    
    input wire [data_width-1:0] dataIn0, dataIn1, dataIn2;
    input wire clk, rst;
    output wire [data_width-1:0] final_result0,
	final_result1,
	final_result2,
	final_result3,
	final_result4,
	final_result5,
	final_result6,
	final_result7,
	final_result8,
	final_result9,
	final_result10,
	final_result11,
	final_result12,
	final_result13,
	final_result14,
	final_result15,
	final_result16,
	final_result17,
	final_result18,
	final_result19,
	final_result20,
	final_result21,
	final_result22,
	final_result23,
	final_result24,
	final_result25,
	final_result26,
	final_result27,
	final_result28,
	final_result29,
	final_result30,
	final_result31,
	final_result32,
	final_result33,
	final_result34,
	final_result35,
	final_result36,
	final_result37,
	final_result38,
	final_result39,
	final_result40,
	final_result41,
	final_result42,
	final_result43,
	final_result44,
	final_result45,
	final_result46,
	final_result47,
	final_result48,
	final_result49,
	final_result50,
	final_result51,
	final_result52,
	final_result53,
	final_result54,
	final_result55,
	final_result56,
	final_result57,
	final_result58,
	final_result59,
	final_result60,
	final_result61,
	final_result62,
	final_result63;
    output wire [ram_depth-1:0] rowcounter;
    output wire [counter_depth-1:0] counter;

    wire [data_width-1:0] result0,
	result1,
	result2,
	result3,
	result4,
	result5,
	result6,
	result7,
	result8,
	result9,
	result10,
	result11,
	result12,
	result13,
	result14,
	result15,
	result16,
	result17,
	result18,
	result19,
	result20,
	result21,
	result22,
	result23,
	result24,
	result25,
	result26,
	result27,
	result28,
	result29,
	result30,
	result31,
	result32,
	result33,
	result34,
	result35,
	result36,
	result37,
	result38,
	result39,
	result40,
	result41,
	result42,
	result43,
	result44,
	result45,
	result46,
	result47,
	result48,
	result49,
	result50,
	result51,
	result52,
	result53,
	result54,
	result55,
	result56,
	result57,
	result58,
	result59,
	result60,
	result61,
	result62,
	result63;
    wire [data_width-1:0] result0_0,
	result1_0,
	result2_0,
	result3_0,
	result4_0,
	result5_0,
	result6_0,
	result7_0,
	result8_0,
	result9_0,
	result10_0,
	result11_0,
	result12_0,
	result13_0,
	result14_0,
	result15_0,
	result16_0,
	result17_0,
	result18_0,
	result19_0,
	result20_0,
	result21_0,
	result22_0,
	result23_0,
	result24_0,
	result25_0,
	result26_0,
	result27_0,
	result28_0,
	result29_0,
	result30_0,
	result31_0,
	result32_0,
	result33_0,
	result34_0,
	result35_0,
	result36_0,
	result37_0,
	result38_0,
	result39_0,
	result40_0,
	result41_0,
	result42_0,
	result43_0,
	result44_0,
	result45_0,
	result46_0,
	result47_0,
	result48_0,
	result49_0,
	result50_0,
	result51_0,
	result52_0,
	result53_0,
	result54_0,
	result55_0,
	result56_0,
	result57_0,
	result58_0,
	result59_0,
	result60_0,
	result61_0,
	result62_0,
	result63_0,
	result0_1,
	result1_1,
	result2_1,
	result3_1,
	result4_1,
	result5_1,
	result6_1,
	result7_1,
	result8_1,
	result9_1,
	result10_1,
	result11_1,
	result12_1,
	result13_1,
	result14_1,
	result15_1,
	result16_1,
	result17_1,
	result18_1,
	result19_1,
	result20_1,
	result21_1,
	result22_1,
	result23_1,
	result24_1,
	result25_1,
	result26_1,
	result27_1,
	result28_1,
	result29_1,
	result30_1,
	result31_1,
	result32_1,
	result33_1,
	result34_1,
	result35_1,
	result36_1,
	result37_1,
	result38_1,
	result39_1,
	result40_1,
	result41_1,
	result42_1,
	result43_1,
	result44_1,
	result45_1,
	result46_1,
	result47_1,
	result48_1,
	result49_1,
	result50_1,
	result51_1,
	result52_1,
	result53_1,
	result54_1,
	result55_1,
	result56_1,
	result57_1,
	result58_1,
	result59_1,
	result60_1,
	result61_1,
	result62_1,
	result63_1,
	result0_2,
	result1_2,
	result2_2,
	result3_2,
	result4_2,
	result5_2,
	result6_2,
	result7_2,
	result8_2,
	result9_2,
	result10_2,
	result11_2,
	result12_2,
	result13_2,
	result14_2,
	result15_2,
	result16_2,
	result17_2,
	result18_2,
	result19_2,
	result20_2,
	result21_2,
	result22_2,
	result23_2,
	result24_2,
	result25_2,
	result26_2,
	result27_2,
	result28_2,
	result29_2,
	result30_2,
	result31_2,
	result32_2,
	result33_2,
	result34_2,
	result35_2,
	result36_2,
	result37_2,
	result38_2,
	result39_2,
	result40_2,
	result41_2,
	result42_2,
	result43_2,
	result44_2,
	result45_2,
	result46_2,
	result47_2,
	result48_2,
	result49_2,
	result50_2,
	result51_2,
	result52_2,
	result53_2,
	result54_2,
	result55_2,
	result56_2,
	result57_2,
	result58_2,
	result59_2,
	result60_2,
	result61_2,
	result62_2,
	result63_2;
        
conv_224_weight0_0 conv0(
    .counter(counter),
    .rowcounter(rowcounter),
    .clk(clk),
    .rst(rst),
    .dataIn(dataIn0),
    .result0(result0_0),
    .result1(result1_0),
    .result2(result2_0),
    .result3(result3_0),
    .result4(result4_0),
    .result5(result5_0),
    .result6(result6_0),
    .result7(result7_0),
    .result8(result8_0),
    .result9(result9_0),
    .result10(result10_0),
    .result11(result11_0),
    .result12(result12_0),
    .result13(result13_0),
    .result14(result14_0),
    .result15(result15_0),
    .result16(result16_0),
    .result17(result17_0),
    .result18(result18_0),
    .result19(result19_0),
    .result20(result20_0),
    .result21(result21_0),
    .result22(result22_0),
    .result23(result23_0),
    .result24(result24_0),
    .result25(result25_0),
    .result26(result26_0),
    .result27(result27_0),
    .result28(result28_0),
    .result29(result29_0),
    .result30(result30_0),
    .result31(result31_0),
    .result32(result32_0),
    .result33(result33_0),
    .result34(result34_0),
    .result35(result35_0),
    .result36(result36_0),
    .result37(result37_0),
    .result38(result38_0),
    .result39(result39_0),
    .result40(result40_0),
    .result41(result41_0),
    .result42(result42_0),
    .result43(result43_0),
    .result44(result44_0),
    .result45(result45_0),
    .result46(result46_0),
    .result47(result47_0),
    .result48(result48_0),
    .result49(result49_0),
    .result50(result50_0),
    .result51(result51_0),
    .result52(result52_0),
    .result53(result53_0),
    .result54(result54_0),
    .result55(result55_0),
    .result56(result56_0),
    .result57(result57_0),
    .result58(result58_0),
    .result59(result59_0),
    .result60(result60_0),
    .result61(result61_0),
    .result62(result62_0),
    .result63(result63_0)
    );

conv_224_weight0_1 conv1(
    .counter(),
    .rowcounter(),
    .clk(clk),
    .rst(rst),
    .dataIn(dataIn1),
    .result0(result0_1),
    .result1(result1_1),
    .result2(result2_1),
    .result3(result3_1),
    .result4(result4_1),
    .result5(result5_1),
    .result6(result6_1),
    .result7(result7_1),
    .result8(result8_1),
    .result9(result9_1),
    .result10(result10_1),
    .result11(result11_1),
    .result12(result12_1),
    .result13(result13_1),
    .result14(result14_1),
    .result15(result15_1),
    .result16(result16_1),
    .result17(result17_1),
    .result18(result18_1),
    .result19(result19_1),
    .result20(result20_1),
    .result21(result21_1),
    .result22(result22_1),
    .result23(result23_1),
    .result24(result24_1),
    .result25(result25_1),
    .result26(result26_1),
    .result27(result27_1),
    .result28(result28_1),
    .result29(result29_1),
    .result30(result30_1),
    .result31(result31_1),
    .result32(result32_1),
    .result33(result33_1),
    .result34(result34_1),
    .result35(result35_1),
    .result36(result36_1),
    .result37(result37_1),
    .result38(result38_1),
    .result39(result39_1),
    .result40(result40_1),
    .result41(result41_1),
    .result42(result42_1),
    .result43(result43_1),
    .result44(result44_1),
    .result45(result45_1),
    .result46(result46_1),
    .result47(result47_1),
    .result48(result48_1),
    .result49(result49_1),
    .result50(result50_1),
    .result51(result51_1),
    .result52(result52_1),
    .result53(result53_1),
    .result54(result54_1),
    .result55(result55_1),
    .result56(result56_1),
    .result57(result57_1),
    .result58(result58_1),
    .result59(result59_1),
    .result60(result60_1),
    .result61(result61_1),
    .result62(result62_1),
    .result63(result63_1)
    );
    
conv_224_weight0_2 conv2(
    .counter(),
    .rowcounter(),
    .clk(clk),
    .rst(rst),
    .dataIn(dataIn2),
    .result0(result0_2),
    .result1(result1_2),
    .result2(result2_2),
    .result3(result3_2),
    .result4(result4_2),
    .result5(result5_2),
    .result6(result6_2),
    .result7(result7_2),
    .result8(result8_2),
    .result9(result9_2),
    .result10(result10_2),
    .result11(result11_2),
    .result12(result12_2),
    .result13(result13_2),
    .result14(result14_2),
    .result15(result15_2),
    .result16(result16_2),
    .result17(result17_2),
    .result18(result18_2),
    .result19(result19_2),
    .result20(result20_2),
    .result21(result21_2),
    .result22(result22_2),
    .result23(result23_2),
    .result24(result24_2),
    .result25(result25_2),
    .result26(result26_2),
    .result27(result27_2),
    .result28(result28_2),
    .result29(result29_2),
    .result30(result30_2),
    .result31(result31_2),
    .result32(result32_2),
    .result33(result33_2),
    .result34(result34_2),
    .result35(result35_2),
    .result36(result36_2),
    .result37(result37_2),
    .result38(result38_2),
    .result39(result39_2),
    .result40(result40_2),
    .result41(result41_2),
    .result42(result42_2),
    .result43(result43_2),
    .result44(result44_2),
    .result45(result45_2),
    .result46(result46_2),
    .result47(result47_2),
    .result48(result48_2),
    .result49(result49_2),
    .result50(result50_2),
    .result51(result51_2),
    .result52(result52_2),
    .result53(result53_2),
    .result54(result54_2),
    .result55(result55_2),
    .result56(result56_2),
    .result57(result57_2),
    .result58(result58_2),
    .result59(result59_2),
    .result60(result60_2),
    .result61(result61_2),
    .result62(result62_2),
    .result63(result63_2)
    );

bias_adder_224_64 #(in_bias0)
	ba0(.result(result0), .in_map0(result0_0), .in_map1(result0_1), .in_map2(result0_2));

bias_adder_224_64 #(in_bias1)
	ba1(.result(result1), .in_map0(result1_0), .in_map1(result1_1), .in_map2(result1_2));

bias_adder_224_64 #(in_bias2)
	ba2(.result(result2), .in_map0(result2_0), .in_map1(result2_1), .in_map2(result2_2));

bias_adder_224_64 #(in_bias3)
	ba3(.result(result3), .in_map0(result3_0), .in_map1(result3_1), .in_map2(result3_2));

bias_adder_224_64 #(in_bias4)
	ba4(.result(result4), .in_map0(result4_0), .in_map1(result4_1), .in_map2(result4_2));

bias_adder_224_64 #(in_bias5)
	ba5(.result(result5), .in_map0(result5_0), .in_map1(result5_1), .in_map2(result5_2));

bias_adder_224_64 #(in_bias6)
	ba6(.result(result6), .in_map0(result6_0), .in_map1(result6_1), .in_map2(result6_2));

bias_adder_224_64 #(in_bias7)
	ba7(.result(result7), .in_map0(result7_0), .in_map1(result7_1), .in_map2(result7_2));

bias_adder_224_64 #(in_bias8)
	ba8(.result(result8), .in_map0(result8_0), .in_map1(result8_1), .in_map2(result8_2));

bias_adder_224_64 #(in_bias9)
	ba9(.result(result9), .in_map0(result9_0), .in_map1(result9_1), .in_map2(result9_2));

bias_adder_224_64 #(in_bias10)
	ba10(.result(result10), .in_map0(result10_0), .in_map1(result10_1), .in_map2(result10_2));

bias_adder_224_64 #(in_bias11)
	ba11(.result(result11), .in_map0(result11_0), .in_map1(result11_1), .in_map2(result11_2));

bias_adder_224_64 #(in_bias12)
	ba12(.result(result12), .in_map0(result12_0), .in_map1(result12_1), .in_map2(result12_2));

bias_adder_224_64 #(in_bias13)
	ba13(.result(result13), .in_map0(result13_0), .in_map1(result13_1), .in_map2(result13_2));

bias_adder_224_64 #(in_bias14)
	ba14(.result(result14), .in_map0(result14_0), .in_map1(result14_1), .in_map2(result14_2));

bias_adder_224_64 #(in_bias15)
	ba15(.result(result15), .in_map0(result15_0), .in_map1(result15_1), .in_map2(result15_2));

bias_adder_224_64 #(in_bias16)
	ba16(.result(result16), .in_map0(result16_0), .in_map1(result16_1), .in_map2(result16_2));

bias_adder_224_64 #(in_bias17)
	ba17(.result(result17), .in_map0(result17_0), .in_map1(result17_1), .in_map2(result17_2));

bias_adder_224_64 #(in_bias18)
	ba18(.result(result18), .in_map0(result18_0), .in_map1(result18_1), .in_map2(result18_2));

bias_adder_224_64 #(in_bias19)
	ba19(.result(result19), .in_map0(result19_0), .in_map1(result19_1), .in_map2(result19_2));

bias_adder_224_64 #(in_bias20)
	ba20(.result(result20), .in_map0(result20_0), .in_map1(result20_1), .in_map2(result20_2));

bias_adder_224_64 #(in_bias21)
	ba21(.result(result21), .in_map0(result21_0), .in_map1(result21_1), .in_map2(result21_2));

bias_adder_224_64 #(in_bias22)
	ba22(.result(result22), .in_map0(result22_0), .in_map1(result22_1), .in_map2(result22_2));

bias_adder_224_64 #(in_bias23)
	ba23(.result(result23), .in_map0(result23_0), .in_map1(result23_1), .in_map2(result23_2));

bias_adder_224_64 #(in_bias24)
	ba24(.result(result24), .in_map0(result24_0), .in_map1(result24_1), .in_map2(result24_2));

bias_adder_224_64 #(in_bias25)
	ba25(.result(result25), .in_map0(result25_0), .in_map1(result25_1), .in_map2(result25_2));

bias_adder_224_64 #(in_bias26)
	ba26(.result(result26), .in_map0(result26_0), .in_map1(result26_1), .in_map2(result26_2));

bias_adder_224_64 #(in_bias27)
	ba27(.result(result27), .in_map0(result27_0), .in_map1(result27_1), .in_map2(result27_2));

bias_adder_224_64 #(in_bias28)
	ba28(.result(result28), .in_map0(result28_0), .in_map1(result28_1), .in_map2(result28_2));

bias_adder_224_64 #(in_bias29)
	ba29(.result(result29), .in_map0(result29_0), .in_map1(result29_1), .in_map2(result29_2));

bias_adder_224_64 #(in_bias30)
	ba30(.result(result30), .in_map0(result30_0), .in_map1(result30_1), .in_map2(result30_2));

bias_adder_224_64 #(in_bias31)
	ba31(.result(result31), .in_map0(result31_0), .in_map1(result31_1), .in_map2(result31_2));

bias_adder_224_64 #(in_bias32)
	ba32(.result(result32), .in_map0(result32_0), .in_map1(result32_1), .in_map2(result32_2));

bias_adder_224_64 #(in_bias33)
	ba33(.result(result33), .in_map0(result33_0), .in_map1(result33_1), .in_map2(result33_2));

bias_adder_224_64 #(in_bias34)
	ba34(.result(result34), .in_map0(result34_0), .in_map1(result34_1), .in_map2(result34_2));

bias_adder_224_64 #(in_bias35)
	ba35(.result(result35), .in_map0(result35_0), .in_map1(result35_1), .in_map2(result35_2));

bias_adder_224_64 #(in_bias36)
	ba36(.result(result36), .in_map0(result36_0), .in_map1(result36_1), .in_map2(result36_2));

bias_adder_224_64 #(in_bias37)
	ba37(.result(result37), .in_map0(result37_0), .in_map1(result37_1), .in_map2(result37_2));

bias_adder_224_64 #(in_bias38)
	ba38(.result(result38), .in_map0(result38_0), .in_map1(result38_1), .in_map2(result38_2));

bias_adder_224_64 #(in_bias39)
	ba39(.result(result39), .in_map0(result39_0), .in_map1(result39_1), .in_map2(result39_2));

bias_adder_224_64 #(in_bias40)
	ba40(.result(result40), .in_map0(result40_0), .in_map1(result40_1), .in_map2(result40_2));

bias_adder_224_64 #(in_bias41)
	ba41(.result(result41), .in_map0(result41_0), .in_map1(result41_1), .in_map2(result41_2));

bias_adder_224_64 #(in_bias42)
	ba42(.result(result42), .in_map0(result42_0), .in_map1(result42_1), .in_map2(result42_2));

bias_adder_224_64 #(in_bias43)
	ba43(.result(result43), .in_map0(result43_0), .in_map1(result43_1), .in_map2(result43_2));

bias_adder_224_64 #(in_bias44)
	ba44(.result(result44), .in_map0(result44_0), .in_map1(result44_1), .in_map2(result44_2));

bias_adder_224_64 #(in_bias45)
	ba45(.result(result45), .in_map0(result45_0), .in_map1(result45_1), .in_map2(result45_2));

bias_adder_224_64 #(in_bias46)
	ba46(.result(result46), .in_map0(result46_0), .in_map1(result46_1), .in_map2(result46_2));

bias_adder_224_64 #(in_bias47)
	ba47(.result(result47), .in_map0(result47_0), .in_map1(result47_1), .in_map2(result47_2));

bias_adder_224_64 #(in_bias48)
	ba48(.result(result48), .in_map0(result48_0), .in_map1(result48_1), .in_map2(result48_2));

bias_adder_224_64 #(in_bias49)
	ba49(.result(result49), .in_map0(result49_0), .in_map1(result49_1), .in_map2(result49_2));

bias_adder_224_64 #(in_bias50)
	ba50(.result(result50), .in_map0(result50_0), .in_map1(result50_1), .in_map2(result50_2));

bias_adder_224_64 #(in_bias51)
	ba51(.result(result51), .in_map0(result51_0), .in_map1(result51_1), .in_map2(result51_2));

bias_adder_224_64 #(in_bias52)
	ba52(.result(result52), .in_map0(result52_0), .in_map1(result52_1), .in_map2(result52_2));

bias_adder_224_64 #(in_bias53)
	ba53(.result(result53), .in_map0(result53_0), .in_map1(result53_1), .in_map2(result53_2));

bias_adder_224_64 #(in_bias54)
	ba54(.result(result54), .in_map0(result54_0), .in_map1(result54_1), .in_map2(result54_2));

bias_adder_224_64 #(in_bias55)
	ba55(.result(result55), .in_map0(result55_0), .in_map1(result55_1), .in_map2(result55_2));

bias_adder_224_64 #(in_bias56)
	ba56(.result(result56), .in_map0(result56_0), .in_map1(result56_1), .in_map2(result56_2));

bias_adder_224_64 #(in_bias57)
	ba57(.result(result57), .in_map0(result57_0), .in_map1(result57_1), .in_map2(result57_2));

bias_adder_224_64 #(in_bias58)
	ba58(.result(result58), .in_map0(result58_0), .in_map1(result58_1), .in_map2(result58_2));

bias_adder_224_64 #(in_bias59)
	ba59(.result(result59), .in_map0(result59_0), .in_map1(result59_1), .in_map2(result59_2));

bias_adder_224_64 #(in_bias60)
	ba60(.result(result60), .in_map0(result60_0), .in_map1(result60_1), .in_map2(result60_2));

bias_adder_224_64 #(in_bias61)
	ba61(.result(result61), .in_map0(result61_0), .in_map1(result61_1), .in_map2(result61_2));

bias_adder_224_64 #(in_bias62)
	ba62(.result(result62), .in_map0(result62_0), .in_map1(result62_1), .in_map2(result62_2));

bias_adder_224_64 #(in_bias63)
	ba63(.result(result63), .in_map0(result63_0), .in_map1(result63_1), .in_map2(result63_2));


relu relu_inst [0:63](
	.out_conv({result0,
	result1,
	result2,
	result3,
	result4,
	result5,
	result6,
	result7,
	result8,
	result9,
	result10,
	result11,
	result12,
	result13,
	result14,
	result15,
	result16,
	result17,
	result18,
	result19,
	result20,
	result21,
	result22,
	result23,
	result24,
	result25,
	result26,
	result27,
	result28,
	result29,
	result30,
	result31,
	result32,
	result33,
	result34,
	result35,
	result36,
	result37,
	result38,
	result39,
	result40,
	result41,
	result42,
	result43,
	result44,
	result45,
	result46,
	result47,
	result48,
	result49,
	result50,
	result51,
	result52,
	result53,
	result54,
	result55,
	result56,
	result57,
	result58,
	result59,
	result60,
	result61,
	result62,
	result63}),
	.out_relu({final_result0,
	final_result1,
	final_result2,
	final_result3,
	final_result4,
	final_result5,
	final_result6,
	final_result7,
	final_result8,
	final_result9,
	final_result10,
	final_result11,
	final_result12,
	final_result13,
	final_result14,
	final_result15,
	final_result16,
	final_result17,
	final_result18,
	final_result19,
	final_result20,
	final_result21,
	final_result22,
	final_result23,
	final_result24,
	final_result25,
	final_result26,
	final_result27,
	final_result28,
	final_result29,
	final_result30,
	final_result31,
	final_result32,
	final_result33,
	final_result34,
	final_result35,
	final_result36,
	final_result37,
	final_result38,
	final_result39,
	final_result40,
	final_result41,
	final_result42,
	final_result43,
	final_result44,
	final_result45,
	final_result46,
	final_result47,
	final_result48,
	final_result49,
	final_result50,
	final_result51,
	final_result52,
	final_result53,
	final_result54,
	final_result55,
	final_result56,
	final_result57,
	final_result58,
	final_result59,
	final_result60,
	final_result61,
	final_result62,
	final_result63}));
endmodule
