`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:32:28
// Design Name: 
// Module Name: conv_56_weight4_6
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


module conv_56_weight4_6
    #(
    parameter data_width = 32,
    parameter ram_depth = 6,
    parameter counter_depth = 8,
    parameter imgsize = 56,
    parameter in_weight0 = 32'b10111101100010110101100111101111,
	parameter in_weight1 = 32'b00111101110101111000111001001101,
	parameter in_weight2 = 32'b10111101100111010101010111010101,
	parameter in_weight3 = 32'b10111101110110110010110111110000,
	parameter in_weight4 = 32'b00111011011101001100110001010101,
	parameter in_weight5 = 32'b10111100100111101000011110001000,
	parameter in_weight6 = 32'b00111101101010110000001110100010,
	parameter in_weight7 = 32'b10111101110011110011011111101000,
	parameter in_weight8 = 32'b00111100011000001111100010011111,
	parameter in_weight9 = 32'b00111101010001011010110001000110,
	parameter in_weight10 = 32'b10111101011110101100111100111000,
	parameter in_weight11 = 32'b00111101101001000101111000000011,
	parameter in_weight12 = 32'b00111101000111100001011000001110,
	parameter in_weight13 = 32'b10111101001011011010000000101000,
	parameter in_weight14 = 32'b10111100010100110010100001001010,
	parameter in_weight15 = 32'b10111101110010000001001010000110,
	parameter in_weight16 = 32'b00111100100110101111011011101000,
	parameter in_weight17 = 32'b00111101111100010111110110101111,
	parameter in_weight18 = 32'b00111101011101101101110101011101,
	parameter in_weight19 = 32'b10111101100110100011100001110110,
	parameter in_weight20 = 32'b00111101101001010010111111011100,
	parameter in_weight21 = 32'b00111101010000110000101110101111,
	parameter in_weight22 = 32'b10111101100100000010111011111001,
	parameter in_weight23 = 32'b00111101110100101110001110101010,
	parameter in_weight24 = 32'b10111101001110010001101101010101,
	parameter in_weight25 = 32'b10111101111000000010001000100111,
	parameter in_weight26 = 32'b00111100101111001001101010110011,
	parameter in_weight27 = 32'b00111101011011101011011000100000,
	parameter in_weight28 = 32'b00111101111110001100001110000101,
	parameter in_weight29 = 32'b10111101010100101000100100000001,
	parameter in_weight30 = 32'b00111101011111010001111000100011,
	parameter in_weight31 = 32'b10111101111001100100010101001100,
	parameter in_weight32 = 32'b10111011110111000000000000010001,
	parameter in_weight33 = 32'b00111101111010011010000010011111,
	parameter in_weight34 = 32'b00111101011011101011101000110001,
	parameter in_weight35 = 32'b00111101110101110100010010010110,
	parameter in_weight36 = 32'b00111101000010011010001000011010,
	parameter in_weight37 = 32'b00111100001111100000001110011011,
	parameter in_weight38 = 32'b10111101101011010111011101000110,
	parameter in_weight39 = 32'b00111101101010101011000101011100,
	parameter in_weight40 = 32'b00111101111001000011011100001010,
	parameter in_weight41 = 32'b00111101101011010110111000010100,
	parameter in_weight42 = 32'b10111101100001001101110001001110,
	parameter in_weight43 = 32'b10111101000110101000110011011101,
	parameter in_weight44 = 32'b00111101011001111101001101010011,
	parameter in_weight45 = 32'b00111100110010001110001010100011,
	parameter in_weight46 = 32'b10111101111011110100010011010010,
	parameter in_weight47 = 32'b00111100111000101100001001100011,
	parameter in_weight48 = 32'b00111100111101100010110110011011,
	parameter in_weight49 = 32'b10111100110101110011101110000011,
	parameter in_weight50 = 32'b00111100110100110110000000011110,
	parameter in_weight51 = 32'b10111100100111011111010011100011,
	parameter in_weight52 = 32'b00111101110101010011001011101000,
	parameter in_weight53 = 32'b10111100001101011111001110101010,
	parameter in_weight54 = 32'b00111101110100110001111001011001,
	parameter in_weight55 = 32'b00111100001001101011111001011101,
	parameter in_weight56 = 32'b00111101100001101011011001100000,
	parameter in_weight57 = 32'b00111101001001100000100011100111,
	parameter in_weight58 = 32'b00111101010100110101000001000111,
	parameter in_weight59 = 32'b00111100101100001100111101111010,
	parameter in_weight60 = 32'b10111100011000001000110100110000,
	parameter in_weight61 = 32'b00111101001111001000101011010110,
	parameter in_weight62 = 32'b00111101010011111000100101100000,
	parameter in_weight63 = 32'b00111100110000101011000000111110,
	parameter in_weight64 = 32'b00111100111011101101101111000100,
	parameter in_weight65 = 32'b10111101101000111010011100011000,
	parameter in_weight66 = 32'b00111101100011111011110111110101,
	parameter in_weight67 = 32'b00111011111111101011011010100011,
	parameter in_weight68 = 32'b10111101101001011000011110100100,
	parameter in_weight69 = 32'b10111101111011011000000000111011,
	parameter in_weight70 = 32'b00111101100100101101001001001100,
	parameter in_weight71 = 32'b00111101000011111001100010010111,
	parameter in_weight72 = 32'b00111101101001010101110111000100,
	parameter in_weight73 = 32'b00111101001010010010011101111001,
	parameter in_weight74 = 32'b10111100001000100111011111101010,
	parameter in_weight75 = 32'b00111101100011001001101100100101,
	parameter in_weight76 = 32'b10111101000000011011010011110110,
	parameter in_weight77 = 32'b10111101110100011100100100111010,
	parameter in_weight78 = 32'b10111100111101001011100001100111,
	parameter in_weight79 = 32'b10111101110100010010101011000101,
	parameter in_weight80 = 32'b10111100011111000010111100010011,
	parameter in_weight81 = 32'b00111101111011100111101101100100,
	parameter in_weight82 = 32'b00111101000010011001000101010000,
	parameter in_weight83 = 32'b10111101000100110011110000100011,
	parameter in_weight84 = 32'b10111101101111010010100110101111,
	parameter in_weight85 = 32'b00111101111000001001100001011101,
	parameter in_weight86 = 32'b00111101111100100111000101001111,
	parameter in_weight87 = 32'b00111101011100000101111100010000,
	parameter in_weight88 = 32'b00111101110010111111011001000001,
	parameter in_weight89 = 32'b00111001110001001011111011101110,
	parameter in_weight90 = 32'b00111101011110000111001100111111,
	parameter in_weight91 = 32'b10111101110011101100011010000101,
	parameter in_weight92 = 32'b10111100100010010001010000111100,
	parameter in_weight93 = 32'b10111100000100000100111001101111,
	parameter in_weight94 = 32'b00111101101111001011001011000100,
	parameter in_weight95 = 32'b00111101001111001010001101100110,
	parameter in_weight96 = 32'b00111101100011010001000101011011,
	parameter in_weight97 = 32'b00111100011010010111001101010111,
	parameter in_weight98 = 32'b00111101011011000101000001010110,
	parameter in_weight99 = 32'b00111011001100010110011100101101,
	parameter in_weight100 = 32'b00111101011111001100001110011001,
	parameter in_weight101 = 32'b00111101111000111100011000000000,
	parameter in_weight102 = 32'b10111101100100110011111000100101,
	parameter in_weight103 = 32'b00111101101010000001100111000111,
	parameter in_weight104 = 32'b10111101010001000000000110110001,
	parameter in_weight105 = 32'b00111101101111100101010110010011,
	parameter in_weight106 = 32'b10111011100000110110010101000111,
	parameter in_weight107 = 32'b00111100000100010000000001000100,
	parameter in_weight108 = 32'b10111101001010011100001000101010,
	parameter in_weight109 = 32'b10111101100110010111000101101010,
	parameter in_weight110 = 32'b10111101001011000100100011011110,
	parameter in_weight111 = 32'b10111011000001010001101010100100,
	parameter in_weight112 = 32'b10111100110111100111111000111110,
	parameter in_weight113 = 32'b00111101100110000011001000111000,
	parameter in_weight114 = 32'b00111101111100100110011011000011,
	parameter in_weight115 = 32'b00111101110011010000011001111000,
	parameter in_weight116 = 32'b00111101101110011111000001101000,
	parameter in_weight117 = 32'b10111100101010011110101110111011,
	parameter in_weight118 = 32'b00111101000010110001010010010101,
	parameter in_weight119 = 32'b00111101001111111011110000111000,
	parameter in_weight120 = 32'b10111101100100000000011001000011,
	parameter in_weight121 = 32'b10111101101111111111001111000001,
	parameter in_weight122 = 32'b00111101100011010111010101101000,
	parameter in_weight123 = 32'b10111101101101011001010001010010,
	parameter in_weight124 = 32'b10111101111011100001111100110110,
	parameter in_weight125 = 32'b00111100111100001001010000001101,
	parameter in_weight126 = 32'b00111101001011011000010001000010,
	parameter in_weight127 = 32'b00111101101111001110011011000011,
	parameter in_weight128 = 32'b00111101101011111000110010011111,
	parameter in_weight129 = 32'b10111101001001000111101001111000,
	parameter in_weight130 = 32'b10111101000101111001100011010000,
	parameter in_weight131 = 32'b00111101110011010100110010110001,
	parameter in_weight132 = 32'b00111101110110001111110001101111,
	parameter in_weight133 = 32'b00111100000111100111101100000011,
	parameter in_weight134 = 32'b00111101000000011010101011010101,
	parameter in_weight135 = 32'b10111100001101101010100001011111,
	parameter in_weight136 = 32'b00111100011001100000101100110100,
	parameter in_weight137 = 32'b00111101111000001101111001110010,
	parameter in_weight138 = 32'b10111100100001111111100001111111,
	parameter in_weight139 = 32'b10111101111000111011111011110101,
	parameter in_weight140 = 32'b00111101100011110110011010101000,
	parameter in_weight141 = 32'b00111101110000100111001110000000,
	parameter in_weight142 = 32'b00111100111001110001011111001000,
	parameter in_weight143 = 32'b00111101101100010101110101100101
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
	result7,
	result8,
	result9,
	result10,
	result11,
	result12,
	result13,
	result14,
	result15
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
	result7,
	result8,
	result9,
	result10,
	result11,
	result12,
	result13,
	result14,
	result15;
    output wire [ram_depth-1:0] rowcounter;
    output wire [counter_depth-1:0] counter;
    
    wire [data_width-1:0] kernal0, kernal1, kernal2, kernal3, kernal4, kernal5, kernal6, kernal7, kernal8;
    
lineBuffer_56_conv #(data_width,
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

conv_core #(in_weight72, in_weight73, in_weight74, in_weight75, in_weight76, in_weight77, in_weight78, in_weight79, in_weight80)
			core8(.result(result8), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight81, in_weight82, in_weight83, in_weight84, in_weight85, in_weight86, in_weight87, in_weight88, in_weight89)
			core9(.result(result9), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight90, in_weight91, in_weight92, in_weight93, in_weight94, in_weight95, in_weight96, in_weight97, in_weight98)
			core10(.result(result10), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight99, in_weight100, in_weight101, in_weight102, in_weight103, in_weight104, in_weight105, in_weight106, in_weight107)
			core11(.result(result11), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight108, in_weight109, in_weight110, in_weight111, in_weight112, in_weight113, in_weight114, in_weight115, in_weight116)
			core12(.result(result12), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight117, in_weight118, in_weight119, in_weight120, in_weight121, in_weight122, in_weight123, in_weight124, in_weight125)
			core13(.result(result13), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight126, in_weight127, in_weight128, in_weight129, in_weight130, in_weight131, in_weight132, in_weight133, in_weight134)
			core14(.result(result14), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight135, in_weight136, in_weight137, in_weight138, in_weight139, in_weight140, in_weight141, in_weight142, in_weight143)
			core15(.result(result15), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

endmodule
