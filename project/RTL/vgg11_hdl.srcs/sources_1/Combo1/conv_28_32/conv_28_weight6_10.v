`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_10
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


module conv_28_weight6_10
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b10111011000101111111000000110011,
	parameter in_weight1 = 32'b10111101000111001000101100101111,
	parameter in_weight2 = 32'b10111011010110100001110010001011,
	parameter in_weight3 = 32'b00111101100110100100010010010111,
	parameter in_weight4 = 32'b00111101011001011001010110011001,
	parameter in_weight5 = 32'b00111101011001110111000000111111,
	parameter in_weight6 = 32'b00111101001000010001111111011000,
	parameter in_weight7 = 32'b00111101100000001000000100010001,
	parameter in_weight8 = 32'b00111101100111101111000101011011,
	parameter in_weight9 = 32'b10111101011110101000010001011011,
	parameter in_weight10 = 32'b10111011100111000001100011101111,
	parameter in_weight11 = 32'b10111100100101010010001001100101,
	parameter in_weight12 = 32'b10111100111100101101011100100000,
	parameter in_weight13 = 32'b10111101010101110101000001011010,
	parameter in_weight14 = 32'b00111100110010010101011010010011,
	parameter in_weight15 = 32'b00111101001001111100000111110011,
	parameter in_weight16 = 32'b00111011100110110111000101110110,
	parameter in_weight17 = 32'b10111011100000011101100000001000,
	parameter in_weight18 = 32'b10111100000000011010001110010001,
	parameter in_weight19 = 32'b10111101011101011110111100010001,
	parameter in_weight20 = 32'b00111100101001011101000010100011,
	parameter in_weight21 = 32'b00111101000100101111110101010100,
	parameter in_weight22 = 32'b10111100000100000101011000100010,
	parameter in_weight23 = 32'b00111100010010010111011100010010,
	parameter in_weight24 = 32'b00111001110101000100101001011100,
	parameter in_weight25 = 32'b00111101010001000000000010011111,
	parameter in_weight26 = 32'b00111101100100110111010110001001,
	parameter in_weight27 = 32'b10111101010010010111011111100001,
	parameter in_weight28 = 32'b00111101010100110011001100010111,
	parameter in_weight29 = 32'b00111100111000000111110011001011,
	parameter in_weight30 = 32'b00111101010100011110011001111011,
	parameter in_weight31 = 32'b00111100000000101011111000110010,
	parameter in_weight32 = 32'b00111101100001100101100011101011,
	parameter in_weight33 = 32'b00111100110111001110111111101001,
	parameter in_weight34 = 32'b00111101011000001000111001100011,
	parameter in_weight35 = 32'b00111100011110110010011110111000,
	parameter in_weight36 = 32'b10111101101010110101100110010011,
	parameter in_weight37 = 32'b10111101010000100001000001001010,
	parameter in_weight38 = 32'b10111100101100011000000111000100,
	parameter in_weight39 = 32'b10111101001011001010011010110010,
	parameter in_weight40 = 32'b00111101010101100101010100000101,
	parameter in_weight41 = 32'b00111100011100101101110010011000,
	parameter in_weight42 = 32'b10111101011100101000001101001001,
	parameter in_weight43 = 32'b00111100111110000010010001100000,
	parameter in_weight44 = 32'b10111101101010111001100010111011,
	parameter in_weight45 = 32'b10111101000111001011110000010100,
	parameter in_weight46 = 32'b00111101001110100100010100101101,
	parameter in_weight47 = 32'b00111100100010111010010001011001,
	parameter in_weight48 = 32'b10111011110001100000001101101110,
	parameter in_weight49 = 32'b00111101100010001101011100100011,
	parameter in_weight50 = 32'b00111101100011010000100100001001,
	parameter in_weight51 = 32'b10111101100000000001010010000101,
	parameter in_weight52 = 32'b10111101100101110111111011010100,
	parameter in_weight53 = 32'b00111101000010111101110001011100,
	parameter in_weight54 = 32'b10111101100010111100110000000001,
	parameter in_weight55 = 32'b00111101000101011110001111101100,
	parameter in_weight56 = 32'b00111101010011010100000101100111,
	parameter in_weight57 = 32'b10111101011101011001000011110010,
	parameter in_weight58 = 32'b10111100001000100110010011000010,
	parameter in_weight59 = 32'b10111101011011100101000110010001,
	parameter in_weight60 = 32'b00111011111111010001011000100101,
	parameter in_weight61 = 32'b10111100101000010000010111100100,
	parameter in_weight62 = 32'b00111101011100010001000000110101,
	parameter in_weight63 = 32'b00111101100011101001000000001010,
	parameter in_weight64 = 32'b10111101101000110011001110100110,
	parameter in_weight65 = 32'b10111100111010010001001110001001,
	parameter in_weight66 = 32'b10111101100111110011110011000111,
	parameter in_weight67 = 32'b00111101010110100000101110010000,
	parameter in_weight68 = 32'b00111101000100000100000101100000,
	parameter in_weight69 = 32'b10111101000011111111111110100001,
	parameter in_weight70 = 32'b10111100110100001100111010001101,
	parameter in_weight71 = 32'b00111100011000001101111101101000,
	parameter in_weight72 = 32'b10111101100110001001101001100110,
	parameter in_weight73 = 32'b00111100100001010101101101100010,
	parameter in_weight74 = 32'b10111101100000111110101111001100,
	parameter in_weight75 = 32'b00111101001010101111101011101001,
	parameter in_weight76 = 32'b10111101001000111100100000000010,
	parameter in_weight77 = 32'b10111101101001111101100001101110,
	parameter in_weight78 = 32'b00111011100000110001110011011101,
	parameter in_weight79 = 32'b00111101010011111101001111100010,
	parameter in_weight80 = 32'b00111101010001101111110101101011,
	parameter in_weight81 = 32'b00111101100000101011010101010000,
	parameter in_weight82 = 32'b10111101010000000111110111101110,
	parameter in_weight83 = 32'b10111101010110101111100100011001,
	parameter in_weight84 = 32'b10111101001011111101111101101010,
	parameter in_weight85 = 32'b00111100111001111111110001010001,
	parameter in_weight86 = 32'b10111101100110010001101100100111,
	parameter in_weight87 = 32'b00111101101001100110101111101100,
	parameter in_weight88 = 32'b00111100011111011000010000100001,
	parameter in_weight89 = 32'b10111101100010000110110001011101,
	parameter in_weight90 = 32'b00111100010001101110010110101001,
	parameter in_weight91 = 32'b10111010101001111000111010011110,
	parameter in_weight92 = 32'b10111011000111110100011111111101,
	parameter in_weight93 = 32'b10111101011000010011110001101001,
	parameter in_weight94 = 32'b10111101011010010001010001100111,
	parameter in_weight95 = 32'b00111101011101010001101000011010,
	parameter in_weight96 = 32'b10111101010011010110011010011001,
	parameter in_weight97 = 32'b00111100100010010111001101010011,
	parameter in_weight98 = 32'b10111101100101001000101001110100,
	parameter in_weight99 = 32'b00111100111101010011110011001001,
	parameter in_weight100 = 32'b00111101010001010110011010110101,
	parameter in_weight101 = 32'b00111011110011111011110101101100,
	parameter in_weight102 = 32'b00111011110010101000110100101000,
	parameter in_weight103 = 32'b00111101010110010011110110100001,
	parameter in_weight104 = 32'b10111101100111000011001001011111,
	parameter in_weight105 = 32'b10111101100000100111100010100011,
	parameter in_weight106 = 32'b00111101001000110011110011111101,
	parameter in_weight107 = 32'b00111010110011010101000010001101,
	parameter in_weight108 = 32'b10111100101101010111001100111101,
	parameter in_weight109 = 32'b00111100110110100001000000111000,
	parameter in_weight110 = 32'b00111101010111001011110110101100,
	parameter in_weight111 = 32'b10111101010001010110010001100010,
	parameter in_weight112 = 32'b10111101100111010110101111111111,
	parameter in_weight113 = 32'b00111101100100010001111001000110,
	parameter in_weight114 = 32'b10111101100111010010010110000010,
	parameter in_weight115 = 32'b10111101000011010000000111100010,
	parameter in_weight116 = 32'b00111100000100111000011011010011,
	parameter in_weight117 = 32'b10111101010010110101010001000110,
	parameter in_weight118 = 32'b10111101011100010101011101110100,
	parameter in_weight119 = 32'b00111101100110100100000001100001,
	parameter in_weight120 = 32'b00111101000101000110000000000001,
	parameter in_weight121 = 32'b00111101100101001010010010100000,
	parameter in_weight122 = 32'b00111101100110110000001101101010,
	parameter in_weight123 = 32'b00111101100011101110011110001110,
	parameter in_weight124 = 32'b00111101000011110110000001011100,
	parameter in_weight125 = 32'b10111100011001011100011001011000,
	parameter in_weight126 = 32'b10111101011010100111011101011110,
	parameter in_weight127 = 32'b00111101000010110110110111111101,
	parameter in_weight128 = 32'b10111100100000001101101000010110,
	parameter in_weight129 = 32'b10111100000011100011001110001111,
	parameter in_weight130 = 32'b10111101011000101100010110001100,
	parameter in_weight131 = 32'b00111100101100101111111100001110,
	parameter in_weight132 = 32'b00111101011000100110110101101011,
	parameter in_weight133 = 32'b10111100101000001011100110111011,
	parameter in_weight134 = 32'b00111100110011101011010101000100,
	parameter in_weight135 = 32'b10111100101001000010110100100010,
	parameter in_weight136 = 32'b00111101010100001101011010111000,
	parameter in_weight137 = 32'b00111011000110000011001100101110,
	parameter in_weight138 = 32'b00111101001000000001001001100001,
	parameter in_weight139 = 32'b00111011111010111010011010011110,
	parameter in_weight140 = 32'b00111101100110011111110101011010,
	parameter in_weight141 = 32'b00111011111001101001011010101110,
	parameter in_weight142 = 32'b00111101101001010000001011100111,
	parameter in_weight143 = 32'b00111011010000011001100110001011,
	parameter in_weight144 = 32'b00111101100001000010111100110011,
	parameter in_weight145 = 32'b00111101010000010001100101011100,
	parameter in_weight146 = 32'b10111100100100100101101001101000,
	parameter in_weight147 = 32'b10111101001111000011010000010111,
	parameter in_weight148 = 32'b00111101101001011110011001101101,
	parameter in_weight149 = 32'b00111100010011110010001111010011,
	parameter in_weight150 = 32'b00111101101010000010000110111011,
	parameter in_weight151 = 32'b10111010011111111000000010111011,
	parameter in_weight152 = 32'b00111100011010110101000110001010,
	parameter in_weight153 = 32'b00111101101000010010010000000100,
	parameter in_weight154 = 32'b10111101000010010001111011000110,
	parameter in_weight155 = 32'b10111101001011101010010001000011,
	parameter in_weight156 = 32'b00111101011110011000111111011100,
	parameter in_weight157 = 32'b10111100101001101111111101100111,
	parameter in_weight158 = 32'b00111101100100110101101011101111,
	parameter in_weight159 = 32'b10111101100100011010110010011110,
	parameter in_weight160 = 32'b00111101100100001011001010000110,
	parameter in_weight161 = 32'b00111101000011100110100110011111,
	parameter in_weight162 = 32'b10111101000011110110100100101100,
	parameter in_weight163 = 32'b00111010101101000000000100000010,
	parameter in_weight164 = 32'b10111101010001100000101101011110,
	parameter in_weight165 = 32'b10111100011111001100010101000110,
	parameter in_weight166 = 32'b10111100110000010111111110010011,
	parameter in_weight167 = 32'b00111101010110000000111101110000,
	parameter in_weight168 = 32'b10111011111101000010110011001111,
	parameter in_weight169 = 32'b10111101100111011101110111110010,
	parameter in_weight170 = 32'b00111011001111011110101000100111,
	parameter in_weight171 = 32'b10111100001101000010010001100101,
	parameter in_weight172 = 32'b00111101101001000100111001110011,
	parameter in_weight173 = 32'b00111101001110110101000101011001,
	parameter in_weight174 = 32'b10111100010010101100111001100111,
	parameter in_weight175 = 32'b00111101001111101000000101111001,
	parameter in_weight176 = 32'b10111100001111001111010110101100,
	parameter in_weight177 = 32'b10111101100111010111001111001011,
	parameter in_weight178 = 32'b00111101010000001110001001100000,
	parameter in_weight179 = 32'b10111100110110111001000110100010,
	parameter in_weight180 = 32'b00111101001001111100111000001010,
	parameter in_weight181 = 32'b10111100010000100001111110010100,
	parameter in_weight182 = 32'b10111101100001100011010111001100,
	parameter in_weight183 = 32'b00111101100110111010100110110111,
	parameter in_weight184 = 32'b10111101101000101011010011100000,
	parameter in_weight185 = 32'b10111100100001011111000100110101,
	parameter in_weight186 = 32'b10111100000010001000110110110110,
	parameter in_weight187 = 32'b10111101010010101010011101100110,
	parameter in_weight188 = 32'b10111101100101100110100111101001,
	parameter in_weight189 = 32'b00111100011101111111001110110111,
	parameter in_weight190 = 32'b00111100011001000101011101101011,
	parameter in_weight191 = 32'b10111101101000011000010111011111,
	parameter in_weight192 = 32'b00111101000111010110110110001110,
	parameter in_weight193 = 32'b10111100011111110001011101010011,
	parameter in_weight194 = 32'b00111100111000001101001001000101,
	parameter in_weight195 = 32'b10111101001000101100101001100100,
	parameter in_weight196 = 32'b00111101100001011110110001011011,
	parameter in_weight197 = 32'b10111101100011100101000010101101,
	parameter in_weight198 = 32'b10111100100000011000110010100110,
	parameter in_weight199 = 32'b00111101100000001011001111100000,
	parameter in_weight200 = 32'b00111101001001110111111010000010,
	parameter in_weight201 = 32'b10111101010110000100111100011111,
	parameter in_weight202 = 32'b00111101000101010110001101011010,
	parameter in_weight203 = 32'b10111100111110101100011000000010,
	parameter in_weight204 = 32'b10111100011110110011101101001010,
	parameter in_weight205 = 32'b10111100011111110101101010111001,
	parameter in_weight206 = 32'b10111101011110010111001100100111,
	parameter in_weight207 = 32'b10111011100101010010100001001110,
	parameter in_weight208 = 32'b10111101010001001101100100100011,
	parameter in_weight209 = 32'b10111100100011100000001101010011,
	parameter in_weight210 = 32'b00111101010000000101111001000011,
	parameter in_weight211 = 32'b10111101000001010001101011010011,
	parameter in_weight212 = 32'b10111011100001001111000111010110,
	parameter in_weight213 = 32'b10111100111111011000110111101111,
	parameter in_weight214 = 32'b10111101010000000101101011011001,
	parameter in_weight215 = 32'b00111101100111011010001111001101,
	parameter in_weight216 = 32'b00111101001110010010111100010010,
	parameter in_weight217 = 32'b10111101100101111110111110011100,
	parameter in_weight218 = 32'b00111101010011110110100111100101,
	parameter in_weight219 = 32'b10111100011110000010111000010010,
	parameter in_weight220 = 32'b00111101011101100100101000111110,
	parameter in_weight221 = 32'b10111101000011011001101110000110,
	parameter in_weight222 = 32'b00111101011110110100111011101011,
	parameter in_weight223 = 32'b10111011101010000111100010011011,
	parameter in_weight224 = 32'b00111100111101100011100101011011,
	parameter in_weight225 = 32'b10111100110000011001000000111111,
	parameter in_weight226 = 32'b10111100010011011011100010001110,
	parameter in_weight227 = 32'b00111101101010101101010011111110,
	parameter in_weight228 = 32'b10111101100000111011100011000010,
	parameter in_weight229 = 32'b10111100011111110111111100001111,
	parameter in_weight230 = 32'b10111100000101000110000111011000,
	parameter in_weight231 = 32'b10111101101001010011010100101111,
	parameter in_weight232 = 32'b10111100111000001100010110011110,
	parameter in_weight233 = 32'b00111100010101010100001001111000,
	parameter in_weight234 = 32'b10111101100111010000010111010100,
	parameter in_weight235 = 32'b10111101100100101101011001100111,
	parameter in_weight236 = 32'b10111101010101111010100001001100,
	parameter in_weight237 = 32'b00111100000001110010100111111100,
	parameter in_weight238 = 32'b10111101000000010011001101100111,
	parameter in_weight239 = 32'b10111101100001001101011110010010,
	parameter in_weight240 = 32'b10111101100010110001000011101111,
	parameter in_weight241 = 32'b00111101010010101001011001100100,
	parameter in_weight242 = 32'b10111101100011110001000110101010,
	parameter in_weight243 = 32'b10111100111100111000101101001101,
	parameter in_weight244 = 32'b10111100100111000100100011001001,
	parameter in_weight245 = 32'b00111101001101011110000101111001,
	parameter in_weight246 = 32'b00111101010000101011110111110001,
	parameter in_weight247 = 32'b10111101010111010000110001101001,
	parameter in_weight248 = 32'b00111101100101111100101110010010,
	parameter in_weight249 = 32'b10111100010011010100111001010101,
	parameter in_weight250 = 32'b10111101001100000110010000000111,
	parameter in_weight251 = 32'b10111101010001001000101101011011,
	parameter in_weight252 = 32'b10111011101001011100110001101010,
	parameter in_weight253 = 32'b00111100110101000011001001000011,
	parameter in_weight254 = 32'b00111100000001000100101110001011,
	parameter in_weight255 = 32'b10111101100110110101100011010111,
	parameter in_weight256 = 32'b10111101000010001011110010000110,
	parameter in_weight257 = 32'b00111101100100001100111000011001,
	parameter in_weight258 = 32'b00111100111110101000101110001010,
	parameter in_weight259 = 32'b00111101100111000010101001001101,
	parameter in_weight260 = 32'b10111101010000010010011001000101,
	parameter in_weight261 = 32'b00111101101001001010000000010110,
	parameter in_weight262 = 32'b00111011011100101111111110000011,
	parameter in_weight263 = 32'b10111101010001100111101011001111,
	parameter in_weight264 = 32'b10111101100011001001001000000111,
	parameter in_weight265 = 32'b00111100010100001010111001001100,
	parameter in_weight266 = 32'b10111101001011111100001011000100,
	parameter in_weight267 = 32'b10111100110011101000101100010001,
	parameter in_weight268 = 32'b00111101001011101101110000000110,
	parameter in_weight269 = 32'b00111101010100111100111111010110,
	parameter in_weight270 = 32'b00111101101000011111000000000110,
	parameter in_weight271 = 32'b10111101101001101111000100110110,
	parameter in_weight272 = 32'b00111101011100101101001011000000,
	parameter in_weight273 = 32'b00111100010011001100101101010110,
	parameter in_weight274 = 32'b10111100100011100010010110101100,
	parameter in_weight275 = 32'b10111010101010111011111100010110,
	parameter in_weight276 = 32'b10111101011111111111101100111101,
	parameter in_weight277 = 32'b10111100101110110111111110111111,
	parameter in_weight278 = 32'b10111100010001111010010011011100,
	parameter in_weight279 = 32'b00111101000100111001100000011101,
	parameter in_weight280 = 32'b00111101010001000001001101000100,
	parameter in_weight281 = 32'b10111101000000011011000110110110,
	parameter in_weight282 = 32'b10111100111001101100100101011101,
	parameter in_weight283 = 32'b10111100111100110010010110100100,
	parameter in_weight284 = 32'b00111101010101110001111000011100,
	parameter in_weight285 = 32'b10111101001100011110110100001101,
	parameter in_weight286 = 32'b10111011110000100100000100010111,
	parameter in_weight287 = 32'b00111101100110000001001001010111
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
