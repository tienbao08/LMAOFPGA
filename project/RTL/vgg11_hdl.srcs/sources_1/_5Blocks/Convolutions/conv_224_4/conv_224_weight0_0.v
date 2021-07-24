`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 13:41:46
// Design Name: 
// Module Name: conv_224_weight0_0
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


module conv_224_weight0_0
    #(
    parameter data_width = 32,
    parameter ram_depth = 8,
    parameter counter_depth = 10,
    parameter imgsize = 224,
    parameter in_weight0 = 32'b10111101110101001000001111011010,
	parameter in_weight1 = 32'b10111101101111101011011000001110,
	parameter in_weight2 = 32'b10111110000000000010100010110000,
	parameter in_weight3 = 32'b10111100101000110010001101101001,
	parameter in_weight4 = 32'b10111100110001001010111101111101,
	parameter in_weight5 = 32'b10111101101000010100111110001000,
	parameter in_weight6 = 32'b00111110000111111001110100100100,
	parameter in_weight7 = 32'b00111101100100011000110000001110,
	parameter in_weight8 = 32'b00111101111000111111001011001000,
	parameter in_weight9 = 32'b00111100101000010101100101001010,
	parameter in_weight10 = 32'b00111110001111111010010111010001,
	parameter in_weight11 = 32'b10111110000001000101100100010101,
	parameter in_weight12 = 32'b10111100000111101110000100100010,
	parameter in_weight13 = 32'b10111101000111011111001111101011,
	parameter in_weight14 = 32'b10111101111111101110010110110001,
	parameter in_weight15 = 32'b00111110001001101100011111100100,
	parameter in_weight16 = 32'b00111101111100100010111111101101,
	parameter in_weight17 = 32'b00111101111011010110100100010110,
	parameter in_weight18 = 32'b00111110010101011011001100110110,
	parameter in_weight19 = 32'b10111101111101100111001010111000,
	parameter in_weight20 = 32'b00111101100100100000111101101011,
	parameter in_weight21 = 32'b00111100001000111000001110000111,
	parameter in_weight22 = 32'b10111100101111000001101101111011,
	parameter in_weight23 = 32'b00111110010000111010110110100011,
	parameter in_weight24 = 32'b00111101001010100001000010000110,
	parameter in_weight25 = 32'b10111101111010101100110101101111,
	parameter in_weight26 = 32'b00111101010000010000001000010001,
	parameter in_weight27 = 32'b10111110000110011101110100010101,
	parameter in_weight28 = 32'b10111110001010001101000111110001,
	parameter in_weight29 = 32'b00111101110010001111111101111100,
	parameter in_weight30 = 32'b00111110000111111111001001010011,
	parameter in_weight31 = 32'b00111110001011011001111010011010,
	parameter in_weight32 = 32'b00111101001011101010011010111010,
	parameter in_weight33 = 32'b00111100101011110001110100111001,
	parameter in_weight34 = 32'b10111101011111111101101101111001,
	parameter in_weight35 = 32'b10111110001010000110000010111110
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
