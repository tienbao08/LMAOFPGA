`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_14
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


module conv_28_weight6_14
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b10111101100010100011100111010001,
	parameter in_weight1 = 32'b00111101000001010010001011111001,
	parameter in_weight2 = 32'b10111101100010110110101111111111,
	parameter in_weight3 = 32'b10111101100111101111111011110110,
	parameter in_weight4 = 32'b00111100101100110101000000001110,
	parameter in_weight5 = 32'b10111101100111011001101110110111,
	parameter in_weight6 = 32'b10111101101000100111010000011001,
	parameter in_weight7 = 32'b00111101100111000101101100101100,
	parameter in_weight8 = 32'b00111101101000100101111111101111,
	parameter in_weight9 = 32'b00111101100110100000111111010100,
	parameter in_weight10 = 32'b00111101100011101010011001011110,
	parameter in_weight11 = 32'b00111101011001110111100011110010,
	parameter in_weight12 = 32'b10111101100010100111000000001101,
	parameter in_weight13 = 32'b00111101000010000110010110101010,
	parameter in_weight14 = 32'b10111101100010001010110001110011,
	parameter in_weight15 = 32'b00111100001011011000110100101101,
	parameter in_weight16 = 32'b10111101011111100111101010110111,
	parameter in_weight17 = 32'b00111101000011001010001001110110,
	parameter in_weight18 = 32'b10111100111001100011010011101000,
	parameter in_weight19 = 32'b00111101100010011000001101011111,
	parameter in_weight20 = 32'b10111100100001010011110010111010,
	parameter in_weight21 = 32'b00111011010010100111000111000110,
	parameter in_weight22 = 32'b10111100001001000100101110011110,
	parameter in_weight23 = 32'b00111101011100001011111100010110,
	parameter in_weight24 = 32'b10111101010001101000010001101011,
	parameter in_weight25 = 32'b00111101100110010100110101110011,
	parameter in_weight26 = 32'b00111101100001101000010000110111,
	parameter in_weight27 = 32'b00111100101111011101100011110101,
	parameter in_weight28 = 32'b10111101001101001101110101011111,
	parameter in_weight29 = 32'b00111100001101000111000101000100,
	parameter in_weight30 = 32'b00111011101110000011101110101010,
	parameter in_weight31 = 32'b00111101001011100001100100010100,
	parameter in_weight32 = 32'b00111100110110100101001001000110,
	parameter in_weight33 = 32'b00111100110011100110011111110011,
	parameter in_weight34 = 32'b10111100101110000101001001100000,
	parameter in_weight35 = 32'b10111100100001110010010010000001,
	parameter in_weight36 = 32'b00111101101000100101111000100011,
	parameter in_weight37 = 32'b00111101000000101110011011010110,
	parameter in_weight38 = 32'b10111101001010001111000110010011,
	parameter in_weight39 = 32'b10111011010111011100111010111010,
	parameter in_weight40 = 32'b10111101101010011110111100000000,
	parameter in_weight41 = 32'b00111101100100001011011001010001,
	parameter in_weight42 = 32'b10111011010001011011000100111001,
	parameter in_weight43 = 32'b00111101100011011001000000101110,
	parameter in_weight44 = 32'b00111101010111000000010101011100,
	parameter in_weight45 = 32'b00111101000111111101101110011010,
	parameter in_weight46 = 32'b10111100011011100011110001111010,
	parameter in_weight47 = 32'b10111101100011100011110010000001,
	parameter in_weight48 = 32'b10111101001000000010100000010100,
	parameter in_weight49 = 32'b10111101001010000101011101010100,
	parameter in_weight50 = 32'b00111101100010110110110110110000,
	parameter in_weight51 = 32'b10111100010100100101001100100100,
	parameter in_weight52 = 32'b10111100001100111101000110101000,
	parameter in_weight53 = 32'b10111100100110101000110110100101,
	parameter in_weight54 = 32'b10111101100011011000001000110111,
	parameter in_weight55 = 32'b00111101011000010001001100101101,
	parameter in_weight56 = 32'b10111101100000000111111100111011,
	parameter in_weight57 = 32'b10111011100011101000000000100110,
	parameter in_weight58 = 32'b00111101000101101000111001111000,
	parameter in_weight59 = 32'b10111101010001110001111110011000,
	parameter in_weight60 = 32'b10111100000111000100111111110001,
	parameter in_weight61 = 32'b10111100110010000111111100100010,
	parameter in_weight62 = 32'b00111100111010111100101110011101,
	parameter in_weight63 = 32'b10111101100000010110100000001110,
	parameter in_weight64 = 32'b00111100101010011010101100010101,
	parameter in_weight65 = 32'b10111011011010001100101001010001,
	parameter in_weight66 = 32'b10111100110011001110101110111111,
	parameter in_weight67 = 32'b00111100101101011101000001100111,
	parameter in_weight68 = 32'b00111011101110000100011011011010,
	parameter in_weight69 = 32'b00111101001000000001000100100011,
	parameter in_weight70 = 32'b00111101000111101010111001011110,
	parameter in_weight71 = 32'b00111101101000010100100010001110,
	parameter in_weight72 = 32'b10111011100111001111011001110011,
	parameter in_weight73 = 32'b00111011000000111111000111001001,
	parameter in_weight74 = 32'b10111101000110001110111001111110,
	parameter in_weight75 = 32'b10111101001110111011111100101110,
	parameter in_weight76 = 32'b00111101000111101111101001111010,
	parameter in_weight77 = 32'b00111101100011001111000011110000,
	parameter in_weight78 = 32'b00111101010001100110100010001100,
	parameter in_weight79 = 32'b00111101010101010010001000011100,
	parameter in_weight80 = 32'b10111101001001000111111011000001,
	parameter in_weight81 = 32'b00111100000010010111101000011010,
	parameter in_weight82 = 32'b00111100111110011110000111101100,
	parameter in_weight83 = 32'b00111100011110010101110001010010,
	parameter in_weight84 = 32'b10111011101011100111001010100111,
	parameter in_weight85 = 32'b10111101000110111110010110101100,
	parameter in_weight86 = 32'b00111101101000110010111010000111,
	parameter in_weight87 = 32'b10111101010101011001111001000001,
	parameter in_weight88 = 32'b10111101011011111110011110010001,
	parameter in_weight89 = 32'b10111100111100100001001011001010,
	parameter in_weight90 = 32'b00111101100000000111111011011001,
	parameter in_weight91 = 32'b00111101010000001001110111001100,
	parameter in_weight92 = 32'b10111101100000001111110010111100,
	parameter in_weight93 = 32'b10111100100100010101001111110000,
	parameter in_weight94 = 32'b00111100000001000100100000100111,
	parameter in_weight95 = 32'b00111100110011000111101011100011,
	parameter in_weight96 = 32'b10111101001101000110100011101001,
	parameter in_weight97 = 32'b00111100000010101111110100110001,
	parameter in_weight98 = 32'b00111101001101000001100100000000,
	parameter in_weight99 = 32'b00111100000100001100000001101011,
	parameter in_weight100 = 32'b10111101010111101101010100001100,
	parameter in_weight101 = 32'b10111101001010111111001000010011,
	parameter in_weight102 = 32'b10111101100010011101110110010110,
	parameter in_weight103 = 32'b10111101100100010001011111011110,
	parameter in_weight104 = 32'b00111101011111110010110011001011,
	parameter in_weight105 = 32'b00111101100011011001001000010101,
	parameter in_weight106 = 32'b00111011111010111110101111001001,
	parameter in_weight107 = 32'b10111101001111010110001010110010,
	parameter in_weight108 = 32'b00111100110001101011111110100100,
	parameter in_weight109 = 32'b00111100110010001100001001100011,
	parameter in_weight110 = 32'b00111100100000110001011101110110,
	parameter in_weight111 = 32'b10111101100111111011010010101011,
	parameter in_weight112 = 32'b00111101011100111110011101110110,
	parameter in_weight113 = 32'b00111010110001111011110011111101,
	parameter in_weight114 = 32'b00111100100000110001110001100001,
	parameter in_weight115 = 32'b10111101100110001000000011100100,
	parameter in_weight116 = 32'b00111100110100110110011011110001,
	parameter in_weight117 = 32'b10111101011000010010001010111110,
	parameter in_weight118 = 32'b00111101011011011101110010111010,
	parameter in_weight119 = 32'b10111101100000110001111110101110,
	parameter in_weight120 = 32'b10111101100100001000001100111010,
	parameter in_weight121 = 32'b00111100010110010100000010000101,
	parameter in_weight122 = 32'b10111011111111000101011001101100,
	parameter in_weight123 = 32'b00111101101001101100111101111010,
	parameter in_weight124 = 32'b00111100100001110101111010111010,
	parameter in_weight125 = 32'b00111101100110110000010001000010,
	parameter in_weight126 = 32'b00111101100111001100001100011010,
	parameter in_weight127 = 32'b00111101011110110110011011011010,
	parameter in_weight128 = 32'b10111101100010001101010100011111,
	parameter in_weight129 = 32'b10111101010101101110101111110001,
	parameter in_weight130 = 32'b10111011101110011101011010000010,
	parameter in_weight131 = 32'b10111011001101111100000111010010,
	parameter in_weight132 = 32'b10111101100000011111101100000011,
	parameter in_weight133 = 32'b10111100100010111111110111001101,
	parameter in_weight134 = 32'b10111101001001000010000111111100,
	parameter in_weight135 = 32'b10111101100111010010010100011000,
	parameter in_weight136 = 32'b00111101100001110010000010100000,
	parameter in_weight137 = 32'b10111100111111110011100010000010,
	parameter in_weight138 = 32'b10111101101000100001111100101010,
	parameter in_weight139 = 32'b00111101100000001000001010001000,
	parameter in_weight140 = 32'b00111101010111101101011110000010,
	parameter in_weight141 = 32'b00111100010100101010001101001110,
	parameter in_weight142 = 32'b00111101100101000001001010101101,
	parameter in_weight143 = 32'b10111100000000101001000010000111,
	parameter in_weight144 = 32'b00111100110000011010100100110001,
	parameter in_weight145 = 32'b10111100101010011000111111010110,
	parameter in_weight146 = 32'b00111100000000100111111101000101,
	parameter in_weight147 = 32'b00111100001100111111111111101001,
	parameter in_weight148 = 32'b10111101000001101111111100111010,
	parameter in_weight149 = 32'b10111101001011011110100101000101,
	parameter in_weight150 = 32'b10111100101111010001000001100111,
	parameter in_weight151 = 32'b10111010010000001110001110110000,
	parameter in_weight152 = 32'b10111100110001000010000111100000,
	parameter in_weight153 = 32'b00111100101100011010100010101000,
	parameter in_weight154 = 32'b00111101001000011110010010000000,
	parameter in_weight155 = 32'b00111101001111110011000000001000,
	parameter in_weight156 = 32'b00111101001110000001011010001001,
	parameter in_weight157 = 32'b10111101011011110011001000110010,
	parameter in_weight158 = 32'b10111011100111110000001101110111,
	parameter in_weight159 = 32'b00111100010101111001111011011111,
	parameter in_weight160 = 32'b10111101011101001010001001010001,
	parameter in_weight161 = 32'b10111101000011101100111001000101,
	parameter in_weight162 = 32'b00111010111011000100011111010111,
	parameter in_weight163 = 32'b10111101010101010100001001100010,
	parameter in_weight164 = 32'b00111101100011110101101100000001,
	parameter in_weight165 = 32'b00111101010011101100011111011110,
	parameter in_weight166 = 32'b00111101000011000101100011110111,
	parameter in_weight167 = 32'b10111011100010001110000000001010,
	parameter in_weight168 = 32'b00111100110100101011111011000000,
	parameter in_weight169 = 32'b10111101011000101000011100010100,
	parameter in_weight170 = 32'b00111011101000111100010010111000,
	parameter in_weight171 = 32'b10111100000111000011010110100001,
	parameter in_weight172 = 32'b00111011111111111100110000000011,
	parameter in_weight173 = 32'b10111100101100001111111001101011,
	parameter in_weight174 = 32'b10111100000101010010000100010000,
	parameter in_weight175 = 32'b00111101011100001010110011100110,
	parameter in_weight176 = 32'b00111100000000100010100001111001,
	parameter in_weight177 = 32'b10111011111010000011111000000100,
	parameter in_weight178 = 32'b00111101100110001000011000001110,
	parameter in_weight179 = 32'b10111101011000111011011010010000,
	parameter in_weight180 = 32'b00111101011011100111001110011010,
	parameter in_weight181 = 32'b00111100101010000011011110111001,
	parameter in_weight182 = 32'b00111101100011111111011001111010,
	parameter in_weight183 = 32'b00111011100010000001100100010111,
	parameter in_weight184 = 32'b10111100101110101110011110001000,
	parameter in_weight185 = 32'b00111101011000111010101011100101,
	parameter in_weight186 = 32'b00111100011000101000101010010000,
	parameter in_weight187 = 32'b10111011100110010100000001010110,
	parameter in_weight188 = 32'b10111101011101000110010010111001,
	parameter in_weight189 = 32'b00111101010110110100100111011101,
	parameter in_weight190 = 32'b00111100110001000110011101101010,
	parameter in_weight191 = 32'b00111101101000000010001100110100,
	parameter in_weight192 = 32'b10111101011001111011000100011001,
	parameter in_weight193 = 32'b10111101000111111001001110010110,
	parameter in_weight194 = 32'b00111101100001001110011100111001,
	parameter in_weight195 = 32'b00111101100000010111001101000010,
	parameter in_weight196 = 32'b00111100101000110000111110100101,
	parameter in_weight197 = 32'b00111101001100000110011010001110,
	parameter in_weight198 = 32'b00111101101001001010000100111110,
	parameter in_weight199 = 32'b00111101001010111010100100101111,
	parameter in_weight200 = 32'b00111101010111100110100001010101,
	parameter in_weight201 = 32'b00111101000010111110000111100100,
	parameter in_weight202 = 32'b10111101000010000010100010001101,
	parameter in_weight203 = 32'b00111101011000001001011100011101,
	parameter in_weight204 = 32'b10111100101101000011101110011011,
	parameter in_weight205 = 32'b00111101000011001011010100110101,
	parameter in_weight206 = 32'b00111101011111100100000000111110,
	parameter in_weight207 = 32'b10111011110000001100111101010100,
	parameter in_weight208 = 32'b00111100000001101111110111001110,
	parameter in_weight209 = 32'b00111101011100000110111001010001,
	parameter in_weight210 = 32'b10111101010000111100000011010110,
	parameter in_weight211 = 32'b00111100111110000111010001111001,
	parameter in_weight212 = 32'b10111101011010100101000001000011,
	parameter in_weight213 = 32'b10111100100110000101011011000011,
	parameter in_weight214 = 32'b10111101001110001100010000001110,
	parameter in_weight215 = 32'b00111101100000110100101001101101,
	parameter in_weight216 = 32'b00111011000000011101101000000001,
	parameter in_weight217 = 32'b00111101100011110010101111000101,
	parameter in_weight218 = 32'b10111001101101111110001010100110,
	parameter in_weight219 = 32'b00111101010001000000010111101010,
	parameter in_weight220 = 32'b00111101011000110011100010101111,
	parameter in_weight221 = 32'b10111101100110000011111100001110,
	parameter in_weight222 = 32'b00111100000000111110111001010110,
	parameter in_weight223 = 32'b10111101100011100101001110111000,
	parameter in_weight224 = 32'b10111010110010011101101100101011,
	parameter in_weight225 = 32'b00111101100000111001111111011000,
	parameter in_weight226 = 32'b10111101010100111011110100001001,
	parameter in_weight227 = 32'b00111100001001100101001010001011,
	parameter in_weight228 = 32'b00111101100100001011101000101101,
	parameter in_weight229 = 32'b10111100101001111000101001011001,
	parameter in_weight230 = 32'b00111101010111001010111101011000,
	parameter in_weight231 = 32'b00111010110111010010010101111000,
	parameter in_weight232 = 32'b00111101001000001001101010110000,
	parameter in_weight233 = 32'b00111101000101100000001001110011,
	parameter in_weight234 = 32'b00111100000110111011011111101001,
	parameter in_weight235 = 32'b00111101011011010100000010110000,
	parameter in_weight236 = 32'b00111101100011010010010011001010,
	parameter in_weight237 = 32'b00111101101010001011011000100000,
	parameter in_weight238 = 32'b10111100100100011100111011111110,
	parameter in_weight239 = 32'b00111101101000000001011011111110,
	parameter in_weight240 = 32'b00111101000001110110000000010101,
	parameter in_weight241 = 32'b00111101100000011010101011101010,
	parameter in_weight242 = 32'b10111101011110110001111111111101,
	parameter in_weight243 = 32'b10111101010100011001010101110101,
	parameter in_weight244 = 32'b10111010110001010000111010110010,
	parameter in_weight245 = 32'b10111101100001111111111111100100,
	parameter in_weight246 = 32'b10111101101001011110100011101100,
	parameter in_weight247 = 32'b10111100010101101001010000110011,
	parameter in_weight248 = 32'b00111100100010000101000000001111,
	parameter in_weight249 = 32'b00111100110100101010010010010000,
	parameter in_weight250 = 32'b10111101000011101100010001011001,
	parameter in_weight251 = 32'b10111100010010011101111000011000,
	parameter in_weight252 = 32'b00111101100101101111110000011101,
	parameter in_weight253 = 32'b00111101100010000010100101011110,
	parameter in_weight254 = 32'b00111101010011011001001001111010,
	parameter in_weight255 = 32'b00111101011011100010110000010111,
	parameter in_weight256 = 32'b00111101001011111011001010010000,
	parameter in_weight257 = 32'b00111011010000001111100101100010,
	parameter in_weight258 = 32'b10111100110011101001000011101111,
	parameter in_weight259 = 32'b10111101011000110101100101010101,
	parameter in_weight260 = 32'b00111101010010110111100000111110,
	parameter in_weight261 = 32'b10111100100111011110011011000010,
	parameter in_weight262 = 32'b10111100111110001000010000100010,
	parameter in_weight263 = 32'b10111101100111011110110000110000,
	parameter in_weight264 = 32'b00111011000011000110100111001000,
	parameter in_weight265 = 32'b10111101001101111000101010101001,
	parameter in_weight266 = 32'b10111011100001001001001010111110,
	parameter in_weight267 = 32'b00111100000001011011010100110001,
	parameter in_weight268 = 32'b00111101011011101011110111010110,
	parameter in_weight269 = 32'b00111100111110001010110011011100,
	parameter in_weight270 = 32'b00111101000111101111010000111100,
	parameter in_weight271 = 32'b10111100100010011101100110111111,
	parameter in_weight272 = 32'b10111100100110101101100101110110,
	parameter in_weight273 = 32'b00111101101000011101110010001100,
	parameter in_weight274 = 32'b10111101100110100001111000010101,
	parameter in_weight275 = 32'b00111101100111010011011001011000,
	parameter in_weight276 = 32'b00111100011110100110110111111100,
	parameter in_weight277 = 32'b00111101100111001101000110000010,
	parameter in_weight278 = 32'b10111011111110010111110110001011,
	parameter in_weight279 = 32'b10111101101010101101011101110011,
	parameter in_weight280 = 32'b00111011101001001110100001101010,
	parameter in_weight281 = 32'b10111011101100100000000010101001,
	parameter in_weight282 = 32'b00111100111111101111001000100110,
	parameter in_weight283 = 32'b00111101100001100011110110100011,
	parameter in_weight284 = 32'b10111101100010010000101010100011,
	parameter in_weight285 = 32'b10111100011010000101011100110000,
	parameter in_weight286 = 32'b10111101010101110111101010000100,
	parameter in_weight287 = 32'b10111101000100001000000010111111
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
