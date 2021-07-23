`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:37:30
// Design Name: 
// Module Name: conv_112_weight2_0
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


module conv_112_weight2_0
    #(
    parameter data_width = 32,
    parameter ram_depth = 7,
    parameter counter_depth = 9,
    parameter imgsize = 112,
    parameter in_weight0 = 32'b00111101110001010110011110100011,
	parameter in_weight1 = 32'b00111101001011010011001100100100,
	parameter in_weight2 = 32'b10111100100101000010110110011100,
	parameter in_weight3 = 32'b10111100101000100110001110110100,
	parameter in_weight4 = 32'b10111101111010110010101100110110,
	parameter in_weight5 = 32'b10111110001000000000000000110011,
	parameter in_weight6 = 32'b00111110000110000010011010100010,
	parameter in_weight7 = 32'b00111101110111011010111011011101,
	parameter in_weight8 = 32'b10111101100010111101110001101111,
	parameter in_weight9 = 32'b00111100111101101100101010100011,
	parameter in_weight10 = 32'b00111101100101011100000101110000,
	parameter in_weight11 = 32'b10111101100000001110011000101010,
	parameter in_weight12 = 32'b00111101111011110001100110100000,
	parameter in_weight13 = 32'b00111101110110101111001110000000,
	parameter in_weight14 = 32'b00111101101110111111001111110001,
	parameter in_weight15 = 32'b10111101110000100010010110011101,
	parameter in_weight16 = 32'b00111101010000000111111100110110,
	parameter in_weight17 = 32'b00111110000101101111100010110100,
	parameter in_weight18 = 32'b00111101101101011110011001001001,
	parameter in_weight19 = 32'b10111101010111011001001001001011,
	parameter in_weight20 = 32'b00111101110111001101111011011111,
	parameter in_weight21 = 32'b10111101001111010010101110111101,
	parameter in_weight22 = 32'b00111101100010000101011010110111,
	parameter in_weight23 = 32'b10111100110111101000001111110111,
	parameter in_weight24 = 32'b10111101110111001000000100111001,
	parameter in_weight25 = 32'b00111101000110100000101001111001,
	parameter in_weight26 = 32'b10111101010010110100011010110101,
	parameter in_weight27 = 32'b10111101000110100101101000001000,
	parameter in_weight28 = 32'b00111101100110001101010011001001,
	parameter in_weight29 = 32'b10111101101000010100111011000010,
	parameter in_weight30 = 32'b10111110000110110000011010111000,
	parameter in_weight31 = 32'b10111101110100010010001000100101,
	parameter in_weight32 = 32'b00111110000000011100000100110110,
	parameter in_weight33 = 32'b10111101100000110110000101100001,
	parameter in_weight34 = 32'b00111100100100011111100001001000,
	parameter in_weight35 = 32'b00111101010000101011100011101000,
	parameter in_weight36 = 32'b00111101010011100001001111011011,
	parameter in_weight37 = 32'b10111101000101100000001001111100,
	parameter in_weight38 = 32'b00111101011001011000001100101001,
	parameter in_weight39 = 32'b10111100101101010000001100101110,
	parameter in_weight40 = 32'b10111101110110111100111010010111,
	parameter in_weight41 = 32'b10111100101001000010100000000110,
	parameter in_weight42 = 32'b10111101000100100110001010011001,
	parameter in_weight43 = 32'b10111101110110011010011101111101,
	parameter in_weight44 = 32'b00111101111001000011010110110101,
	parameter in_weight45 = 32'b10111101010101101010100001100011,
	parameter in_weight46 = 32'b10111101011010000101000110101001,
	parameter in_weight47 = 32'b00111101001000101011110111111010,
	parameter in_weight48 = 32'b10111011100110111101101011101010,
	parameter in_weight49 = 32'b00111101110111001001111010000110,
	parameter in_weight50 = 32'b00111101101010001110001101010001,
	parameter in_weight51 = 32'b00111101110011001010001111011110,
	parameter in_weight52 = 32'b10111101111110011001010100100010,
	parameter in_weight53 = 32'b00111101001010101001000011110010,
	parameter in_weight54 = 32'b10111101111101010010000010011110,
	parameter in_weight55 = 32'b00111101010111010111001110111111,
	parameter in_weight56 = 32'b00111110000101101100110101100011,
	parameter in_weight57 = 32'b10111101111000000101101001000011,
	parameter in_weight58 = 32'b00111110000011111001100111100110,
	parameter in_weight59 = 32'b10111101000101000000011010110111,
	parameter in_weight60 = 32'b00111100101101001100100011011000,
	parameter in_weight61 = 32'b10111110000000000100001011000101,
	parameter in_weight62 = 32'b10111101110010101001110100110000,
	parameter in_weight63 = 32'b10111100000001010110100010011110,
	parameter in_weight64 = 32'b10111010110100110011110001110010,
	parameter in_weight65 = 32'b10111110000101111100011010010011,
	parameter in_weight66 = 32'b00111101101011100000000100011010,
	parameter in_weight67 = 32'b00111101001010110110111001011011,
	parameter in_weight68 = 32'b00111100100000010000000000111001,
	parameter in_weight69 = 32'b10111101101101001000010010010111,
	parameter in_weight70 = 32'b10111101010001111010001011101111,
	parameter in_weight71 = 32'b00111100011101110111010010011110
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
