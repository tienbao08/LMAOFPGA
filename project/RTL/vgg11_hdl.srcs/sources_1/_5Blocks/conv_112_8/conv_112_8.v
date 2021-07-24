`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:37:30
// Design Name: 
// Module Name: conv_112_8
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


module conv_112_8
    #(
    parameter in_bias0 = 32'b10111101010001011110000110010010,
	parameter in_bias1 = 32'b00111110000011000110100111101001,
	parameter in_bias2 = 32'b00111100110011011011011100001100,
	parameter in_bias3 = 32'b10111101011100001100010100100110,
	parameter in_bias4 = 32'b00111101100010000101010100110011,
	parameter in_bias5 = 32'b00111110000101010100010000000001,
	parameter in_bias6 = 32'b00111101010101100011000001011000,
	parameter in_bias7 = 32'b10111100110010100010101000011010,
    parameter data_width = 32
    )
    (
    clk,
    rst,
    dataIn0,
	dataIn1,
	dataIn2,
	dataIn3,
    final_result0,
	final_result1,
	final_result2,
	final_result3,
	final_result4,
	final_result5,
	final_result6,
	final_result7
    );
    
    input wire [data_width-1:0] dataIn0,
	dataIn1,
	dataIn2,
	dataIn3;
    input wire clk, rst;
    output wire [data_width-1:0] final_result0,
	final_result1,
	final_result2,
	final_result3,
	final_result4,
	final_result5,
	final_result6,
	final_result7;

    wire [data_width-1:0] result0,
	result1,
	result2,
	result3,
	result4,
	result5,
	result6,
	result7;
    wire [data_width-1:0] result0_0,
	result1_0,
	result2_0,
	result3_0,
	result4_0,
	result5_0,
	result6_0,
	result7_0,
	result0_1,
	result1_1,
	result2_1,
	result3_1,
	result4_1,
	result5_1,
	result6_1,
	result7_1,
	result0_2,
	result1_2,
	result2_2,
	result3_2,
	result4_2,
	result5_2,
	result6_2,
	result7_2,
	result0_3,
	result1_3,
	result2_3,
	result3_3,
	result4_3,
	result5_3,
	result6_3,
	result7_3;

conv_112_weight2_0 conv0(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn0), .result0(result0_0), .result1(result1_0), .result2(result2_0), .result3(result3_0), .result4(result4_0), .result5(result5_0), .result6(result6_0), .result7(result7_0));

conv_112_weight2_1 conv1(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn1), .result0(result0_1), .result1(result1_1), .result2(result2_1), .result3(result3_1), .result4(result4_1), .result5(result5_1), .result6(result6_1), .result7(result7_1));

conv_112_weight2_2 conv2(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn2), .result0(result0_2), .result1(result1_2), .result2(result2_2), .result3(result3_2), .result4(result4_2), .result5(result5_2), .result6(result6_2), .result7(result7_2));

conv_112_weight2_3 conv3(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn3), .result0(result0_3), .result1(result1_3), .result2(result2_3), .result3(result3_3), .result4(result4_3), .result5(result5_3), .result6(result6_3), .result7(result7_3));

bias_adder_112_8 #(in_bias0)
	ba0(.result(result0), .in_map0(result0_0), .in_map1(result0_1), .in_map2(result0_2), .in_map3(result0_3));

bias_adder_112_8 #(in_bias1)
	ba1(.result(result1), .in_map0(result1_0), .in_map1(result1_1), .in_map2(result1_2), .in_map3(result1_3));

bias_adder_112_8 #(in_bias2)
	ba2(.result(result2), .in_map0(result2_0), .in_map1(result2_1), .in_map2(result2_2), .in_map3(result2_3));

bias_adder_112_8 #(in_bias3)
	ba3(.result(result3), .in_map0(result3_0), .in_map1(result3_1), .in_map2(result3_2), .in_map3(result3_3));

bias_adder_112_8 #(in_bias4)
	ba4(.result(result4), .in_map0(result4_0), .in_map1(result4_1), .in_map2(result4_2), .in_map3(result4_3));

bias_adder_112_8 #(in_bias5)
	ba5(.result(result5), .in_map0(result5_0), .in_map1(result5_1), .in_map2(result5_2), .in_map3(result5_3));

bias_adder_112_8 #(in_bias6)
	ba6(.result(result6), .in_map0(result6_0), .in_map1(result6_1), .in_map2(result6_2), .in_map3(result6_3));

bias_adder_112_8 #(in_bias7)
	ba7(.result(result7), .in_map0(result7_0), .in_map1(result7_1), .in_map2(result7_2), .in_map3(result7_3));


relu relu_inst [0:7](
	.out_conv({result0,
	result1,
	result2,
	result3,
	result4,
	result5,
	result6,
	result7}),
	.out_relu({final_result0,
	final_result1,
	final_result2,
	final_result3,
	final_result4,
	final_result5,
	final_result6,
	final_result7}));
endmodule
