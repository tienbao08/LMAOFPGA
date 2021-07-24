`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:32:28
// Design Name: 
// Module Name: conv_56_weight4_1
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


module conv_56_weight4_1
    #(
    parameter data_width = 32,
    parameter ram_depth = 6,
    parameter counter_depth = 8,
    parameter imgsize = 56,
    parameter in_weight0 = 32'b10111100100110010001101110111100,
	parameter in_weight1 = 32'b10111101011101101101111010111111,
	parameter in_weight2 = 32'b10111101010001100111110001001011,
	parameter in_weight3 = 32'b00111101110001000101010110100101,
	parameter in_weight4 = 32'b00111011000011111111011110101001,
	parameter in_weight5 = 32'b10111101100000111110100010111000,
	parameter in_weight6 = 32'b10111101100001010110100010011101,
	parameter in_weight7 = 32'b10111101111001110101011001111111,
	parameter in_weight8 = 32'b00111101111000011110001110000100,
	parameter in_weight9 = 32'b10111101111001101101111011110000,
	parameter in_weight10 = 32'b00111101100010010011011100100001,
	parameter in_weight11 = 32'b10111011010000010110100101010111,
	parameter in_weight12 = 32'b10111101110010100111001101101101,
	parameter in_weight13 = 32'b00111011111101001010110101010111,
	parameter in_weight14 = 32'b00111101011011011111010100010111,
	parameter in_weight15 = 32'b10111101011101100001100110011111,
	parameter in_weight16 = 32'b00111101100010011011001100111011,
	parameter in_weight17 = 32'b10111101101110010110001100111101,
	parameter in_weight18 = 32'b00111100110111111001001000010110,
	parameter in_weight19 = 32'b10111101111001010101000011101010,
	parameter in_weight20 = 32'b10111101011110000011110000001101,
	parameter in_weight21 = 32'b10111100100000010001110110011000,
	parameter in_weight22 = 32'b10111011111001111000100010111001,
	parameter in_weight23 = 32'b00111101000001001010110011011111,
	parameter in_weight24 = 32'b00111101101010001101100000110010,
	parameter in_weight25 = 32'b10111101101101110100111100011000,
	parameter in_weight26 = 32'b00111101100110011100101110111001,
	parameter in_weight27 = 32'b00111101000000100001100010111101,
	parameter in_weight28 = 32'b00111101110110101010100110000011,
	parameter in_weight29 = 32'b10111101100101000001111101111110,
	parameter in_weight30 = 32'b00111101101011111100100101011011,
	parameter in_weight31 = 32'b10111101000000001010011101010011,
	parameter in_weight32 = 32'b00111101011000011010111101011101,
	parameter in_weight33 = 32'b10111101111001110010011011100010,
	parameter in_weight34 = 32'b00111100110000010001111001101100,
	parameter in_weight35 = 32'b00111101011001011101111100111110,
	parameter in_weight36 = 32'b00111101100000100000000101101000,
	parameter in_weight37 = 32'b10111101100101010011010101001001,
	parameter in_weight38 = 32'b00111101011110000010000100101110,
	parameter in_weight39 = 32'b10111100101001101110100111011111,
	parameter in_weight40 = 32'b00111101110000100010111000000001,
	parameter in_weight41 = 32'b00111101100001000000010100110100,
	parameter in_weight42 = 32'b10111101101001111010010111011101,
	parameter in_weight43 = 32'b00111101101001101000011011010011,
	parameter in_weight44 = 32'b00111101100111110011010011111111,
	parameter in_weight45 = 32'b10111101111011110001101001000100,
	parameter in_weight46 = 32'b10111100101110111111010101000010,
	parameter in_weight47 = 32'b10111100100010010011001011100001,
	parameter in_weight48 = 32'b10111101101010000001000101110000,
	parameter in_weight49 = 32'b10111101101011011100011100010011,
	parameter in_weight50 = 32'b10111101000110011110000110100001,
	parameter in_weight51 = 32'b00111100110001010001101010000011,
	parameter in_weight52 = 32'b00111101100111111001010010101000,
	parameter in_weight53 = 32'b00111100011011010000011111110100,
	parameter in_weight54 = 32'b10111101010100001101001010001001,
	parameter in_weight55 = 32'b10111101000010010001101000011111,
	parameter in_weight56 = 32'b10111101100101011010001000101101,
	parameter in_weight57 = 32'b10111011111110001001110001100110,
	parameter in_weight58 = 32'b10111101110010111100010110110000,
	parameter in_weight59 = 32'b10111101011110011011111011101010,
	parameter in_weight60 = 32'b00111100100001101011110100101011,
	parameter in_weight61 = 32'b00111101000000001100010111100100,
	parameter in_weight62 = 32'b10111100110101011000111010000111,
	parameter in_weight63 = 32'b10111101110011110101110001010010,
	parameter in_weight64 = 32'b00111101011000001101101000010000,
	parameter in_weight65 = 32'b10111101101000000101110110111110,
	parameter in_weight66 = 32'b00111101100010101110011110011000,
	parameter in_weight67 = 32'b10111101101001000000010111101111,
	parameter in_weight68 = 32'b00111100010100000110111100100111,
	parameter in_weight69 = 32'b00111101110110011111000101111110,
	parameter in_weight70 = 32'b10111101110111111000001111110111,
	parameter in_weight71 = 32'b10111101111001100001100111000101,
	parameter in_weight72 = 32'b00111101100111101110111100001111,
	parameter in_weight73 = 32'b10111100111101100001000011111000,
	parameter in_weight74 = 32'b10111101111001101101000011011011,
	parameter in_weight75 = 32'b00111101001100110110101001110110,
	parameter in_weight76 = 32'b00111011010000111001100001100011,
	parameter in_weight77 = 32'b00111100111010100110001111110100,
	parameter in_weight78 = 32'b10111100110111000000011100111010,
	parameter in_weight79 = 32'b10111100101001110101000000000111,
	parameter in_weight80 = 32'b10111101111001111011011110011100,
	parameter in_weight81 = 32'b10111101011111111010101110110001,
	parameter in_weight82 = 32'b10111011110000101101110010100100,
	parameter in_weight83 = 32'b10111101111000001010110000011101,
	parameter in_weight84 = 32'b00111101111011011100000110110001,
	parameter in_weight85 = 32'b10111100110110010000001111000110,
	parameter in_weight86 = 32'b10111011111011010101101111011111,
	parameter in_weight87 = 32'b10111101100111110011100110100010,
	parameter in_weight88 = 32'b10111101100010001100000000101100,
	parameter in_weight89 = 32'b00111101110100111000010010000101,
	parameter in_weight90 = 32'b00111101011110011010111101011110,
	parameter in_weight91 = 32'b10111101010011000110001010010011,
	parameter in_weight92 = 32'b10111101110111011111001010011111,
	parameter in_weight93 = 32'b00111101111100000111001110011100,
	parameter in_weight94 = 32'b00111101000011010110000110001101,
	parameter in_weight95 = 32'b00111101010010111001011101000011,
	parameter in_weight96 = 32'b10111101011010001101000000100101,
	parameter in_weight97 = 32'b00111101101100110110111010000111,
	parameter in_weight98 = 32'b10111100100111010101111101100001,
	parameter in_weight99 = 32'b00111101010110000110101010010010,
	parameter in_weight100 = 32'b10111101001110000111110000010111,
	parameter in_weight101 = 32'b00111100100100111000110001100110,
	parameter in_weight102 = 32'b10111101100111111010100011010111,
	parameter in_weight103 = 32'b10111101011010000111100111000000,
	parameter in_weight104 = 32'b00111101010110110100110110000001,
	parameter in_weight105 = 32'b00111101100011101111110100010001,
	parameter in_weight106 = 32'b00111100101101111001010011101100,
	parameter in_weight107 = 32'b10111101011011111100110111001000,
	parameter in_weight108 = 32'b00111101111111101001001111011101,
	parameter in_weight109 = 32'b00111100111111011000111110101100,
	parameter in_weight110 = 32'b00111101001000000101010101111100,
	parameter in_weight111 = 32'b00111100011000000010011010101011,
	parameter in_weight112 = 32'b00111100001011110001111101111000,
	parameter in_weight113 = 32'b00111101001011010110001011000111,
	parameter in_weight114 = 32'b00111100101111001011011000101001,
	parameter in_weight115 = 32'b00111011010011111001111001000110,
	parameter in_weight116 = 32'b00111101011011111111111000101010,
	parameter in_weight117 = 32'b00111100110010010011010011110111,
	parameter in_weight118 = 32'b10111100010001110000010011011101,
	parameter in_weight119 = 32'b10111101100110000010110101010010,
	parameter in_weight120 = 32'b10111101011100010011001100000101,
	parameter in_weight121 = 32'b00111101001101000010011111111101,
	parameter in_weight122 = 32'b10111101001001001111001010101110,
	parameter in_weight123 = 32'b10111100000100000100000010111001,
	parameter in_weight124 = 32'b00111101110011000100011001110100,
	parameter in_weight125 = 32'b00111101001111010111000101000001,
	parameter in_weight126 = 32'b10111101101001010001000101011010,
	parameter in_weight127 = 32'b10111101100010110100100010011011,
	parameter in_weight128 = 32'b00111101100111101010000100010011,
	parameter in_weight129 = 32'b00111011110011100010010000001010,
	parameter in_weight130 = 32'b10111101110000000100000010011110,
	parameter in_weight131 = 32'b00111101100000111010010000010110,
	parameter in_weight132 = 32'b10111101000010110101110100100111,
	parameter in_weight133 = 32'b10111100110000001110001010001010,
	parameter in_weight134 = 32'b10111101100000001011010001011011,
	parameter in_weight135 = 32'b00111101011101000001011001100001,
	parameter in_weight136 = 32'b00111101001001010100011010000000,
	parameter in_weight137 = 32'b00111101111001010011111000001011,
	parameter in_weight138 = 32'b00111101011001100000100000100110,
	parameter in_weight139 = 32'b10111101101110100100001110011011,
	parameter in_weight140 = 32'b00111101111001100111001000001000,
	parameter in_weight141 = 32'b00111101101001011111000000010010,
	parameter in_weight142 = 32'b00111101100000110011110100110111,
	parameter in_weight143 = 32'b10111100101011001001100100101001
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
