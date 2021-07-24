`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:37:30
// Design Name: 
// Module Name: conv_112_weight2_3
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


module conv_112_weight2_3
    #(
    parameter data_width = 32,
    parameter ram_depth = 7,
    parameter counter_depth = 9,
    parameter imgsize = 112,
    parameter in_weight0 = 32'b00111110000101111111111110000110,
	parameter in_weight1 = 32'b10111110000001101101000110101011,
	parameter in_weight2 = 32'b10111011101001100001011011010000,
	parameter in_weight3 = 32'b10111110000000000001110100100000,
	parameter in_weight4 = 32'b10111110000101111111011110111001,
	parameter in_weight5 = 32'b00111110001001100000000110110111,
	parameter in_weight6 = 32'b10111110000010000110001110010001,
	parameter in_weight7 = 32'b10111110001010010101111111000110,
	parameter in_weight8 = 32'b00111101011000011111010011110010,
	parameter in_weight9 = 32'b00111101111100101010111111011110,
	parameter in_weight10 = 32'b00111101000010101010000011011010,
	parameter in_weight11 = 32'b00111101100001011011110001001101,
	parameter in_weight12 = 32'b00111101110111100010001000011110,
	parameter in_weight13 = 32'b00111110000010010011101001111111,
	parameter in_weight14 = 32'b00111100100101001100001101010001,
	parameter in_weight15 = 32'b00111100100100110110100100110110,
	parameter in_weight16 = 32'b00111101011010010001011011101000,
	parameter in_weight17 = 32'b00111101011001011010100000111011,
	parameter in_weight18 = 32'b00111110000011011110101001101100,
	parameter in_weight19 = 32'b10111101001011001110010001010101,
	parameter in_weight20 = 32'b10111110000110011000000100110011,
	parameter in_weight21 = 32'b10111101100100100111100100001010,
	parameter in_weight22 = 32'b10111100001011011011010001100001,
	parameter in_weight23 = 32'b00111101101011000011000010010100,
	parameter in_weight24 = 32'b00111101100101000111111011110010,
	parameter in_weight25 = 32'b00111101111101101101101010110110,
	parameter in_weight26 = 32'b00111101111010011001001011011111,
	parameter in_weight27 = 32'b10111100011100010111010000111100,
	parameter in_weight28 = 32'b00111100110000011100000100000101,
	parameter in_weight29 = 32'b10111110001001010101111011110000,
	parameter in_weight30 = 32'b10111100101011101111101111110110,
	parameter in_weight31 = 32'b10111101101111101011001011010011,
	parameter in_weight32 = 32'b10111101111100110101000010110010,
	parameter in_weight33 = 32'b00111100111110001100001111100001,
	parameter in_weight34 = 32'b10111000101111011111100110110010,
	parameter in_weight35 = 32'b00111101101100110101001100001011,
	parameter in_weight36 = 32'b10111101110000001001001001101111,
	parameter in_weight37 = 32'b00111110001010000001011010111100,
	parameter in_weight38 = 32'b00111101111000011111101010101001,
	parameter in_weight39 = 32'b00111101001110100100010110100111,
	parameter in_weight40 = 32'b00111010100011100010111001111100,
	parameter in_weight41 = 32'b00111101001011100000100111011111,
	parameter in_weight42 = 32'b00111110001001110110011110001111,
	parameter in_weight43 = 32'b00111100000111111011111010111011,
	parameter in_weight44 = 32'b10111101110111100101001000110001,
	parameter in_weight45 = 32'b10111101110000010011100010000110,
	parameter in_weight46 = 32'b10111110001000010111010010010101,
	parameter in_weight47 = 32'b10111100101110101011101010001001,
	parameter in_weight48 = 32'b10111110000010100110001011101010,
	parameter in_weight49 = 32'b00111110000101011101100001011000,
	parameter in_weight50 = 32'b10111101110001101110111101000000,
	parameter in_weight51 = 32'b10111101001001111111000010111000,
	parameter in_weight52 = 32'b10111101011010101001111111000011,
	parameter in_weight53 = 32'b10111100110011101001010111110111,
	parameter in_weight54 = 32'b00111110000110101101100000110111,
	parameter in_weight55 = 32'b00111101110111100110011011100100,
	parameter in_weight56 = 32'b10111110000100000000111000000001,
	parameter in_weight57 = 32'b10111101111001100000000111011000,
	parameter in_weight58 = 32'b00111101001100100101101010001000,
	parameter in_weight59 = 32'b00111110000100110110000110011011,
	parameter in_weight60 = 32'b10111110001001000100011011010100,
	parameter in_weight61 = 32'b00111101000110111010100000011111,
	parameter in_weight62 = 32'b00111100111110000000101011101110,
	parameter in_weight63 = 32'b10111101110010011110100110001100,
	parameter in_weight64 = 32'b10111110000101010000011000011001,
	parameter in_weight65 = 32'b00111110001001001111010010110111,
	parameter in_weight66 = 32'b10111101001010001100001011010011,
	parameter in_weight67 = 32'b10111100001111101000101100000010,
	parameter in_weight68 = 32'b00111101000100001011000000110011,
	parameter in_weight69 = 32'b00111101110000111100100011100111,
	parameter in_weight70 = 32'b00111101101101101100010101111110,
	parameter in_weight71 = 32'b10111101101011100100110011010101
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
	result3,
	result4,
	result5,
	result6,
	result7
    );
    
    input wire [data_width-1:0] dataIn;
    input wire clk, rst;
    output wire [data_width-1:0] result0,
	result1,
	result2,
	result3,
	result4,
	result5,
	result6,
	result7;
    output wire [ram_depth-1:0] rowcounter;
    output wire [counter_depth-1:0] counter;
    
    wire [data_width-1:0] kernal0, kernal1, kernal2, kernal3, kernal4, kernal5, kernal6, kernal7, kernal8;
    
lineBuffer_112_conv #(data_width,
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

conv_core #(in_weight36, in_weight37, in_weight38, in_weight39, in_weight40, in_weight41, in_weight42, in_weight43, in_weight44)
			core4(.result(result4), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight45, in_weight46, in_weight47, in_weight48, in_weight49, in_weight50, in_weight51, in_weight52, in_weight53)
			core5(.result(result5), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight54, in_weight55, in_weight56, in_weight57, in_weight58, in_weight59, in_weight60, in_weight61, in_weight62)
			core6(.result(result6), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight63, in_weight64, in_weight65, in_weight66, in_weight67, in_weight68, in_weight69, in_weight70, in_weight71)
			core7(.result(result7), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

endmodule
