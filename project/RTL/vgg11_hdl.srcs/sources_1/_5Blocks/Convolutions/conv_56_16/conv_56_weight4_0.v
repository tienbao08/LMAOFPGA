`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:32:28
// Design Name: 
// Module Name: conv_56_weight4_0
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


module conv_56_weight4_0
    #(
    parameter data_width = 32,
    parameter ram_depth = 6,
    parameter counter_depth = 8,
    parameter imgsize = 56,
    parameter in_weight0 = 32'b00111101010100000000111101001010,
	parameter in_weight1 = 32'b00111010001100010101001111100011,
	parameter in_weight2 = 32'b00111101001010111000010010000100,
	parameter in_weight3 = 32'b00111100111010000111010100011110,
	parameter in_weight4 = 32'b00111100011010001000010001111001,
	parameter in_weight5 = 32'b10111101110111110010010111101011,
	parameter in_weight6 = 32'b10111101111001101101111101000101,
	parameter in_weight7 = 32'b10111101111010011101010001011001,
	parameter in_weight8 = 32'b10111101000100100001111100111010,
	parameter in_weight9 = 32'b10111100011010111101001000111110,
	parameter in_weight10 = 32'b10111101110111010100110010011010,
	parameter in_weight11 = 32'b10111101101010101110010101001101,
	parameter in_weight12 = 32'b10111101010000010010110111100000,
	parameter in_weight13 = 32'b10111011000111110111111001001011,
	parameter in_weight14 = 32'b00111101010101111000100011101100,
	parameter in_weight15 = 32'b10111010100100001111101000101011,
	parameter in_weight16 = 32'b00111101101111100110011110011100,
	parameter in_weight17 = 32'b00111101111001000100100011011101,
	parameter in_weight18 = 32'b10111101011111011001101000000110,
	parameter in_weight19 = 32'b00111101110010110001011010111010,
	parameter in_weight20 = 32'b00111101110111011001111000010100,
	parameter in_weight21 = 32'b10111101001110100000111111011110,
	parameter in_weight22 = 32'b10111101101011110000001110001000,
	parameter in_weight23 = 32'b10111101101111111001010010011010,
	parameter in_weight24 = 32'b00111100010100011111001110110100,
	parameter in_weight25 = 32'b00111101001000111000101001001010,
	parameter in_weight26 = 32'b10111100111011000010000000001111,
	parameter in_weight27 = 32'b00111100101001110001110000101100,
	parameter in_weight28 = 32'b00111101000100010000010100110101,
	parameter in_weight29 = 32'b10111101101110000110011010100001,
	parameter in_weight30 = 32'b10111101001100001011010101101000,
	parameter in_weight31 = 32'b10111101010011001100111011101001,
	parameter in_weight32 = 32'b00111101101111010110111010011101,
	parameter in_weight33 = 32'b10111100100110100101001010000101,
	parameter in_weight34 = 32'b10111101100101100100001011110000,
	parameter in_weight35 = 32'b10111101101101110100000111011110,
	parameter in_weight36 = 32'b10111011001101010011000010100110,
	parameter in_weight37 = 32'b10111011111100011100100010011000,
	parameter in_weight38 = 32'b00111101101100011110001000100011,
	parameter in_weight39 = 32'b10111101110110011101111010000010,
	parameter in_weight40 = 32'b00111101110101001010000100011000,
	parameter in_weight41 = 32'b00111011111101111100000011110100,
	parameter in_weight42 = 32'b10111100110101010001111110100001,
	parameter in_weight43 = 32'b00111101100001010110000001101100,
	parameter in_weight44 = 32'b10111101101000000100100100010100,
	parameter in_weight45 = 32'b10111101000011110010100001010111,
	parameter in_weight46 = 32'b10111101111010100111010100111110,
	parameter in_weight47 = 32'b00111101010000011000101001010001,
	parameter in_weight48 = 32'b10111101100110011001011100001101,
	parameter in_weight49 = 32'b00111010100101111011000111111001,
	parameter in_weight50 = 32'b00111101111011101010101010100100,
	parameter in_weight51 = 32'b10111100111010000111111000000011,
	parameter in_weight52 = 32'b10111101001001110000010111000111,
	parameter in_weight53 = 32'b10111101100110010011110101111101,
	parameter in_weight54 = 32'b00111100110011000000100010010110,
	parameter in_weight55 = 32'b00111101000001100011110100100010,
	parameter in_weight56 = 32'b10111100110010010111110001100011,
	parameter in_weight57 = 32'b10111101110101010010011101101010,
	parameter in_weight58 = 32'b10111101000100101000110000001110,
	parameter in_weight59 = 32'b00111101000100000111000001111101,
	parameter in_weight60 = 32'b00111100110010001111001111101101,
	parameter in_weight61 = 32'b00111101000011101001000111110010,
	parameter in_weight62 = 32'b00111101000111111110001110001011,
	parameter in_weight63 = 32'b10111011000111000000101101010111,
	parameter in_weight64 = 32'b10111001111101101111101011011001,
	parameter in_weight65 = 32'b00111101101011110011010010010010,
	parameter in_weight66 = 32'b00111101100000110110000010010100,
	parameter in_weight67 = 32'b00111101101101011001100110101010,
	parameter in_weight68 = 32'b10111101010101001011011001010111,
	parameter in_weight69 = 32'b10111100111000100101110100101110,
	parameter in_weight70 = 32'b00111101100001110000110111101010,
	parameter in_weight71 = 32'b10111101111010010101110011101100,
	parameter in_weight72 = 32'b00111101100101010100011101110111,
	parameter in_weight73 = 32'b00111100010001100000010011000010,
	parameter in_weight74 = 32'b00111101100111100110001101111110,
	parameter in_weight75 = 32'b10111101110100001011011101111110,
	parameter in_weight76 = 32'b10111101100110011110100111110110,
	parameter in_weight77 = 32'b00111101110010000101001000010100,
	parameter in_weight78 = 32'b10111100111100101001110001001110,
	parameter in_weight79 = 32'b10111101111010010001001001010001,
	parameter in_weight80 = 32'b00111101010110001110110100010110,
	parameter in_weight81 = 32'b10111101110110110011010101111101,
	parameter in_weight82 = 32'b10111100110100100001000101001001,
	parameter in_weight83 = 32'b10111010110100101011011011001001,
	parameter in_weight84 = 32'b00111101101001000110010000111010,
	parameter in_weight85 = 32'b10111100111010101000110011101011,
	parameter in_weight86 = 32'b00111100101110001100011100001010,
	parameter in_weight87 = 32'b00111101111011001001001000111001,
	parameter in_weight88 = 32'b00111101110010111010111110100110,
	parameter in_weight89 = 32'b10111010000100010110101101110100,
	parameter in_weight90 = 32'b00111101100110100000101011110001,
	parameter in_weight91 = 32'b10111101110101010011011101100001,
	parameter in_weight92 = 32'b00111010110011001001111100001100,
	parameter in_weight93 = 32'b00111101110100111011001010100001,
	parameter in_weight94 = 32'b10111101101001111011101100000100,
	parameter in_weight95 = 32'b10111101000010100000100110010001,
	parameter in_weight96 = 32'b00111101001100001011100001110011,
	parameter in_weight97 = 32'b10111101100001101011100101110011,
	parameter in_weight98 = 32'b00111100110011100110111010110001,
	parameter in_weight99 = 32'b10111101010011110000000000111010,
	parameter in_weight100 = 32'b10111101010101110100011101010001,
	parameter in_weight101 = 32'b10111100010011111000011011011101,
	parameter in_weight102 = 32'b00111101110000110110111110000100,
	parameter in_weight103 = 32'b00111101111100010001110101111111,
	parameter in_weight104 = 32'b00111101110101011110110001101001,
	parameter in_weight105 = 32'b10111100101001011000111001000110,
	parameter in_weight106 = 32'b00111101110111101010010010110101,
	parameter in_weight107 = 32'b00111100010010001010001011110101,
	parameter in_weight108 = 32'b10111101010111100001010000010110,
	parameter in_weight109 = 32'b00111101110011001110100110001000,
	parameter in_weight110 = 32'b00111101101101010110010010010010,
	parameter in_weight111 = 32'b10111101101010000100001011000010,
	parameter in_weight112 = 32'b10111100000000000000010001011001,
	parameter in_weight113 = 32'b00111101110010001111111101011101,
	parameter in_weight114 = 32'b10111001100000101100100001011001,
	parameter in_weight115 = 32'b10111101111000111001011100111101,
	parameter in_weight116 = 32'b10111101100000100101110010101000,
	parameter in_weight117 = 32'b00111101101111011001010000110011,
	parameter in_weight118 = 32'b10111011111011100100010110010011,
	parameter in_weight119 = 32'b10111101100001110100100001111110,
	parameter in_weight120 = 32'b00111011010101110111011001010010,
	parameter in_weight121 = 32'b00111101011000001010101101001101,
	parameter in_weight122 = 32'b00111101001001010110000001111010,
	parameter in_weight123 = 32'b00111101000111001010100001001001,
	parameter in_weight124 = 32'b10111100010111010111010011110100,
	parameter in_weight125 = 32'b10111101110111110011001111000001,
	parameter in_weight126 = 32'b10111100101100000101111010101111,
	parameter in_weight127 = 32'b10111101101100100100011100010010,
	parameter in_weight128 = 32'b00111101110011100101010100111110,
	parameter in_weight129 = 32'b10111101101010111100110110011101,
	parameter in_weight130 = 32'b00111101100101001000011001101111,
	parameter in_weight131 = 32'b00111101111000111000111111011100,
	parameter in_weight132 = 32'b10111100101011110000011110001001,
	parameter in_weight133 = 32'b00111100111001110010001001111001,
	parameter in_weight134 = 32'b00111101101101001001010001001010,
	parameter in_weight135 = 32'b00111101110001011010000100111010,
	parameter in_weight136 = 32'b10111100111001010011100001101111,
	parameter in_weight137 = 32'b00111101110010010100011010100111,
	parameter in_weight138 = 32'b10111101001100000110100100101010,
	parameter in_weight139 = 32'b10111101100100001111001011111110,
	parameter in_weight140 = 32'b10111101001101110110001010001011,
	parameter in_weight141 = 32'b00111101101110111001110010010010,
	parameter in_weight142 = 32'b10111100111011100111101111100111,
	parameter in_weight143 = 32'b10111101111001001001011011001001
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
