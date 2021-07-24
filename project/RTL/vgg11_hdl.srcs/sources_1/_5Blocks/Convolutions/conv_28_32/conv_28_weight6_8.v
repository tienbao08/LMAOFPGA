`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_8
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


module conv_28_weight6_8
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b10111101011110010010010100111000,
	parameter in_weight1 = 32'b00111011110011110011001100101111,
	parameter in_weight2 = 32'b10111101011010000110110000111111,
	parameter in_weight3 = 32'b10111100010101110001000111000111,
	parameter in_weight4 = 32'b10111101010110000111101011011011,
	parameter in_weight5 = 32'b00111101100111110011001100011000,
	parameter in_weight6 = 32'b10111100101111010011111001010101,
	parameter in_weight7 = 32'b00111101001110110001100100000100,
	parameter in_weight8 = 32'b00111100110010010010101111101111,
	parameter in_weight9 = 32'b00111101000011101000110010101000,
	parameter in_weight10 = 32'b10111100111010111110011010111010,
	parameter in_weight11 = 32'b10111101010101001001000000000101,
	parameter in_weight12 = 32'b10111101101000010011110110010111,
	parameter in_weight13 = 32'b10111101000010100011000110101001,
	parameter in_weight14 = 32'b10111101001111010111001101010111,
	parameter in_weight15 = 32'b00111100010011011100101100001111,
	parameter in_weight16 = 32'b00111100111111100000000011000000,
	parameter in_weight17 = 32'b10111101010011101001001010000100,
	parameter in_weight18 = 32'b00111100100111111101100100010000,
	parameter in_weight19 = 32'b10111100101011110010000000011001,
	parameter in_weight20 = 32'b10111101100001111110010110011101,
	parameter in_weight21 = 32'b10111101011001001101110001011101,
	parameter in_weight22 = 32'b00111100010110001011100010000110,
	parameter in_weight23 = 32'b00111010010110010000000100100100,
	parameter in_weight24 = 32'b10111100011100111100000111011111,
	parameter in_weight25 = 32'b00111101010110001011001011011110,
	parameter in_weight26 = 32'b00111011110111111011010110111101,
	parameter in_weight27 = 32'b00111101010001011011110100011100,
	parameter in_weight28 = 32'b00111100000010001111010101100100,
	parameter in_weight29 = 32'b00111101000110110011100001111111,
	parameter in_weight30 = 32'b10111101101000010101010100011101,
	parameter in_weight31 = 32'b10111101100101011010110110101010,
	parameter in_weight32 = 32'b10111101000110000001110000111010,
	parameter in_weight33 = 32'b00111101100100000100010010101110,
	parameter in_weight34 = 32'b00111100000010100110100010100000,
	parameter in_weight35 = 32'b10111101001100101000101110101001,
	parameter in_weight36 = 32'b10111101010001101100100111110110,
	parameter in_weight37 = 32'b00111101001100000011110000010010,
	parameter in_weight38 = 32'b10111101000100100110011110100011,
	parameter in_weight39 = 32'b10111100100111101001001101101100,
	parameter in_weight40 = 32'b00111100100111110111000010100101,
	parameter in_weight41 = 32'b10111101100100001000011000010101,
	parameter in_weight42 = 32'b10111100110000010101110001011110,
	parameter in_weight43 = 32'b00111101011010100110001111001101,
	parameter in_weight44 = 32'b00111101010010011010111011011000,
	parameter in_weight45 = 32'b10111011101001111111001001110110,
	parameter in_weight46 = 32'b10111101000101010111000001010111,
	parameter in_weight47 = 32'b10111101101000111111100100111001,
	parameter in_weight48 = 32'b00111101000101000010111110100001,
	parameter in_weight49 = 32'b10111100000011010111000100000000,
	parameter in_weight50 = 32'b00111101100101110000110101101001,
	parameter in_weight51 = 32'b10111100000100100101000110111100,
	parameter in_weight52 = 32'b10111101011111000111101010011010,
	parameter in_weight53 = 32'b00111101011100111100110011000110,
	parameter in_weight54 = 32'b00111101000010100001111001111110,
	parameter in_weight55 = 32'b10111100101101001011100011111001,
	parameter in_weight56 = 32'b00111101100011100111111110101100,
	parameter in_weight57 = 32'b00111101000110100011110010000101,
	parameter in_weight58 = 32'b00111101010010001101101001110001,
	parameter in_weight59 = 32'b00111101000100100111110100011100,
	parameter in_weight60 = 32'b10111101101001110000000101000011,
	parameter in_weight61 = 32'b10111100101111100100011100011101,
	parameter in_weight62 = 32'b10111101001000110001110010101111,
	parameter in_weight63 = 32'b10111100110000000101101101110100,
	parameter in_weight64 = 32'b00111101011101111000001010101111,
	parameter in_weight65 = 32'b00111100101011100111011110100000,
	parameter in_weight66 = 32'b10111100100100010001101110101001,
	parameter in_weight67 = 32'b10111101011001010100111000111110,
	parameter in_weight68 = 32'b00111101101010010010001001001111,
	parameter in_weight69 = 32'b10111101000111111100001100010111,
	parameter in_weight70 = 32'b00111101000100000100111000010110,
	parameter in_weight71 = 32'b10111100101101111101111111000010,
	parameter in_weight72 = 32'b10111101001101000000101101001011,
	parameter in_weight73 = 32'b00111100000111000101010011110000,
	parameter in_weight74 = 32'b10111101100101111001010010001101,
	parameter in_weight75 = 32'b10111100110001101101101101011000,
	parameter in_weight76 = 32'b10111100101010010101101111000000,
	parameter in_weight77 = 32'b10111101100011110010110101010100,
	parameter in_weight78 = 32'b10111100111101110100001011111010,
	parameter in_weight79 = 32'b10111101100110011010000110010001,
	parameter in_weight80 = 32'b10111101100011010110110011001101,
	parameter in_weight81 = 32'b00111101001111010101100101111011,
	parameter in_weight82 = 32'b00111101011001111000010111111010,
	parameter in_weight83 = 32'b10111101100111001100101100010001,
	parameter in_weight84 = 32'b10111100100010010111011011101100,
	parameter in_weight85 = 32'b10111100001101010010011010011001,
	parameter in_weight86 = 32'b00111101100100100111111000101111,
	parameter in_weight87 = 32'b10111101001000110010110000101001,
	parameter in_weight88 = 32'b00111100000100000101111011010111,
	parameter in_weight89 = 32'b10111101010011011111101110111001,
	parameter in_weight90 = 32'b00111101101001011000110111000011,
	parameter in_weight91 = 32'b00111011010100110011100011100000,
	parameter in_weight92 = 32'b10111100100000100001011000100101,
	parameter in_weight93 = 32'b00111011100100010111101101000111,
	parameter in_weight94 = 32'b00111101100010001110011101001110,
	parameter in_weight95 = 32'b00111101100101101101110100000010,
	parameter in_weight96 = 32'b00111101001001111000100101101000,
	parameter in_weight97 = 32'b10111011101001000000001000001001,
	parameter in_weight98 = 32'b00111101101001111100010001011110,
	parameter in_weight99 = 32'b10111101100111100101100111001100,
	parameter in_weight100 = 32'b10111101100001100010111000010110,
	parameter in_weight101 = 32'b10111011000000001000010000101011,
	parameter in_weight102 = 32'b10111101101001010110011011001001,
	parameter in_weight103 = 32'b00111101001111111100111001010111,
	parameter in_weight104 = 32'b10111101000000001100111101010101,
	parameter in_weight105 = 32'b00111100100111101110100000100001,
	parameter in_weight106 = 32'b10111101011100010000111100011001,
	parameter in_weight107 = 32'b00111010101110100101101110000100,
	parameter in_weight108 = 32'b10111101001010010101011011001001,
	parameter in_weight109 = 32'b00111101010000001011100110011100,
	parameter in_weight110 = 32'b10111101100011000001010101111011,
	parameter in_weight111 = 32'b00111101001001110100101110010001,
	parameter in_weight112 = 32'b10111101011110000110000100101011,
	parameter in_weight113 = 32'b10111101100100110000000110101011,
	parameter in_weight114 = 32'b00111101001001100011110111001001,
	parameter in_weight115 = 32'b10111101000000111101110010101011,
	parameter in_weight116 = 32'b00111101101010001010110001100010,
	parameter in_weight117 = 32'b10111101010110001001110101011110,
	parameter in_weight118 = 32'b00111100000111011110100110111100,
	parameter in_weight119 = 32'b10111101001010100010000010000110,
	parameter in_weight120 = 32'b00111101011011110000010010100011,
	parameter in_weight121 = 32'b10111101100100000000000100010000,
	parameter in_weight122 = 32'b10111101011010001101111101011011,
	parameter in_weight123 = 32'b10111100010000100000011010001000,
	parameter in_weight124 = 32'b10111101010010100010111000000001,
	parameter in_weight125 = 32'b00111100110101100011111111011100,
	parameter in_weight126 = 32'b00111011111000010100001101000010,
	parameter in_weight127 = 32'b10111100110010100100011101001010,
	parameter in_weight128 = 32'b10111101000101010110001100111001,
	parameter in_weight129 = 32'b00111100101010101101001010111001,
	parameter in_weight130 = 32'b00111100111110001010001111110101,
	parameter in_weight131 = 32'b10111011011010001110111101111110,
	parameter in_weight132 = 32'b10111101001101000100010110001100,
	parameter in_weight133 = 32'b00111101100010110011011001010011,
	parameter in_weight134 = 32'b10111011000100001010000101001100,
	parameter in_weight135 = 32'b10111100100011000110110011111000,
	parameter in_weight136 = 32'b00111100110101101111111001000111,
	parameter in_weight137 = 32'b00111100111001110100101010101000,
	parameter in_weight138 = 32'b10111100101110011010000100001101,
	parameter in_weight139 = 32'b10111101101000100110110011111111,
	parameter in_weight140 = 32'b10111100100000100110101111100100,
	parameter in_weight141 = 32'b10111101011010111001100011011001,
	parameter in_weight142 = 32'b00111101000011101011111011110011,
	parameter in_weight143 = 32'b10111101100111000111000101110000,
	parameter in_weight144 = 32'b00111101100100010101011010010100,
	parameter in_weight145 = 32'b00111010100000010001011100111011,
	parameter in_weight146 = 32'b10111101001010111110111011111101,
	parameter in_weight147 = 32'b10111101000010111110010001001000,
	parameter in_weight148 = 32'b10111100101011001101101110100100,
	parameter in_weight149 = 32'b10111101101001101110010000010001,
	parameter in_weight150 = 32'b10111101100010101000000010100100,
	parameter in_weight151 = 32'b00111101000100001110110010010000,
	parameter in_weight152 = 32'b00111101001110110001110111010101,
	parameter in_weight153 = 32'b10111101001010101000110110011010,
	parameter in_weight154 = 32'b10111011100111000001101111001101,
	parameter in_weight155 = 32'b10111101101010101110001011010101,
	parameter in_weight156 = 32'b00111100110001111011101111010000,
	parameter in_weight157 = 32'b10111101001111111001111111011001,
	parameter in_weight158 = 32'b10111011010010010101111001100111,
	parameter in_weight159 = 32'b10111100010100001000111000111001,
	parameter in_weight160 = 32'b00111011000010001111010111001110,
	parameter in_weight161 = 32'b00111100011101100111001011111111,
	parameter in_weight162 = 32'b00111100101110111001011111101100,
	parameter in_weight163 = 32'b00111101000110001000100101110000,
	parameter in_weight164 = 32'b10111100111011011011001100010101,
	parameter in_weight165 = 32'b00111100000001110001011011010010,
	parameter in_weight166 = 32'b00111100101010110100011100011100,
	parameter in_weight167 = 32'b10111101001011001111000110100000,
	parameter in_weight168 = 32'b00111101011001100000100000100101,
	parameter in_weight169 = 32'b10111101000111010100101100100011,
	parameter in_weight170 = 32'b00111100100000010000111010101110,
	parameter in_weight171 = 32'b00111101001111010010100100101000,
	parameter in_weight172 = 32'b10111101100010010111101000000101,
	parameter in_weight173 = 32'b00111101011111100000111100101111,
	parameter in_weight174 = 32'b10111011100011001100110011111110,
	parameter in_weight175 = 32'b00111101100100011010100110111100,
	parameter in_weight176 = 32'b10111101010001110010001000100001,
	parameter in_weight177 = 32'b00111011101001001011100011010000,
	parameter in_weight178 = 32'b00111101011001001010100110011000,
	parameter in_weight179 = 32'b00111101101010010111110100100001,
	parameter in_weight180 = 32'b00111101100001010110111001001100,
	parameter in_weight181 = 32'b10111100110101111000000001100110,
	parameter in_weight182 = 32'b00111100100111010101111001111001,
	parameter in_weight183 = 32'b10111101100001111111100010110110,
	parameter in_weight184 = 32'b00111101100110110000011001110101,
	parameter in_weight185 = 32'b00111100110111011100100110011111,
	parameter in_weight186 = 32'b10111100010111101110111101001001,
	parameter in_weight187 = 32'b00111101010111101100111111101111,
	parameter in_weight188 = 32'b10111101001111100101000010010000,
	parameter in_weight189 = 32'b00111101010110110101011111011010,
	parameter in_weight190 = 32'b00111101000111000000111001111000,
	parameter in_weight191 = 32'b10111100111110000110000101111111,
	parameter in_weight192 = 32'b10111011101111101111111101010001,
	parameter in_weight193 = 32'b10111100110011101011111010010111,
	parameter in_weight194 = 32'b10111100101110101101111111100011,
	parameter in_weight195 = 32'b10111100011101100110010111110100,
	parameter in_weight196 = 32'b00111011100001111111110111101110,
	parameter in_weight197 = 32'b10111100011101111011011101111101,
	parameter in_weight198 = 32'b00111101000010000100000011111011,
	parameter in_weight199 = 32'b00111101000101101000110111110001,
	parameter in_weight200 = 32'b00111101010110011100001011010111,
	parameter in_weight201 = 32'b10111100000111100010001011110111,
	parameter in_weight202 = 32'b10111101100011010010100101010001,
	parameter in_weight203 = 32'b00111101000111100000100110011001,
	parameter in_weight204 = 32'b00111101000111111100011001111010,
	parameter in_weight205 = 32'b00111101101010100011000001010010,
	parameter in_weight206 = 32'b10111101010111110000011100100100,
	parameter in_weight207 = 32'b10111001100101111010011101111111,
	parameter in_weight208 = 32'b00111101011101100011000111111001,
	parameter in_weight209 = 32'b00111011100111001001000100110000,
	parameter in_weight210 = 32'b10111100001110000000101100011010,
	parameter in_weight211 = 32'b00111100001011100010011011011000,
	parameter in_weight212 = 32'b00111011110011110000011011101010,
	parameter in_weight213 = 32'b00111101011111000110010001011001,
	parameter in_weight214 = 32'b10111100100110110110111110111001,
	parameter in_weight215 = 32'b00111101100100000110110001110111,
	parameter in_weight216 = 32'b10111101101000100111010011011100,
	parameter in_weight217 = 32'b00111101000001111011001111011000,
	parameter in_weight218 = 32'b10111101001000010100000000100011,
	parameter in_weight219 = 32'b10111101000000100111111101001000,
	parameter in_weight220 = 32'b00111100101100001111000100110000,
	parameter in_weight221 = 32'b00111101100011100110000110000000,
	parameter in_weight222 = 32'b00111101010100000101010011100101,
	parameter in_weight223 = 32'b00111101011100111111000110110110,
	parameter in_weight224 = 32'b00111101100001101101111110010011,
	parameter in_weight225 = 32'b10111100000110010001000000100110,
	parameter in_weight226 = 32'b10111100011100110001110111000110,
	parameter in_weight227 = 32'b00111001010000000101110011100010,
	parameter in_weight228 = 32'b10111101000010101101011010001100,
	parameter in_weight229 = 32'b00111101001001111001110100001111,
	parameter in_weight230 = 32'b10111101101001010010010110111011,
	parameter in_weight231 = 32'b10111100111101011010110000000001,
	parameter in_weight232 = 32'b10111101100100000101111010001000,
	parameter in_weight233 = 32'b00111101010110100000011000100101,
	parameter in_weight234 = 32'b10111101001110011110000000110000,
	parameter in_weight235 = 32'b10111101011010111100011010101110,
	parameter in_weight236 = 32'b00111100010100001001101101100010,
	parameter in_weight237 = 32'b00111101001111101110010101011110,
	parameter in_weight238 = 32'b10111101010110111010001100001100,
	parameter in_weight239 = 32'b10111101011111011000000110011010,
	parameter in_weight240 = 32'b00111101000000100111011101000010,
	parameter in_weight241 = 32'b00111101000011011111000111010101,
	parameter in_weight242 = 32'b10111100111000111110000000111010,
	parameter in_weight243 = 32'b00111100011001111110001010111000,
	parameter in_weight244 = 32'b00111101010111101101001001110010,
	parameter in_weight245 = 32'b10111101000111001001110100000101,
	parameter in_weight246 = 32'b10111101010000000011111011001101,
	parameter in_weight247 = 32'b00111101010111011110111111010001,
	parameter in_weight248 = 32'b00111101010010111110011101101011,
	parameter in_weight249 = 32'b00111101011101000010110110100010,
	parameter in_weight250 = 32'b00111101100001111100101110111001,
	parameter in_weight251 = 32'b10111101100110101011000010101101,
	parameter in_weight252 = 32'b10111100110000111000110010011111,
	parameter in_weight253 = 32'b00111100110001100001011010111001,
	parameter in_weight254 = 32'b00111100111101110100100101100001,
	parameter in_weight255 = 32'b00111101100000101111000001000001,
	parameter in_weight256 = 32'b00111100111001001011011110000010,
	parameter in_weight257 = 32'b10111101100100100010001001100111,
	parameter in_weight258 = 32'b00111100101000101000100001101001,
	parameter in_weight259 = 32'b00111101011101110110110010000101,
	parameter in_weight260 = 32'b10111100110011000001110011110011,
	parameter in_weight261 = 32'b00111101000000111110110101111011,
	parameter in_weight262 = 32'b10111100111100011011011010001010,
	parameter in_weight263 = 32'b10111100111111011001011100011000,
	parameter in_weight264 = 32'b00111101101001011010100111001111,
	parameter in_weight265 = 32'b10111100111101010001111100100111,
	parameter in_weight266 = 32'b00111100100001001101000111000010,
	parameter in_weight267 = 32'b00111101100011000000010010100110,
	parameter in_weight268 = 32'b10111101011000101001000011101010,
	parameter in_weight269 = 32'b10111101000111001101001011010110,
	parameter in_weight270 = 32'b00111101000010001001100110001001,
	parameter in_weight271 = 32'b00111101100110111101001001110100,
	parameter in_weight272 = 32'b00111100111101111010110110011000,
	parameter in_weight273 = 32'b00111101101010000111011001010001,
	parameter in_weight274 = 32'b00111101101000010010110101000101,
	parameter in_weight275 = 32'b00111100001011100011101000101111,
	parameter in_weight276 = 32'b00111101100110101010100111101101,
	parameter in_weight277 = 32'b10111101000011001101111010111101,
	parameter in_weight278 = 32'b10111010010100011100100010011100,
	parameter in_weight279 = 32'b00111101100010001111110101111011,
	parameter in_weight280 = 32'b00111100000010110000010111100111,
	parameter in_weight281 = 32'b10111101101010100000100001101001,
	parameter in_weight282 = 32'b00111101000110100011001011001010,
	parameter in_weight283 = 32'b10111100100011000010000110001001,
	parameter in_weight284 = 32'b10111101001001011011100001101001,
	parameter in_weight285 = 32'b00111100101000100010101111110001,
	parameter in_weight286 = 32'b00111100011100111110010111011101,
	parameter in_weight287 = 32'b10111101100010000001110100110111
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
