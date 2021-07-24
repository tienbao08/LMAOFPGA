`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:32:28
// Design Name: 
// Module Name: conv_56_16
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


module conv_56_16
    #(
    parameter in_bias0 = 32'b00111100100101111010111100010010,
	parameter in_bias1 = 32'b00111101100000011100101000100101,
	parameter in_bias2 = 32'b10111101110110110010001110010101,
	parameter in_bias3 = 32'b10111101100001001100100000110001,
	parameter in_bias4 = 32'b00111011100010101101011101110000,
	parameter in_bias5 = 32'b00111101110111011111011011101000,
	parameter in_bias6 = 32'b10111100101100111100010011010000,
	parameter in_bias7 = 32'b10111010011101100001101111101111,
	parameter in_bias8 = 32'b10111100110010001101111111001100,
	parameter in_bias9 = 32'b00111101101010001110000001110110,
	parameter in_bias10 = 32'b10111100101110100000110100110100,
	parameter in_bias11 = 32'b10111101110100111010001000110010,
	parameter in_bias12 = 32'b10111101110011101001101001100101,
	parameter in_bias13 = 32'b00111101100111101011100100101001,
	parameter in_bias14 = 32'b10111100000010001000010000001000,
	parameter in_bias15 = 32'b10111100001100100110100110000101,
    parameter data_width = 32
    )
    (
    clk,
    rst,
    dataIn0,
	dataIn1,
	dataIn2,
	dataIn3,
	dataIn4,
	dataIn5,
	dataIn6,
	dataIn7,
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
	final_result15
    );
    
    input wire [data_width-1:0] dataIn0,
	dataIn1,
	dataIn2,
	dataIn3,
	dataIn4,
	dataIn5,
	dataIn6,
	dataIn7;
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
	final_result15;

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
	result15;
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
	result0_3,
	result1_3,
	result2_3,
	result3_3,
	result4_3,
	result5_3,
	result6_3,
	result7_3,
	result8_3,
	result9_3,
	result10_3,
	result11_3,
	result12_3,
	result13_3,
	result14_3,
	result15_3,
	result0_4,
	result1_4,
	result2_4,
	result3_4,
	result4_4,
	result5_4,
	result6_4,
	result7_4,
	result8_4,
	result9_4,
	result10_4,
	result11_4,
	result12_4,
	result13_4,
	result14_4,
	result15_4,
	result0_5,
	result1_5,
	result2_5,
	result3_5,
	result4_5,
	result5_5,
	result6_5,
	result7_5,
	result8_5,
	result9_5,
	result10_5,
	result11_5,
	result12_5,
	result13_5,
	result14_5,
	result15_5,
	result0_6,
	result1_6,
	result2_6,
	result3_6,
	result4_6,
	result5_6,
	result6_6,
	result7_6,
	result8_6,
	result9_6,
	result10_6,
	result11_6,
	result12_6,
	result13_6,
	result14_6,
	result15_6,
	result0_7,
	result1_7,
	result2_7,
	result3_7,
	result4_7,
	result5_7,
	result6_7,
	result7_7,
	result8_7,
	result9_7,
	result10_7,
	result11_7,
	result12_7,
	result13_7,
	result14_7,
	result15_7;

conv_56_weight4_0 conv0(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn0), .result0(result0_0), .result1(result1_0), .result2(result2_0), .result3(result3_0), .result4(result4_0), .result5(result5_0), .result6(result6_0), .result7(result7_0), .result8(result8_0), .result9(result9_0), .result10(result10_0), .result11(result11_0), .result12(result12_0), .result13(result13_0), .result14(result14_0), .result15(result15_0));

conv_56_weight4_1 conv1(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn1), .result0(result0_1), .result1(result1_1), .result2(result2_1), .result3(result3_1), .result4(result4_1), .result5(result5_1), .result6(result6_1), .result7(result7_1), .result8(result8_1), .result9(result9_1), .result10(result10_1), .result11(result11_1), .result12(result12_1), .result13(result13_1), .result14(result14_1), .result15(result15_1));

conv_56_weight4_2 conv2(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn2), .result0(result0_2), .result1(result1_2), .result2(result2_2), .result3(result3_2), .result4(result4_2), .result5(result5_2), .result6(result6_2), .result7(result7_2), .result8(result8_2), .result9(result9_2), .result10(result10_2), .result11(result11_2), .result12(result12_2), .result13(result13_2), .result14(result14_2), .result15(result15_2));

conv_56_weight4_3 conv3(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn3), .result0(result0_3), .result1(result1_3), .result2(result2_3), .result3(result3_3), .result4(result4_3), .result5(result5_3), .result6(result6_3), .result7(result7_3), .result8(result8_3), .result9(result9_3), .result10(result10_3), .result11(result11_3), .result12(result12_3), .result13(result13_3), .result14(result14_3), .result15(result15_3));

conv_56_weight4_4 conv4(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn4), .result0(result0_4), .result1(result1_4), .result2(result2_4), .result3(result3_4), .result4(result4_4), .result5(result5_4), .result6(result6_4), .result7(result7_4), .result8(result8_4), .result9(result9_4), .result10(result10_4), .result11(result11_4), .result12(result12_4), .result13(result13_4), .result14(result14_4), .result15(result15_4));

conv_56_weight4_5 conv5(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn5), .result0(result0_5), .result1(result1_5), .result2(result2_5), .result3(result3_5), .result4(result4_5), .result5(result5_5), .result6(result6_5), .result7(result7_5), .result8(result8_5), .result9(result9_5), .result10(result10_5), .result11(result11_5), .result12(result12_5), .result13(result13_5), .result14(result14_5), .result15(result15_5));

conv_56_weight4_6 conv6(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn6), .result0(result0_6), .result1(result1_6), .result2(result2_6), .result3(result3_6), .result4(result4_6), .result5(result5_6), .result6(result6_6), .result7(result7_6), .result8(result8_6), .result9(result9_6), .result10(result10_6), .result11(result11_6), .result12(result12_6), .result13(result13_6), .result14(result14_6), .result15(result15_6));

conv_56_weight4_7 conv7(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn7), .result0(result0_7), .result1(result1_7), .result2(result2_7), .result3(result3_7), .result4(result4_7), .result5(result5_7), .result6(result6_7), .result7(result7_7), .result8(result8_7), .result9(result9_7), .result10(result10_7), .result11(result11_7), .result12(result12_7), .result13(result13_7), .result14(result14_7), .result15(result15_7));

bias_adder_56_16 #(in_bias0)
	ba0(.result(result0), .in_map0(result0_0), .in_map1(result0_1), .in_map2(result0_2), .in_map3(result0_3), .in_map4(result0_4), .in_map5(result0_5), .in_map6(result0_6), .in_map7(result0_7));

bias_adder_56_16 #(in_bias1)
	ba1(.result(result1), .in_map0(result1_0), .in_map1(result1_1), .in_map2(result1_2), .in_map3(result1_3), .in_map4(result1_4), .in_map5(result1_5), .in_map6(result1_6), .in_map7(result1_7));

bias_adder_56_16 #(in_bias2)
	ba2(.result(result2), .in_map0(result2_0), .in_map1(result2_1), .in_map2(result2_2), .in_map3(result2_3), .in_map4(result2_4), .in_map5(result2_5), .in_map6(result2_6), .in_map7(result2_7));

bias_adder_56_16 #(in_bias3)
	ba3(.result(result3), .in_map0(result3_0), .in_map1(result3_1), .in_map2(result3_2), .in_map3(result3_3), .in_map4(result3_4), .in_map5(result3_5), .in_map6(result3_6), .in_map7(result3_7));

bias_adder_56_16 #(in_bias4)
	ba4(.result(result4), .in_map0(result4_0), .in_map1(result4_1), .in_map2(result4_2), .in_map3(result4_3), .in_map4(result4_4), .in_map5(result4_5), .in_map6(result4_6), .in_map7(result4_7));

bias_adder_56_16 #(in_bias5)
	ba5(.result(result5), .in_map0(result5_0), .in_map1(result5_1), .in_map2(result5_2), .in_map3(result5_3), .in_map4(result5_4), .in_map5(result5_5), .in_map6(result5_6), .in_map7(result5_7));

bias_adder_56_16 #(in_bias6)
	ba6(.result(result6), .in_map0(result6_0), .in_map1(result6_1), .in_map2(result6_2), .in_map3(result6_3), .in_map4(result6_4), .in_map5(result6_5), .in_map6(result6_6), .in_map7(result6_7));

bias_adder_56_16 #(in_bias7)
	ba7(.result(result7), .in_map0(result7_0), .in_map1(result7_1), .in_map2(result7_2), .in_map3(result7_3), .in_map4(result7_4), .in_map5(result7_5), .in_map6(result7_6), .in_map7(result7_7));

bias_adder_56_16 #(in_bias8)
	ba8(.result(result8), .in_map0(result8_0), .in_map1(result8_1), .in_map2(result8_2), .in_map3(result8_3), .in_map4(result8_4), .in_map5(result8_5), .in_map6(result8_6), .in_map7(result8_7));

bias_adder_56_16 #(in_bias9)
	ba9(.result(result9), .in_map0(result9_0), .in_map1(result9_1), .in_map2(result9_2), .in_map3(result9_3), .in_map4(result9_4), .in_map5(result9_5), .in_map6(result9_6), .in_map7(result9_7));

bias_adder_56_16 #(in_bias10)
	ba10(.result(result10), .in_map0(result10_0), .in_map1(result10_1), .in_map2(result10_2), .in_map3(result10_3), .in_map4(result10_4), .in_map5(result10_5), .in_map6(result10_6), .in_map7(result10_7));

bias_adder_56_16 #(in_bias11)
	ba11(.result(result11), .in_map0(result11_0), .in_map1(result11_1), .in_map2(result11_2), .in_map3(result11_3), .in_map4(result11_4), .in_map5(result11_5), .in_map6(result11_6), .in_map7(result11_7));

bias_adder_56_16 #(in_bias12)
	ba12(.result(result12), .in_map0(result12_0), .in_map1(result12_1), .in_map2(result12_2), .in_map3(result12_3), .in_map4(result12_4), .in_map5(result12_5), .in_map6(result12_6), .in_map7(result12_7));

bias_adder_56_16 #(in_bias13)
	ba13(.result(result13), .in_map0(result13_0), .in_map1(result13_1), .in_map2(result13_2), .in_map3(result13_3), .in_map4(result13_4), .in_map5(result13_5), .in_map6(result13_6), .in_map7(result13_7));

bias_adder_56_16 #(in_bias14)
	ba14(.result(result14), .in_map0(result14_0), .in_map1(result14_1), .in_map2(result14_2), .in_map3(result14_3), .in_map4(result14_4), .in_map5(result14_5), .in_map6(result14_6), .in_map7(result14_7));

bias_adder_56_16 #(in_bias15)
	ba15(.result(result15), .in_map0(result15_0), .in_map1(result15_1), .in_map2(result15_2), .in_map3(result15_3), .in_map4(result15_4), .in_map5(result15_5), .in_map6(result15_6), .in_map7(result15_7));


relu relu_inst [0:15](
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
	result15}),
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
	final_result15}));
endmodule
