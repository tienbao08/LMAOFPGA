`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:32:28
// Design Name: 
// Module Name: conv_56_weight4_7
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


module conv_56_weight4_7
    #(
    parameter data_width = 32,
    parameter ram_depth = 6,
    parameter counter_depth = 8,
    parameter imgsize = 56,
    parameter in_weight0 = 32'b10111101010111000001001000010011,
	parameter in_weight1 = 32'b00111010001001000101010101101101,
	parameter in_weight2 = 32'b10111101100110000111001000010110,
	parameter in_weight3 = 32'b00111011110000111000110000101111,
	parameter in_weight4 = 32'b00111101100101100000000011000010,
	parameter in_weight5 = 32'b00111011100011001110010010111000,
	parameter in_weight6 = 32'b00111011111101100100111100001111,
	parameter in_weight7 = 32'b00111101010011001001011101010101,
	parameter in_weight8 = 32'b00111101101001001111100110111011,
	parameter in_weight9 = 32'b10111011001100111110010111001010,
	parameter in_weight10 = 32'b10111101001010011100010000100111,
	parameter in_weight11 = 32'b00111101100010000100011110100001,
	parameter in_weight12 = 32'b10111101001001010010011010101000,
	parameter in_weight13 = 32'b10111011110101010011110111100111,
	parameter in_weight14 = 32'b00111100100011000101011000110101,
	parameter in_weight15 = 32'b10111101001110010001010111100010,
	parameter in_weight16 = 32'b10111101001011011000001100100110,
	parameter in_weight17 = 32'b10111101110011100000101001111110,
	parameter in_weight18 = 32'b10111101100101000111111100101000,
	parameter in_weight19 = 32'b00111101100010011101000010111001,
	parameter in_weight20 = 32'b00111101100100110001110000100010,
	parameter in_weight21 = 32'b10111101101100111000011110000001,
	parameter in_weight22 = 32'b00111101110110101111101111101111,
	parameter in_weight23 = 32'b10111101111010110111111101111110,
	parameter in_weight24 = 32'b10111101110010111100010110111011,
	parameter in_weight25 = 32'b10111101101010010100011010001011,
	parameter in_weight26 = 32'b10111101000110111110111010001001,
	parameter in_weight27 = 32'b10111101100001100011100101010011,
	parameter in_weight28 = 32'b10111101110100011010110110100101,
	parameter in_weight29 = 32'b10111100101011111110000000010111,
	parameter in_weight30 = 32'b10111101100100001011000000100110,
	parameter in_weight31 = 32'b00111101101000000101001100000111,
	parameter in_weight32 = 32'b10111101110011100011001111111000,
	parameter in_weight33 = 32'b00111101111100011000110000000000,
	parameter in_weight34 = 32'b10111101101001000010101000101010,
	parameter in_weight35 = 32'b00111100100100001001000001100111,
	parameter in_weight36 = 32'b00111101011110011111010111010001,
	parameter in_weight37 = 32'b00111100110110110100110111111111,
	parameter in_weight38 = 32'b00111011111111001111000101101110,
	parameter in_weight39 = 32'b10111100111111011111000110111011,
	parameter in_weight40 = 32'b00111101100111010110111100110101,
	parameter in_weight41 = 32'b10111101100010000110000111011011,
	parameter in_weight42 = 32'b00111100100100100100100111100100,
	parameter in_weight43 = 32'b10111100011110101010101011010100,
	parameter in_weight44 = 32'b00111100100111110011110100000001,
	parameter in_weight45 = 32'b00111101110111111011100010101101,
	parameter in_weight46 = 32'b10111101011111001010001001001001,
	parameter in_weight47 = 32'b10111101101000001111011110011001,
	parameter in_weight48 = 32'b10111101001111101101100000001101,
	parameter in_weight49 = 32'b10111101110010000010000011010001,
	parameter in_weight50 = 32'b10111101001000011010101111001000,
	parameter in_weight51 = 32'b10111100101001011111100101100001,
	parameter in_weight52 = 32'b10111101110010101011001000110100,
	parameter in_weight53 = 32'b00111100110011010000000100001111,
	parameter in_weight54 = 32'b00111101101001100100101100101000,
	parameter in_weight55 = 32'b10111101101000001100111100110101,
	parameter in_weight56 = 32'b00111101101011100000011101111100,
	parameter in_weight57 = 32'b10111101011111000100101000011111,
	parameter in_weight58 = 32'b00111101101101000001010110000011,
	parameter in_weight59 = 32'b10111101001001101100100101110011,
	parameter in_weight60 = 32'b10111101101011111011100101010001,
	parameter in_weight61 = 32'b00111101101010111000001111001010,
	parameter in_weight62 = 32'b10111101111000001100010001101110,
	parameter in_weight63 = 32'b00111100101110001101001001011100,
	parameter in_weight64 = 32'b10111101110101101000101010001011,
	parameter in_weight65 = 32'b10111101110001101110101110010110,
	parameter in_weight66 = 32'b10111101101001110000110011010100,
	parameter in_weight67 = 32'b00111011011010001010000000001110,
	parameter in_weight68 = 32'b10111100100011001110111100000000,
	parameter in_weight69 = 32'b10111101110100000011111001010110,
	parameter in_weight70 = 32'b00111101010101110011010000011101,
	parameter in_weight71 = 32'b10111101100101101100011101101010,
	parameter in_weight72 = 32'b00111101110100110110111101001011,
	parameter in_weight73 = 32'b00111101100011010101000111011101,
	parameter in_weight74 = 32'b00111101101111101011010111101111,
	parameter in_weight75 = 32'b00111101110101010100011110000101,
	parameter in_weight76 = 32'b10111101100101111110101100010100,
	parameter in_weight77 = 32'b00111101101011111010001110100001,
	parameter in_weight78 = 32'b00111101000111010011110011111101,
	parameter in_weight79 = 32'b00111100011011010111111111010011,
	parameter in_weight80 = 32'b10111101101110011001011101101111,
	parameter in_weight81 = 32'b10111101101010011010001111101100,
	parameter in_weight82 = 32'b00111101100000101000111100001111,
	parameter in_weight83 = 32'b10111101011111001010010000001010,
	parameter in_weight84 = 32'b00111101100010111000100010001010,
	parameter in_weight85 = 32'b00111101101101001111010001010111,
	parameter in_weight86 = 32'b00111101100010110001011110011001,
	parameter in_weight87 = 32'b00111101100010011100110101101100,
	parameter in_weight88 = 32'b10111101101100100000101110100110,
	parameter in_weight89 = 32'b00111101001010101000010110001100,
	parameter in_weight90 = 32'b10111101101011110000100001110001,
	parameter in_weight91 = 32'b00111100000011110001101001001010,
	parameter in_weight92 = 32'b00111101010111010000010110110011,
	parameter in_weight93 = 32'b10111101111011110101101000011010,
	parameter in_weight94 = 32'b10111101011001111010000110100100,
	parameter in_weight95 = 32'b00111101110001001100111001000011,
	parameter in_weight96 = 32'b00111100100000101000111001100111,
	parameter in_weight97 = 32'b00111101100001101011010000011100,
	parameter in_weight98 = 32'b00111011101110100000001001011011,
	parameter in_weight99 = 32'b10111101011111001011000100000101,
	parameter in_weight100 = 32'b00111100011010101001110000000011,
	parameter in_weight101 = 32'b10111101101110110100100011100000,
	parameter in_weight102 = 32'b00111100010010100101101110011000,
	parameter in_weight103 = 32'b10111100001101001100100001000010,
	parameter in_weight104 = 32'b00111101100111110000101010100001,
	parameter in_weight105 = 32'b00111011000111000111110101100011,
	parameter in_weight106 = 32'b00111010110100010001001011110110,
	parameter in_weight107 = 32'b10111010111110010101000101001010,
	parameter in_weight108 = 32'b10111101010111010111010110111000,
	parameter in_weight109 = 32'b00111101110010100011001110110110,
	parameter in_weight110 = 32'b00111101000000110110010010010111,
	parameter in_weight111 = 32'b10111100011010011100111001101100,
	parameter in_weight112 = 32'b10111101101010011111001001111011,
	parameter in_weight113 = 32'b00111101100111001101010000110100,
	parameter in_weight114 = 32'b00111100110001101011110010100110,
	parameter in_weight115 = 32'b00111100001000110100111001000111,
	parameter in_weight116 = 32'b00111101100110001001100000110000,
	parameter in_weight117 = 32'b10111101100110001111100100001111,
	parameter in_weight118 = 32'b10111100110100001011001101000010,
	parameter in_weight119 = 32'b00111101100110101101011111011001,
	parameter in_weight120 = 32'b10111101000001011001111010111000,
	parameter in_weight121 = 32'b00111101100000110011001100001101,
	parameter in_weight122 = 32'b00111101001100010101100100011110,
	parameter in_weight123 = 32'b00111101101011000111111000000101,
	parameter in_weight124 = 32'b00111100011111001101010001000100,
	parameter in_weight125 = 32'b10111101100001111111010110100001,
	parameter in_weight126 = 32'b10111101010000001101110100100110,
	parameter in_weight127 = 32'b00111101110101010010100110000010,
	parameter in_weight128 = 32'b00111101000101101110011111011001,
	parameter in_weight129 = 32'b10111101011101001011100101111001,
	parameter in_weight130 = 32'b00111101101010010101001110101101,
	parameter in_weight131 = 32'b10111101110111001100100101011100,
	parameter in_weight132 = 32'b00111101110111100010111011010110,
	parameter in_weight133 = 32'b10111101100111100110110101110100,
	parameter in_weight134 = 32'b10111101111010000101110111101010,
	parameter in_weight135 = 32'b00111100000111010111100010100001,
	parameter in_weight136 = 32'b00111101101111011100011110000010,
	parameter in_weight137 = 32'b10111101010001011111001101110111,
	parameter in_weight138 = 32'b10111101111000000101100101101010,
	parameter in_weight139 = 32'b00111100000101101011001000001001,
	parameter in_weight140 = 32'b10111101000111100101100011101001,
	parameter in_weight141 = 32'b10111101100001001101101111011011,
	parameter in_weight142 = 32'b00111101101010011101010100100010,
	parameter in_weight143 = 32'b00111101000110010110101101111010
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
