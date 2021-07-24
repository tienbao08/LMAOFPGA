`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_0
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


module conv_28_weight6_0
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b00111101011110100011110101001101,
	parameter in_weight1 = 32'b00111101011001111001110100001011,
	parameter in_weight2 = 32'b00111011010010111001100010110100,
	parameter in_weight3 = 32'b00111100001010100101111101001000,
	parameter in_weight4 = 32'b10111101100100111010111000000111,
	parameter in_weight5 = 32'b10111100110100111001110111100001,
	parameter in_weight6 = 32'b00111101011010011000001001111101,
	parameter in_weight7 = 32'b00111100101110111110111010001101,
	parameter in_weight8 = 32'b10111010111110101011101100111000,
	parameter in_weight9 = 32'b10111101000101110111101100101110,
	parameter in_weight10 = 32'b10111101001000000101101110100010,
	parameter in_weight11 = 32'b10111101010110111100000111111001,
	parameter in_weight12 = 32'b10111101100001000011001110011101,
	parameter in_weight13 = 32'b00111100101100100000011100110010,
	parameter in_weight14 = 32'b00111101010100101101111001111110,
	parameter in_weight15 = 32'b00111101000101000000111111010001,
	parameter in_weight16 = 32'b00111101010111000101111101000110,
	parameter in_weight17 = 32'b00111100110010001011111001000101,
	parameter in_weight18 = 32'b10111101100100101111100001010010,
	parameter in_weight19 = 32'b00111100001010110011011010101100,
	parameter in_weight20 = 32'b10111101100001100110011111011010,
	parameter in_weight21 = 32'b10111101000111000111100001111001,
	parameter in_weight22 = 32'b10111100010001110101110011111100,
	parameter in_weight23 = 32'b10111101001100000100100111011010,
	parameter in_weight24 = 32'b00111101010111000000011011111001,
	parameter in_weight25 = 32'b10111101000001110110001100111100,
	parameter in_weight26 = 32'b00111101011011110001001101101001,
	parameter in_weight27 = 32'b00111101100001011110010001001110,
	parameter in_weight28 = 32'b00111101001110011010001101001011,
	parameter in_weight29 = 32'b00111100110000010110101110101001,
	parameter in_weight30 = 32'b00111100111000100110001011001011,
	parameter in_weight31 = 32'b00111100100111100101100101000010,
	parameter in_weight32 = 32'b10111101010010110100111111110010,
	parameter in_weight33 = 32'b10111101010001000100000010111101,
	parameter in_weight34 = 32'b10111100111101100111110011111100,
	parameter in_weight35 = 32'b00111101010100110101100001000011,
	parameter in_weight36 = 32'b00111101100001011000111010000101,
	parameter in_weight37 = 32'b10111100011010011001010001011100,
	parameter in_weight38 = 32'b10111100110010100010011010111000,
	parameter in_weight39 = 32'b10111101001001001000101110001110,
	parameter in_weight40 = 32'b00111101100110000100101101000101,
	parameter in_weight41 = 32'b00111101001110110010010001000011,
	parameter in_weight42 = 32'b10111101001100111110101101000010,
	parameter in_weight43 = 32'b10111101100110101001100111111100,
	parameter in_weight44 = 32'b10111101011100110101010111011111,
	parameter in_weight45 = 32'b10111101010011101011110001110000,
	parameter in_weight46 = 32'b10111100100010011111011100010001,
	parameter in_weight47 = 32'b00111100101100011110010000001110,
	parameter in_weight48 = 32'b00111100111110100101101001010101,
	parameter in_weight49 = 32'b10111101010011101111011100000101,
	parameter in_weight50 = 32'b10111100000001011110111111111100,
	parameter in_weight51 = 32'b00111100110001010110101011110100,
	parameter in_weight52 = 32'b00111101010011000011111010010111,
	parameter in_weight53 = 32'b10111101101001001100010000010000,
	parameter in_weight54 = 32'b00111101100111011111111011100011,
	parameter in_weight55 = 32'b10111101100001111100100000101100,
	parameter in_weight56 = 32'b10111100001000111100101010000111,
	parameter in_weight57 = 32'b10111101100101110011100100101011,
	parameter in_weight58 = 32'b10111100110001011111001101000011,
	parameter in_weight59 = 32'b10111101001011101001000010110101,
	parameter in_weight60 = 32'b00111101101000011110111100000111,
	parameter in_weight61 = 32'b10111100100011111110101100011000,
	parameter in_weight62 = 32'b10111100010001110010100011110101,
	parameter in_weight63 = 32'b10111100101000100010000100100111,
	parameter in_weight64 = 32'b10111101100111110011011101101001,
	parameter in_weight65 = 32'b00111011111111001110000101010011,
	parameter in_weight66 = 32'b10111011011101010001011101110000,
	parameter in_weight67 = 32'b10111101100011111010100101011010,
	parameter in_weight68 = 32'b00111100111000110010010101110001,
	parameter in_weight69 = 32'b00111100001000000101000001101011,
	parameter in_weight70 = 32'b10111100011110111110101001101111,
	parameter in_weight71 = 32'b00111101100000001001101001011001,
	parameter in_weight72 = 32'b10111101100111000100100101011111,
	parameter in_weight73 = 32'b00111100100110001000000111000101,
	parameter in_weight74 = 32'b10111101000101100111110010101110,
	parameter in_weight75 = 32'b10111101010000011111011000011111,
	parameter in_weight76 = 32'b00111100101000100101101111110001,
	parameter in_weight77 = 32'b10111101001100001101000001000010,
	parameter in_weight78 = 32'b00111101000101101011100011111111,
	parameter in_weight79 = 32'b00111101100100011000000000100110,
	parameter in_weight80 = 32'b10111101100001011110010000011100,
	parameter in_weight81 = 32'b10111101100011100000010011101111,
	parameter in_weight82 = 32'b10111101010101011011100100100011,
	parameter in_weight83 = 32'b10111101000100110101010110010011,
	parameter in_weight84 = 32'b00111101000011001111111011100000,
	parameter in_weight85 = 32'b10111100100110110001001001000110,
	parameter in_weight86 = 32'b10111011101000100010000111100101,
	parameter in_weight87 = 32'b10111101100001001100010100010110,
	parameter in_weight88 = 32'b10111011101111101100000100101100,
	parameter in_weight89 = 32'b00111101010111100011001000001111,
	parameter in_weight90 = 32'b10111101010011011011010100010011,
	parameter in_weight91 = 32'b10111101100010101101001111101110,
	parameter in_weight92 = 32'b00111101001000011010100111111011,
	parameter in_weight93 = 32'b00111101010111000111111001011100,
	parameter in_weight94 = 32'b00111101010100110101001001110101,
	parameter in_weight95 = 32'b00111100010000100111000011011010,
	parameter in_weight96 = 32'b10111101101000000000101011011101,
	parameter in_weight97 = 32'b00111100101101011001010111001011,
	parameter in_weight98 = 32'b00111101000101111100111011101010,
	parameter in_weight99 = 32'b00111101101000110011101101000110,
	parameter in_weight100 = 32'b10111100100110010110100110100100,
	parameter in_weight101 = 32'b00111100011000001110100100110100,
	parameter in_weight102 = 32'b00111101001011001110001001010101,
	parameter in_weight103 = 32'b00111100100100010000011010110000,
	parameter in_weight104 = 32'b00111101010101001010111000010010,
	parameter in_weight105 = 32'b10111100111000111011101111101110,
	parameter in_weight106 = 32'b00111101100101000000101011111110,
	parameter in_weight107 = 32'b10111101011001001100111010101100,
	parameter in_weight108 = 32'b10111101000101001100100100010011,
	parameter in_weight109 = 32'b10111100111000101100001011100110,
	parameter in_weight110 = 32'b00111101100010100100110101111111,
	parameter in_weight111 = 32'b10111101010001101111110100111010,
	parameter in_weight112 = 32'b00111011100010110101001111001001,
	parameter in_weight113 = 32'b00111100100110001011111101111000,
	parameter in_weight114 = 32'b10111101100000111101100011000010,
	parameter in_weight115 = 32'b10111101000100110010011110110010,
	parameter in_weight116 = 32'b00111101000001111000011100100010,
	parameter in_weight117 = 32'b00111101000111001101010000010110,
	parameter in_weight118 = 32'b00111101101010100010100101110101,
	parameter in_weight119 = 32'b10111101011001011001101001000001,
	parameter in_weight120 = 32'b10111101011101010101011010001101,
	parameter in_weight121 = 32'b10111101100010000110110011110001,
	parameter in_weight122 = 32'b00111100000100000010011111101111,
	parameter in_weight123 = 32'b10111100110101101011110011101110,
	parameter in_weight124 = 32'b10111101001111111001000010001111,
	parameter in_weight125 = 32'b10111010111010010101101111100101,
	parameter in_weight126 = 32'b10111101000011010110010101000100,
	parameter in_weight127 = 32'b00111100110111010100110101000100,
	parameter in_weight128 = 32'b00111101011110110111010011101001,
	parameter in_weight129 = 32'b10111101010110011001010100101101,
	parameter in_weight130 = 32'b10111100101101000110111010011011,
	parameter in_weight131 = 32'b00111011110001011111111011101011,
	parameter in_weight132 = 32'b00111100001100000010011111100100,
	parameter in_weight133 = 32'b00111101011111100011101101111101,
	parameter in_weight134 = 32'b00111101001001111010101100001110,
	parameter in_weight135 = 32'b10111010111111100101001010011110,
	parameter in_weight136 = 32'b10111101100101001110000111000111,
	parameter in_weight137 = 32'b00111101010100001001100000110110,
	parameter in_weight138 = 32'b00111101100111001101111101111110,
	parameter in_weight139 = 32'b00111010100111100011110010101001,
	parameter in_weight140 = 32'b00111101100010011001100001010010,
	parameter in_weight141 = 32'b10111101000101110010110111000010,
	parameter in_weight142 = 32'b00111101001000011110111000010101,
	parameter in_weight143 = 32'b10111100111110000100111000001101,
	parameter in_weight144 = 32'b00111010011100010001010000010110,
	parameter in_weight145 = 32'b10111101011001001111111011101100,
	parameter in_weight146 = 32'b00111101100010111100010110110101,
	parameter in_weight147 = 32'b10111101100011110110011011000101,
	parameter in_weight148 = 32'b00111101001101101111010111011100,
	parameter in_weight149 = 32'b10111101001000011000010000101100,
	parameter in_weight150 = 32'b10111011101111011010011011100011,
	parameter in_weight151 = 32'b10111100111011100010100001111101,
	parameter in_weight152 = 32'b10111101010111011011011011101011,
	parameter in_weight153 = 32'b00111101001111101011110111100010,
	parameter in_weight154 = 32'b10111011101000100001111111001111,
	parameter in_weight155 = 32'b10111101001001100000101110100100,
	parameter in_weight156 = 32'b10111100111111101111010001000010,
	parameter in_weight157 = 32'b00111101100111000001001100011111,
	parameter in_weight158 = 32'b10111101000001011100011100110010,
	parameter in_weight159 = 32'b00111100001110010011110011000001,
	parameter in_weight160 = 32'b10111100010010111000110011111010,
	parameter in_weight161 = 32'b10111100110000011011010001110010,
	parameter in_weight162 = 32'b10111100100100011100011001110010,
	parameter in_weight163 = 32'b00111101011111001011100101000111,
	parameter in_weight164 = 32'b10111100110001100011111101111011,
	parameter in_weight165 = 32'b10111100110100100100001011010011,
	parameter in_weight166 = 32'b00111100011111100001101010010010,
	parameter in_weight167 = 32'b10111100001010011000000010111011,
	parameter in_weight168 = 32'b00111101011001001011001110111100,
	parameter in_weight169 = 32'b00111101010100011010011001001010,
	parameter in_weight170 = 32'b00111010011010100001000010000010,
	parameter in_weight171 = 32'b00111100110111000001100010100100,
	parameter in_weight172 = 32'b00111101000111111001000101000011,
	parameter in_weight173 = 32'b00111101010001111100110100111111,
	parameter in_weight174 = 32'b10111100100010110101010100111010,
	parameter in_weight175 = 32'b00111101000001010111011101011000,
	parameter in_weight176 = 32'b10111101001100101110110000010111,
	parameter in_weight177 = 32'b00111101100011011011001010100011,
	parameter in_weight178 = 32'b00111101100110001100110010111001,
	parameter in_weight179 = 32'b10111101000101111101011010011111,
	parameter in_weight180 = 32'b10111101010101000000101111001001,
	parameter in_weight181 = 32'b00111100011100101000101000100000,
	parameter in_weight182 = 32'b00111101100000100100100111110001,
	parameter in_weight183 = 32'b10111101000100000111011001111110,
	parameter in_weight184 = 32'b10111101011110010100000111101010,
	parameter in_weight185 = 32'b10111011100000010101010110001111,
	parameter in_weight186 = 32'b00111100000011010000010111101100,
	parameter in_weight187 = 32'b00111101100101010000001100001101,
	parameter in_weight188 = 32'b00111101001000000010011010110100,
	parameter in_weight189 = 32'b10111101011011100000100111011000,
	parameter in_weight190 = 32'b10111101010000100100111011111001,
	parameter in_weight191 = 32'b10111101011110100101010001001001,
	parameter in_weight192 = 32'b00111101011001110000000101001111,
	parameter in_weight193 = 32'b00111101100011110100101000100100,
	parameter in_weight194 = 32'b00111100001001110110011110011111,
	parameter in_weight195 = 32'b00111101100110101100111010010001,
	parameter in_weight196 = 32'b00111011011000001100001011010110,
	parameter in_weight197 = 32'b10111101101001111011000101010001,
	parameter in_weight198 = 32'b00111101100011110000000110010011,
	parameter in_weight199 = 32'b00111101001110100001110101010100,
	parameter in_weight200 = 32'b00111100101011100101110110101010,
	parameter in_weight201 = 32'b00111101101000100101100010000101,
	parameter in_weight202 = 32'b10111101010100010001000010101011,
	parameter in_weight203 = 32'b10111100100110011001110101011010,
	parameter in_weight204 = 32'b00111101010010001011100111100000,
	parameter in_weight205 = 32'b10111101101001101001011000100110,
	parameter in_weight206 = 32'b10111101011010000100010100110100,
	parameter in_weight207 = 32'b10111101011100111110111111010100,
	parameter in_weight208 = 32'b10111100111011100010100101110111,
	parameter in_weight209 = 32'b00111101100100110000101101110110,
	parameter in_weight210 = 32'b00111011110110001100101100101011,
	parameter in_weight211 = 32'b10111100101000100000100100001111,
	parameter in_weight212 = 32'b00111100111001100100101000001101,
	parameter in_weight213 = 32'b00111100010011011111001110100111,
	parameter in_weight214 = 32'b10111101001110001000011101110010,
	parameter in_weight215 = 32'b00111100110011001100101000101010,
	parameter in_weight216 = 32'b00111100110110100001101010110101,
	parameter in_weight217 = 32'b00111101001001111110011100111111,
	parameter in_weight218 = 32'b00111101010010101001000100011110,
	parameter in_weight219 = 32'b00111011010101100000111000000000,
	parameter in_weight220 = 32'b10111100110010011010100010000110,
	parameter in_weight221 = 32'b00111101000010011010100000011111,
	parameter in_weight222 = 32'b00111101100000000011000111100111,
	parameter in_weight223 = 32'b00111101000001110100010001110010,
	parameter in_weight224 = 32'b00111100110001001101010100111100,
	parameter in_weight225 = 32'b00111101010001111000101010110000,
	parameter in_weight226 = 32'b00111100111101000110001101110110,
	parameter in_weight227 = 32'b10111101011101101111010100101111,
	parameter in_weight228 = 32'b10111101100000110101110101001001,
	parameter in_weight229 = 32'b00111101001101101111101111100011,
	parameter in_weight230 = 32'b10111100111111010000110111100000,
	parameter in_weight231 = 32'b00111101100010000100110101001010,
	parameter in_weight232 = 32'b10111101100000000100010101110110,
	parameter in_weight233 = 32'b00111100010001100011001100000111,
	parameter in_weight234 = 32'b00111101000001011100001000000001,
	parameter in_weight235 = 32'b10111101101000100001001110011100,
	parameter in_weight236 = 32'b00111100000000111110010001110101,
	parameter in_weight237 = 32'b10111101100000000100001001010111,
	parameter in_weight238 = 32'b00111100111111000011000000101001,
	parameter in_weight239 = 32'b00111101001100000100111010001001,
	parameter in_weight240 = 32'b10111011111110001111111001011011,
	parameter in_weight241 = 32'b10111100100010001000011000001011,
	parameter in_weight242 = 32'b10111101001000011001110101100100,
	parameter in_weight243 = 32'b10111101100101110001000101110010,
	parameter in_weight244 = 32'b00111101100110100101011000011011,
	parameter in_weight245 = 32'b10111101010011110011000000101100,
	parameter in_weight246 = 32'b10111101001110101100111011011010,
	parameter in_weight247 = 32'b10111101100001100101111000111011,
	parameter in_weight248 = 32'b00111100011001000101110011111111,
	parameter in_weight249 = 32'b00111101000001000000100100110101,
	parameter in_weight250 = 32'b10111101001000110000011100100001,
	parameter in_weight251 = 32'b00111101010110100000100110100000,
	parameter in_weight252 = 32'b00111100011010010001101110010010,
	parameter in_weight253 = 32'b10111100101100100101100001010011,
	parameter in_weight254 = 32'b10111011100111010011001001001101,
	parameter in_weight255 = 32'b10111011110101111001110110011111,
	parameter in_weight256 = 32'b00111101000011101100101010010100,
	parameter in_weight257 = 32'b00111101001101010101010100000100,
	parameter in_weight258 = 32'b00111101100011001101010010111110,
	parameter in_weight259 = 32'b10111101001010010110001110010001,
	parameter in_weight260 = 32'b10111101100010110000001110001111,
	parameter in_weight261 = 32'b10111101101010100111011100001101,
	parameter in_weight262 = 32'b00111100111011011011111000100011,
	parameter in_weight263 = 32'b00111100010000111011100111101111,
	parameter in_weight264 = 32'b10111101011010100101110010101000,
	parameter in_weight265 = 32'b10111100110000111000101101101110,
	parameter in_weight266 = 32'b00111101100111110011010100000110,
	parameter in_weight267 = 32'b00111101010110100000001000101110,
	parameter in_weight268 = 32'b00111100110011100001100010101100,
	parameter in_weight269 = 32'b10111101011110011101111000011101,
	parameter in_weight270 = 32'b00111101100111111000010010100000,
	parameter in_weight271 = 32'b10111101100100011100001010110000,
	parameter in_weight272 = 32'b00111101001100101010000110010101,
	parameter in_weight273 = 32'b00111101010110101111101100100100,
	parameter in_weight274 = 32'b00111011111111111111100101001101,
	parameter in_weight275 = 32'b10111100000010000010000000110010,
	parameter in_weight276 = 32'b00111101000000101111000010110010,
	parameter in_weight277 = 32'b00111101101000010101011000000101,
	parameter in_weight278 = 32'b10111011111100000111000000000000,
	parameter in_weight279 = 32'b00111101101000011100000111001100,
	parameter in_weight280 = 32'b00111101011000010011001000110110,
	parameter in_weight281 = 32'b10111101010000010100111110010101,
	parameter in_weight282 = 32'b00111011000101111110111010001111,
	parameter in_weight283 = 32'b00111101001001001000100111110000,
	parameter in_weight284 = 32'b10111100111001001110101000110110,
	parameter in_weight285 = 32'b00111101100011001010100000101110,
	parameter in_weight286 = 32'b00111101100111101110111101111111,
	parameter in_weight287 = 32'b10111100100000110010110000001101
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
