`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:32:28
// Design Name: 
// Module Name: conv_56_weight4_3
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


module conv_56_weight4_3
    #(
    parameter data_width = 32,
    parameter ram_depth = 6,
    parameter counter_depth = 8,
    parameter imgsize = 56,
    parameter in_weight0 = 32'b10111101100110101000100011011101,
	parameter in_weight1 = 32'b00111101000010001110101100110111,
	parameter in_weight2 = 32'b10111100000101111101111101100111,
	parameter in_weight3 = 32'b00111101010000010101101010100000,
	parameter in_weight4 = 32'b10111100011001010001000111100100,
	parameter in_weight5 = 32'b10111101111001000000101100110010,
	parameter in_weight6 = 32'b10111101001001101000011101010001,
	parameter in_weight7 = 32'b00111101100011000111110100001101,
	parameter in_weight8 = 32'b00111101111011100100011100000110,
	parameter in_weight9 = 32'b10111100010111111011011011000001,
	parameter in_weight10 = 32'b10111101110100101111110000000001,
	parameter in_weight11 = 32'b00111100111110000110011101101001,
	parameter in_weight12 = 32'b10111101100001001000010010011111,
	parameter in_weight13 = 32'b10111101011110011101001011011000,
	parameter in_weight14 = 32'b10111100110101101011110110001100,
	parameter in_weight15 = 32'b00111101001111011011001111011001,
	parameter in_weight16 = 32'b10111101011000000001100001111111,
	parameter in_weight17 = 32'b10111101111010101011000111101110,
	parameter in_weight18 = 32'b10111101010000110011011000101001,
	parameter in_weight19 = 32'b00111101111001010001011000111011,
	parameter in_weight20 = 32'b00111101100101010000001000110100,
	parameter in_weight21 = 32'b10111101110010001010100110001100,
	parameter in_weight22 = 32'b00111101101001010010110111100110,
	parameter in_weight23 = 32'b00111011011010110111000111110011,
	parameter in_weight24 = 32'b00111101001101111001101101011111,
	parameter in_weight25 = 32'b10111100001000000110100110111100,
	parameter in_weight26 = 32'b10111101110110111000110001011111,
	parameter in_weight27 = 32'b10111101110101110100000101101111,
	parameter in_weight28 = 32'b00111100110010100000100001111110,
	parameter in_weight29 = 32'b10111100111111101001111010100101,
	parameter in_weight30 = 32'b00111101010000101000001010110000,
	parameter in_weight31 = 32'b00111100011111111010011011001010,
	parameter in_weight32 = 32'b00111101010010010001101100100110,
	parameter in_weight33 = 32'b10111101001111100010001111100001,
	parameter in_weight34 = 32'b00111101010001111101010000100010,
	parameter in_weight35 = 32'b10111101110011101110101110001111,
	parameter in_weight36 = 32'b00111101101101010000100000010111,
	parameter in_weight37 = 32'b00111100000110100010011010101101,
	parameter in_weight38 = 32'b00111101100111000001000001101000,
	parameter in_weight39 = 32'b00111101100110001101101111110000,
	parameter in_weight40 = 32'b00111101010001100011000101110011,
	parameter in_weight41 = 32'b10111101000111111100011100011100,
	parameter in_weight42 = 32'b00111101011111011101011100011110,
	parameter in_weight43 = 32'b00111101011101001011000100110001,
	parameter in_weight44 = 32'b00111101110110011001100110011110,
	parameter in_weight45 = 32'b10111101110000101100001111000110,
	parameter in_weight46 = 32'b00111100000101101010101111110111,
	parameter in_weight47 = 32'b10111101111001000111010100110111,
	parameter in_weight48 = 32'b10111100001011101100111000011100,
	parameter in_weight49 = 32'b00111101100011101111101000000011,
	parameter in_weight50 = 32'b10111101100111001100000101010001,
	parameter in_weight51 = 32'b10111101000011101101000001100100,
	parameter in_weight52 = 32'b10111101110011000000010110101111,
	parameter in_weight53 = 32'b10111101011110010010000010101001,
	parameter in_weight54 = 32'b00111101110001010100010001000010,
	parameter in_weight55 = 32'b10111100101001100111001101100010,
	parameter in_weight56 = 32'b10111101001011000101111011001100,
	parameter in_weight57 = 32'b00111101010101101110111100000010,
	parameter in_weight58 = 32'b00111101000001111010001111010101,
	parameter in_weight59 = 32'b00111100111111010101000010100010,
	parameter in_weight60 = 32'b00111100010001110111111011011110,
	parameter in_weight61 = 32'b00111101110111001100111101101100,
	parameter in_weight62 = 32'b10111101011100001000001000011111,
	parameter in_weight63 = 32'b10111101101100010010100111110111,
	parameter in_weight64 = 32'b00111010111001110111101001101001,
	parameter in_weight65 = 32'b00111101111011110110110111010111,
	parameter in_weight66 = 32'b00111100110111111101011101010011,
	parameter in_weight67 = 32'b00111100101101010111111000000100,
	parameter in_weight68 = 32'b10111101010111001001001010011010,
	parameter in_weight69 = 32'b10111101101111010110010100110101,
	parameter in_weight70 = 32'b10111100111010000000011001100111,
	parameter in_weight71 = 32'b00111101000011100001001001101100,
	parameter in_weight72 = 32'b00111101101100001000110000011101,
	parameter in_weight73 = 32'b10111100101010000111011100111111,
	parameter in_weight74 = 32'b00111101111010000100111101111010,
	parameter in_weight75 = 32'b00111101100011011111011000100000,
	parameter in_weight76 = 32'b00111100010011110101101110001011,
	parameter in_weight77 = 32'b10111101101001000101111111110011,
	parameter in_weight78 = 32'b00111100100101001000001001011001,
	parameter in_weight79 = 32'b00111100110000101101101110100000,
	parameter in_weight80 = 32'b10111101001101100110011000001000,
	parameter in_weight81 = 32'b00111100010110001111110100010110,
	parameter in_weight82 = 32'b00111101101101100101111000001010,
	parameter in_weight83 = 32'b10111100111110110001010101001011,
	parameter in_weight84 = 32'b00111101110010010010111001110111,
	parameter in_weight85 = 32'b10111101001011110101111111010001,
	parameter in_weight86 = 32'b00111101110110000110001000011000,
	parameter in_weight87 = 32'b10111101101011010100011111000001,
	parameter in_weight88 = 32'b10111100100000100010110100101011,
	parameter in_weight89 = 32'b00111101101101100110011100000100,
	parameter in_weight90 = 32'b10111101100110011111110011110101,
	parameter in_weight91 = 32'b10111101000111101011001010111111,
	parameter in_weight92 = 32'b10111011100001110110010110110000,
	parameter in_weight93 = 32'b10111101101110111110111001111110,
	parameter in_weight94 = 32'b10111101110101111000000001101101,
	parameter in_weight95 = 32'b00111101000001111000000010111101,
	parameter in_weight96 = 32'b10111100001000001111000111100011,
	parameter in_weight97 = 32'b10111101100000011011001101110001,
	parameter in_weight98 = 32'b10111101100001100110100111010001,
	parameter in_weight99 = 32'b10111101100110011010111010101100,
	parameter in_weight100 = 32'b00111101001110011110011001101110,
	parameter in_weight101 = 32'b10111101010000110100110111111100,
	parameter in_weight102 = 32'b10111100100100101100100010000000,
	parameter in_weight103 = 32'b10111101110010101011111010111110,
	parameter in_weight104 = 32'b00111101101101000100101011001111,
	parameter in_weight105 = 32'b10111101010011110011110001100111,
	parameter in_weight106 = 32'b10111101110010110001101001110010,
	parameter in_weight107 = 32'b10111101100000111101000011010101,
	parameter in_weight108 = 32'b00111101111001110101000110101001,
	parameter in_weight109 = 32'b00111101001111011010100011010101,
	parameter in_weight110 = 32'b00111100000111010101010011101110,
	parameter in_weight111 = 32'b10111101001000000000000001100001,
	parameter in_weight112 = 32'b10111100111110011100100000010101,
	parameter in_weight113 = 32'b10111101100101011100001111111110,
	parameter in_weight114 = 32'b00111100111110011000010010100000,
	parameter in_weight115 = 32'b00111101110011010100101011010010,
	parameter in_weight116 = 32'b10111100011010001011101010001000,
	parameter in_weight117 = 32'b10111100111000100111011001100111,
	parameter in_weight118 = 32'b00111101001011011000101011001001,
	parameter in_weight119 = 32'b00111010100000101001001111001011,
	parameter in_weight120 = 32'b00111101110101001101000011100110,
	parameter in_weight121 = 32'b10111101101111000111111101110111,
	parameter in_weight122 = 32'b00111101110011101100010001001010,
	parameter in_weight123 = 32'b10111101110001000010000110011010,
	parameter in_weight124 = 32'b00111100110000000100000010110011,
	parameter in_weight125 = 32'b00111101011010101100101011010000,
	parameter in_weight126 = 32'b00111101101110001011111001111011,
	parameter in_weight127 = 32'b00111101100001100110101110011011,
	parameter in_weight128 = 32'b00111101111011011101110101001000,
	parameter in_weight129 = 32'b10111101001100000010110000000100,
	parameter in_weight130 = 32'b00111101101110111110100101010011,
	parameter in_weight131 = 32'b00111101110011101000100001000100,
	parameter in_weight132 = 32'b10111101111011010001101100101011,
	parameter in_weight133 = 32'b10111100010111000110000001111100,
	parameter in_weight134 = 32'b00111101101100101101000011001100,
	parameter in_weight135 = 32'b00111101100000110110110000101000,
	parameter in_weight136 = 32'b10111101111011110010101000010110,
	parameter in_weight137 = 32'b00111010111010101111100010100011,
	parameter in_weight138 = 32'b00111101110101010011111011011101,
	parameter in_weight139 = 32'b00111101000100110110101100101110,
	parameter in_weight140 = 32'b00111101100101001010100000000011,
	parameter in_weight141 = 32'b00111101100000001101011101100010,
	parameter in_weight142 = 32'b10111101000110011111100110000001,
	parameter in_weight143 = 32'b00111100011111100100010100001000
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
