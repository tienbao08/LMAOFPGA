`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:37:30
// Design Name: 
// Module Name: conv_112_weight2_2
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


module conv_112_weight2_2
    #(
    parameter data_width = 32,
    parameter ram_depth = 7,
    parameter counter_depth = 9,
    parameter imgsize = 112,
    parameter in_weight0 = 32'b10111101010101010101011100101000,
	parameter in_weight1 = 32'b00111101000100001100110100010110,
	parameter in_weight2 = 32'b00111101101101011111000111111010,
	parameter in_weight3 = 32'b10111101011110000010101101010110,
	parameter in_weight4 = 32'b00111101110010101010010000101001,
	parameter in_weight5 = 32'b10111101111110101000010001100100,
	parameter in_weight6 = 32'b10111110000010010000000110000011,
	parameter in_weight7 = 32'b10111100101100001111011100100111,
	parameter in_weight8 = 32'b00111101101011110001010101111010,
	parameter in_weight9 = 32'b00111010100000011100000000010111,
	parameter in_weight10 = 32'b00111101100101101110101111110111,
	parameter in_weight11 = 32'b00111101000010101001100111010111,
	parameter in_weight12 = 32'b00111101101010001110111101111000,
	parameter in_weight13 = 32'b00111110000011010000100100010100,
	parameter in_weight14 = 32'b00111110000010011100000111001111,
	parameter in_weight15 = 32'b00111100110000001110100001111110,
	parameter in_weight16 = 32'b00111100110111101001001001111010,
	parameter in_weight17 = 32'b00111011101001100011111011111001,
	parameter in_weight18 = 32'b00111110000111100001111100100100,
	parameter in_weight19 = 32'b00111101100111100110100111100101,
	parameter in_weight20 = 32'b00111101111001000101101000100101,
	parameter in_weight21 = 32'b10111101010010011001101001111001,
	parameter in_weight22 = 32'b10111101011110110101010101100011,
	parameter in_weight23 = 32'b00111101111100100001000110100110,
	parameter in_weight24 = 32'b10111101001011100111110000101111,
	parameter in_weight25 = 32'b00111110001001111110000010101001,
	parameter in_weight26 = 32'b10111101101100100100001010100101,
	parameter in_weight27 = 32'b10111101100011110011001111100110,
	parameter in_weight28 = 32'b10111101100111101000011011010100,
	parameter in_weight29 = 32'b00111011011101011111010010110110,
	parameter in_weight30 = 32'b00111101101100011110011101000000,
	parameter in_weight31 = 32'b10111110000011100001100010000011,
	parameter in_weight32 = 32'b10111101100000110111111001110101,
	parameter in_weight33 = 32'b00111110000110010001100111101000,
	parameter in_weight34 = 32'b00111011110110101010011010010111,
	parameter in_weight35 = 32'b10111100110000101010000000111011,
	parameter in_weight36 = 32'b00111101101011000110011110111000,
	parameter in_weight37 = 32'b00111101111110111000000010010001,
	parameter in_weight38 = 32'b10111110000011011110100111101101,
	parameter in_weight39 = 32'b10111011110110100100101101000111,
	parameter in_weight40 = 32'b10111101110010010010101011110001,
	parameter in_weight41 = 32'b00111011100001010010111110100110,
	parameter in_weight42 = 32'b10111110000101001101101100100011,
	parameter in_weight43 = 32'b00111101101011010111000000111101,
	parameter in_weight44 = 32'b10111101011010001000010010100100,
	parameter in_weight45 = 32'b10111101111010111011100011100010,
	parameter in_weight46 = 32'b00111011100111101101001011001100,
	parameter in_weight47 = 32'b10111110000110101011111100000101,
	parameter in_weight48 = 32'b10111100110111010110110101000000,
	parameter in_weight49 = 32'b00111110000100000010011001100111,
	parameter in_weight50 = 32'b00111100010011110100100010101101,
	parameter in_weight51 = 32'b10111101111000001010111000110010,
	parameter in_weight52 = 32'b10111101110100001100100001010001,
	parameter in_weight53 = 32'b10111101101000010011011000000110,
	parameter in_weight54 = 32'b00111101001000100010101110001011,
	parameter in_weight55 = 32'b00111101111101110100011010010101,
	parameter in_weight56 = 32'b00111101100111011001110110101010,
	parameter in_weight57 = 32'b00111101100011111011011001100111,
	parameter in_weight58 = 32'b00111101101001011100001000101011,
	parameter in_weight59 = 32'b00111100101111100000010110010010,
	parameter in_weight60 = 32'b10111110000110011100000111110101,
	parameter in_weight61 = 32'b00111101110101110111111001001111,
	parameter in_weight62 = 32'b00111101100000010101000100110100,
	parameter in_weight63 = 32'b10111101110110010110101101000010,
	parameter in_weight64 = 32'b00111101001100100000111100001010,
	parameter in_weight65 = 32'b10111101011001010001100110000001,
	parameter in_weight66 = 32'b00111110001010110001001001111111,
	parameter in_weight67 = 32'b00111100101100101100110001001101,
	parameter in_weight68 = 32'b00111101000001111110111011000110,
	parameter in_weight69 = 32'b10111101110100010101110100110010,
	parameter in_weight70 = 32'b10111110000111100110110101001001,
	parameter in_weight71 = 32'b00111100000000001001001111010101
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
