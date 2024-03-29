`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:37:30
// Design Name: 
// Module Name: conv_112_weight2_1
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


module conv_112_weight2_1
    #(
    parameter data_width = 32,
    parameter ram_depth = 7,
    parameter counter_depth = 9,
    parameter imgsize = 112,
    parameter in_weight0 = 32'b00111101111010101011000011111100,
	parameter in_weight1 = 32'b10111101100000000100100111111111,
	parameter in_weight2 = 32'b00111110000010111110010100000011,
	parameter in_weight3 = 32'b10111101101011010010000001111011,
	parameter in_weight4 = 32'b00111101001000000100000111010000,
	parameter in_weight5 = 32'b10111110000110111011111100000101,
	parameter in_weight6 = 32'b10111110000011000110110011101111,
	parameter in_weight7 = 32'b00111101001100001110111110000001,
	parameter in_weight8 = 32'b00111101101010010100000101000001,
	parameter in_weight9 = 32'b00111101100011000011100111100100,
	parameter in_weight10 = 32'b00111101111100010010000110010100,
	parameter in_weight11 = 32'b00111100101010000100110001000000,
	parameter in_weight12 = 32'b10111101011000010001100000101000,
	parameter in_weight13 = 32'b10111101111110111001100111110111,
	parameter in_weight14 = 32'b00111101100111011111101001001100,
	parameter in_weight15 = 32'b10111101001110011011011111000001,
	parameter in_weight16 = 32'b00111100100010011000010101001010,
	parameter in_weight17 = 32'b10111110000001110101000111001010,
	parameter in_weight18 = 32'b10111101110001001101001110001000,
	parameter in_weight19 = 32'b10111110000010010101111111001011,
	parameter in_weight20 = 32'b00111101110001101001111101101111,
	parameter in_weight21 = 32'b10111101111001000100110100001001,
	parameter in_weight22 = 32'b10111100110000001111110000000001,
	parameter in_weight23 = 32'b10111101011011110100010111101110,
	parameter in_weight24 = 32'b10111101001010011101100110100111,
	parameter in_weight25 = 32'b10111110000010000000111000100101,
	parameter in_weight26 = 32'b00111101011110001010101100111010,
	parameter in_weight27 = 32'b00111110000111000001010100001010,
	parameter in_weight28 = 32'b00111011011110101111011001110001,
	parameter in_weight29 = 32'b00111110001001101001010111001001,
	parameter in_weight30 = 32'b00111101010001110101110110010111,
	parameter in_weight31 = 32'b00111101001100111100101101000001,
	parameter in_weight32 = 32'b10111101010010000011110001010000,
	parameter in_weight33 = 32'b10111110001000001101100110111010,
	parameter in_weight34 = 32'b00111101011000110111101101000101,
	parameter in_weight35 = 32'b10111110000101010000101010001010,
	parameter in_weight36 = 32'b10111101000010011000110011111010,
	parameter in_weight37 = 32'b10111101101110100100111110000110,
	parameter in_weight38 = 32'b10111101001111111111110100011101,
	parameter in_weight39 = 32'b10111101110100110000111010011110,
	parameter in_weight40 = 32'b10111101011011111011001000010111,
	parameter in_weight41 = 32'b10111101010100101100001000001100,
	parameter in_weight42 = 32'b10111100001001011000101100111100,
	parameter in_weight43 = 32'b00111100111010101010011111100010,
	parameter in_weight44 = 32'b10111100101010011100001001011001,
	parameter in_weight45 = 32'b00111101011110011100001110011110,
	parameter in_weight46 = 32'b10111101100111001110101111010100,
	parameter in_weight47 = 32'b00111101011001011100011000001101,
	parameter in_weight48 = 32'b00111101110011001010100010111010,
	parameter in_weight49 = 32'b00111101011001011101001001000100,
	parameter in_weight50 = 32'b10111110001010000100000011100010,
	parameter in_weight51 = 32'b00111101100001001111110010110000,
	parameter in_weight52 = 32'b10111101001001101100001111100011,
	parameter in_weight53 = 32'b10111101110000000000010101110100,
	parameter in_weight54 = 32'b00111101001111101111100010010000,
	parameter in_weight55 = 32'b00111101010110100101010101100010,
	parameter in_weight56 = 32'b00111100111010101001111001001111,
	parameter in_weight57 = 32'b00111101110111110000111011001110,
	parameter in_weight58 = 32'b10111100110010111101110101100100,
	parameter in_weight59 = 32'b00111110001010000110001000001010,
	parameter in_weight60 = 32'b00111101110001110100010010001010,
	parameter in_weight61 = 32'b10111101000010100000011110011001,
	parameter in_weight62 = 32'b00111110000100110110100101001111,
	parameter in_weight63 = 32'b00111110001000011111000111110010,
	parameter in_weight64 = 32'b10111101100100110110010100011000,
	parameter in_weight65 = 32'b00111101101101101001100010101010,
	parameter in_weight66 = 32'b00111110001000011011100010101010,
	parameter in_weight67 = 32'b10111101101000000101100110001111,
	parameter in_weight68 = 32'b00111110001000111011011000110101,
	parameter in_weight69 = 32'b10111100110001111000110111110101,
	parameter in_weight70 = 32'b10111101101100111000011000100011,
	parameter in_weight71 = 32'b00111101010001101110000010000100
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
