`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:32:28
// Design Name: 
// Module Name: conv_56_weight4_4
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


module conv_56_weight4_4
    #(
    parameter data_width = 32,
    parameter ram_depth = 6,
    parameter counter_depth = 8,
    parameter imgsize = 56,
    parameter in_weight0 = 32'b00111101100101101101000001000100,
	parameter in_weight1 = 32'b10111100000101000011000111100001,
	parameter in_weight2 = 32'b00111101111011110111010100010001,
	parameter in_weight3 = 32'b10111101011001000001000100000001,
	parameter in_weight4 = 32'b00111101101000011011011110001010,
	parameter in_weight5 = 32'b00111011001010111000110000110100,
	parameter in_weight6 = 32'b10111100111010010000111001000110,
	parameter in_weight7 = 32'b00111100100011000001001001010101,
	parameter in_weight8 = 32'b00111101110100011110110101010110,
	parameter in_weight9 = 32'b10111100110010011010101100110111,
	parameter in_weight10 = 32'b10111011010110110010000000101010,
	parameter in_weight11 = 32'b10111101100010110001010111011010,
	parameter in_weight12 = 32'b10111101110101100001101111100000,
	parameter in_weight13 = 32'b10111101000001111110101000000110,
	parameter in_weight14 = 32'b00111101101010011101110101001110,
	parameter in_weight15 = 32'b10111100101101000010101110011000,
	parameter in_weight16 = 32'b00111101000011110001111001111110,
	parameter in_weight17 = 32'b10111100010011100101111101011001,
	parameter in_weight18 = 32'b10111011101011011000010010000110,
	parameter in_weight19 = 32'b10111101110110111100100010110011,
	parameter in_weight20 = 32'b00111101100011111001100100111100,
	parameter in_weight21 = 32'b00111101100011101001101010000111,
	parameter in_weight22 = 32'b10111101101011101011000001000011,
	parameter in_weight23 = 32'b00111101110000110001000101000111,
	parameter in_weight24 = 32'b10111100001100110011011110100011,
	parameter in_weight25 = 32'b10111010100001100101000001110101,
	parameter in_weight26 = 32'b10111100110110011000011011010010,
	parameter in_weight27 = 32'b10111101110111010010100011100011,
	parameter in_weight28 = 32'b00111101000010010011100000110110,
	parameter in_weight29 = 32'b10111101101111001111101100110001,
	parameter in_weight30 = 32'b10111101101000001101010110011001,
	parameter in_weight31 = 32'b10111101110111110010011010111001,
	parameter in_weight32 = 32'b10111101010001011110111110110110,
	parameter in_weight33 = 32'b00111101101111111111111101001010,
	parameter in_weight34 = 32'b10111100110010100110111111011001,
	parameter in_weight35 = 32'b10111101001000001001110100000001,
	parameter in_weight36 = 32'b10111101110101000111000001011111,
	parameter in_weight37 = 32'b00111101001100010101000011100011,
	parameter in_weight38 = 32'b00111101100101100110100000101010,
	parameter in_weight39 = 32'b10111101001000100001010001110110,
	parameter in_weight40 = 32'b00111101111100010000000100111000,
	parameter in_weight41 = 32'b10111100111000111011000111101100,
	parameter in_weight42 = 32'b10111101111001101000000100010110,
	parameter in_weight43 = 32'b00111101010000111001010001100000,
	parameter in_weight44 = 32'b10111101100101000010110000010000,
	parameter in_weight45 = 32'b10111101101000010100111011111010,
	parameter in_weight46 = 32'b10111101100110100110001101100010,
	parameter in_weight47 = 32'b00111101101101010101001110110111,
	parameter in_weight48 = 32'b00111100011110101110001100100111,
	parameter in_weight49 = 32'b00111101100101101001100011011101,
	parameter in_weight50 = 32'b10111100011000000111000111111010,
	parameter in_weight51 = 32'b00111101011011010111100011000010,
	parameter in_weight52 = 32'b00111101100001011101011011111100,
	parameter in_weight53 = 32'b10111101101100110100001010100011,
	parameter in_weight54 = 32'b00111100100101111001110110000001,
	parameter in_weight55 = 32'b00111101101011100010000100100111,
	parameter in_weight56 = 32'b10111101110111100100000110101101,
	parameter in_weight57 = 32'b00111101100111000101010000100010,
	parameter in_weight58 = 32'b00111100100011001010110001001111,
	parameter in_weight59 = 32'b10111101010000101111010100011001,
	parameter in_weight60 = 32'b10111101110111001010101101010001,
	parameter in_weight61 = 32'b10111101000010010110011001010011,
	parameter in_weight62 = 32'b00111010110010101101011100010010,
	parameter in_weight63 = 32'b10111101110011111000010001011001,
	parameter in_weight64 = 32'b10111101000111100101111010000101,
	parameter in_weight65 = 32'b00111101001101110001010010111000,
	parameter in_weight66 = 32'b00111101111001011100001011101001,
	parameter in_weight67 = 32'b00111101001100000011011011011000,
	parameter in_weight68 = 32'b10111100010010111101110011110010,
	parameter in_weight69 = 32'b00111101001100100001001111010000,
	parameter in_weight70 = 32'b10111101111000011011110001010000,
	parameter in_weight71 = 32'b00111101111011110000011110001101,
	parameter in_weight72 = 32'b00111101011111000101000100011001,
	parameter in_weight73 = 32'b10111101100000011111110110000010,
	parameter in_weight74 = 32'b00111101111010101010000100000101,
	parameter in_weight75 = 32'b00111100111011011101000100010101,
	parameter in_weight76 = 32'b00111100101010000100011100111010,
	parameter in_weight77 = 32'b00111101000000010011111101110000,
	parameter in_weight78 = 32'b10111100100111011110001011011001,
	parameter in_weight79 = 32'b10111101110000001010101010011000,
	parameter in_weight80 = 32'b10111101110101010100111110100000,
	parameter in_weight81 = 32'b00111100101110101001000001111001,
	parameter in_weight82 = 32'b10111100111010011111001011010011,
	parameter in_weight83 = 32'b00111011001011010111110101101111,
	parameter in_weight84 = 32'b10111101011110101100110000001011,
	parameter in_weight85 = 32'b10111101110001011111101010001010,
	parameter in_weight86 = 32'b00111100110001000111010100111001,
	parameter in_weight87 = 32'b00111100100001100110001011100111,
	parameter in_weight88 = 32'b00111101011000010100101101000111,
	parameter in_weight89 = 32'b00111100110010110100100000001001,
	parameter in_weight90 = 32'b10111101011110010111010110011110,
	parameter in_weight91 = 32'b00111101100011111011111010011010,
	parameter in_weight92 = 32'b10111011100110111101101000100000,
	parameter in_weight93 = 32'b00111101101001000100001100110100,
	parameter in_weight94 = 32'b10111101000011010001011110100011,
	parameter in_weight95 = 32'b10111101111011100010000110100011,
	parameter in_weight96 = 32'b00111010110111101100010011100010,
	parameter in_weight97 = 32'b10111100101101010000000000010100,
	parameter in_weight98 = 32'b00111101101001110011000000111101,
	parameter in_weight99 = 32'b10111101100010011011100100011000,
	parameter in_weight100 = 32'b10111100001011111111001011111010,
	parameter in_weight101 = 32'b10111101100111111011101010011100,
	parameter in_weight102 = 32'b00111101110100100110101000011111,
	parameter in_weight103 = 32'b00111101001101000011110110011010,
	parameter in_weight104 = 32'b00111100101111011101111111000000,
	parameter in_weight105 = 32'b10111011110101110011010101010011,
	parameter in_weight106 = 32'b10111101110000101100100011000000,
	parameter in_weight107 = 32'b00111101100010011001000000111010,
	parameter in_weight108 = 32'b10111101101111011011010111010101,
	parameter in_weight109 = 32'b10111101100100100111100010011110,
	parameter in_weight110 = 32'b10111101001101101010110000101100,
	parameter in_weight111 = 32'b10111101010111110100100101111011,
	parameter in_weight112 = 32'b00111100111001101101001011000101,
	parameter in_weight113 = 32'b10111101100011011011101101110100,
	parameter in_weight114 = 32'b00111101110101100000100100101000,
	parameter in_weight115 = 32'b10111101111010111111000110100001,
	parameter in_weight116 = 32'b00111101011100100000111010101001,
	parameter in_weight117 = 32'b00111101110101110111100000111110,
	parameter in_weight118 = 32'b00111101110000010010100011100000,
	parameter in_weight119 = 32'b00111101100010101110101111100111,
	parameter in_weight120 = 32'b10111101010010010000010011101110,
	parameter in_weight121 = 32'b00111100111101001110000111010001,
	parameter in_weight122 = 32'b00111101001011100010101000110011,
	parameter in_weight123 = 32'b10111101110111100011111010101001,
	parameter in_weight124 = 32'b10111101100101111011111001110100,
	parameter in_weight125 = 32'b10111100001011011001000101101000,
	parameter in_weight126 = 32'b00111011110001110100100111111011,
	parameter in_weight127 = 32'b00111101111000111110010100010010,
	parameter in_weight128 = 32'b00111101101111101110101100000011,
	parameter in_weight129 = 32'b00111101111001111011011011101010,
	parameter in_weight130 = 32'b10111101101010001011101000111110,
	parameter in_weight131 = 32'b10111100110011001100001000110101,
	parameter in_weight132 = 32'b10111101110111000101010111000110,
	parameter in_weight133 = 32'b00111101100111101000111001111010,
	parameter in_weight134 = 32'b10111100101011110100100001101101,
	parameter in_weight135 = 32'b00111101101011101010111001111111,
	parameter in_weight136 = 32'b10111011000100111100101101000110,
	parameter in_weight137 = 32'b10111101101110110010011000111000,
	parameter in_weight138 = 32'b00111101110010001011100110110101,
	parameter in_weight139 = 32'b10111101011101011110000000001110,
	parameter in_weight140 = 32'b10111100010111011111000101110010,
	parameter in_weight141 = 32'b00111101011000000100001001111010,
	parameter in_weight142 = 32'b10111011110110101010100110110011,
	parameter in_weight143 = 32'b00111101100111100100000101100010
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
