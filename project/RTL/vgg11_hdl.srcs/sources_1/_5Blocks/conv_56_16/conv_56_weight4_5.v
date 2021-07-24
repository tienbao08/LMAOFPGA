`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:32:28
// Design Name: 
// Module Name: conv_56_weight4_5
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


module conv_56_weight4_5
    #(
    parameter data_width = 32,
    parameter ram_depth = 6,
    parameter counter_depth = 8,
    parameter imgsize = 56,
    parameter in_weight0 = 32'b10111010101001100111100111110001,
	parameter in_weight1 = 32'b00111101101100001000011110010111,
	parameter in_weight2 = 32'b10111101111001101001111100100000,
	parameter in_weight3 = 32'b00111101111011000111100001000010,
	parameter in_weight4 = 32'b10111101001000110101001100000010,
	parameter in_weight5 = 32'b00111101111000001000100111101111,
	parameter in_weight6 = 32'b10111101101011001111101011110101,
	parameter in_weight7 = 32'b10111011101001111011010101000100,
	parameter in_weight8 = 32'b10111101101100100011101101010111,
	parameter in_weight9 = 32'b00111101000001001000100010110101,
	parameter in_weight10 = 32'b10111101111001110000110110000001,
	parameter in_weight11 = 32'b10111100111001011111100000001011,
	parameter in_weight12 = 32'b00111100100001111010011011110010,
	parameter in_weight13 = 32'b00111101100000101110110001000110,
	parameter in_weight14 = 32'b10111101100011111110001101001111,
	parameter in_weight15 = 32'b10111100100100111110101110011100,
	parameter in_weight16 = 32'b10111100011110011000101001000101,
	parameter in_weight17 = 32'b00111011110001001001011010011110,
	parameter in_weight18 = 32'b10111010100111011110100000111110,
	parameter in_weight19 = 32'b00111101101011000000101110111000,
	parameter in_weight20 = 32'b00111101011100100110011011100100,
	parameter in_weight21 = 32'b10111101100011101101100111011000,
	parameter in_weight22 = 32'b00111101100011100010110101010101,
	parameter in_weight23 = 32'b10111101100011011111000111111101,
	parameter in_weight24 = 32'b00111101010001001010000011101010,
	parameter in_weight25 = 32'b10111101100011001011001000011110,
	parameter in_weight26 = 32'b10111101110001011110000111011001,
	parameter in_weight27 = 32'b00111101111010101100101110011110,
	parameter in_weight28 = 32'b10111100001011000000001011000101,
	parameter in_weight29 = 32'b00111101110011000011011101001110,
	parameter in_weight30 = 32'b00111100010100111100001111011110,
	parameter in_weight31 = 32'b10111100100101001101001101111011,
	parameter in_weight32 = 32'b10111101100010100001011001011011,
	parameter in_weight33 = 32'b00111101101011100101100010111011,
	parameter in_weight34 = 32'b10111101011000010100100011100100,
	parameter in_weight35 = 32'b10111101110011001010110111110100,
	parameter in_weight36 = 32'b10111101110101100001000011110000,
	parameter in_weight37 = 32'b00111101111100001111101111110011,
	parameter in_weight38 = 32'b10111001011010000010100101000001,
	parameter in_weight39 = 32'b10111101110010101110100001110111,
	parameter in_weight40 = 32'b10111010010000011001011100100011,
	parameter in_weight41 = 32'b10111101011000101010101001100011,
	parameter in_weight42 = 32'b00111101101001111111100110111100,
	parameter in_weight43 = 32'b00111101110000100000110100001110,
	parameter in_weight44 = 32'b00111100100100100011011100000011,
	parameter in_weight45 = 32'b10111101111011100101001010111111,
	parameter in_weight46 = 32'b10111101000100101101111100011010,
	parameter in_weight47 = 32'b10111101111011000101101111011111,
	parameter in_weight48 = 32'b00111101110110001010001100001101,
	parameter in_weight49 = 32'b00111101000110110000000010110110,
	parameter in_weight50 = 32'b00111101110000000011110110010011,
	parameter in_weight51 = 32'b00111101000011101010001000110101,
	parameter in_weight52 = 32'b00111101110011110110010000100100,
	parameter in_weight53 = 32'b10111101111000000010110000100110,
	parameter in_weight54 = 32'b00111100010110001010100101001000,
	parameter in_weight55 = 32'b00111100101010100100110001010100,
	parameter in_weight56 = 32'b00111101110111111100000011110000,
	parameter in_weight57 = 32'b00111101101010101101000011111100,
	parameter in_weight58 = 32'b10111101101110100111011000111011,
	parameter in_weight59 = 32'b00111100111110000010000101001010,
	parameter in_weight60 = 32'b00111101001000011010101000001010,
	parameter in_weight61 = 32'b00111101100111000001010100101110,
	parameter in_weight62 = 32'b00111101111010000000110011010101,
	parameter in_weight63 = 32'b10111101101000011011001111010001,
	parameter in_weight64 = 32'b00111100000111100101000110111011,
	parameter in_weight65 = 32'b00111101000110001110001110111111,
	parameter in_weight66 = 32'b10111101011011110111101100110010,
	parameter in_weight67 = 32'b10111100100101101001000011011011,
	parameter in_weight68 = 32'b00111011100010001001111110000001,
	parameter in_weight69 = 32'b00111100110000010001110100001010,
	parameter in_weight70 = 32'b10111101111011001101101101000011,
	parameter in_weight71 = 32'b00111101011011100010101101011101,
	parameter in_weight72 = 32'b00111100110100010110101110001000,
	parameter in_weight73 = 32'b10111101100100100010110000101111,
	parameter in_weight74 = 32'b00111100011111000010101101110010,
	parameter in_weight75 = 32'b00111101101110000000010101111101,
	parameter in_weight76 = 32'b10111100110010010110101100110011,
	parameter in_weight77 = 32'b00111100001100101001110010010001,
	parameter in_weight78 = 32'b10111101100101000111110111001100,
	parameter in_weight79 = 32'b00111101010010110001101010011100,
	parameter in_weight80 = 32'b10111101110100101010001000000000,
	parameter in_weight81 = 32'b00111101110110101110001001101100,
	parameter in_weight82 = 32'b10111101010110111011111010111000,
	parameter in_weight83 = 32'b00111101000011110100000011000111,
	parameter in_weight84 = 32'b00111101011001111111010011100000,
	parameter in_weight85 = 32'b10111101001011110101101011010110,
	parameter in_weight86 = 32'b10111101010100111001111111010111,
	parameter in_weight87 = 32'b10111101101000110101101010011101,
	parameter in_weight88 = 32'b10111101010011110100001000110011,
	parameter in_weight89 = 32'b00111100101110111100000100001011,
	parameter in_weight90 = 32'b10111100010110101111000010001011,
	parameter in_weight91 = 32'b10111101100100111001100011111000,
	parameter in_weight92 = 32'b00111101010101000110100100000011,
	parameter in_weight93 = 32'b00111101010110110111101001100111,
	parameter in_weight94 = 32'b00111101111010001111000100001111,
	parameter in_weight95 = 32'b00111101101010101001010010100110,
	parameter in_weight96 = 32'b10111100000101111111011000110101,
	parameter in_weight97 = 32'b10111101100001111001111010010110,
	parameter in_weight98 = 32'b10111101011010101101111010111001,
	parameter in_weight99 = 32'b00111100101000100100110101101011,
	parameter in_weight100 = 32'b10111101011111001100001011000000,
	parameter in_weight101 = 32'b00111011101111010100001001010111,
	parameter in_weight102 = 32'b10111100001111110000110101001111,
	parameter in_weight103 = 32'b00111100001011101001110011110010,
	parameter in_weight104 = 32'b00111101000110100101100100010111,
	parameter in_weight105 = 32'b10111101000001001111001111110110,
	parameter in_weight106 = 32'b00111101010101111111101100111110,
	parameter in_weight107 = 32'b00111101101101111111110000101001,
	parameter in_weight108 = 32'b10111101101000110100000000000001,
	parameter in_weight109 = 32'b10111101011010000110110110011110,
	parameter in_weight110 = 32'b10111101111011111010110100111101,
	parameter in_weight111 = 32'b10111100101010011001110111001000,
	parameter in_weight112 = 32'b00111101000010100111101110111001,
	parameter in_weight113 = 32'b00111101101001100111111000100010,
	parameter in_weight114 = 32'b10111101100001100000011101101101,
	parameter in_weight115 = 32'b10111101100101111001101101101011,
	parameter in_weight116 = 32'b10111101011011000100000111110000,
	parameter in_weight117 = 32'b10111101101000011011011110010011,
	parameter in_weight118 = 32'b10111100101101100001010101101010,
	parameter in_weight119 = 32'b00111101001110110001001100010000,
	parameter in_weight120 = 32'b10111100111010101100111011010011,
	parameter in_weight121 = 32'b00111100111111010000100101001000,
	parameter in_weight122 = 32'b00111101100011111011100100001001,
	parameter in_weight123 = 32'b00111101101011000000000100110110,
	parameter in_weight124 = 32'b00111101111000101001110110000001,
	parameter in_weight125 = 32'b00111101110010011100001011010110,
	parameter in_weight126 = 32'b10111100101011100101100100000001,
	parameter in_weight127 = 32'b00111100110000111110101101011111,
	parameter in_weight128 = 32'b00111101111010111000001101111001,
	parameter in_weight129 = 32'b00111101100110100001100010001000,
	parameter in_weight130 = 32'b10111100111000011101010001010011,
	parameter in_weight131 = 32'b10111101100100001001111111011100,
	parameter in_weight132 = 32'b10111011010010000010100001101001,
	parameter in_weight133 = 32'b10111101000000101111010001000111,
	parameter in_weight134 = 32'b00111100011011001001010100100001,
	parameter in_weight135 = 32'b10111101011001101111101011011011,
	parameter in_weight136 = 32'b00111101100000111111101011010110,
	parameter in_weight137 = 32'b00111100111001110100001101000111,
	parameter in_weight138 = 32'b10111001100011111001000101001010,
	parameter in_weight139 = 32'b00111101100101010101011111000000,
	parameter in_weight140 = 32'b10111101100011111001100010010110,
	parameter in_weight141 = 32'b00111100111100101101110110101111,
	parameter in_weight142 = 32'b10111101110011101110100001011000,
	parameter in_weight143 = 32'b10111101101011111001100010101011
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
