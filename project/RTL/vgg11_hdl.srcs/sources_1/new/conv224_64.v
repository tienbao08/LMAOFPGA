`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2021 10:50:04 AM
// Design Name: 
// Module Name: conv224_64
// Project Name: 
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


module conv224_64(
    result0,
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
    result63,
    counter_red,
    counter_green,
    counter_blue,
    rowcounter_red,
    rowcounter_green,
    rowcounter_blue,
    rst,
    clk,
    dataIn_red,
    dataIn_green,
    dataIn_blue
    );
    
    input wire [31:0] dataIn_red, dataIn_green, dataIn_blue;
    input wire clk, rst;
    output wire [9:0] counter_red, counter_green, counter_blue;
    output wire [7:0] rowcounter_red, rowcounter_green, rowcounter_blue;
    output wire [31:0] result0,
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
    wire [31:0] in_bias0,
in_bias1,
in_bias2,
in_bias3,
in_bias4,
in_bias5,
in_bias6,
in_bias7,
in_bias8,
in_bias9,
in_bias10,
in_bias11,
in_bias12,
in_bias13,
in_bias14,
in_bias15,
in_bias16,
in_bias17,
in_bias18,
in_bias19,
in_bias20,
in_bias21,
in_bias22,
in_bias23,
in_bias24,
in_bias25,
in_bias26,
in_bias27,
in_bias28,
in_bias29,
in_bias30,
in_bias31,
in_bias32,
in_bias33,
in_bias34,
in_bias35,
in_bias36,
in_bias37,
in_bias38,
in_bias39,
in_bias40,
in_bias41,
in_bias42,
in_bias43,
in_bias44,
in_bias45,
in_bias46,
in_bias47,
in_bias48,
in_bias49,
in_bias50,
in_bias51,
in_bias52,
in_bias53,
in_bias54,
in_bias55,
in_bias56,
in_bias57,
in_bias58,
in_bias59,
in_bias60,
in_bias61,
in_bias62,
in_bias63;

    wire [31:0] result0_red,
result1_red,
result2_red,
result3_red,
result4_red,
result5_red,
result6_red,
result7_red,
result8_red,
result9_red,
result10_red,
result11_red,
result12_red,
result13_red,
result14_red,
result15_red,
result16_red,
result17_red,
result18_red,
result19_red,
result20_red,
result21_red,
result22_red,
result23_red,
result24_red,
result25_red,
result26_red,
result27_red,
result28_red,
result29_red,
result30_red,
result31_red,
result32_red,
result33_red,
result34_red,
result35_red,
result36_red,
result37_red,
result38_red,
result39_red,
result40_red,
result41_red,
result42_red,
result43_red,
result44_red,
result45_red,
result46_red,
result47_red,
result48_red,
result49_red,
result50_red,
result51_red,
result52_red,
result53_red,
result54_red,
result55_red,
result56_red,
result57_red,
result58_red,
result59_red,
result60_red,
result61_red,
result62_red,
result63_red;

    wire [31:0] result0_green,
result1_green,
result2_green,
result3_green,
result4_green,
result5_green,
result6_green,
result7_green,
result8_green,
result9_green,
result10_green,
result11_green,
result12_green,
result13_green,
result14_green,
result15_green,
result16_green,
result17_green,
result18_green,
result19_green,
result20_green,
result21_green,
result22_green,
result23_green,
result24_green,
result25_green,
result26_green,
result27_green,
result28_green,
result29_green,
result30_green,
result31_green,
result32_green,
result33_green,
result34_green,
result35_green,
result36_green,
result37_green,
result38_green,
result39_green,
result40_green,
result41_green,
result42_green,
result43_green,
result44_green,
result45_green,
result46_green,
result47_green,
result48_green,
result49_green,
result50_green,
result51_green,
result52_green,
result53_green,
result54_green,
result55_green,
result56_green,
result57_green,
result58_green,
result59_green,
result60_green,
result61_green,
result62_green,
result63_green;

    wire [31:0] result0_blue,
result1_blue,
result2_blue,
result3_blue,
result4_blue,
result5_blue,
result6_blue,
result7_blue,
result8_blue,
result9_blue,
result10_blue,
result11_blue,
result12_blue,
result13_blue,
result14_blue,
result15_blue,
result16_blue,
result17_blue,
result18_blue,
result19_blue,
result20_blue,
result21_blue,
result22_blue,
result23_blue,
result24_blue,
result25_blue,
result26_blue,
result27_blue,
result28_blue,
result29_blue,
result30_blue,
result31_blue,
result32_blue,
result33_blue,
result34_blue,
result35_blue,
result36_blue,
result37_blue,
result38_blue,
result39_blue,
result40_blue,
result41_blue,
result42_blue,
result43_blue,
result44_blue,
result45_blue,
result46_blue,
result47_blue,
result48_blue,
result49_blue,
result50_blue,
result51_blue,
result52_blue,
result53_blue,
result54_blue,
result55_blue,
result56_blue,
result57_blue,
result58_blue,
result59_blue,
result60_blue,
result61_blue,
result62_blue,
result63_blue;

conv224_64_red red_inst(
    .result0(result0_red),
	.result1(result1_red),
	.result2(result2_red),
	.result3(result3_red),
	.result4(result4_red),
	.result5(result5_red),
	.result6(result6_red),
	.result7(result7_red),
	.result8(result8_red),
	.result9(result9_red),
	.result10(result10_red),
	.result11(result11_red),
	.result12(result12_red),
	.result13(result13_red),
	.result14(result14_red),
	.result15(result15_red),
	.result16(result16_red),
	.result17(result17_red),
	.result18(result18_red),
	.result19(result19_red),
	.result20(result20_red),
	.result21(result21_red),
	.result22(result22_red),
	.result23(result23_red),
	.result24(result24_red),
	.result25(result25_red),
	.result26(result26_red),
	.result27(result27_red),
	.result28(result28_red),
	.result29(result29_red),
	.result30(result30_red),
	.result31(result31_red),
	.result32(result32_red),
	.result33(result33_red),
	.result34(result34_red),
	.result35(result35_red),
	.result36(result36_red),
	.result37(result37_red),
	.result38(result38_red),
	.result39(result39_red),
	.result40(result40_red),
	.result41(result41_red),
	.result42(result42_red),
	.result43(result43_red),
	.result44(result44_red),
	.result45(result45_red),
	.result46(result46_red),
	.result47(result47_red),
	.result48(result48_red),
	.result49(result49_red),
	.result50(result50_red),
	.result51(result51_red),
	.result52(result52_red),
	.result53(result53_red),
	.result54(result54_red),
	.result55(result55_red),
	.result56(result56_red),
	.result57(result57_red),
	.result58(result58_red),
	.result59(result59_red),
	.result60(result60_red),
	.result61(result61_red),
	.result62(result62_red),
	.result63(result63_red),
    .counter(counter_red),
    .rowcounter(rowcounter_red),
    .rst(rst),
    .clk(clk),
    .dataIn(dataIn_red)
    );
    
conv224_64_green green_inst(
    .result0(result0_green),
	.result1(result1_green),
	.result2(result2_green),
	.result3(result3_green),
	.result4(result4_green),
	.result5(result5_green),
	.result6(result6_green),
	.result7(result7_green),
	.result8(result8_green),
	.result9(result9_green),
	.result10(result10_green),
	.result11(result11_green),
	.result12(result12_green),
	.result13(result13_green),
	.result14(result14_green),
	.result15(result15_green),
	.result16(result16_green),
	.result17(result17_green),
	.result18(result18_green),
	.result19(result19_green),
	.result20(result20_green),
	.result21(result21_green),
	.result22(result22_green),
	.result23(result23_green),
	.result24(result24_green),
	.result25(result25_green),
	.result26(result26_green),
	.result27(result27_green),
	.result28(result28_green),
	.result29(result29_green),
	.result30(result30_green),
	.result31(result31_green),
	.result32(result32_green),
	.result33(result33_green),
	.result34(result34_green),
	.result35(result35_green),
	.result36(result36_green),
	.result37(result37_green),
	.result38(result38_green),
	.result39(result39_green),
	.result40(result40_green),
	.result41(result41_green),
	.result42(result42_green),
	.result43(result43_green),
	.result44(result44_green),
	.result45(result45_green),
	.result46(result46_green),
	.result47(result47_green),
	.result48(result48_green),
	.result49(result49_green),
	.result50(result50_green),
	.result51(result51_green),
	.result52(result52_green),
	.result53(result53_green),
	.result54(result54_green),
	.result55(result55_green),
	.result56(result56_green),
	.result57(result57_green),
	.result58(result58_green),
	.result59(result59_green),
	.result60(result60_green),
	.result61(result61_green),
	.result62(result62_green),
	.result63(result63_green),
    .counter(counter_green),
    .rowcounter(rowcounter_green),
    .rst(rst),
    .clk(clk),
    .dataIn(dataIn_green)
    );
    
conv224_64_blue blue_inst(
    .result0(result0_blue),
	.result1(result1_blue),
	.result2(result2_blue),
	.result3(result3_blue),
	.result4(result4_blue),
	.result5(result5_blue),
	.result6(result6_blue),
	.result7(result7_blue),
	.result8(result8_blue),
	.result9(result9_blue),
	.result10(result10_blue),
	.result11(result11_blue),
	.result12(result12_blue),
	.result13(result13_blue),
	.result14(result14_blue),
	.result15(result15_blue),
	.result16(result16_blue),
	.result17(result17_blue),
	.result18(result18_blue),
	.result19(result19_blue),
	.result20(result20_blue),
	.result21(result21_blue),
	.result22(result22_blue),
	.result23(result23_blue),
	.result24(result24_blue),
	.result25(result25_blue),
	.result26(result26_blue),
	.result27(result27_blue),
	.result28(result28_blue),
	.result29(result29_blue),
	.result30(result30_blue),
	.result31(result31_blue),
	.result32(result32_blue),
	.result33(result33_blue),
	.result34(result34_blue),
	.result35(result35_blue),
	.result36(result36_blue),
	.result37(result37_blue),
	.result38(result38_blue),
	.result39(result39_blue),
	.result40(result40_blue),
	.result41(result41_blue),
	.result42(result42_blue),
	.result43(result43_blue),
	.result44(result44_blue),
	.result45(result45_blue),
	.result46(result46_blue),
	.result47(result47_blue),
	.result48(result48_blue),
	.result49(result49_blue),
	.result50(result50_blue),
	.result51(result51_blue),
	.result52(result52_blue),
	.result53(result53_blue),
	.result54(result54_blue),
	.result55(result55_blue),
	.result56(result56_blue),
	.result57(result57_blue),
	.result58(result58_blue),
	.result59(result59_blue),
	.result60(result60_blue),
	.result61(result61_blue),
	.result62(result62_blue),
	.result63(result63_blue),
    .counter(counter_blue),
    .rowcounter(rowcounter_blue),
    .rst(rst),
    .clk(clk),
    .dataIn(dataIn_blue)
    );
    
bias_adder_224_64 ba0[0:63](
    .result({result0,
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
    .in0({result0_red,
result1_red,
result2_red,
result3_red,
result4_red,
result5_red,
result6_red,
result7_red,
result8_red,
result9_red,
result10_red,
result11_red,
result12_red,
result13_red,
result14_red,
result15_red,
result16_red,
result17_red,
result18_red,
result19_red,
result20_red,
result21_red,
result22_red,
result23_red,
result24_red,
result25_red,
result26_red,
result27_red,
result28_red,
result29_red,
result30_red,
result31_red,
result32_red,
result33_red,
result34_red,
result35_red,
result36_red,
result37_red,
result38_red,
result39_red,
result40_red,
result41_red,
result42_red,
result43_red,
result44_red,
result45_red,
result46_red,
result47_red,
result48_red,
result49_red,
result50_red,
result51_red,
result52_red,
result53_red,
result54_red,
result55_red,
result56_red,
result57_red,
result58_red,
result59_red,
result60_red,
result61_red,
result62_red,
result63_red}),
    .in1({result0_green,
result1_green,
result2_green,
result3_green,
result4_green,
result5_green,
result6_green,
result7_green,
result8_green,
result9_green,
result10_green,
result11_green,
result12_green,
result13_green,
result14_green,
result15_green,
result16_green,
result17_green,
result18_green,
result19_green,
result20_green,
result21_green,
result22_green,
result23_green,
result24_green,
result25_green,
result26_green,
result27_green,
result28_green,
result29_green,
result30_green,
result31_green,
result32_green,
result33_green,
result34_green,
result35_green,
result36_green,
result37_green,
result38_green,
result39_green,
result40_green,
result41_green,
result42_green,
result43_green,
result44_green,
result45_green,
result46_green,
result47_green,
result48_green,
result49_green,
result50_green,
result51_green,
result52_green,
result53_green,
result54_green,
result55_green,
result56_green,
result57_green,
result58_green,
result59_green,
result60_green,
result61_green,
result62_green,
result63_green}),
    .in2({result0_blue,
result1_blue,
result2_blue,
result3_blue,
result4_blue,
result5_blue,
result6_blue,
result7_blue,
result8_blue,
result9_blue,
result10_blue,
result11_blue,
result12_blue,
result13_blue,
result14_blue,
result15_blue,
result16_blue,
result17_blue,
result18_blue,
result19_blue,
result20_blue,
result21_blue,
result22_blue,
result23_blue,
result24_blue,
result25_blue,
result26_blue,
result27_blue,
result28_blue,
result29_blue,
result30_blue,
result31_blue,
result32_blue,
result33_blue,
result34_blue,
result35_blue,
result36_blue,
result37_blue,
result38_blue,
result39_blue,
result40_blue,
result41_blue,
result42_blue,
result43_blue,
result44_blue,
result45_blue,
result46_blue,
result47_blue,
result48_blue,
result49_blue,
result50_blue,
result51_blue,
result52_blue,
result53_blue,
result54_blue,
result55_blue,
result56_blue,
result57_blue,
result58_blue,
result59_blue,
result60_blue,
result61_blue,
result62_blue,
result63_blue}),
    .in_bias({in_bias0,
in_bias1,
in_bias2,
in_bias3,
in_bias4,
in_bias5,
in_bias6,
in_bias7,
in_bias8,
in_bias9,
in_bias10,
in_bias11,
in_bias12,
in_bias13,
in_bias14,
in_bias15,
in_bias16,
in_bias17,
in_bias18,
in_bias19,
in_bias20,
in_bias21,
in_bias22,
in_bias23,
in_bias24,
in_bias25,
in_bias26,
in_bias27,
in_bias28,
in_bias29,
in_bias30,
in_bias31,
in_bias32,
in_bias33,
in_bias34,
in_bias35,
in_bias36,
in_bias37,
in_bias38,
in_bias39,
in_bias40,
in_bias41,
in_bias42,
in_bias43,
in_bias44,
in_bias45,
in_bias46,
in_bias47,
in_bias48,
in_bias49,
in_bias50,
in_bias51,
in_bias52,
in_bias53,
in_bias54,
in_bias55,
in_bias56,
in_bias57,
in_bias58,
in_bias59,
in_bias60,
in_bias61,
in_bias62,
in_bias63})
    );
    
ROM_bias_224_64 bias0(
    .out({in_bias0,
in_bias1,
in_bias2,
in_bias3,
in_bias4,
in_bias5,
in_bias6,
in_bias7,
in_bias8,
in_bias9,
in_bias10,
in_bias11,
in_bias12,
in_bias13,
in_bias14,
in_bias15,
in_bias16,
in_bias17,
in_bias18,
in_bias19,
in_bias20,
in_bias21,
in_bias22,
in_bias23,
in_bias24,
in_bias25,
in_bias26,
in_bias27,
in_bias28,
in_bias29,
in_bias30,
in_bias31,
in_bias32,
in_bias33,
in_bias34,
in_bias35,
in_bias36,
in_bias37,
in_bias38,
in_bias39,
in_bias40,
in_bias41,
in_bias42,
in_bias43,
in_bias44,
in_bias45,
in_bias46,
in_bias47,
in_bias48,
in_bias49,
in_bias50,
in_bias51,
in_bias52,
in_bias53,
in_bias54,
in_bias55,
in_bias56,
in_bias57,
in_bias58,
in_bias59,
in_bias60,
in_bias61,
in_bias62,
in_bias63})
    );
endmodule
