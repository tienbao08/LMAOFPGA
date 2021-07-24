`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_1
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


module conv_28_weight6_1
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b10111101100011111011111110100011,
	parameter in_weight1 = 32'b00111100100011010011010001111111,
	parameter in_weight2 = 32'b10111101100101100111001011011100,
	parameter in_weight3 = 32'b00111101011100110000100100010011,
	parameter in_weight4 = 32'b10111101001110100110000110110110,
	parameter in_weight5 = 32'b10111101001110100111111001000011,
	parameter in_weight6 = 32'b10111100000010000110100000011110,
	parameter in_weight7 = 32'b00111101100011000110001101101010,
	parameter in_weight8 = 32'b10111101101010000111101110001000,
	parameter in_weight9 = 32'b10111101010010011110111001011001,
	parameter in_weight10 = 32'b10111101010001011001010001100001,
	parameter in_weight11 = 32'b00111011000010011110111110111011,
	parameter in_weight12 = 32'b00111101101000011111010101110010,
	parameter in_weight13 = 32'b10111101000010111100111011010100,
	parameter in_weight14 = 32'b00111101100101110000101101001110,
	parameter in_weight15 = 32'b00111100101000100111111111110111,
	parameter in_weight16 = 32'b00111101100111010111011011111011,
	parameter in_weight17 = 32'b10111100110111001111010010110110,
	parameter in_weight18 = 32'b00111101100101100101011111111111,
	parameter in_weight19 = 32'b00111101100011111110111110011111,
	parameter in_weight20 = 32'b00111101100001001101011100010110,
	parameter in_weight21 = 32'b00111101011111000110100011011000,
	parameter in_weight22 = 32'b00111101011010010010111110101110,
	parameter in_weight23 = 32'b10111101011100001010100100100010,
	parameter in_weight24 = 32'b00111100110010011010011110101010,
	parameter in_weight25 = 32'b10111010011011110011111000100001,
	parameter in_weight26 = 32'b00111101010101110100010110100111,
	parameter in_weight27 = 32'b10111011111111101001110010100101,
	parameter in_weight28 = 32'b10111101011001000010000000100111,
	parameter in_weight29 = 32'b10111101100101111001110010010001,
	parameter in_weight30 = 32'b10111101100100010011010111110111,
	parameter in_weight31 = 32'b10111101000111001101000101100010,
	parameter in_weight32 = 32'b00111101000001010110111100101000,
	parameter in_weight33 = 32'b00111101010010000101001111110110,
	parameter in_weight34 = 32'b10111101000011000111011001001111,
	parameter in_weight35 = 32'b00111101000100011101000010110100,
	parameter in_weight36 = 32'b00111000011010100010101001111100,
	parameter in_weight37 = 32'b00111101011110101100101110010010,
	parameter in_weight38 = 32'b00111100011100000001000110001000,
	parameter in_weight39 = 32'b10111011100000011001000000101100,
	parameter in_weight40 = 32'b10111101101010100101010101010110,
	parameter in_weight41 = 32'b00111101101001011000100001000100,
	parameter in_weight42 = 32'b10111101101001110011001100110001,
	parameter in_weight43 = 32'b00111100100100011101100101000100,
	parameter in_weight44 = 32'b10111101000000011001101100100010,
	parameter in_weight45 = 32'b00111101010100100101100010001000,
	parameter in_weight46 = 32'b10111100011000110100010011001100,
	parameter in_weight47 = 32'b00111101101010101011101100110110,
	parameter in_weight48 = 32'b00111101101010010010010010011110,
	parameter in_weight49 = 32'b10111010100011000100000110011000,
	parameter in_weight50 = 32'b10111101000011111101100101100001,
	parameter in_weight51 = 32'b10111100110000111001110100100011,
	parameter in_weight52 = 32'b10111101001100010000111100011011,
	parameter in_weight53 = 32'b10111011101110010100000001001011,
	parameter in_weight54 = 32'b10111100011010100010001000010110,
	parameter in_weight55 = 32'b10111100001110100010001000101100,
	parameter in_weight56 = 32'b10111010101111000011110110101110,
	parameter in_weight57 = 32'b00111100010100011111010001011000,
	parameter in_weight58 = 32'b10111100000001110011000111111111,
	parameter in_weight59 = 32'b00111100011110010010100010010001,
	parameter in_weight60 = 32'b00111011111000100010100001001100,
	parameter in_weight61 = 32'b10111100110111101110110111101111,
	parameter in_weight62 = 32'b00111100101000001110110111000011,
	parameter in_weight63 = 32'b00111100111000111011001111010001,
	parameter in_weight64 = 32'b00111101100000000100101101010011,
	parameter in_weight65 = 32'b10111100110100110111110010000110,
	parameter in_weight66 = 32'b10111101100110010000111101000010,
	parameter in_weight67 = 32'b10111101010100100011011011010000,
	parameter in_weight68 = 32'b10111100111111000111111110101010,
	parameter in_weight69 = 32'b10111101000010001100001010101100,
	parameter in_weight70 = 32'b00111100011101011000010101010011,
	parameter in_weight71 = 32'b10111100110100111111010001101100,
	parameter in_weight72 = 32'b00111100100011000011000111001101,
	parameter in_weight73 = 32'b10111101001011100110011110101101,
	parameter in_weight74 = 32'b00111100111011111011110011000011,
	parameter in_weight75 = 32'b00111101100000110101100101001011,
	parameter in_weight76 = 32'b00111101011111110000110100001011,
	parameter in_weight77 = 32'b00111101010000000110011000110001,
	parameter in_weight78 = 32'b00111011101001111111001111100010,
	parameter in_weight79 = 32'b00111100110101011110101111000110,
	parameter in_weight80 = 32'b10111101100100010001100101001000,
	parameter in_weight81 = 32'b00111101011100011111000101010110,
	parameter in_weight82 = 32'b10111101101001011011011000000001,
	parameter in_weight83 = 32'b10111100111111100000010111010000,
	parameter in_weight84 = 32'b00111101100010111011101000011000,
	parameter in_weight85 = 32'b10111101000110100000101100100010,
	parameter in_weight86 = 32'b00111101100100111011111100011000,
	parameter in_weight87 = 32'b10111101010011000011000010011100,
	parameter in_weight88 = 32'b00111101101000101000001000011110,
	parameter in_weight89 = 32'b00111100111110100110110110011011,
	parameter in_weight90 = 32'b10111101100111011010011111001001,
	parameter in_weight91 = 32'b00111101001111011011110001000110,
	parameter in_weight92 = 32'b00111010000010001011010110100110,
	parameter in_weight93 = 32'b00111100101101101111111001011110,
	parameter in_weight94 = 32'b00111101100010011001011100111000,
	parameter in_weight95 = 32'b00111101000100101111100011001101,
	parameter in_weight96 = 32'b00111101011000110000010100000111,
	parameter in_weight97 = 32'b00111010110110101100101101110000,
	parameter in_weight98 = 32'b10111101010100010111001110000010,
	parameter in_weight99 = 32'b10111101001001000100000000100001,
	parameter in_weight100 = 32'b10111101010001110101100110101101,
	parameter in_weight101 = 32'b00111101000001101101010111010110,
	parameter in_weight102 = 32'b10111101001110111001001000101001,
	parameter in_weight103 = 32'b10111101100101010010111100101100,
	parameter in_weight104 = 32'b10111101011100010111001110100100,
	parameter in_weight105 = 32'b10111100111000001110000011111101,
	parameter in_weight106 = 32'b10111101000111100010110100010100,
	parameter in_weight107 = 32'b00111100110111010000011101001000,
	parameter in_weight108 = 32'b10111101101000000101000100010101,
	parameter in_weight109 = 32'b10111101100001100001001100111101,
	parameter in_weight110 = 32'b10111101100010100111011111001111,
	parameter in_weight111 = 32'b10111100101010011101111000010001,
	parameter in_weight112 = 32'b00111010100000100101110111001000,
	parameter in_weight113 = 32'b00111101001000111010011011111110,
	parameter in_weight114 = 32'b10111100100111101011101100010000,
	parameter in_weight115 = 32'b00111101000110100001010111110010,
	parameter in_weight116 = 32'b10111101010000000101101110100111,
	parameter in_weight117 = 32'b10111101100001000100011101100010,
	parameter in_weight118 = 32'b10111101101001000001111100000010,
	parameter in_weight119 = 32'b10111100001111001001101111000000,
	parameter in_weight120 = 32'b10111010101011100011100110000111,
	parameter in_weight121 = 32'b00111101101001110101000010111010,
	parameter in_weight122 = 32'b10111100101001101001111101010010,
	parameter in_weight123 = 32'b10111100100101111010111100110100,
	parameter in_weight124 = 32'b10111101010010110001001111100100,
	parameter in_weight125 = 32'b10111011101000100000010111111111,
	parameter in_weight126 = 32'b10111101010100010000010111100111,
	parameter in_weight127 = 32'b10111101100000101000111010110010,
	parameter in_weight128 = 32'b00111100101101010101101000001001,
	parameter in_weight129 = 32'b00111100111000110011101010011100,
	parameter in_weight130 = 32'b10111100001111001101111001010000,
	parameter in_weight131 = 32'b00111101001110101010000100001111,
	parameter in_weight132 = 32'b00111101011010101010110100011000,
	parameter in_weight133 = 32'b10111011101110010001001110100101,
	parameter in_weight134 = 32'b00111101011110001110000001101010,
	parameter in_weight135 = 32'b10111011111010110101100000110011,
	parameter in_weight136 = 32'b00111011101010001011111100000010,
	parameter in_weight137 = 32'b10111100101100000100101011110110,
	parameter in_weight138 = 32'b10111100010110110111001001010000,
	parameter in_weight139 = 32'b10111101011110001010001011010000,
	parameter in_weight140 = 32'b10111101011000010110101001011110,
	parameter in_weight141 = 32'b10111101100010101001111010010111,
	parameter in_weight142 = 32'b10111101000000111010110010000001,
	parameter in_weight143 = 32'b00111101011111100010111010011110,
	parameter in_weight144 = 32'b00111100100010110111100001101111,
	parameter in_weight145 = 32'b10111101000000101111101101111001,
	parameter in_weight146 = 32'b10111101000111100011010101100111,
	parameter in_weight147 = 32'b10111101100001101100111100110100,
	parameter in_weight148 = 32'b00111101011111101000100101110000,
	parameter in_weight149 = 32'b00111101010011000001111111011011,
	parameter in_weight150 = 32'b00111101000011111101010110100110,
	parameter in_weight151 = 32'b10111011110001100101101101111111,
	parameter in_weight152 = 32'b00111101100010001000100101100110,
	parameter in_weight153 = 32'b10111101101000010100011101011010,
	parameter in_weight154 = 32'b10111100101001001101110111001010,
	parameter in_weight155 = 32'b00111101000100010011100000000011,
	parameter in_weight156 = 32'b00111101101001111001000111001001,
	parameter in_weight157 = 32'b00111100011100011001111000000000,
	parameter in_weight158 = 32'b00111101000000101001111011101100,
	parameter in_weight159 = 32'b00111101001101000101011000111100,
	parameter in_weight160 = 32'b10111101100101101010111001010101,
	parameter in_weight161 = 32'b10111101000001101100011000110110,
	parameter in_weight162 = 32'b10111101010010010100011011010001,
	parameter in_weight163 = 32'b00111101000000011011010111011100,
	parameter in_weight164 = 32'b10111100101011001000010100010100,
	parameter in_weight165 = 32'b10111011000101111001100111111011,
	parameter in_weight166 = 32'b10111101010001010100100000110010,
	parameter in_weight167 = 32'b10111101001111111000100000111011,
	parameter in_weight168 = 32'b10111101000011101111010111000100,
	parameter in_weight169 = 32'b10111101011100010011111011110000,
	parameter in_weight170 = 32'b00111101011111100111110100000111,
	parameter in_weight171 = 32'b00111101100011011000101101101000,
	parameter in_weight172 = 32'b00111101001001101111111100101011,
	parameter in_weight173 = 32'b10111011111100100111000100110010,
	parameter in_weight174 = 32'b00111100101001111010100101000101,
	parameter in_weight175 = 32'b10111101101001000110111111101110,
	parameter in_weight176 = 32'b00111101010111010101110011110001,
	parameter in_weight177 = 32'b00111011000000111110001100011001,
	parameter in_weight178 = 32'b10111100101100110010001110110110,
	parameter in_weight179 = 32'b10111101100000100010111101111111,
	parameter in_weight180 = 32'b00111011001110000110101100100000,
	parameter in_weight181 = 32'b00111101100010110111111011100111,
	parameter in_weight182 = 32'b00111101101001000100001000000000,
	parameter in_weight183 = 32'b00111101010111111011111011011000,
	parameter in_weight184 = 32'b10111100101111011111010111100100,
	parameter in_weight185 = 32'b10111101001000011000100100101011,
	parameter in_weight186 = 32'b10111101101001000111100111100010,
	parameter in_weight187 = 32'b10111100110010001010001100011101,
	parameter in_weight188 = 32'b10111101001000010101001110101000,
	parameter in_weight189 = 32'b00111101101010010000101111001000,
	parameter in_weight190 = 32'b10111011110100011001011000000000,
	parameter in_weight191 = 32'b00111101101000101111010100100110,
	parameter in_weight192 = 32'b10111100111110011001000100100111,
	parameter in_weight193 = 32'b10111100100100011100111011010001,
	parameter in_weight194 = 32'b00111100100000110010010100101001,
	parameter in_weight195 = 32'b00111101011001000110110100101000,
	parameter in_weight196 = 32'b00111101010110011100010110101100,
	parameter in_weight197 = 32'b00111101000101001001101100110100,
	parameter in_weight198 = 32'b10111101100000101110000001001000,
	parameter in_weight199 = 32'b00111011100111100001011110100110,
	parameter in_weight200 = 32'b00111101100101011111110110100111,
	parameter in_weight201 = 32'b00111100100110110011110011001010,
	parameter in_weight202 = 32'b00111101101000010001101000000001,
	parameter in_weight203 = 32'b00111100111100010001010000101001,
	parameter in_weight204 = 32'b10111010110110100010101000000101,
	parameter in_weight205 = 32'b10111100101010011001001010010111,
	parameter in_weight206 = 32'b10111100001010000010000011011010,
	parameter in_weight207 = 32'b10111101101001111001011011101100,
	parameter in_weight208 = 32'b00111101010111010001010100101011,
	parameter in_weight209 = 32'b00111101101010100100000110111101,
	parameter in_weight210 = 32'b00111101101000110111101111010011,
	parameter in_weight211 = 32'b00111100011101110111110111100001,
	parameter in_weight212 = 32'b00111101000110011001000100101110,
	parameter in_weight213 = 32'b00111100000111110110010001011000,
	parameter in_weight214 = 32'b10111010011011011010000001111100,
	parameter in_weight215 = 32'b10111101100001011010000000110111,
	parameter in_weight216 = 32'b00111101100111001000100011111111,
	parameter in_weight217 = 32'b10111100101000101001000100010100,
	parameter in_weight218 = 32'b10111101010010010001010110101010,
	parameter in_weight219 = 32'b10111101000001100000100111110001,
	parameter in_weight220 = 32'b00111101000000100111000000110110,
	parameter in_weight221 = 32'b10111100011111100001101110010110,
	parameter in_weight222 = 32'b10111100111001000011010101001110,
	parameter in_weight223 = 32'b10111101000010001111011110110000,
	parameter in_weight224 = 32'b00111100100010001001011000010010,
	parameter in_weight225 = 32'b10111101100110010000100001011001,
	parameter in_weight226 = 32'b10111101010010000011011100101111,
	parameter in_weight227 = 32'b10111101011010101111101001011101,
	parameter in_weight228 = 32'b10111101100100110011001110100010,
	parameter in_weight229 = 32'b00111101001010010000110110000011,
	parameter in_weight230 = 32'b10111100110001011010011010111111,
	parameter in_weight231 = 32'b10111101011100111011101000101010,
	parameter in_weight232 = 32'b10111101100100001001010111101000,
	parameter in_weight233 = 32'b10111101100101000010001110101000,
	parameter in_weight234 = 32'b10111101010100101000000111111110,
	parameter in_weight235 = 32'b10111100110101101010000110111101,
	parameter in_weight236 = 32'b00111101100101101110010000001111,
	parameter in_weight237 = 32'b00111011011111000101010001111010,
	parameter in_weight238 = 32'b10111101011011000110000001000001,
	parameter in_weight239 = 32'b10111101000111000101111000010000,
	parameter in_weight240 = 32'b00111100001011010010101000101010,
	parameter in_weight241 = 32'b10111101000000011110010110011110,
	parameter in_weight242 = 32'b00111100100001001000001010011111,
	parameter in_weight243 = 32'b10111101001101101101100010001101,
	parameter in_weight244 = 32'b00111101010010111111000000011001,
	parameter in_weight245 = 32'b00111101100011000101100111000101,
	parameter in_weight246 = 32'b10111011100101110010001110111011,
	parameter in_weight247 = 32'b10111101011110111110001011110110,
	parameter in_weight248 = 32'b00111101100100010110110001101101,
	parameter in_weight249 = 32'b10111101000111001010100111100001,
	parameter in_weight250 = 32'b00111101010000110100010010001011,
	parameter in_weight251 = 32'b10111010100110100101011101111110,
	parameter in_weight252 = 32'b00111100011010100001001100111000,
	parameter in_weight253 = 32'b00111101010111101111011101100011,
	parameter in_weight254 = 32'b00111100001010011110110011101100,
	parameter in_weight255 = 32'b10111011001110001101101110110011,
	parameter in_weight256 = 32'b10111100100110101111110010101100,
	parameter in_weight257 = 32'b10111100011011010001011111111010,
	parameter in_weight258 = 32'b10111100101010110001010110011010,
	parameter in_weight259 = 32'b10111100111010000001011111101111,
	parameter in_weight260 = 32'b10111101101010011110011101000111,
	parameter in_weight261 = 32'b00111101001010100111100110010010,
	parameter in_weight262 = 32'b10111011110101100000011110001111,
	parameter in_weight263 = 32'b10111100100101010111011010111000,
	parameter in_weight264 = 32'b00111101100100001001011111100110,
	parameter in_weight265 = 32'b10111010111101001100100101111101,
	parameter in_weight266 = 32'b10111101011101000001100000111111,
	parameter in_weight267 = 32'b00111101001011011101110000010001,
	parameter in_weight268 = 32'b10111100100100001111010010110110,
	parameter in_weight269 = 32'b10111101101000001010110000101010,
	parameter in_weight270 = 32'b10111100111111011111111111110110,
	parameter in_weight271 = 32'b10111101011001111010100110101111,
	parameter in_weight272 = 32'b00111101011011111101100111101100,
	parameter in_weight273 = 32'b10111101100111010001011111000111,
	parameter in_weight274 = 32'b10111100101111000011111001000111,
	parameter in_weight275 = 32'b00111100011011000110010001000001,
	parameter in_weight276 = 32'b10111101010011011000110000111001,
	parameter in_weight277 = 32'b10111101101000111011001010011100,
	parameter in_weight278 = 32'b00111101100111100010100101101101,
	parameter in_weight279 = 32'b10111100011011101101111100101011,
	parameter in_weight280 = 32'b00111101100100010100001110110011,
	parameter in_weight281 = 32'b10111100110111110010101000011111,
	parameter in_weight282 = 32'b10111101001011110011001001100111,
	parameter in_weight283 = 32'b00111101101001001101010000100001,
	parameter in_weight284 = 32'b10111101001001000011001011011001,
	parameter in_weight285 = 32'b00111100110010100110000110001101,
	parameter in_weight286 = 32'b10111101001110000101010101100011,
	parameter in_weight287 = 32'b10111100110010110101011100111000
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
