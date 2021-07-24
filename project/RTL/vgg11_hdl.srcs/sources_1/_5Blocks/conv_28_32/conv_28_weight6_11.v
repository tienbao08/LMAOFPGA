`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_11
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


module conv_28_weight6_11
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b10111101010011000000011000001100,
	parameter in_weight1 = 32'b10111100111101011101011010000001,
	parameter in_weight2 = 32'b10111100010011101101010000101100,
	parameter in_weight3 = 32'b10111101011001111000011101011010,
	parameter in_weight4 = 32'b00111101000001010110000111100001,
	parameter in_weight5 = 32'b10111100111110010110101110000011,
	parameter in_weight6 = 32'b10111100000001110101010101101001,
	parameter in_weight7 = 32'b00111011110001000100010010111011,
	parameter in_weight8 = 32'b10111100100110100000100100001010,
	parameter in_weight9 = 32'b10111101011001111001000100001101,
	parameter in_weight10 = 32'b10111101001000110111100011100101,
	parameter in_weight11 = 32'b10111100101101110001000000010010,
	parameter in_weight12 = 32'b00111101101000011110101110101000,
	parameter in_weight13 = 32'b10111101011111100000111011111101,
	parameter in_weight14 = 32'b00111101101010010100000001111100,
	parameter in_weight15 = 32'b10111101011100111101011010011011,
	parameter in_weight16 = 32'b10111101000001110111001101001101,
	parameter in_weight17 = 32'b00111101101010011011010011111000,
	parameter in_weight18 = 32'b00111011111011110001001010010101,
	parameter in_weight19 = 32'b00111100111011001100111001011011,
	parameter in_weight20 = 32'b00111101011111010111010011000001,
	parameter in_weight21 = 32'b00111101001110100100010010100011,
	parameter in_weight22 = 32'b00111010100011101100110010100010,
	parameter in_weight23 = 32'b00111100001011100111111100110110,
	parameter in_weight24 = 32'b10111100111010110011011101111000,
	parameter in_weight25 = 32'b10111100011100001000010111010100,
	parameter in_weight26 = 32'b00111101000110010111010100111100,
	parameter in_weight27 = 32'b10111011100011101011110000110001,
	parameter in_weight28 = 32'b10111101000010101011101010111100,
	parameter in_weight29 = 32'b00111101001000110111000111000010,
	parameter in_weight30 = 32'b00111011001101111100000011001001,
	parameter in_weight31 = 32'b10111101100100101001010000010001,
	parameter in_weight32 = 32'b10111101010001001011010011100000,
	parameter in_weight33 = 32'b00111100110011001101101110011010,
	parameter in_weight34 = 32'b00111101101000101111000001010110,
	parameter in_weight35 = 32'b10111101010010001001110001111011,
	parameter in_weight36 = 32'b10111100111011111001010000000011,
	parameter in_weight37 = 32'b10111101010111110100100101111101,
	parameter in_weight38 = 32'b00111100110110111111111001100100,
	parameter in_weight39 = 32'b00111101001111110000000111111010,
	parameter in_weight40 = 32'b10111100000011000110100011111010,
	parameter in_weight41 = 32'b10111100101110001101110110011101,
	parameter in_weight42 = 32'b10111101101010110000011110110010,
	parameter in_weight43 = 32'b00111101011110111110000000001100,
	parameter in_weight44 = 32'b00111100111000001010010001000110,
	parameter in_weight45 = 32'b10111101100110010101100100000101,
	parameter in_weight46 = 32'b10111101100111010000110010010011,
	parameter in_weight47 = 32'b00111101000000011100010000011111,
	parameter in_weight48 = 32'b00111101000010101111110111010011,
	parameter in_weight49 = 32'b10111100111100011100000001111111,
	parameter in_weight50 = 32'b00111101100011101111010111110010,
	parameter in_weight51 = 32'b00111101010100001000000010101101,
	parameter in_weight52 = 32'b00111101010101001100110100011110,
	parameter in_weight53 = 32'b00111011101100001101000111010111,
	parameter in_weight54 = 32'b00111100011000100111010111000101,
	parameter in_weight55 = 32'b10111101101001001110011110001000,
	parameter in_weight56 = 32'b00111101011100011001100101000011,
	parameter in_weight57 = 32'b10111100111110101011001101001100,
	parameter in_weight58 = 32'b10111101100000100010101101001110,
	parameter in_weight59 = 32'b10111101001110011101000111001001,
	parameter in_weight60 = 32'b10111100100100010101100010010111,
	parameter in_weight61 = 32'b00111101001111110011110100110101,
	parameter in_weight62 = 32'b10111100011101100110111111011000,
	parameter in_weight63 = 32'b00111011111111011000111101101101,
	parameter in_weight64 = 32'b00111101101001000001111101010111,
	parameter in_weight65 = 32'b10111011011000011010001110011110,
	parameter in_weight66 = 32'b10111101100111110010010101110001,
	parameter in_weight67 = 32'b10111101010011101110000111001110,
	parameter in_weight68 = 32'b10111101001011001101110100101111,
	parameter in_weight69 = 32'b00111101010010011000011010010101,
	parameter in_weight70 = 32'b00111101011000001101011110011010,
	parameter in_weight71 = 32'b10111100000111110111111111000011,
	parameter in_weight72 = 32'b00111101000110010010111111011101,
	parameter in_weight73 = 32'b10111011110001101110111001101111,
	parameter in_weight74 = 32'b10111101000111000110001101100111,
	parameter in_weight75 = 32'b00111100111001011111100110110101,
	parameter in_weight76 = 32'b10111101100000100101110011101000,
	parameter in_weight77 = 32'b10111100110100100101001100011111,
	parameter in_weight78 = 32'b10111101011101011010010011010011,
	parameter in_weight79 = 32'b10111011111010011000011100001001,
	parameter in_weight80 = 32'b00111101001011100000110110000101,
	parameter in_weight81 = 32'b00111101001100100000100001000010,
	parameter in_weight82 = 32'b10111101100000111111111000110101,
	parameter in_weight83 = 32'b10111101100010110100001010010111,
	parameter in_weight84 = 32'b00111100001111111000111101000000,
	parameter in_weight85 = 32'b10111100111010001001011011101001,
	parameter in_weight86 = 32'b00111100100000001100100110010011,
	parameter in_weight87 = 32'b00111101100100011011001100001100,
	parameter in_weight88 = 32'b00111101101010010100000111011000,
	parameter in_weight89 = 32'b00111100011000000001101110110011,
	parameter in_weight90 = 32'b10111101001110101110100110110100,
	parameter in_weight91 = 32'b00111011111111010001101100000010,
	parameter in_weight92 = 32'b10111101010011101010111001000101,
	parameter in_weight93 = 32'b10111100010010101100100101100110,
	parameter in_weight94 = 32'b00111101010001101000100010100000,
	parameter in_weight95 = 32'b10111101101000001101001000001101,
	parameter in_weight96 = 32'b00111101011010010110010101001000,
	parameter in_weight97 = 32'b00111101101001101010010000010110,
	parameter in_weight98 = 32'b00111100101011000001010010101111,
	parameter in_weight99 = 32'b10111100101101010000000111001111,
	parameter in_weight100 = 32'b00111011011001100010101111110001,
	parameter in_weight101 = 32'b00111100111000000101000101111111,
	parameter in_weight102 = 32'b00111010110000111000110010011001,
	parameter in_weight103 = 32'b00111100100111101010101110001111,
	parameter in_weight104 = 32'b00111101011101111010001011010100,
	parameter in_weight105 = 32'b10111101000101111111010011000010,
	parameter in_weight106 = 32'b10111011110000110100010000111110,
	parameter in_weight107 = 32'b10111100101000111111001000101001,
	parameter in_weight108 = 32'b10111101100010111111010110000011,
	parameter in_weight109 = 32'b00111100101001101011110000010001,
	parameter in_weight110 = 32'b00111101101001110001010001101101,
	parameter in_weight111 = 32'b00111101000011101001001100111101,
	parameter in_weight112 = 32'b10111101100111000001010000011111,
	parameter in_weight113 = 32'b10111101100010110101001010110100,
	parameter in_weight114 = 32'b10111101100100110111111001000011,
	parameter in_weight115 = 32'b10111101011000100111111001101101,
	parameter in_weight116 = 32'b00111011000110111001011010011000,
	parameter in_weight117 = 32'b00111101001011110001010101011110,
	parameter in_weight118 = 32'b00111101100111001000000011111010,
	parameter in_weight119 = 32'b10111101010101101001100001001101,
	parameter in_weight120 = 32'b10111100111100111100000010101101,
	parameter in_weight121 = 32'b00111101000011010000100011100010,
	parameter in_weight122 = 32'b00111101101001001010101111110111,
	parameter in_weight123 = 32'b10111100111010101111001100110001,
	parameter in_weight124 = 32'b00111101100111100000010011111101,
	parameter in_weight125 = 32'b00111101100110101001011111000010,
	parameter in_weight126 = 32'b00111101100101101010000100100100,
	parameter in_weight127 = 32'b10111101001010010001101110100100,
	parameter in_weight128 = 32'b10111100011111011110011101010010,
	parameter in_weight129 = 32'b10111011110011101100001111110001,
	parameter in_weight130 = 32'b10111011000101011101111110000011,
	parameter in_weight131 = 32'b00111101010111101101101001000010,
	parameter in_weight132 = 32'b00111101010000001111100100001000,
	parameter in_weight133 = 32'b00111100001101001010101110100011,
	parameter in_weight134 = 32'b10111100000000101110010101101101,
	parameter in_weight135 = 32'b10111011001000110001011101100101,
	parameter in_weight136 = 32'b10111100110011000011110111110000,
	parameter in_weight137 = 32'b10111100010110101101111110010000,
	parameter in_weight138 = 32'b10111100111010011110010000101100,
	parameter in_weight139 = 32'b00111100110010101011101000001110,
	parameter in_weight140 = 32'b00111011110101001101101001110100,
	parameter in_weight141 = 32'b10111101011010001111010001001111,
	parameter in_weight142 = 32'b00111101101010011111011100001101,
	parameter in_weight143 = 32'b00111101001010110011000110011111,
	parameter in_weight144 = 32'b10111101011111100011110000100101,
	parameter in_weight145 = 32'b00111101100010000111011100010001,
	parameter in_weight146 = 32'b10111010011001101111100001100111,
	parameter in_weight147 = 32'b10111101011100101001010100011010,
	parameter in_weight148 = 32'b00111101100010100110100000111110,
	parameter in_weight149 = 32'b00111101001111000110001100011000,
	parameter in_weight150 = 32'b00111100101111100100101000000011,
	parameter in_weight151 = 32'b10111100010001000110011100100100,
	parameter in_weight152 = 32'b00111101000011000101001100111000,
	parameter in_weight153 = 32'b00111101010110001011010100001100,
	parameter in_weight154 = 32'b10111100100010100110100000001000,
	parameter in_weight155 = 32'b10111011011001010101010111100001,
	parameter in_weight156 = 32'b00111101011100101000111001011111,
	parameter in_weight157 = 32'b10111101100000100000011100101010,
	parameter in_weight158 = 32'b00111100000101010111001110000101,
	parameter in_weight159 = 32'b10111101011011011100111110010101,
	parameter in_weight160 = 32'b00111100111011001101011100010011,
	parameter in_weight161 = 32'b10111100111010001001010111101001,
	parameter in_weight162 = 32'b10111011101101100101001000000010,
	parameter in_weight163 = 32'b00111101001001110110100010100011,
	parameter in_weight164 = 32'b00111100010110100011001011010100,
	parameter in_weight165 = 32'b00111101101001101110000100101111,
	parameter in_weight166 = 32'b10111101100110111010100011110010,
	parameter in_weight167 = 32'b10111101100000110000011101101000,
	parameter in_weight168 = 32'b10111101001100111011100101000001,
	parameter in_weight169 = 32'b00111101001101110001011010111010,
	parameter in_weight170 = 32'b00111101001110001100011010001111,
	parameter in_weight171 = 32'b10111100111111000110101001110101,
	parameter in_weight172 = 32'b00111101100101001011011100011001,
	parameter in_weight173 = 32'b10111101010000100100110000110001,
	parameter in_weight174 = 32'b10111101100111100011001000111001,
	parameter in_weight175 = 32'b00111100010010100011001011000001,
	parameter in_weight176 = 32'b10111101011001101011011100101011,
	parameter in_weight177 = 32'b00111101001001001111011010100110,
	parameter in_weight178 = 32'b10111100100110111111010010001111,
	parameter in_weight179 = 32'b00111101001101101010100010011111,
	parameter in_weight180 = 32'b00111100011110111101101000010101,
	parameter in_weight181 = 32'b00111011110000101111001011000000,
	parameter in_weight182 = 32'b10111101011010010100011000111111,
	parameter in_weight183 = 32'b10111101100011000001000111110100,
	parameter in_weight184 = 32'b10111100000101101111110110100100,
	parameter in_weight185 = 32'b10111101011011011111110110011110,
	parameter in_weight186 = 32'b00111101100100000011100111000100,
	parameter in_weight187 = 32'b00111101100110111111001010101110,
	parameter in_weight188 = 32'b10111101101010101110101010101010,
	parameter in_weight189 = 32'b10111101100110100100111101110101,
	parameter in_weight190 = 32'b00111100111001101100001110110011,
	parameter in_weight191 = 32'b10111010110001000010000110000010,
	parameter in_weight192 = 32'b10111100101100101101100100101100,
	parameter in_weight193 = 32'b10111101000010010011000100001110,
	parameter in_weight194 = 32'b00111101100001010010101110001000,
	parameter in_weight195 = 32'b10111101010011011011111010111101,
	parameter in_weight196 = 32'b10111101100010011000110110111111,
	parameter in_weight197 = 32'b10111101010001111110111101111110,
	parameter in_weight198 = 32'b00111100101101011010101001100011,
	parameter in_weight199 = 32'b10111101100000101110000100100101,
	parameter in_weight200 = 32'b10111101100111001010101000101011,
	parameter in_weight201 = 32'b10111011111000011010010010001100,
	parameter in_weight202 = 32'b00111101100101011101001100000101,
	parameter in_weight203 = 32'b00111100011011011110010011010010,
	parameter in_weight204 = 32'b10111101100100101000001010011110,
	parameter in_weight205 = 32'b00111100011110010110000000001100,
	parameter in_weight206 = 32'b00111101101000100001011111000011,
	parameter in_weight207 = 32'b00111101010010000101000110100111,
	parameter in_weight208 = 32'b00111100100111101011000000010110,
	parameter in_weight209 = 32'b00111101100100010101100010010010,
	parameter in_weight210 = 32'b10111101100111000111011100100001,
	parameter in_weight211 = 32'b00111101100000111101111110110000,
	parameter in_weight212 = 32'b00111101010011010000111011001001,
	parameter in_weight213 = 32'b10111100101110011101110101000001,
	parameter in_weight214 = 32'b10111100001010011101010001101110,
	parameter in_weight215 = 32'b00111101010010011000010111111100,
	parameter in_weight216 = 32'b10110111001100001101101100001010,
	parameter in_weight217 = 32'b10111101001011101101101101110011,
	parameter in_weight218 = 32'b10111100100100110011101110101011,
	parameter in_weight219 = 32'b10111100111100001000110110011111,
	parameter in_weight220 = 32'b10111101010010000011100110111010,
	parameter in_weight221 = 32'b10111011110011100000100100001110,
	parameter in_weight222 = 32'b00111101001011100110010011101110,
	parameter in_weight223 = 32'b10111100011100111101111100111100,
	parameter in_weight224 = 32'b00111101100111110000000100011011,
	parameter in_weight225 = 32'b10111101100001010110101000110101,
	parameter in_weight226 = 32'b10111100011010101101100001100100,
	parameter in_weight227 = 32'b00111100110100010001000011011100,
	parameter in_weight228 = 32'b00111101011101010101000001011100,
	parameter in_weight229 = 32'b00111100111111101100011011101101,
	parameter in_weight230 = 32'b10111100010100001001001000100011,
	parameter in_weight231 = 32'b00111101011101110000010110101110,
	parameter in_weight232 = 32'b10111100011110110111010000100111,
	parameter in_weight233 = 32'b10111101101001110001000011010001,
	parameter in_weight234 = 32'b00111011101101011001111001001100,
	parameter in_weight235 = 32'b10111100000100010110111111011111,
	parameter in_weight236 = 32'b00111101100111101011010001110111,
	parameter in_weight237 = 32'b00111011111100010110010100011001,
	parameter in_weight238 = 32'b00111100101000010101010000111011,
	parameter in_weight239 = 32'b10111101100001111101000001111110,
	parameter in_weight240 = 32'b10111010001101100111001101100011,
	parameter in_weight241 = 32'b00111100011001100110100100011000,
	parameter in_weight242 = 32'b10111100110001100011101010101001,
	parameter in_weight243 = 32'b10111100111010010101101101001110,
	parameter in_weight244 = 32'b00111101001110010001101110101101,
	parameter in_weight245 = 32'b10111101010100001011011101001101,
	parameter in_weight246 = 32'b00111101011010010010010101110100,
	parameter in_weight247 = 32'b00111101011000011000100001110001,
	parameter in_weight248 = 32'b00111100101010001001000010111101,
	parameter in_weight249 = 32'b00111100111110001111100110101010,
	parameter in_weight250 = 32'b00111011000100001001100001001010,
	parameter in_weight251 = 32'b00111101001111110001101011101101,
	parameter in_weight252 = 32'b10111100100101001000000110001000,
	parameter in_weight253 = 32'b10111100001000101010111100101010,
	parameter in_weight254 = 32'b10111100100000110100110011100110,
	parameter in_weight255 = 32'b00111100100111111100010001111001,
	parameter in_weight256 = 32'b10111100111011111001110011011100,
	parameter in_weight257 = 32'b10111101010001000110011110111110,
	parameter in_weight258 = 32'b00111101100000001100111101111111,
	parameter in_weight259 = 32'b00111101100001110010000110010000,
	parameter in_weight260 = 32'b10111101001001010000110111001011,
	parameter in_weight261 = 32'b00111101100011011000011010110010,
	parameter in_weight262 = 32'b10111101011101010100101110110100,
	parameter in_weight263 = 32'b00111101010001011110011001111000,
	parameter in_weight264 = 32'b10111100111110111101001000110000,
	parameter in_weight265 = 32'b10111101000001000011100100111110,
	parameter in_weight266 = 32'b10111100010010010010000000001110,
	parameter in_weight267 = 32'b10111100001110101100111110011000,
	parameter in_weight268 = 32'b00111101100000111111001111000100,
	parameter in_weight269 = 32'b00111101101001000001001000110111,
	parameter in_weight270 = 32'b00111101100010010101110001101101,
	parameter in_weight271 = 32'b10111101100101101011010010111101,
	parameter in_weight272 = 32'b10111100100010100110011000000110,
	parameter in_weight273 = 32'b10111101010110100010100000010101,
	parameter in_weight274 = 32'b00111101000101101010011110010100,
	parameter in_weight275 = 32'b00111101100010100010001101111001,
	parameter in_weight276 = 32'b10111100101111110101001100011111,
	parameter in_weight277 = 32'b00111100110000100111100011011100,
	parameter in_weight278 = 32'b00111101001111110101011111101101,
	parameter in_weight279 = 32'b10111101100101111100101001000001,
	parameter in_weight280 = 32'b00111101001100110001000110001111,
	parameter in_weight281 = 32'b10111101000110100010101110001001,
	parameter in_weight282 = 32'b00111101000111010010110100010111,
	parameter in_weight283 = 32'b00111100001111101110111111110111,
	parameter in_weight284 = 32'b10111101100011011010110011101110,
	parameter in_weight285 = 32'b10111011011100000111111111001100,
	parameter in_weight286 = 32'b00111100000101001000101101110110,
	parameter in_weight287 = 32'b10111011110101111000010110110110
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
