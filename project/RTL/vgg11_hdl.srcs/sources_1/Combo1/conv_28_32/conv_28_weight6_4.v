`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_4
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


module conv_28_weight6_4
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b00111101100000111000010001110000,
	parameter in_weight1 = 32'b10111101100111001111100111101101,
	parameter in_weight2 = 32'b10111100000111110010111100111001,
	parameter in_weight3 = 32'b00111101100000010000000110001001,
	parameter in_weight4 = 32'b00111101100010111101010011100110,
	parameter in_weight5 = 32'b10111101010100010011001101110010,
	parameter in_weight6 = 32'b10111101100000111001101111001011,
	parameter in_weight7 = 32'b10111101001010010010111011011111,
	parameter in_weight8 = 32'b10111100110101011101101000011101,
	parameter in_weight9 = 32'b00111101011110010101000101011111,
	parameter in_weight10 = 32'b00111100111010011000110010111100,
	parameter in_weight11 = 32'b10111101001111101100101101111010,
	parameter in_weight12 = 32'b10111101010010001111111001110101,
	parameter in_weight13 = 32'b10111101010000001101001010011010,
	parameter in_weight14 = 32'b00111100011011101000111010010011,
	parameter in_weight15 = 32'b10111100011000011011110010010011,
	parameter in_weight16 = 32'b10111100110111011001101101010010,
	parameter in_weight17 = 32'b10111011101100010100001100011010,
	parameter in_weight18 = 32'b00111010010111111101001001001010,
	parameter in_weight19 = 32'b00111101100100011110101010111010,
	parameter in_weight20 = 32'b10111100111011110100001001000100,
	parameter in_weight21 = 32'b10111011110011110101010011100001,
	parameter in_weight22 = 32'b00111101011001000001010000011001,
	parameter in_weight23 = 32'b10111100100000001110011100100001,
	parameter in_weight24 = 32'b00111011110110111100111110001001,
	parameter in_weight25 = 32'b00111101100100100101111101001110,
	parameter in_weight26 = 32'b10111100101101001010101010100010,
	parameter in_weight27 = 32'b10111100100000110011010010010111,
	parameter in_weight28 = 32'b10111101011011101110011101001101,
	parameter in_weight29 = 32'b10111101100110000111100010100001,
	parameter in_weight30 = 32'b00111011100101001010100011001101,
	parameter in_weight31 = 32'b10111101100010101011101110000101,
	parameter in_weight32 = 32'b00111100110010100111110111001111,
	parameter in_weight33 = 32'b10111101100110110101000100101100,
	parameter in_weight34 = 32'b00111100111010010100111111001101,
	parameter in_weight35 = 32'b00111001101100100001110111100000,
	parameter in_weight36 = 32'b00111100011110010000111111101100,
	parameter in_weight37 = 32'b00111101010100101000100011010001,
	parameter in_weight38 = 32'b00111011101101000110011101001000,
	parameter in_weight39 = 32'b00111011100010001001101001001101,
	parameter in_weight40 = 32'b10111101000001001011111001100110,
	parameter in_weight41 = 32'b10111101011000001110111110101100,
	parameter in_weight42 = 32'b00111100100101111010010111000011,
	parameter in_weight43 = 32'b10111101101010011011111010101011,
	parameter in_weight44 = 32'b10111101100000010000001101000001,
	parameter in_weight45 = 32'b10111100110010101111011011110101,
	parameter in_weight46 = 32'b10111100001111001000001100000101,
	parameter in_weight47 = 32'b00111101001111110111101110100101,
	parameter in_weight48 = 32'b10111101000011110000000111011100,
	parameter in_weight49 = 32'b00111100001101011110000100111000,
	parameter in_weight50 = 32'b10111101101010001100110011010011,
	parameter in_weight51 = 32'b10111101001110111010100101101000,
	parameter in_weight52 = 32'b10111011110100010100000011110101,
	parameter in_weight53 = 32'b10111101100010000010010101110101,
	parameter in_weight54 = 32'b10111101100001011001111111111001,
	parameter in_weight55 = 32'b10111101011110100010111111110011,
	parameter in_weight56 = 32'b10111101100101110111101110011110,
	parameter in_weight57 = 32'b10111100101101101100000011110111,
	parameter in_weight58 = 32'b10111100111111010010010100001110,
	parameter in_weight59 = 32'b10111011101000011001011101011010,
	parameter in_weight60 = 32'b00111101011001011000111001001110,
	parameter in_weight61 = 32'b00111100100011110100110011001110,
	parameter in_weight62 = 32'b00111101001001100000110100011011,
	parameter in_weight63 = 32'b00111101001000100001110011101001,
	parameter in_weight64 = 32'b10111011111011100100001111000001,
	parameter in_weight65 = 32'b00111101000001101100011010001101,
	parameter in_weight66 = 32'b00111101101001000101010100111110,
	parameter in_weight67 = 32'b00111100011011111111010101011000,
	parameter in_weight68 = 32'b10111011110101111001011011100101,
	parameter in_weight69 = 32'b10111101010111110110110011101111,
	parameter in_weight70 = 32'b00111101000101000010011101011000,
	parameter in_weight71 = 32'b10111100111101110111101101000011,
	parameter in_weight72 = 32'b00111101100110111101011000110100,
	parameter in_weight73 = 32'b10111101010110001000101010001011,
	parameter in_weight74 = 32'b10111101001000110001111000111101,
	parameter in_weight75 = 32'b00111101100110001110001001000110,
	parameter in_weight76 = 32'b00111101001010111100000101010000,
	parameter in_weight77 = 32'b10111010101010001010101101011100,
	parameter in_weight78 = 32'b10111100000001001110001011010100,
	parameter in_weight79 = 32'b10111101101001001111110110001111,
	parameter in_weight80 = 32'b10111011101101001001010001111011,
	parameter in_weight81 = 32'b00111101100110100010001111110100,
	parameter in_weight82 = 32'b10111101001001111110011000011110,
	parameter in_weight83 = 32'b00111100110110111000100011110001,
	parameter in_weight84 = 32'b10111100001111101111100100100110,
	parameter in_weight85 = 32'b00111101001110111001001110101100,
	parameter in_weight86 = 32'b00111101100111110101000001110000,
	parameter in_weight87 = 32'b00111100011110110100010101011100,
	parameter in_weight88 = 32'b00111101011111011010101111111000,
	parameter in_weight89 = 32'b00111101100101111011111010111100,
	parameter in_weight90 = 32'b00111101101010000101010010000000,
	parameter in_weight91 = 32'b10111101011101111010101111100110,
	parameter in_weight92 = 32'b10111101010101101111010101101011,
	parameter in_weight93 = 32'b00111100001111011000000100110111,
	parameter in_weight94 = 32'b00111100111111000111001100111101,
	parameter in_weight95 = 32'b10111101001110001100001111101100,
	parameter in_weight96 = 32'b00111100110010111101110000011001,
	parameter in_weight97 = 32'b10111100000010110101111010110110,
	parameter in_weight98 = 32'b10111101010011011000001000100101,
	parameter in_weight99 = 32'b00111101000011011100100001100000,
	parameter in_weight100 = 32'b00111101100001001111110100110000,
	parameter in_weight101 = 32'b10111100101110010110001000101100,
	parameter in_weight102 = 32'b00111100101000011110110111001110,
	parameter in_weight103 = 32'b10111100001001011011011100001101,
	parameter in_weight104 = 32'b10111100001100101101011000001100,
	parameter in_weight105 = 32'b10111100001001011001001001101100,
	parameter in_weight106 = 32'b10111101001010110001001000010110,
	parameter in_weight107 = 32'b00111101010010000111011000101111,
	parameter in_weight108 = 32'b10111101011010111011000111111110,
	parameter in_weight109 = 32'b10111101010101000101011101101100,
	parameter in_weight110 = 32'b10111101010110011101001001010100,
	parameter in_weight111 = 32'b10111101010101111111000000110111,
	parameter in_weight112 = 32'b10111101011100000101111100001100,
	parameter in_weight113 = 32'b00111100011011010010100111011000,
	parameter in_weight114 = 32'b10111101000110101011001110011111,
	parameter in_weight115 = 32'b00111100110111110100110001101010,
	parameter in_weight116 = 32'b00111101011110111110001010001000,
	parameter in_weight117 = 32'b00111101100001100101100011011110,
	parameter in_weight118 = 32'b10111101001101100010011001010010,
	parameter in_weight119 = 32'b10111100100011010001000000011000,
	parameter in_weight120 = 32'b10111100110101000110011001010010,
	parameter in_weight121 = 32'b10111101100000010010101101001010,
	parameter in_weight122 = 32'b00111101100000010111100110010010,
	parameter in_weight123 = 32'b10111101101001010000111001001011,
	parameter in_weight124 = 32'b00111101001101110001110000000111,
	parameter in_weight125 = 32'b00111101001111011110100101110001,
	parameter in_weight126 = 32'b00111100110001001100111111110100,
	parameter in_weight127 = 32'b00111100000100110001100101011100,
	parameter in_weight128 = 32'b00111101011110101111110011101100,
	parameter in_weight129 = 32'b00111101101000000111110110000110,
	parameter in_weight130 = 32'b00111100001011111100001100111000,
	parameter in_weight131 = 32'b10111101100000011011011100101001,
	parameter in_weight132 = 32'b10111101001001000010110110010111,
	parameter in_weight133 = 32'b10111100111010100111111001011110,
	parameter in_weight134 = 32'b00111101001011001101111010100010,
	parameter in_weight135 = 32'b10111100111101011000011100100000,
	parameter in_weight136 = 32'b00111101101001011100101000010110,
	parameter in_weight137 = 32'b10111101011101001000011011001000,
	parameter in_weight138 = 32'b00111101001101001100011001010000,
	parameter in_weight139 = 32'b10111101000111001100000010010110,
	parameter in_weight140 = 32'b00111101101011110101011010010000,
	parameter in_weight141 = 32'b00111101100000000100101110100011,
	parameter in_weight142 = 32'b10111101001010010100101010111111,
	parameter in_weight143 = 32'b10111101100010100001001111000100,
	parameter in_weight144 = 32'b10111101010000110100101010111110,
	parameter in_weight145 = 32'b00111101000001110001011010110001,
	parameter in_weight146 = 32'b00111011111111000101101101110001,
	parameter in_weight147 = 32'b00111100010001111111011101011111,
	parameter in_weight148 = 32'b00111101100001010000001110001100,
	parameter in_weight149 = 32'b00111101000110101100001011011100,
	parameter in_weight150 = 32'b00111100111101001010000011101001,
	parameter in_weight151 = 32'b10111101101010101010010100101100,
	parameter in_weight152 = 32'b00111101010001001100111100000001,
	parameter in_weight153 = 32'b00111101101000001101010011010110,
	parameter in_weight154 = 32'b00111101100001001110011110111110,
	parameter in_weight155 = 32'b00111101010001111000101100010000,
	parameter in_weight156 = 32'b00111011111011000001000001100001,
	parameter in_weight157 = 32'b10111101001101101000111110001111,
	parameter in_weight158 = 32'b00111101100101101100110010100101,
	parameter in_weight159 = 32'b00111101100011011110111100110111,
	parameter in_weight160 = 32'b10111101001101100101011000101101,
	parameter in_weight161 = 32'b00111011110001100100001011010011,
	parameter in_weight162 = 32'b10111100100001001111101001100000,
	parameter in_weight163 = 32'b10111100110111101011011011100010,
	parameter in_weight164 = 32'b00111101100001000101111101001100,
	parameter in_weight165 = 32'b10111101011111001101000011010000,
	parameter in_weight166 = 32'b00111101100100011011111110110011,
	parameter in_weight167 = 32'b10111011111100101101001100001100,
	parameter in_weight168 = 32'b00111101001101010010101100000000,
	parameter in_weight169 = 32'b10111011000101100000110100111110,
	parameter in_weight170 = 32'b10111011110110000110101000001001,
	parameter in_weight171 = 32'b00111101000010011110111111010100,
	parameter in_weight172 = 32'b10111101000010011110000110000010,
	parameter in_weight173 = 32'b00111101010011010101001001011101,
	parameter in_weight174 = 32'b00111100111101100111001000011010,
	parameter in_weight175 = 32'b00111101100000101001010101110011,
	parameter in_weight176 = 32'b00111100110000111100101011001101,
	parameter in_weight177 = 32'b00111101011101000110001010011101,
	parameter in_weight178 = 32'b10111101001100001101010100111010,
	parameter in_weight179 = 32'b10111101100010100111110000111111,
	parameter in_weight180 = 32'b00111101100010111111001001110000,
	parameter in_weight181 = 32'b00111101001100110100011110010110,
	parameter in_weight182 = 32'b00111101010000101110010010110111,
	parameter in_weight183 = 32'b00111100101110110011010011010010,
	parameter in_weight184 = 32'b00111011001111001010000110011000,
	parameter in_weight185 = 32'b00111100100011111001111000110111,
	parameter in_weight186 = 32'b00111101001000110110110101111110,
	parameter in_weight187 = 32'b00111101011010111000010001001010,
	parameter in_weight188 = 32'b00111101100011100110111111101001,
	parameter in_weight189 = 32'b00111101100111000000000111000111,
	parameter in_weight190 = 32'b00111101100101110110000011101010,
	parameter in_weight191 = 32'b10111101000101001010001001000101,
	parameter in_weight192 = 32'b00111101011101001101100011111100,
	parameter in_weight193 = 32'b00111011010000111101111000100101,
	parameter in_weight194 = 32'b00111101000001100010101010010011,
	parameter in_weight195 = 32'b10111101000000000010001101001010,
	parameter in_weight196 = 32'b10111100101110000010111001111000,
	parameter in_weight197 = 32'b00111101100110011100000001100011,
	parameter in_weight198 = 32'b10111101100001111110000111000000,
	parameter in_weight199 = 32'b00111100101010110100001100100000,
	parameter in_weight200 = 32'b00111011110001100000111100010000,
	parameter in_weight201 = 32'b10111101100101110011000000100101,
	parameter in_weight202 = 32'b10111100111011110111001000011111,
	parameter in_weight203 = 32'b10111100011110001100000111010000,
	parameter in_weight204 = 32'b00111100111011010011101101111110,
	parameter in_weight205 = 32'b10111101100011001111010110010100,
	parameter in_weight206 = 32'b00111101100000111100100111011000,
	parameter in_weight207 = 32'b10111101001000011100011111111100,
	parameter in_weight208 = 32'b10111101000101101111011111100000,
	parameter in_weight209 = 32'b10111101000011000111011111111111,
	parameter in_weight210 = 32'b00111101100101100101110101101111,
	parameter in_weight211 = 32'b00111011110000100101101110001111,
	parameter in_weight212 = 32'b00111100100111100101101110001011,
	parameter in_weight213 = 32'b10111100010101001111011110010010,
	parameter in_weight214 = 32'b10111101000011000101110001110110,
	parameter in_weight215 = 32'b00111101000100110111000100011111,
	parameter in_weight216 = 32'b00111101001111000101011011101100,
	parameter in_weight217 = 32'b10111100101100001110001100000101,
	parameter in_weight218 = 32'b00111101000000001011101110101111,
	parameter in_weight219 = 32'b10111101011111001111001110010111,
	parameter in_weight220 = 32'b00111101001001111011000110010010,
	parameter in_weight221 = 32'b00111101010110101010100100101110,
	parameter in_weight222 = 32'b10111101001000100000100111000001,
	parameter in_weight223 = 32'b10111101100100001100001101101011,
	parameter in_weight224 = 32'b00111101100000100101100110001000,
	parameter in_weight225 = 32'b00111101101001110111110011000001,
	parameter in_weight226 = 32'b10111010000001001001001000001111,
	parameter in_weight227 = 32'b00111100011100000001100111111111,
	parameter in_weight228 = 32'b10111100111010110111001111001000,
	parameter in_weight229 = 32'b00111101100110000011111000010111,
	parameter in_weight230 = 32'b10111100111001010110000011111110,
	parameter in_weight231 = 32'b10111100001101010100010001111111,
	parameter in_weight232 = 32'b10111101100101011110000110101000,
	parameter in_weight233 = 32'b00111011111001101001010011111111,
	parameter in_weight234 = 32'b10111101101000011011010011001000,
	parameter in_weight235 = 32'b00111100111011000011101011110011,
	parameter in_weight236 = 32'b10111100101100000110001100100101,
	parameter in_weight237 = 32'b00111101100010100010011110110010,
	parameter in_weight238 = 32'b10111100001111110100001000010110,
	parameter in_weight239 = 32'b00111101100011101010000010111110,
	parameter in_weight240 = 32'b00111101010110001101001100100111,
	parameter in_weight241 = 32'b00111100011100111101000110101110,
	parameter in_weight242 = 32'b10111101100010011110101001001110,
	parameter in_weight243 = 32'b10111101100001001111110101100110,
	parameter in_weight244 = 32'b10111100001111111000111011100010,
	parameter in_weight245 = 32'b00111101000100101011001011010101,
	parameter in_weight246 = 32'b10111100100010001100011010000011,
	parameter in_weight247 = 32'b10111101001101011011001100000000,
	parameter in_weight248 = 32'b10111101100010101011010110100110,
	parameter in_weight249 = 32'b10111101100001010111000100111100,
	parameter in_weight250 = 32'b10111100110110010000110100011100,
	parameter in_weight251 = 32'b00111101101001011101001111100100,
	parameter in_weight252 = 32'b00111001010001011011110101110010,
	parameter in_weight253 = 32'b10111101010011111001110011110010,
	parameter in_weight254 = 32'b10111101001101000011010101001110,
	parameter in_weight255 = 32'b10111101101000110101101010001100,
	parameter in_weight256 = 32'b00111101010010000100111110111011,
	parameter in_weight257 = 32'b10111101011010101011011010110100,
	parameter in_weight258 = 32'b10111100110111101001101010110010,
	parameter in_weight259 = 32'b00111000100100111000100101100101,
	parameter in_weight260 = 32'b00111100111111101110001110100101,
	parameter in_weight261 = 32'b10111101100000110101011011111110,
	parameter in_weight262 = 32'b00111101100111110100101101101011,
	parameter in_weight263 = 32'b00111100001000110111110010000101,
	parameter in_weight264 = 32'b00111101011001100100000101101110,
	parameter in_weight265 = 32'b10111100110100000001000110111110,
	parameter in_weight266 = 32'b00111101001001010100010110001001,
	parameter in_weight267 = 32'b00111101011011010010100000011100,
	parameter in_weight268 = 32'b10111101001000010010100010111000,
	parameter in_weight269 = 32'b00111101100000000010001011001101,
	parameter in_weight270 = 32'b00111010100000101010110111100001,
	parameter in_weight271 = 32'b10111101101001110000011111010111,
	parameter in_weight272 = 32'b00111101100000111010011000010010,
	parameter in_weight273 = 32'b00111101010111000101110101101000,
	parameter in_weight274 = 32'b00111101010010010100010001011110,
	parameter in_weight275 = 32'b00111101100100000000101101010110,
	parameter in_weight276 = 32'b10111101101001111001011000001101,
	parameter in_weight277 = 32'b10111100001011010010101111001001,
	parameter in_weight278 = 32'b10111101010000111111011110000001,
	parameter in_weight279 = 32'b10111101001011100001010011110000,
	parameter in_weight280 = 32'b10111101001000101101001110111000,
	parameter in_weight281 = 32'b10111100111010011000000110111000,
	parameter in_weight282 = 32'b00111101100000000000001100101101,
	parameter in_weight283 = 32'b00111100100000011100011111000101,
	parameter in_weight284 = 32'b10111101011010111001000001000100,
	parameter in_weight285 = 32'b10111101000100101010101100000000,
	parameter in_weight286 = 32'b00111101000111001000110000001101,
	parameter in_weight287 = 32'b10111101100001010000010010111001
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
