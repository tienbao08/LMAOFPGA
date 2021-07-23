`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_7
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


module conv_28_weight6_7
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b10111101101000101010111101001010,
	parameter in_weight1 = 32'b00111101000110001111101001100110,
	parameter in_weight2 = 32'b10111101100111010110011000101010,
	parameter in_weight3 = 32'b00111101100011010010011101100010,
	parameter in_weight4 = 32'b00111101010010000100100110000110,
	parameter in_weight5 = 32'b00111101100001111000001010000001,
	parameter in_weight6 = 32'b10111101011101100111010000110000,
	parameter in_weight7 = 32'b00111101001011011111110010001010,
	parameter in_weight8 = 32'b00111011101011000100110110100110,
	parameter in_weight9 = 32'b10111101011101111100000100010011,
	parameter in_weight10 = 32'b10111101101000101001101100101011,
	parameter in_weight11 = 32'b00111100100101001011000100010000,
	parameter in_weight12 = 32'b00111100111110100111000011101111,
	parameter in_weight13 = 32'b00111101010110001010001001111010,
	parameter in_weight14 = 32'b00111100111111100010011110000111,
	parameter in_weight15 = 32'b00111101001010111001011100001111,
	parameter in_weight16 = 32'b00111100011111100111010110000110,
	parameter in_weight17 = 32'b10111100110100010000111111100000,
	parameter in_weight18 = 32'b00111101100010100101101001100010,
	parameter in_weight19 = 32'b00111101010001001101111010001111,
	parameter in_weight20 = 32'b00111101010100011010011001111010,
	parameter in_weight21 = 32'b00111101100100010010101011101001,
	parameter in_weight22 = 32'b10111100000111010110101101111110,
	parameter in_weight23 = 32'b10111101000010101110111111101011,
	parameter in_weight24 = 32'b10111101001010110111000010101000,
	parameter in_weight25 = 32'b00111101011001000001111010110010,
	parameter in_weight26 = 32'b00111011110100001110101111110100,
	parameter in_weight27 = 32'b00111010011110101010001110010001,
	parameter in_weight28 = 32'b10111101100001000111011000000110,
	parameter in_weight29 = 32'b00111101101000011100110011101010,
	parameter in_weight30 = 32'b10111100011001000000110001001011,
	parameter in_weight31 = 32'b00111100110100010110001110000100,
	parameter in_weight32 = 32'b10111101001100100100101111111011,
	parameter in_weight33 = 32'b10111101000000101001110001001001,
	parameter in_weight34 = 32'b00111101001001111001111101011101,
	parameter in_weight35 = 32'b10111101011011101010100100011101,
	parameter in_weight36 = 32'b10111100110000010011001000110100,
	parameter in_weight37 = 32'b00111100011001101001001001000001,
	parameter in_weight38 = 32'b00111100100111100111100101001101,
	parameter in_weight39 = 32'b00111100111101101101010110001010,
	parameter in_weight40 = 32'b10111011100011101110101100001111,
	parameter in_weight41 = 32'b10111101101001110000000011111101,
	parameter in_weight42 = 32'b10111101000011111101010110001110,
	parameter in_weight43 = 32'b00111100111001110011011001110101,
	parameter in_weight44 = 32'b00111101000010111011100010100000,
	parameter in_weight45 = 32'b10111101011010101000100010110011,
	parameter in_weight46 = 32'b10111100010010111100011001111010,
	parameter in_weight47 = 32'b10111101000110110101101100110001,
	parameter in_weight48 = 32'b00111101010111001011100100000011,
	parameter in_weight49 = 32'b00111101011001000001100000100011,
	parameter in_weight50 = 32'b10111101001001100101101011101110,
	parameter in_weight51 = 32'b10111100010010101110000111011110,
	parameter in_weight52 = 32'b00111100111111010000000101110110,
	parameter in_weight53 = 32'b00111100101101100101110101010111,
	parameter in_weight54 = 32'b00111101100000010001110111100011,
	parameter in_weight55 = 32'b00111101000101010111101111000010,
	parameter in_weight56 = 32'b10111101001000101011100111001011,
	parameter in_weight57 = 32'b00111101100001100000000111111110,
	parameter in_weight58 = 32'b10111101000001101001111101110110,
	parameter in_weight59 = 32'b10111101011010000001000111001000,
	parameter in_weight60 = 32'b10111010101111101101101001100101,
	parameter in_weight61 = 32'b10111100000111110011110101000111,
	parameter in_weight62 = 32'b10111101101001010100011110100011,
	parameter in_weight63 = 32'b10111101010101101010101000111011,
	parameter in_weight64 = 32'b10111101001001100011111110111000,
	parameter in_weight65 = 32'b10111100110110000000110100011100,
	parameter in_weight66 = 32'b00111100110001111000011000011100,
	parameter in_weight67 = 32'b00111010100000101111111011010011,
	parameter in_weight68 = 32'b00111100000011010010001100101111,
	parameter in_weight69 = 32'b10111101100011111111011011000100,
	parameter in_weight70 = 32'b10111010110100100111101100000010,
	parameter in_weight71 = 32'b10111101011010100001000011010001,
	parameter in_weight72 = 32'b00111100111110000111101010001011,
	parameter in_weight73 = 32'b00111100111110101111110110111001,
	parameter in_weight74 = 32'b00111101011111010100111101000101,
	parameter in_weight75 = 32'b10111100101010011011011011110000,
	parameter in_weight76 = 32'b00111101010010110001111010110111,
	parameter in_weight77 = 32'b00111101101001100010110111001011,
	parameter in_weight78 = 32'b10111101100010101010000111000111,
	parameter in_weight79 = 32'b10111100000011100100100100101011,
	parameter in_weight80 = 32'b00111100110011000010011111001011,
	parameter in_weight81 = 32'b00111100110100001110101100000110,
	parameter in_weight82 = 32'b00111101001110001001011101111111,
	parameter in_weight83 = 32'b10111101001011000001110111110101,
	parameter in_weight84 = 32'b00111101010100110101100010100111,
	parameter in_weight85 = 32'b00111100000001010000100010011001,
	parameter in_weight86 = 32'b10111101011100110100000100010011,
	parameter in_weight87 = 32'b00111100110100111101000000110101,
	parameter in_weight88 = 32'b00111101000111100010110010001011,
	parameter in_weight89 = 32'b10111100011101011101000011111110,
	parameter in_weight90 = 32'b00111101000010100000001010010110,
	parameter in_weight91 = 32'b10111101011000100101111010010100,
	parameter in_weight92 = 32'b10111101101010011111011011010010,
	parameter in_weight93 = 32'b00111101011101100010111011011010,
	parameter in_weight94 = 32'b00111100000110010000110001100101,
	parameter in_weight95 = 32'b10111101000001100010000011111110,
	parameter in_weight96 = 32'b00111101100101110110100101011011,
	parameter in_weight97 = 32'b00111101001100010100010001111011,
	parameter in_weight98 = 32'b00111101000010100000000001100101,
	parameter in_weight99 = 32'b10111011100000100000101010010111,
	parameter in_weight100 = 32'b00111101011011000011101110000010,
	parameter in_weight101 = 32'b00111100111110100100110001111010,
	parameter in_weight102 = 32'b10111101100011011010101101100010,
	parameter in_weight103 = 32'b00111101011010110000001111001100,
	parameter in_weight104 = 32'b00111100010100001010000100010011,
	parameter in_weight105 = 32'b00111101010100010011101011000111,
	parameter in_weight106 = 32'b10111100000100010011010011100110,
	parameter in_weight107 = 32'b10111101001000001101100110011101,
	parameter in_weight108 = 32'b00111100011010100110001101101100,
	parameter in_weight109 = 32'b00111101100010011111110000000000,
	parameter in_weight110 = 32'b00111101000110101000000110011100,
	parameter in_weight111 = 32'b00111101000000011101011101001010,
	parameter in_weight112 = 32'b00111100101010010011101010111111,
	parameter in_weight113 = 32'b10111011011000001011111100011000,
	parameter in_weight114 = 32'b10111101000010010100101111111001,
	parameter in_weight115 = 32'b00111101100100000011100111101111,
	parameter in_weight116 = 32'b10111101101000101101010010101101,
	parameter in_weight117 = 32'b00111100101101000100000111000101,
	parameter in_weight118 = 32'b10111101100001101111000111010001,
	parameter in_weight119 = 32'b10111101010011110001111010100001,
	parameter in_weight120 = 32'b10111101010001110100011101111101,
	parameter in_weight121 = 32'b00111101000001000001001101111101,
	parameter in_weight122 = 32'b00111101100110100111001111011010,
	parameter in_weight123 = 32'b00111100000111011010001100011110,
	parameter in_weight124 = 32'b10111101010010110011110010110000,
	parameter in_weight125 = 32'b00111101010110100111111010000101,
	parameter in_weight126 = 32'b10111101100110001100111110010111,
	parameter in_weight127 = 32'b00111001011000010100110110100111,
	parameter in_weight128 = 32'b00111100001010000001010101000100,
	parameter in_weight129 = 32'b10111100111011000000111111011011,
	parameter in_weight130 = 32'b00111101000001000011101110111100,
	parameter in_weight131 = 32'b10111100010110101011011011111110,
	parameter in_weight132 = 32'b10111101000001101000010010101101,
	parameter in_weight133 = 32'b00111101011010000011010000101101,
	parameter in_weight134 = 32'b00111101001011011111100110111000,
	parameter in_weight135 = 32'b00111101011110011011111010001100,
	parameter in_weight136 = 32'b00111100111010111111000110100001,
	parameter in_weight137 = 32'b00111101101001110000011100100010,
	parameter in_weight138 = 32'b10111100000110011001001011100100,
	parameter in_weight139 = 32'b00111100100111101010110100111011,
	parameter in_weight140 = 32'b10111101100101110100001000111010,
	parameter in_weight141 = 32'b00111100100111101101100111111010,
	parameter in_weight142 = 32'b10111101100100101010100110001110,
	parameter in_weight143 = 32'b00111101100000001011100001101100,
	parameter in_weight144 = 32'b10111011010001010111010001110010,
	parameter in_weight145 = 32'b10111011000000000010001101110110,
	parameter in_weight146 = 32'b00111100100111100110001001101100,
	parameter in_weight147 = 32'b00111101000101100111011101110010,
	parameter in_weight148 = 32'b10111100110100111111011100101101,
	parameter in_weight149 = 32'b10111101010100011110101010000110,
	parameter in_weight150 = 32'b10111100001101000110010001111001,
	parameter in_weight151 = 32'b00111101011001000101111111111000,
	parameter in_weight152 = 32'b00111011100111101001111011001101,
	parameter in_weight153 = 32'b00111101001010100001110111001111,
	parameter in_weight154 = 32'b10111101000011100010011101000111,
	parameter in_weight155 = 32'b00111101000011011101101110111100,
	parameter in_weight156 = 32'b10111101100011011111011111100111,
	parameter in_weight157 = 32'b10111100101000101111001000111000,
	parameter in_weight158 = 32'b00111100110111000100100000110011,
	parameter in_weight159 = 32'b10111100100000110001010000001100,
	parameter in_weight160 = 32'b10111100101100010000000011100100,
	parameter in_weight161 = 32'b00111101001010100000010110101111,
	parameter in_weight162 = 32'b00111101101001100000100111110100,
	parameter in_weight163 = 32'b10111101010001001010010111000011,
	parameter in_weight164 = 32'b10111101001000101110100101001001,
	parameter in_weight165 = 32'b10111100010101110010110011000010,
	parameter in_weight166 = 32'b10111101001101111001100111110100,
	parameter in_weight167 = 32'b00111101010001101100100000111011,
	parameter in_weight168 = 32'b00111101011101111110011110100100,
	parameter in_weight169 = 32'b00111101001001101101101110100101,
	parameter in_weight170 = 32'b00111101001100000011001110010101,
	parameter in_weight171 = 32'b10111010100100011111100110001101,
	parameter in_weight172 = 32'b10111101100010100010110101011111,
	parameter in_weight173 = 32'b00111101001111011011011111111000,
	parameter in_weight174 = 32'b10111101010111111101010101110101,
	parameter in_weight175 = 32'b10111011100001000011110011111110,
	parameter in_weight176 = 32'b10111100000000010011111110110101,
	parameter in_weight177 = 32'b00111101000011101011110101000101,
	parameter in_weight178 = 32'b00111100000010010110101110010000,
	parameter in_weight179 = 32'b00111100111011100011001111110111,
	parameter in_weight180 = 32'b00111101001101000110010000010101,
	parameter in_weight181 = 32'b00111101001000000110110101000111,
	parameter in_weight182 = 32'b10111101100001100110011101110110,
	parameter in_weight183 = 32'b10111100110001011110110001101100,
	parameter in_weight184 = 32'b00111101100100100101101101000001,
	parameter in_weight185 = 32'b00111101100001101111110011000100,
	parameter in_weight186 = 32'b00111100010000100001110110100000,
	parameter in_weight187 = 32'b00111100101100000011101001100011,
	parameter in_weight188 = 32'b00111100010101111101100011010111,
	parameter in_weight189 = 32'b00111100101101011010110010110000,
	parameter in_weight190 = 32'b00111100000010001011001101100000,
	parameter in_weight191 = 32'b10111101000001100000011011101001,
	parameter in_weight192 = 32'b00111101100111001111111111101110,
	parameter in_weight193 = 32'b00111101001100100000001101110110,
	parameter in_weight194 = 32'b10111100001101010000110110011010,
	parameter in_weight195 = 32'b10111101011100110000001000100011,
	parameter in_weight196 = 32'b10111101001001011111011011001010,
	parameter in_weight197 = 32'b10111101011000000110111110000011,
	parameter in_weight198 = 32'b00111101100000100110110100101010,
	parameter in_weight199 = 32'b10111101010111011110001110001010,
	parameter in_weight200 = 32'b00111101100110010100000101111011,
	parameter in_weight201 = 32'b10111101101001010100101001100001,
	parameter in_weight202 = 32'b00111101000111111101000011101110,
	parameter in_weight203 = 32'b10111100111011000111001100111001,
	parameter in_weight204 = 32'b10111100000111101111111001111010,
	parameter in_weight205 = 32'b10111011111010001001110100111010,
	parameter in_weight206 = 32'b00111100011100100000111111110000,
	parameter in_weight207 = 32'b00111101011111000011001111110110,
	parameter in_weight208 = 32'b10111101100111010111011000000010,
	parameter in_weight209 = 32'b00111101101001100101011110000000,
	parameter in_weight210 = 32'b00111100010100000110110001010101,
	parameter in_weight211 = 32'b10111101000010010100001011101100,
	parameter in_weight212 = 32'b00111101100110000011001011100000,
	parameter in_weight213 = 32'b10111101100011101101011011100101,
	parameter in_weight214 = 32'b00111101101001011100001111110111,
	parameter in_weight215 = 32'b00111101010011101010101100110010,
	parameter in_weight216 = 32'b10111101011011111111000110111111,
	parameter in_weight217 = 32'b00111101011100111010010110100100,
	parameter in_weight218 = 32'b00111101010010111010101101100011,
	parameter in_weight219 = 32'b00111101000100100100011111011001,
	parameter in_weight220 = 32'b00111101011000110110110111100001,
	parameter in_weight221 = 32'b10111011111110111101001000001101,
	parameter in_weight222 = 32'b00111100111111000111010111110001,
	parameter in_weight223 = 32'b10111011101010110010001100100111,
	parameter in_weight224 = 32'b10111101001111000111000101100110,
	parameter in_weight225 = 32'b00111101001101100110000100101110,
	parameter in_weight226 = 32'b00111101001000111100111001001001,
	parameter in_weight227 = 32'b10111101100010011101010111000000,
	parameter in_weight228 = 32'b10111011111110011010110100101100,
	parameter in_weight229 = 32'b00111101100001101010000111100100,
	parameter in_weight230 = 32'b00111101100001110111000011011110,
	parameter in_weight231 = 32'b10111101010101101110100000000000,
	parameter in_weight232 = 32'b00111101000100001000001010100111,
	parameter in_weight233 = 32'b00111101100110111111111010011010,
	parameter in_weight234 = 32'b10111101001010011111111010001001,
	parameter in_weight235 = 32'b10111101000110111101001001011110,
	parameter in_weight236 = 32'b00111101100100110101011111110100,
	parameter in_weight237 = 32'b10111101100111100010001001000110,
	parameter in_weight238 = 32'b00111101011101000100110100001101,
	parameter in_weight239 = 32'b00111100110110001100001111100001,
	parameter in_weight240 = 32'b10111101100010100101111101011100,
	parameter in_weight241 = 32'b10111101101010000101011110011000,
	parameter in_weight242 = 32'b10111100101100110010110101010110,
	parameter in_weight243 = 32'b10111101000001000101110010011011,
	parameter in_weight244 = 32'b00111100000111001001101101001010,
	parameter in_weight245 = 32'b00111101100000010100001110111010,
	parameter in_weight246 = 32'b10111101000010110001010111011011,
	parameter in_weight247 = 32'b10111101001011101111000000101000,
	parameter in_weight248 = 32'b00111100101100111110010011100100,
	parameter in_weight249 = 32'b10111101100011010101101011100100,
	parameter in_weight250 = 32'b00111101011100011110010000011110,
	parameter in_weight251 = 32'b00111101000101001010000101001101,
	parameter in_weight252 = 32'b10111101011101000100101111001000,
	parameter in_weight253 = 32'b00111101100001011110110010101010,
	parameter in_weight254 = 32'b00111101100001010110111100100101,
	parameter in_weight255 = 32'b10111101011001111000110100010101,
	parameter in_weight256 = 32'b10111101011100110010110000010011,
	parameter in_weight257 = 32'b10111101010010100011100111000001,
	parameter in_weight258 = 32'b00111101100011100000110000011010,
	parameter in_weight259 = 32'b10111100010111010000101010101111,
	parameter in_weight260 = 32'b10111101011110001010000101010001,
	parameter in_weight261 = 32'b00111011011110101010010110001101,
	parameter in_weight262 = 32'b10111101011111100000010010000111,
	parameter in_weight263 = 32'b00111101000111111110011000100111,
	parameter in_weight264 = 32'b00111011111001000011000000100100,
	parameter in_weight265 = 32'b10111101011011110010000010110010,
	parameter in_weight266 = 32'b00111101100101001001100010011011,
	parameter in_weight267 = 32'b10111100111000011010101110010011,
	parameter in_weight268 = 32'b00111100111101100110010001111111,
	parameter in_weight269 = 32'b00111101011000001111101110110111,
	parameter in_weight270 = 32'b00111100111110110110011011111111,
	parameter in_weight271 = 32'b00111100111010001101001011010110,
	parameter in_weight272 = 32'b10111011010111011101000110001111,
	parameter in_weight273 = 32'b00111100011010100110110110111111,
	parameter in_weight274 = 32'b00111101100100011101001110101001,
	parameter in_weight275 = 32'b00111101100001011001101111011001,
	parameter in_weight276 = 32'b10111011011101110001100100001010,
	parameter in_weight277 = 32'b00111101100100110101011000110010,
	parameter in_weight278 = 32'b00111101100100000011110110010011,
	parameter in_weight279 = 32'b00111100001110000111000111110101,
	parameter in_weight280 = 32'b00111101001100010101101001100001,
	parameter in_weight281 = 32'b10111101000010001100101011100000,
	parameter in_weight282 = 32'b00111101011000010011111000011110,
	parameter in_weight283 = 32'b00111100110101011101110110111111,
	parameter in_weight284 = 32'b00111100101110110111000100100010,
	parameter in_weight285 = 32'b10111011111011011011111000001111,
	parameter in_weight286 = 32'b00111101000011100000101111000100,
	parameter in_weight287 = 32'b10111100111101101111101000000110
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
