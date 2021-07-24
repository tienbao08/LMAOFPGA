`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_12
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


module conv_28_weight6_12
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b00111101100011010010111110001011,
	parameter in_weight1 = 32'b00111101100000111001111100101101,
	parameter in_weight2 = 32'b10111100101000000010010100011100,
	parameter in_weight3 = 32'b00111101100001001001001001010100,
	parameter in_weight4 = 32'b00111011010010010101111001010010,
	parameter in_weight5 = 32'b00111101010010111100101100100000,
	parameter in_weight6 = 32'b10111101010110010010000111001001,
	parameter in_weight7 = 32'b00111011001010001010011110011111,
	parameter in_weight8 = 32'b00111011110001001100101111011101,
	parameter in_weight9 = 32'b10111101001111001110110100001101,
	parameter in_weight10 = 32'b00111100110110001000111000000111,
	parameter in_weight11 = 32'b10111100110100001100010101110001,
	parameter in_weight12 = 32'b10111101010100101101000111110101,
	parameter in_weight13 = 32'b00111101011100001001000100010111,
	parameter in_weight14 = 32'b10111101100010011011111001011001,
	parameter in_weight15 = 32'b00111011000011010011110010110110,
	parameter in_weight16 = 32'b10111101100011000011111010101111,
	parameter in_weight17 = 32'b10111011100011001001011101001111,
	parameter in_weight18 = 32'b00111011101111101111110101101101,
	parameter in_weight19 = 32'b10111101101001011110000001011111,
	parameter in_weight20 = 32'b10111101100010011000011110000001,
	parameter in_weight21 = 32'b00111100011011101001111001001101,
	parameter in_weight22 = 32'b10111100000111010100010101100001,
	parameter in_weight23 = 32'b10111101100100011101000110100010,
	parameter in_weight24 = 32'b10111101001011011111010101100001,
	parameter in_weight25 = 32'b00111100100101110101100000100110,
	parameter in_weight26 = 32'b00111100111110101111101000101011,
	parameter in_weight27 = 32'b10111101011110001101011001111100,
	parameter in_weight28 = 32'b10111101001011001101001101110001,
	parameter in_weight29 = 32'b00111100010110000010001010111000,
	parameter in_weight30 = 32'b00111101100110101101011100101011,
	parameter in_weight31 = 32'b00111101001000110110100011110010,
	parameter in_weight32 = 32'b00111101010100000110100001010100,
	parameter in_weight33 = 32'b10111101100111111101011101110101,
	parameter in_weight34 = 32'b10111101011111101111100000000110,
	parameter in_weight35 = 32'b10111100111110001010001100011111,
	parameter in_weight36 = 32'b10111101001100000101110001010110,
	parameter in_weight37 = 32'b10111101010101100010011111010100,
	parameter in_weight38 = 32'b00111101100110001000100010101000,
	parameter in_weight39 = 32'b00111101100010010111101110010101,
	parameter in_weight40 = 32'b00111101001110001010000101110000,
	parameter in_weight41 = 32'b10111100110101010000110001000101,
	parameter in_weight42 = 32'b10111101011111000011010100000110,
	parameter in_weight43 = 32'b10111101000011111100101010001110,
	parameter in_weight44 = 32'b00111101001110101001010101101111,
	parameter in_weight45 = 32'b10111101001011000000011110111110,
	parameter in_weight46 = 32'b10111101001010001010011001011000,
	parameter in_weight47 = 32'b00111100111111100101001100100010,
	parameter in_weight48 = 32'b10111101100110111011101000010001,
	parameter in_weight49 = 32'b00111101010100010100100110000011,
	parameter in_weight50 = 32'b10111101011110000000100011000111,
	parameter in_weight51 = 32'b00111100001001101000111110000111,
	parameter in_weight52 = 32'b10111100101011000010010000111010,
	parameter in_weight53 = 32'b10111101011001111010110101100110,
	parameter in_weight54 = 32'b10111101001001101101111100011000,
	parameter in_weight55 = 32'b00111101100000110101101101111011,
	parameter in_weight56 = 32'b00111101011110000000010100010111,
	parameter in_weight57 = 32'b00111101010000101111010000010011,
	parameter in_weight58 = 32'b10111101011000110101100100110011,
	parameter in_weight59 = 32'b10111101100011101010110101111011,
	parameter in_weight60 = 32'b00111101101010111001100110010110,
	parameter in_weight61 = 32'b00111011101001100111011011011001,
	parameter in_weight62 = 32'b00111100110101000000010101110000,
	parameter in_weight63 = 32'b10111100111010100011000010001111,
	parameter in_weight64 = 32'b10111101101001100011011010001100,
	parameter in_weight65 = 32'b00111101000111100101010111111110,
	parameter in_weight66 = 32'b00111101100011100101101000000011,
	parameter in_weight67 = 32'b10111101100100011100000001001110,
	parameter in_weight68 = 32'b00111100000000111000101111001001,
	parameter in_weight69 = 32'b10111100100001101000000010100000,
	parameter in_weight70 = 32'b00111101100011101111011001100101,
	parameter in_weight71 = 32'b10111101010000001000111001110000,
	parameter in_weight72 = 32'b00111011111111110111110101101000,
	parameter in_weight73 = 32'b10111011010111110000110101101101,
	parameter in_weight74 = 32'b00111101100110001101011001000000,
	parameter in_weight75 = 32'b10111101101000000111000110010001,
	parameter in_weight76 = 32'b00111101001011100000000111001010,
	parameter in_weight77 = 32'b10111011011111011010100001100001,
	parameter in_weight78 = 32'b00111101011100111011111010111000,
	parameter in_weight79 = 32'b10111011101010101010001000110011,
	parameter in_weight80 = 32'b10111100010101100101110011101101,
	parameter in_weight81 = 32'b00111101011000010100110000110101,
	parameter in_weight82 = 32'b00111101000001011101111011110101,
	parameter in_weight83 = 32'b10111100101111010101110101100010,
	parameter in_weight84 = 32'b00111101010110011111000111101110,
	parameter in_weight85 = 32'b00111101100011000001111111010101,
	parameter in_weight86 = 32'b00111101011101001110101111100101,
	parameter in_weight87 = 32'b00111100001011000000110101111010,
	parameter in_weight88 = 32'b00111100010001011100111100010101,
	parameter in_weight89 = 32'b10111101011110011101011010011110,
	parameter in_weight90 = 32'b00111011101000001111000101111100,
	parameter in_weight91 = 32'b10111100110111110011101000010101,
	parameter in_weight92 = 32'b00111100010000011100101101000111,
	parameter in_weight93 = 32'b10111101100101011100110011001111,
	parameter in_weight94 = 32'b00111101011011000100100111000011,
	parameter in_weight95 = 32'b00111101101000110111011100110010,
	parameter in_weight96 = 32'b00111100111001100001111011101001,
	parameter in_weight97 = 32'b10111101000011101001011100111100,
	parameter in_weight98 = 32'b10111101101001110100111010010100,
	parameter in_weight99 = 32'b10111100111001000100101010000110,
	parameter in_weight100 = 32'b00111101100110010000111101100010,
	parameter in_weight101 = 32'b00111100110000010101110001011000,
	parameter in_weight102 = 32'b00111011111000001010101010010110,
	parameter in_weight103 = 32'b10111101100000010110010110100010,
	parameter in_weight104 = 32'b00111100110111000010110001001011,
	parameter in_weight105 = 32'b00111100011101100011101100010011,
	parameter in_weight106 = 32'b10111101011010100000000000011111,
	parameter in_weight107 = 32'b00111100110010011011010001110011,
	parameter in_weight108 = 32'b10111101001110000110001001011010,
	parameter in_weight109 = 32'b00111100111111001010110001111001,
	parameter in_weight110 = 32'b10111011111111111110001000001111,
	parameter in_weight111 = 32'b00111100011101101011110011110100,
	parameter in_weight112 = 32'b10111100111111001011110010101010,
	parameter in_weight113 = 32'b00111100101100001000100100110001,
	parameter in_weight114 = 32'b10111100110101010000100111011100,
	parameter in_weight115 = 32'b00111101011101010101011011111100,
	parameter in_weight116 = 32'b00111100111100111000101111001101,
	parameter in_weight117 = 32'b00111100111000100101110100011101,
	parameter in_weight118 = 32'b10111101100100111100100011100110,
	parameter in_weight119 = 32'b10111101100001111111110000101000,
	parameter in_weight120 = 32'b10111101001010110010001011111100,
	parameter in_weight121 = 32'b00111101000101001011001110010111,
	parameter in_weight122 = 32'b10111101100000110111100101100100,
	parameter in_weight123 = 32'b10111101001000100001101011000011,
	parameter in_weight124 = 32'b00111101000010000010100011100001,
	parameter in_weight125 = 32'b10111101100010101111110000110011,
	parameter in_weight126 = 32'b10111100000100000111011101110110,
	parameter in_weight127 = 32'b00111101011111111000010011100001,
	parameter in_weight128 = 32'b10111100000111110110010001010100,
	parameter in_weight129 = 32'b00111101010001010001000000001001,
	parameter in_weight130 = 32'b10111101100001101110110110111111,
	parameter in_weight131 = 32'b00111101001110011010110001101011,
	parameter in_weight132 = 32'b10111101011001000010111001111101,
	parameter in_weight133 = 32'b10111101101000000100000000000011,
	parameter in_weight134 = 32'b10111101001100001010000011011101,
	parameter in_weight135 = 32'b00111101010111101000110001101010,
	parameter in_weight136 = 32'b00111101010010111111000001111010,
	parameter in_weight137 = 32'b00111101011010111110110110011110,
	parameter in_weight138 = 32'b00111101011001001100011101001010,
	parameter in_weight139 = 32'b00111101100011011000100010110110,
	parameter in_weight140 = 32'b00111101010001001001000001011011,
	parameter in_weight141 = 32'b00111101100111111010001011010001,
	parameter in_weight142 = 32'b00111101011011000100111000111011,
	parameter in_weight143 = 32'b00111101100110110101110000000001,
	parameter in_weight144 = 32'b00111101010111101000000100110100,
	parameter in_weight145 = 32'b10111101100001000011001010001110,
	parameter in_weight146 = 32'b00111100011100110110100011000000,
	parameter in_weight147 = 32'b00111101100001001111000110111111,
	parameter in_weight148 = 32'b00111101001101001000010101100100,
	parameter in_weight149 = 32'b10111011111001111110110001000110,
	parameter in_weight150 = 32'b10111101010011001001100011001011,
	parameter in_weight151 = 32'b00111101000001100011110101010100,
	parameter in_weight152 = 32'b10111100101001100111011110000111,
	parameter in_weight153 = 32'b10111101010001101011001000111100,
	parameter in_weight154 = 32'b10111101010000010101111110111000,
	parameter in_weight155 = 32'b00111011100011011101000101010101,
	parameter in_weight156 = 32'b10111100100100000010110111111110,
	parameter in_weight157 = 32'b10111100100101011001010101000111,
	parameter in_weight158 = 32'b10111100101001011100000010011110,
	parameter in_weight159 = 32'b10111101011101101010101101010111,
	parameter in_weight160 = 32'b10111011111111000110100110000101,
	parameter in_weight161 = 32'b10111101010100100010101101010011,
	parameter in_weight162 = 32'b10111100111101100101011001010101,
	parameter in_weight163 = 32'b00111100100101001011010011101111,
	parameter in_weight164 = 32'b10111100100110000011010010100110,
	parameter in_weight165 = 32'b00111101101001001011111010010011,
	parameter in_weight166 = 32'b00111101010001010100010100101011,
	parameter in_weight167 = 32'b10111011111110000111000101110110,
	parameter in_weight168 = 32'b10111101000001001000100001100100,
	parameter in_weight169 = 32'b10111101000010010000011001111010,
	parameter in_weight170 = 32'b00111101000011010010110111101100,
	parameter in_weight171 = 32'b00111100100001011100110010101110,
	parameter in_weight172 = 32'b10111101101001001101100011000110,
	parameter in_weight173 = 32'b00111101100001111100111110010111,
	parameter in_weight174 = 32'b00111101001111000100111101000000,
	parameter in_weight175 = 32'b00111010000000110101110000101010,
	parameter in_weight176 = 32'b00111100101111111101001110100010,
	parameter in_weight177 = 32'b10111101001110110111110001010011,
	parameter in_weight178 = 32'b00111101011000111010010100110110,
	parameter in_weight179 = 32'b00111100111111101100110000101111,
	parameter in_weight180 = 32'b10111101010100010101001011001001,
	parameter in_weight181 = 32'b00111101100100101011100011101011,
	parameter in_weight182 = 32'b00111100101011111111000111101111,
	parameter in_weight183 = 32'b10111011001100101010000110101110,
	parameter in_weight184 = 32'b10111101011111000110001011100100,
	parameter in_weight185 = 32'b00111101001010000111001000000010,
	parameter in_weight186 = 32'b10111100110100011111101101010111,
	parameter in_weight187 = 32'b10111101001011010101000010011001,
	parameter in_weight188 = 32'b00111011010011100011100000000111,
	parameter in_weight189 = 32'b10111101010100000101110101001111,
	parameter in_weight190 = 32'b00111101100101001111101000010001,
	parameter in_weight191 = 32'b00111101100000100011101101110001,
	parameter in_weight192 = 32'b10111101100010001000000001011000,
	parameter in_weight193 = 32'b10111100111110101111001100100011,
	parameter in_weight194 = 32'b00111100110110000111000111100000,
	parameter in_weight195 = 32'b10111101100001100010101101110100,
	parameter in_weight196 = 32'b00111101100110010111011110111101,
	parameter in_weight197 = 32'b10111100101011000111000010010010,
	parameter in_weight198 = 32'b10111101101001111001100101010100,
	parameter in_weight199 = 32'b00111101000010100111010111011101,
	parameter in_weight200 = 32'b10111101100011101101010010000111,
	parameter in_weight201 = 32'b00111101000011100011001111101101,
	parameter in_weight202 = 32'b00111101000110111001010111010110,
	parameter in_weight203 = 32'b00111100100110011101001100001011,
	parameter in_weight204 = 32'b10111100101011010101100000100100,
	parameter in_weight205 = 32'b10111101100001000010000001100010,
	parameter in_weight206 = 32'b00111101011010001101101010010001,
	parameter in_weight207 = 32'b10111101100111100110100111000101,
	parameter in_weight208 = 32'b00111101001101010001110000110100,
	parameter in_weight209 = 32'b10111100101001100111000000001001,
	parameter in_weight210 = 32'b10111101011000010100001001011100,
	parameter in_weight211 = 32'b10111011101101101000011101010011,
	parameter in_weight212 = 32'b00111100110101110001001001001011,
	parameter in_weight213 = 32'b00111101001001101101011101100111,
	parameter in_weight214 = 32'b10111101000100100101111100000001,
	parameter in_weight215 = 32'b00111101000111011110110011100111,
	parameter in_weight216 = 32'b00111101011011101000000011011010,
	parameter in_weight217 = 32'b00111100111111110110010100101011,
	parameter in_weight218 = 32'b00111101100110101001000011101110,
	parameter in_weight219 = 32'b00111101100110010000000111101101,
	parameter in_weight220 = 32'b10111101010101110111111111011010,
	parameter in_weight221 = 32'b10111101000010111100010101111011,
	parameter in_weight222 = 32'b10111011111010110000001110110000,
	parameter in_weight223 = 32'b10111101100000010101001110001011,
	parameter in_weight224 = 32'b10111101010001100100111100010011,
	parameter in_weight225 = 32'b00111100111100011011101100010110,
	parameter in_weight226 = 32'b00111101010010101000001001111001,
	parameter in_weight227 = 32'b00111101101010001100000100100100,
	parameter in_weight228 = 32'b10111101001101001110000001111010,
	parameter in_weight229 = 32'b00111101100010000011011111100100,
	parameter in_weight230 = 32'b00111101000101111010001111111101,
	parameter in_weight231 = 32'b00111100001010001001011010111100,
	parameter in_weight232 = 32'b10111000001011110101111000101111,
	parameter in_weight233 = 32'b10111101100100100101011111010011,
	parameter in_weight234 = 32'b00111101100111111000100110011001,
	parameter in_weight235 = 32'b00111101000100100100111111000110,
	parameter in_weight236 = 32'b00111101000101111001111011100101,
	parameter in_weight237 = 32'b10111101000101001000101100110011,
	parameter in_weight238 = 32'b10111100110000110111111000101101,
	parameter in_weight239 = 32'b10111101100100011100110000011010,
	parameter in_weight240 = 32'b00111101000011100101001110101011,
	parameter in_weight241 = 32'b10111100110100000011011100111110,
	parameter in_weight242 = 32'b10111101101001000111101001001010,
	parameter in_weight243 = 32'b00111101001111101111101011101001,
	parameter in_weight244 = 32'b10111100111110011101010110101101,
	parameter in_weight245 = 32'b10111101011101000111001010111000,
	parameter in_weight246 = 32'b00111011010100101000101110011101,
	parameter in_weight247 = 32'b00111011000101011110111010000001,
	parameter in_weight248 = 32'b10111101100011001110011001001111,
	parameter in_weight249 = 32'b10111100110001101111001100000010,
	parameter in_weight250 = 32'b10111100110001100001111111001111,
	parameter in_weight251 = 32'b00111101100111010011001100000100,
	parameter in_weight252 = 32'b00111101100011011110010100110010,
	parameter in_weight253 = 32'b10111101101001010000001111011100,
	parameter in_weight254 = 32'b10111100100111110010101111101011,
	parameter in_weight255 = 32'b00111100110110000001111011011010,
	parameter in_weight256 = 32'b00111100110000101000100111111011,
	parameter in_weight257 = 32'b00111101000001110001000100110111,
	parameter in_weight258 = 32'b10111101011100110100110101110000,
	parameter in_weight259 = 32'b00111101010100111101101100010010,
	parameter in_weight260 = 32'b10111101100010001011011011001100,
	parameter in_weight261 = 32'b10111101100111101000010100001110,
	parameter in_weight262 = 32'b10111100110010111110101111010100,
	parameter in_weight263 = 32'b00111100111000010000111001110100,
	parameter in_weight264 = 32'b10111101100101011010110000000111,
	parameter in_weight265 = 32'b10111101010111101010100001011100,
	parameter in_weight266 = 32'b10111100101100010010111001001010,
	parameter in_weight267 = 32'b00111101000101111101101110011111,
	parameter in_weight268 = 32'b10111001111100001001111100010100,
	parameter in_weight269 = 32'b00111100110011011010001101011110,
	parameter in_weight270 = 32'b10111100001001011111111110111011,
	parameter in_weight271 = 32'b10111101000110101100111000111010,
	parameter in_weight272 = 32'b10111101000010000110110001100101,
	parameter in_weight273 = 32'b00111100111110101000011001111101,
	parameter in_weight274 = 32'b10111101001000110100000000111110,
	parameter in_weight275 = 32'b10111101010100110100101111010111,
	parameter in_weight276 = 32'b10111101010101011100001001000110,
	parameter in_weight277 = 32'b00111101011000011011001011011000,
	parameter in_weight278 = 32'b00111011101001001110100111010110,
	parameter in_weight279 = 32'b00111101001111001111111110001010,
	parameter in_weight280 = 32'b10111101000110010101111011001110,
	parameter in_weight281 = 32'b00111101100010010010111110100001,
	parameter in_weight282 = 32'b10111100011000100110001011111011,
	parameter in_weight283 = 32'b10111011011000110100100111100000,
	parameter in_weight284 = 32'b10111101000110000010011101110011,
	parameter in_weight285 = 32'b00111101011010011100000100100101,
	parameter in_weight286 = 32'b00111101011000110111011101100010,
	parameter in_weight287 = 32'b00111100001111110101000010101101
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
	result15,
	result16,
	result17,
	result18,
	result19,
	result20,
	result21,
	result22,
	result23,
	result24,
	result25,
	result26,
	result27,
	result28,
	result29,
	result30,
	result31
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
	result15,
	result16,
	result17,
	result18,
	result19,
	result20,
	result21,
	result22,
	result23,
	result24,
	result25,
	result26,
	result27,
	result28,
	result29,
	result30,
	result31;
    output wire [ram_depth-1:0] rowcounter;
    output wire [counter_depth-1:0] counter;
    
    wire [data_width-1:0] kernal0, kernal1, kernal2, kernal3, kernal4, kernal5, kernal6, kernal7, kernal8;
    
lineBuffer_28_conv #(data_width,
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

conv_core #(in_weight144, in_weight145, in_weight146, in_weight147, in_weight148, in_weight149, in_weight150, in_weight151, in_weight152)
			core16(.result(result16), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight153, in_weight154, in_weight155, in_weight156, in_weight157, in_weight158, in_weight159, in_weight160, in_weight161)
			core17(.result(result17), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight162, in_weight163, in_weight164, in_weight165, in_weight166, in_weight167, in_weight168, in_weight169, in_weight170)
			core18(.result(result18), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight171, in_weight172, in_weight173, in_weight174, in_weight175, in_weight176, in_weight177, in_weight178, in_weight179)
			core19(.result(result19), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight180, in_weight181, in_weight182, in_weight183, in_weight184, in_weight185, in_weight186, in_weight187, in_weight188)
			core20(.result(result20), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight189, in_weight190, in_weight191, in_weight192, in_weight193, in_weight194, in_weight195, in_weight196, in_weight197)
			core21(.result(result21), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight198, in_weight199, in_weight200, in_weight201, in_weight202, in_weight203, in_weight204, in_weight205, in_weight206)
			core22(.result(result22), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight207, in_weight208, in_weight209, in_weight210, in_weight211, in_weight212, in_weight213, in_weight214, in_weight215)
			core23(.result(result23), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight216, in_weight217, in_weight218, in_weight219, in_weight220, in_weight221, in_weight222, in_weight223, in_weight224)
			core24(.result(result24), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight225, in_weight226, in_weight227, in_weight228, in_weight229, in_weight230, in_weight231, in_weight232, in_weight233)
			core25(.result(result25), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight234, in_weight235, in_weight236, in_weight237, in_weight238, in_weight239, in_weight240, in_weight241, in_weight242)
			core26(.result(result26), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight243, in_weight244, in_weight245, in_weight246, in_weight247, in_weight248, in_weight249, in_weight250, in_weight251)
			core27(.result(result27), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight252, in_weight253, in_weight254, in_weight255, in_weight256, in_weight257, in_weight258, in_weight259, in_weight260)
			core28(.result(result28), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight261, in_weight262, in_weight263, in_weight264, in_weight265, in_weight266, in_weight267, in_weight268, in_weight269)
			core29(.result(result29), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight270, in_weight271, in_weight272, in_weight273, in_weight274, in_weight275, in_weight276, in_weight277, in_weight278)
			core30(.result(result30), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

conv_core #(in_weight279, in_weight280, in_weight281, in_weight282, in_weight283, in_weight284, in_weight285, in_weight286, in_weight287)
			core31(.result(result31), .in0(kernal0), .in1(kernal1), .in2(kernal2), .in3(kernal3), .in4(kernal4), .in5(kernal5), .in6(kernal6), .in7(kernal7), .in8(kernal8));

endmodule
