`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 13:41:46
// Design Name: 
// Module Name: conv_224_4
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


module conv_224_4
    #(
    parameter in_bias0 = 32'b10111110000011110111011100011001,
	parameter in_bias1 = 32'b10111101111101000000111001110110,
	parameter in_bias2 = 32'b10111110000001000001010101010101,
	parameter in_bias3 = 32'b10111101111101011111110010011101,
    parameter data_width = 32
    )
    (
    clk,
    rst,
    dataIn0,
	dataIn1,
	dataIn2,
    final_result0,
	final_result1,
	final_result2,
	final_result3
    );
    
    input wire [data_width-1:0] dataIn0,
	dataIn1,
	dataIn2;
    input wire clk, rst;
    output wire [data_width-1:0] final_result0,
	final_result1,
	final_result2,
	final_result3;

    wire [data_width-1:0] result0,
	result1,
	result2,
	result3;
    wire [data_width-1:0] result0_0,
	result1_0,
	result2_0,
	result3_0,
	result0_1,
	result1_1,
	result2_1,
	result3_1,
	result0_2,
	result1_2,
	result2_2,
	result3_2;

conv_224_weight0_0 conv0(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn0), .result0(result0_0), .result1(result1_0), .result2(result2_0), .result3(result3_0));

conv_224_weight0_1 conv1(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn1), .result0(result0_1), .result1(result1_1), .result2(result2_1), .result3(result3_1));

conv_224_weight0_2 conv2(.counter(), .rowcounter(), .clk(clk), .rst(rst), .dataIn(dataIn2), .result0(result0_2), .result1(result1_2), .result2(result2_2), .result3(result3_2));

bias_adder_224_4 #(in_bias0)
	ba0(.result(result0), .in_map0(result0_0), .in_map1(result0_1), .in_map2(result0_2));

bias_adder_224_4 #(in_bias1)
	ba1(.result(result1), .in_map0(result1_0), .in_map1(result1_1), .in_map2(result1_2));

bias_adder_224_4 #(in_bias2)
	ba2(.result(result2), .in_map0(result2_0), .in_map1(result2_1), .in_map2(result2_2));

bias_adder_224_4 #(in_bias3)
	ba3(.result(result3), .in_map0(result3_0), .in_map1(result3_1), .in_map2(result3_2));


relu relu_inst [0:3](
	.out_conv({result0,
	result1,
	result2,
	result3}),
	.out_relu({final_result0,
	final_result1,
	final_result2,
	final_result3}));
endmodule
