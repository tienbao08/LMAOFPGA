`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_6
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


module conv_28_weight6_6
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b10111011001011100111111100001100,
	parameter in_weight1 = 32'b00111101000100011110101000110010,
	parameter in_weight2 = 32'b10111101100101011011101010111011,
	parameter in_weight3 = 32'b10111100011111010110000000011110,
	parameter in_weight4 = 32'b10111101100001101000010001101111,
	parameter in_weight5 = 32'b10111101000110111100111101010111,
	parameter in_weight6 = 32'b00111100111100111011000110100000,
	parameter in_weight7 = 32'b00111100100110101100111100010000,
	parameter in_weight8 = 32'b10111100101100101101011001111010,
	parameter in_weight9 = 32'b10111101000110001110010011111010,
	parameter in_weight10 = 32'b10111101100011101100110110111100,
	parameter in_weight11 = 32'b10111101100101010001111110100110,
	parameter in_weight12 = 32'b10111101100010011011110100001101,
	parameter in_weight13 = 32'b10111101100111110011111111100100,
	parameter in_weight14 = 32'b00111101011110100100000010101010,
	parameter in_weight15 = 32'b00111101001001011101110111001001,
	parameter in_weight16 = 32'b00111101000001011100111000000010,
	parameter in_weight17 = 32'b00111101100000011101111001101000,
	parameter in_weight18 = 32'b00111011010100010111000101110011,
	parameter in_weight19 = 32'b00111101100111000101110001110000,
	parameter in_weight20 = 32'b10111101101000000111100011100111,
	parameter in_weight21 = 32'b10111101100001110111110011101100,
	parameter in_weight22 = 32'b00111101100000010011000010100110,
	parameter in_weight23 = 32'b00111101100011010001111101101111,
	parameter in_weight24 = 32'b00111101100101100100110100001100,
	parameter in_weight25 = 32'b00111100110110110011111100001011,
	parameter in_weight26 = 32'b00111100010010100010101100010010,
	parameter in_weight27 = 32'b10111100101011000111001110001100,
	parameter in_weight28 = 32'b10111101010001010001111011110110,
	parameter in_weight29 = 32'b00111011110110111111000100010100,
	parameter in_weight30 = 32'b00111101011010011011001101111101,
	parameter in_weight31 = 32'b00111101010110100010011101011111,
	parameter in_weight32 = 32'b10111101100100001101111010100101,
	parameter in_weight33 = 32'b00111101011001101011001010010110,
	parameter in_weight34 = 32'b10111101011101000100001110001100,
	parameter in_weight35 = 32'b00111100110010110110010111100101,
	parameter in_weight36 = 32'b00111100011111010101100111110110,
	parameter in_weight37 = 32'b00111101001101101111010001010000,
	parameter in_weight38 = 32'b00111101001011111000111110010000,
	parameter in_weight39 = 32'b10111100101101000110110110100100,
	parameter in_weight40 = 32'b00111101101000100011101010101101,
	parameter in_weight41 = 32'b00111101100111011111011100110011,
	parameter in_weight42 = 32'b10111101100100010000001110011010,
	parameter in_weight43 = 32'b00111100101111011000010001100111,
	parameter in_weight44 = 32'b00111101011011100111010001011110,
	parameter in_weight45 = 32'b00111100111000111011001110111000,
	parameter in_weight46 = 32'b00111100100000111110000001101101,
	parameter in_weight47 = 32'b00111100101100101100111111000011,
	parameter in_weight48 = 32'b10111101010010000110101010111101,
	parameter in_weight49 = 32'b10111100100000111111100010011101,
	parameter in_weight50 = 32'b00111101011110010111111001101111,
	parameter in_weight51 = 32'b10111101100100010111001011110001,
	parameter in_weight52 = 32'b00111101000111110001100100001000,
	parameter in_weight53 = 32'b10111101100001101001001011010100,
	parameter in_weight54 = 32'b00111101101001001110011001101000,
	parameter in_weight55 = 32'b10111101011110101110111011010010,
	parameter in_weight56 = 32'b00111101100001100011001100000010,
	parameter in_weight57 = 32'b00111101001010111111100111000010,
	parameter in_weight58 = 32'b10111100011100000101111100011111,
	parameter in_weight59 = 32'b10111101010011011111011001001010,
	parameter in_weight60 = 32'b10111101101000001000001101101111,
	parameter in_weight61 = 32'b00111101010011111001100001111101,
	parameter in_weight62 = 32'b10111100110101011000110011110000,
	parameter in_weight63 = 32'b10111101101000001111100110110010,
	parameter in_weight64 = 32'b10111101100000110111100001100110,
	parameter in_weight65 = 32'b10111101101000011101110111010000,
	parameter in_weight66 = 32'b10111101100101100001001011101011,
	parameter in_weight67 = 32'b10111101000100110010111000110111,
	parameter in_weight68 = 32'b10111100101010100110111110110001,
	parameter in_weight69 = 32'b00111101001010101000101111101100,
	parameter in_weight70 = 32'b00111101101001011010111010111011,
	parameter in_weight71 = 32'b00111100101000101110000001101010,
	parameter in_weight72 = 32'b00111100110110100010011111010111,
	parameter in_weight73 = 32'b00111100111011100110001001010100,
	parameter in_weight74 = 32'b10111101101010011110101111011010,
	parameter in_weight75 = 32'b00111100001001110110010010010000,
	parameter in_weight76 = 32'b10111100111110111111000000100101,
	parameter in_weight77 = 32'b00111100111100001000100100010111,
	parameter in_weight78 = 32'b00111100100000100001101101000101,
	parameter in_weight79 = 32'b10111101001011011010001010000010,
	parameter in_weight80 = 32'b00111101101000100100100111110010,
	parameter in_weight81 = 32'b00111101001010010001111101110011,
	parameter in_weight82 = 32'b10111100110101010110110101101111,
	parameter in_weight83 = 32'b10111101000100110110001011001011,
	parameter in_weight84 = 32'b10111101011010100100000111111011,
	parameter in_weight85 = 32'b10111100100001111011110001111111,
	parameter in_weight86 = 32'b00111101100010110101001101111001,
	parameter in_weight87 = 32'b10111101001101011111110010101001,
	parameter in_weight88 = 32'b00111100110001101100100111000000,
	parameter in_weight89 = 32'b10111101011010000101000110111111,
	parameter in_weight90 = 32'b00111011110111000110111001110000,
	parameter in_weight91 = 32'b10111100101011101101111010010111,
	parameter in_weight92 = 32'b10111101001001011011111011100001,
	parameter in_weight93 = 32'b10111101000011010110101010111010,
	parameter in_weight94 = 32'b10111101101001000101010111101111,
	parameter in_weight95 = 32'b00111100011100100001010101100001,
	parameter in_weight96 = 32'b10111101000100010100100011110101,
	parameter in_weight97 = 32'b10111101001000001101100111111000,
	parameter in_weight98 = 32'b00111100100011111011001100001010,
	parameter in_weight99 = 32'b10111100101010001010111100111101,
	parameter in_weight100 = 32'b10111101001000111100101011100101,
	parameter in_weight101 = 32'b00111101101001101010101111111000,
	parameter in_weight102 = 32'b00111100100011001011010010101111,
	parameter in_weight103 = 32'b00111011110010011110101000001110,
	parameter in_weight104 = 32'b10111101101000101110001001111001,
	parameter in_weight105 = 32'b00111101100101101001100000111110,
	parameter in_weight106 = 32'b00111101001011000010100011110011,
	parameter in_weight107 = 32'b00111100111010100111010111101011,
	parameter in_weight108 = 32'b00111101100101011111100100100010,
	parameter in_weight109 = 32'b00111101001001110100001111100111,
	parameter in_weight110 = 32'b00111101100101101010111111010010,
	parameter in_weight111 = 32'b00111101010111110110011000101111,
	parameter in_weight112 = 32'b00111100000010101001100011010111,
	parameter in_weight113 = 32'b00111101100110011100111001010001,
	parameter in_weight114 = 32'b10111101010111101010100101110001,
	parameter in_weight115 = 32'b10111101011110110001011010111001,
	parameter in_weight116 = 32'b10111100010100000001011011100100,
	parameter in_weight117 = 32'b00111101100111100101001111101110,
	parameter in_weight118 = 32'b10111100100010011110101001010101,
	parameter in_weight119 = 32'b00111101000111010000010110010110,
	parameter in_weight120 = 32'b00111101001101111010011100100100,
	parameter in_weight121 = 32'b00111100000011101000011100111110,
	parameter in_weight122 = 32'b10111101001001101001001010101010,
	parameter in_weight123 = 32'b10111101100000111110101101010100,
	parameter in_weight124 = 32'b00111101000101001010001110111110,
	parameter in_weight125 = 32'b00111101100010001100000101011010,
	parameter in_weight126 = 32'b10111101001111010110101101101100,
	parameter in_weight127 = 32'b10111101100011110011110001100011,
	parameter in_weight128 = 32'b00111101011011101010101010111110,
	parameter in_weight129 = 32'b10111100111011110100111110100101,
	parameter in_weight130 = 32'b10111101100010111001011110011001,
	parameter in_weight131 = 32'b00111101011001111010101011010111,
	parameter in_weight132 = 32'b10111101011011000011101000110001,
	parameter in_weight133 = 32'b00111101100001010111111101000100,
	parameter in_weight134 = 32'b10111101001010101110101101010110,
	parameter in_weight135 = 32'b00111101001111010011010000011100,
	parameter in_weight136 = 32'b10111100101000110111110010001000,
	parameter in_weight137 = 32'b00111100010001111011000010111101,
	parameter in_weight138 = 32'b10111100010100010010111100000001,
	parameter in_weight139 = 32'b10111101001110011101010111000010,
	parameter in_weight140 = 32'b10111100111111101010001010001010,
	parameter in_weight141 = 32'b00111101100001111010101000000110,
	parameter in_weight142 = 32'b10111101100100010010111111011100,
	parameter in_weight143 = 32'b10111100101101000001011011110100,
	parameter in_weight144 = 32'b00111101000010110100111001001010,
	parameter in_weight145 = 32'b10111011001011000000101100001110,
	parameter in_weight146 = 32'b00111000111001101101101000100111,
	parameter in_weight147 = 32'b00111101100101110000101011111101,
	parameter in_weight148 = 32'b10111100011111111110110010111101,
	parameter in_weight149 = 32'b00111101101001011011101001111001,
	parameter in_weight150 = 32'b00111101100000001011111000111101,
	parameter in_weight151 = 32'b00111101100101101001011111100000,
	parameter in_weight152 = 32'b00111101001010001110001111110010,
	parameter in_weight153 = 32'b10111101010111111001011000111101,
	parameter in_weight154 = 32'b10111100110010100111111010001110,
	parameter in_weight155 = 32'b00111101100100011111010001011101,
	parameter in_weight156 = 32'b10111101100010111100111010110010,
	parameter in_weight157 = 32'b10111100011001001101011001111111,
	parameter in_weight158 = 32'b00111100110001000011011110001110,
	parameter in_weight159 = 32'b00111101011100100011101011101100,
	parameter in_weight160 = 32'b10111101100101110111010100100000,
	parameter in_weight161 = 32'b00111100011001110101001010101100,
	parameter in_weight162 = 32'b00111101000110111110111111110110,
	parameter in_weight163 = 32'b00111100101110001101000101010111,
	parameter in_weight164 = 32'b10111101101001000011100001000011,
	parameter in_weight165 = 32'b00111101100010010100001000000010,
	parameter in_weight166 = 32'b00111100001111100001111000101110,
	parameter in_weight167 = 32'b10111101011000110100100000010101,
	parameter in_weight168 = 32'b00111011010111010010110110010111,
	parameter in_weight169 = 32'b10111100101100001010000000110111,
	parameter in_weight170 = 32'b10111100000010000101110101000111,
	parameter in_weight171 = 32'b10111011110000110011010011101010,
	parameter in_weight172 = 32'b10111101101001100110101011101000,
	parameter in_weight173 = 32'b10111011100100001100111100111010,
	parameter in_weight174 = 32'b10111101000101111101000101111010,
	parameter in_weight175 = 32'b10111101101000111010011010010110,
	parameter in_weight176 = 32'b10111101100100011011111111110000,
	parameter in_weight177 = 32'b10111011010011111110010001000110,
	parameter in_weight178 = 32'b10111101010110010011110111001100,
	parameter in_weight179 = 32'b00111101100100111011101010110001,
	parameter in_weight180 = 32'b10111101010000110000001110010010,
	parameter in_weight181 = 32'b10111100100001110101100010000110,
	parameter in_weight182 = 32'b00111100101111101010110101011100,
	parameter in_weight183 = 32'b00111101000000010011100000111111,
	parameter in_weight184 = 32'b00111100110110111010101001101100,
	parameter in_weight185 = 32'b10111100110000111011011001001110,
	parameter in_weight186 = 32'b00111101101000001111110111111101,
	parameter in_weight187 = 32'b10111101100010111111001001010100,
	parameter in_weight188 = 32'b00111101011111010110101010011001,
	parameter in_weight189 = 32'b10111100011010011011010000010110,
	parameter in_weight190 = 32'b00111101000001101000011011101000,
	parameter in_weight191 = 32'b00111100101000001001100110111011,
	parameter in_weight192 = 32'b10111101010010101010000011000100,
	parameter in_weight193 = 32'b00111101000111010111001010110100,
	parameter in_weight194 = 32'b10111101100000101001101010010110,
	parameter in_weight195 = 32'b10111100111110000101101000111011,
	parameter in_weight196 = 32'b10111100110010011011111100010110,
	parameter in_weight197 = 32'b00111101011000000100110010100100,
	parameter in_weight198 = 32'b10111101011110111010101111000010,
	parameter in_weight199 = 32'b10111101001010010101111100000011,
	parameter in_weight200 = 32'b00111011000011111000001000110101,
	parameter in_weight201 = 32'b00111101100100000110010000111101,
	parameter in_weight202 = 32'b10111011110010110110110111001101,
	parameter in_weight203 = 32'b00111101100011101001100111110101,
	parameter in_weight204 = 32'b00111101001000001011001111111001,
	parameter in_weight205 = 32'b10111101010011100011111111101011,
	parameter in_weight206 = 32'b00111101011110101100001010111001,
	parameter in_weight207 = 32'b10111101001011001111001010001110,
	parameter in_weight208 = 32'b00111101101001010011011101000100,
	parameter in_weight209 = 32'b00111100000000110011011100101110,
	parameter in_weight210 = 32'b00111100111001010000111101101001,
	parameter in_weight211 = 32'b00111101010011100010110100110010,
	parameter in_weight212 = 32'b00111101000100100011000000111011,
	parameter in_weight213 = 32'b00111100101100000100011101010011,
	parameter in_weight214 = 32'b00111101100010100101001010111110,
	parameter in_weight215 = 32'b10111101101001111001101001010011,
	parameter in_weight216 = 32'b00111101100101100110000001000111,
	parameter in_weight217 = 32'b10111101100111110010011001000110,
	parameter in_weight218 = 32'b10111100110110000010101100111111,
	parameter in_weight219 = 32'b10111101101000000101010000010001,
	parameter in_weight220 = 32'b10111101100010101000110010001010,
	parameter in_weight221 = 32'b10111101100011110101110000101100,
	parameter in_weight222 = 32'b00111101011101010010110000111111,
	parameter in_weight223 = 32'b00111011101000111111101011111001,
	parameter in_weight224 = 32'b00111011001011010100111110010110,
	parameter in_weight225 = 32'b10111100001110100100011110010000,
	parameter in_weight226 = 32'b10111101010011011010101011100111,
	parameter in_weight227 = 32'b10111100000110101010111101011110,
	parameter in_weight228 = 32'b10111101100100011110001011011010,
	parameter in_weight229 = 32'b10111100101111111001001010001001,
	parameter in_weight230 = 32'b10111100110001001011001111011100,
	parameter in_weight231 = 32'b00111011010110000011001010010000,
	parameter in_weight232 = 32'b10111101000111110100011001011111,
	parameter in_weight233 = 32'b00111101100011011001110000011011,
	parameter in_weight234 = 32'b10111101000101010100110011101100,
	parameter in_weight235 = 32'b10111101001100000010101110111000,
	parameter in_weight236 = 32'b10111101011001011000101110000001,
	parameter in_weight237 = 32'b00111010111111110100110001110001,
	parameter in_weight238 = 32'b10111101000010000001100000100011,
	parameter in_weight239 = 32'b00111101010001011011110001101011,
	parameter in_weight240 = 32'b10111101000000100001011101000100,
	parameter in_weight241 = 32'b10111101100101001000001100000001,
	parameter in_weight242 = 32'b10111100001101101011000110110000,
	parameter in_weight243 = 32'b00111101001101011001101110010101,
	parameter in_weight244 = 32'b00111101100111100111000101001001,
	parameter in_weight245 = 32'b10111100010010000101011101100001,
	parameter in_weight246 = 32'b10111101100010010000111011001111,
	parameter in_weight247 = 32'b10111100011111000100111100111001,
	parameter in_weight248 = 32'b00111101001100101101110001010101,
	parameter in_weight249 = 32'b00111100100011111011110001110000,
	parameter in_weight250 = 32'b10111101101010100001111111011100,
	parameter in_weight251 = 32'b10111101100001111110100001101101,
	parameter in_weight252 = 32'b10111100100100011110111110101000,
	parameter in_weight253 = 32'b10111101001010000111101111011001,
	parameter in_weight254 = 32'b10111100010001000110110100010110,
	parameter in_weight255 = 32'b00111100101001011010111110110110,
	parameter in_weight256 = 32'b00111100111011001010100001000100,
	parameter in_weight257 = 32'b10111101100001010010010001110101,
	parameter in_weight258 = 32'b10111100011100011011011111101000,
	parameter in_weight259 = 32'b00111011110000101010101000100111,
	parameter in_weight260 = 32'b10111101100011100111010001000101,
	parameter in_weight261 = 32'b00111101010000001000101110100111,
	parameter in_weight262 = 32'b10111100101100001111100001001110,
	parameter in_weight263 = 32'b00111011110111010001010100100001,
	parameter in_weight264 = 32'b10111100001110010010000001010001,
	parameter in_weight265 = 32'b00111101101000110110111100100111,
	parameter in_weight266 = 32'b00111100111011100011110010010001,
	parameter in_weight267 = 32'b00111101000001111000011001000110,
	parameter in_weight268 = 32'b00111101100110011000111111110100,
	parameter in_weight269 = 32'b10111101011011001001110001011001,
	parameter in_weight270 = 32'b00111101001001111001001011010000,
	parameter in_weight271 = 32'b00111001100111101010010010111010,
	parameter in_weight272 = 32'b00111101011010101011110101000101,
	parameter in_weight273 = 32'b00111100000111011111111111110001,
	parameter in_weight274 = 32'b00111100100000111111100001111001,
	parameter in_weight275 = 32'b10111101011000000100110011101110,
	parameter in_weight276 = 32'b10111101100001111010101011011010,
	parameter in_weight277 = 32'b10111100000000111100110101110001,
	parameter in_weight278 = 32'b10111101101010000010011101111011,
	parameter in_weight279 = 32'b10111101010101111000101110101010,
	parameter in_weight280 = 32'b10111101101000001111001111100001,
	parameter in_weight281 = 32'b10111101100100101111101000001000,
	parameter in_weight282 = 32'b00111101011010000011101101110110,
	parameter in_weight283 = 32'b10111011111110010110100010001001,
	parameter in_weight284 = 32'b00111101100011100100100100011010,
	parameter in_weight285 = 32'b10111101101000011011110111011011,
	parameter in_weight286 = 32'b00111101010011111001010011001011,
	parameter in_weight287 = 32'b10111101100010010101010100111001
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
