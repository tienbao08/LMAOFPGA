`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 13:41:46
// Design Name: 
// Module Name: conv_224_weight0_2
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


module conv_224_weight0_2
    #(
    parameter data_width = 32,
    parameter ram_depth = 8,
    parameter counter_depth = 10,
    parameter imgsize = 224,
    parameter in_weight0 = 32'b10111101001000001111010001111100,
	parameter in_weight1 = 32'b00111101111110100100001111100001,
	parameter in_weight2 = 32'b10111101101010011011010010011101,
	parameter in_weight3 = 32'b10111110000010001111011000111101,
	parameter in_weight4 = 32'b00111100100111000100000100100101,
	parameter in_weight5 = 32'b10111110001010101001101100101110,
	parameter in_weight6 = 32'b00111101001001000101011101110011,
	parameter in_weight7 = 32'b10111110001101111011111000111111,
	parameter in_weight8 = 32'b00111110001001000000001111010101,
	parameter in_weight9 = 32'b10111100100010011001100011110011,
	parameter in_weight10 = 32'b10111101010111000101001111110000,
	parameter in_weight11 = 32'b10111110000011011100110010001000,
	parameter in_weight12 = 32'b10111110001011000100100001101011,
	parameter in_weight13 = 32'b10111101000110000100000101100100,
	parameter in_weight14 = 32'b10111101000110101010000000000011,
	parameter in_weight15 = 32'b00111101101110100000010111101010,
	parameter in_weight16 = 32'b00111110000111000100011000111010,
	parameter in_weight17 = 32'b10111110000000110011011110011010,
	parameter in_weight18 = 32'b10111101001100101111001100101111,
	parameter in_weight19 = 32'b10111110001100011000010101111011,
	parameter in_weight20 = 32'b10111101111110101011010100111011,
	parameter in_weight21 = 32'b10111101111011111111011100101011,
	parameter in_weight22 = 32'b00111101011101000111111011010100,
	parameter in_weight23 = 32'b10111101111110100110101000010101,
	parameter in_weight24 = 32'b00111101101011101010010010000110,
	parameter in_weight25 = 32'b10111110000111111000110000100110,
	parameter in_weight26 = 32'b10111101011110000110100111010001,
	parameter in_weight27 = 32'b10111110000010100100010111101010,
	parameter in_weight28 = 32'b10111101011100110010101110101100,
	parameter in_weight29 = 32'b00111101111101001100100001010011,
	parameter in_weight30 = 32'b00111101010110111100000110111010,
	parameter in_weight31 = 32'b10111101001000011110000001000001,
	parameter in_weight32 = 32'b10111110000011001001110101101011,
	parameter in_weight33 = 32'b10111011011010101101110111010101,
	parameter in_weight34 = 32'b10111101110101111101000101110110,
	parameter in_weight35 = 32'b10111110010000000000111101110110
    )
    (
    counter,
    rowcounter,
    clk,
    rst,
    dataIn,
    result0,
	result1,
	result2,
	result3
    );
    
    input wire [data_width-1:0] dataIn;
    input wire clk, rst;
    output wire [data_width-1:0] result0,
	result1,
	result2,
	result3;
    output wire [ram_depth-1:0] rowcounter;
    output wire [counter_depth-1:0] counter;
    
    wire [data_width-1:0] kernal0, kernal1, kernal2, kernal3, kernal4, kernal5, kernal6, kernal7, kernal8;
    
lineBuffer_224_conv #(data_width,
                  ram_depth,
                  counter_depth,
                  imgsize)
                  lineB0(
    .dataOut_0(kernal0),
    .dataOut_1(kernal1),
    .dataOut_2(kernal2),
    .dataOut_3(kernal3),
    .dataOut_4(kernal4),
    .dataOut_5(kernal5),
    .dataOut_6(kernal6),
    .dataOut_7(kernal7),
    .dataOut_8(kernal8),
    .counter(counter),
    .rowcounter(rowcounter),
    .clk(clk),
    .rst(rst),
    .dataIn(dataIn)
    ); 
    
conv_core #(in_weight0, in_weight1, in_weight2, in_weight3, in_weight4, in_weight5, in_weight6, in_weight7, in_weight8)
			core0(.result(result0), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight9, in_weight10, in_weight11, in_weight12, in_weight13, in_weight14, in_weight15, in_weight16, in_weight17)
			core1(.result(result1), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight18, in_weight19, in_weight20, in_weight21, in_weight22, in_weight23, in_weight24, in_weight25, in_weight26)
			core2(.result(result2), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight27, in_weight28, in_weight29, in_weight30, in_weight31, in_weight32, in_weight33, in_weight34, in_weight35)
			core3(.result(result3), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

endmodule
