`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_5
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


module conv_28_weight6_5
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b10111100011111110100000111010001,
	parameter in_weight1 = 32'b10111101011101101101001000011101,
	parameter in_weight2 = 32'b00111100000011100111010011110001,
	parameter in_weight3 = 32'b10111100111110001110101110010010,
	parameter in_weight4 = 32'b10111101100010100000010100000000,
	parameter in_weight5 = 32'b10111011001010000000110100010110,
	parameter in_weight6 = 32'b00111100110001101010001001110010,
	parameter in_weight7 = 32'b10111101001110011000011011111001,
	parameter in_weight8 = 32'b00111010010101011011000001011010,
	parameter in_weight9 = 32'b00111101100101111101001100100000,
	parameter in_weight10 = 32'b00111100101100110010000100011111,
	parameter in_weight11 = 32'b10111101101000001100011001111001,
	parameter in_weight12 = 32'b00111101100111010011011000110110,
	parameter in_weight13 = 32'b00111101010011110011010001000011,
	parameter in_weight14 = 32'b10111100110001010111111110010011,
	parameter in_weight15 = 32'b10111100111111100100101110110100,
	parameter in_weight16 = 32'b00111101011001100101100001011101,
	parameter in_weight17 = 32'b00111101010000001001100011010101,
	parameter in_weight18 = 32'b00111101000010000011011001011011,
	parameter in_weight19 = 32'b10111100110001100011001010100101,
	parameter in_weight20 = 32'b10111100000010001111000101001000,
	parameter in_weight21 = 32'b10111101100011010000110000001110,
	parameter in_weight22 = 32'b10111011111111010001011110111011,
	parameter in_weight23 = 32'b10111101001100100110000010111000,
	parameter in_weight24 = 32'b00111101010111100101011010000011,
	parameter in_weight25 = 32'b10111101010111100000101111101010,
	parameter in_weight26 = 32'b10111100010011111011011101011101,
	parameter in_weight27 = 32'b00111101011110100101011001101011,
	parameter in_weight28 = 32'b10111011111010101101010111100010,
	parameter in_weight29 = 32'b10111101100110111001111111000010,
	parameter in_weight30 = 32'b10111011111100000110001111100011,
	parameter in_weight31 = 32'b10111101011101101010101000011010,
	parameter in_weight32 = 32'b00111101100110011010011011000010,
	parameter in_weight33 = 32'b10111100110110011000101111100110,
	parameter in_weight34 = 32'b10111100100011101110000101101010,
	parameter in_weight35 = 32'b10111011110100001110101100110100,
	parameter in_weight36 = 32'b10111100000001011111111110001011,
	parameter in_weight37 = 32'b10111101100110101000010000101001,
	parameter in_weight38 = 32'b00111101100100100110001110111110,
	parameter in_weight39 = 32'b00111011110100000111010010010001,
	parameter in_weight40 = 32'b00111101001000001011110010000010,
	parameter in_weight41 = 32'b10111101100001101011000001011100,
	parameter in_weight42 = 32'b10111011011100111001100000000101,
	parameter in_weight43 = 32'b00111101001101110010110111001010,
	parameter in_weight44 = 32'b00111100110011111010100100001100,
	parameter in_weight45 = 32'b10111100111101010000111011011110,
	parameter in_weight46 = 32'b00111101010001001000101010111000,
	parameter in_weight47 = 32'b00111101011101001111001110111000,
	parameter in_weight48 = 32'b10111101011100101010111111011011,
	parameter in_weight49 = 32'b10111101100000111011110111011110,
	parameter in_weight50 = 32'b10111101100101000100001111010100,
	parameter in_weight51 = 32'b00111100100010101010000001100100,
	parameter in_weight52 = 32'b10111101100011011011101101010100,
	parameter in_weight53 = 32'b10111100001110000011001011101110,
	parameter in_weight54 = 32'b00111101100101001110010000010011,
	parameter in_weight55 = 32'b00111101101001010110110110000100,
	parameter in_weight56 = 32'b10111101100101001011101001010111,
	parameter in_weight57 = 32'b10111101011011000110110001001001,
	parameter in_weight58 = 32'b10111101010010100001111111010001,
	parameter in_weight59 = 32'b00111101100000001001001010010000,
	parameter in_weight60 = 32'b10111101001011111100110111000110,
	parameter in_weight61 = 32'b10111101001000001001101011011010,
	parameter in_weight62 = 32'b10111101011110100000011111111101,
	parameter in_weight63 = 32'b00111100001111100000000101010010,
	parameter in_weight64 = 32'b00111101100000011100011101010011,
	parameter in_weight65 = 32'b10111101101001010111101001111010,
	parameter in_weight66 = 32'b10111100101011000001011100110000,
	parameter in_weight67 = 32'b00111100101100111100011000100111,
	parameter in_weight68 = 32'b00111101011101111010011111111010,
	parameter in_weight69 = 32'b00111101100101110111111010001111,
	parameter in_weight70 = 32'b10111101100101111111001111110111,
	parameter in_weight71 = 32'b10111101010000111010111111100010,
	parameter in_weight72 = 32'b10111101100100100011001111010010,
	parameter in_weight73 = 32'b10111101001011111010000100000011,
	parameter in_weight74 = 32'b00111101010111100110110001111110,
	parameter in_weight75 = 32'b00111101100011000110100101011111,
	parameter in_weight76 = 32'b00111100000110000101010110000010,
	parameter in_weight77 = 32'b00111101100101110110011000101000,
	parameter in_weight78 = 32'b00111010001100010011010101011001,
	parameter in_weight79 = 32'b10111100000010001111101001000101,
	parameter in_weight80 = 32'b10111101011111000000110110010010,
	parameter in_weight81 = 32'b00111100001011101011100101010101,
	parameter in_weight82 = 32'b00111011111101111000111000000110,
	parameter in_weight83 = 32'b10111101001010010011001110011000,
	parameter in_weight84 = 32'b10111011011100011110100001000101,
	parameter in_weight85 = 32'b10111101100101110111100010000011,
	parameter in_weight86 = 32'b00111100111100110100101100100100,
	parameter in_weight87 = 32'b10111100000011010100010100001011,
	parameter in_weight88 = 32'b00111100010101010110111000001010,
	parameter in_weight89 = 32'b10111100110100010001011100110011,
	parameter in_weight90 = 32'b00111011110010101001010000101010,
	parameter in_weight91 = 32'b10111101011101011010101000000011,
	parameter in_weight92 = 32'b10111101100001010011011101010010,
	parameter in_weight93 = 32'b00111101100111110111110011101010,
	parameter in_weight94 = 32'b00111101100001100011101100100111,
	parameter in_weight95 = 32'b00111100111100010110011010000010,
	parameter in_weight96 = 32'b00111101000101101010011000000001,
	parameter in_weight97 = 32'b10111101010001000101110001110101,
	parameter in_weight98 = 32'b10111101010100010010001010011001,
	parameter in_weight99 = 32'b10111100111010111011000111011011,
	parameter in_weight100 = 32'b10111101001000010001111011011110,
	parameter in_weight101 = 32'b10111101100111011101001111101101,
	parameter in_weight102 = 32'b00111101001010111110100101001011,
	parameter in_weight103 = 32'b00111101101010000111011010110100,
	parameter in_weight104 = 32'b00111101101010111010111001110001,
	parameter in_weight105 = 32'b10111101000110100110111011110010,
	parameter in_weight106 = 32'b10111101100001111011101001101000,
	parameter in_weight107 = 32'b10111011110001100111110011000000,
	parameter in_weight108 = 32'b10111101010001111111000001100011,
	parameter in_weight109 = 32'b00111101011000100110000001001110,
	parameter in_weight110 = 32'b10111101010000000110110100000101,
	parameter in_weight111 = 32'b00111101010101110001100110110110,
	parameter in_weight112 = 32'b10111101000111100101101111010000,
	parameter in_weight113 = 32'b10111100011011101011000000001001,
	parameter in_weight114 = 32'b00111101100001101010010000010111,
	parameter in_weight115 = 32'b00111101010101011011000001110111,
	parameter in_weight116 = 32'b00111101010011110011001111101010,
	parameter in_weight117 = 32'b00111101100011010100001101110101,
	parameter in_weight118 = 32'b10111101100010011010111000001101,
	parameter in_weight119 = 32'b10111101100010001101000000010010,
	parameter in_weight120 = 32'b10111101100000101000011110000000,
	parameter in_weight121 = 32'b10111011000101111101010110110001,
	parameter in_weight122 = 32'b10111101011110000010101010001100,
	parameter in_weight123 = 32'b10111101100001100110111111000001,
	parameter in_weight124 = 32'b10111101010110110101100110110000,
	parameter in_weight125 = 32'b00111101011000100010000000010010,
	parameter in_weight126 = 32'b00111101100110111011111111101100,
	parameter in_weight127 = 32'b10111101000100000110111100000100,
	parameter in_weight128 = 32'b00111100101001100110101111000111,
	parameter in_weight129 = 32'b10111101101001010011101000100010,
	parameter in_weight130 = 32'b00111101100001010010101100100000,
	parameter in_weight131 = 32'b00111101001011111000100011110100,
	parameter in_weight132 = 32'b10111100100101100111011111001001,
	parameter in_weight133 = 32'b10111011001011000000101110001011,
	parameter in_weight134 = 32'b00111101010000001000101000101111,
	parameter in_weight135 = 32'b10111100100001000011100100100110,
	parameter in_weight136 = 32'b10111101100111011100101000001100,
	parameter in_weight137 = 32'b00111100111010100011101001000110,
	parameter in_weight138 = 32'b10111101100101111110100110000101,
	parameter in_weight139 = 32'b10111101100010110100011000110110,
	parameter in_weight140 = 32'b00111100011010011111011101101111,
	parameter in_weight141 = 32'b10111101000101101100101000110000,
	parameter in_weight142 = 32'b00111100000110110111000010110100,
	parameter in_weight143 = 32'b00111101100110111010011100011111,
	parameter in_weight144 = 32'b00111101101001001010000011000010,
	parameter in_weight145 = 32'b00111101011000011010011101000001,
	parameter in_weight146 = 32'b00111101100111011010111011011011,
	parameter in_weight147 = 32'b00111100111100001110111101011110,
	parameter in_weight148 = 32'b00111101100110111001000000010110,
	parameter in_weight149 = 32'b10111101001101010001111111110000,
	parameter in_weight150 = 32'b10111100000110110000110100011111,
	parameter in_weight151 = 32'b10111101010101111101110100111100,
	parameter in_weight152 = 32'b10111101101000010111001000011101,
	parameter in_weight153 = 32'b00111101100100111110100100000011,
	parameter in_weight154 = 32'b10111101011100011000111011101010,
	parameter in_weight155 = 32'b10111101011111000111101001001110,
	parameter in_weight156 = 32'b10111101100000110111010001000101,
	parameter in_weight157 = 32'b00111100000000001011001100011000,
	parameter in_weight158 = 32'b10111101001001100111101001011101,
	parameter in_weight159 = 32'b10111101100001000100001011000100,
	parameter in_weight160 = 32'b00111101001101101000111001000101,
	parameter in_weight161 = 32'b00111101100000000010010010011000,
	parameter in_weight162 = 32'b10111100010000100101011010110100,
	parameter in_weight163 = 32'b00111101100010010001000010111010,
	parameter in_weight164 = 32'b00111100111000010101001001001010,
	parameter in_weight165 = 32'b10111101001001001100101010111110,
	parameter in_weight166 = 32'b00111100110100010001110000000101,
	parameter in_weight167 = 32'b00111101100111010111110001110101,
	parameter in_weight168 = 32'b10111100110001000000110001011000,
	parameter in_weight169 = 32'b10111101010000010101101010011110,
	parameter in_weight170 = 32'b10111100110110110100100110100001,
	parameter in_weight171 = 32'b00111101011111110010001001001100,
	parameter in_weight172 = 32'b10111101101001000000000111110010,
	parameter in_weight173 = 32'b10111100110001010100101011101101,
	parameter in_weight174 = 32'b00111100101011110101111011001010,
	parameter in_weight175 = 32'b10111100101101100011100001110101,
	parameter in_weight176 = 32'b10111101100010001011110110101110,
	parameter in_weight177 = 32'b10111100000100011010100101100111,
	parameter in_weight178 = 32'b00111101100111011010001011111111,
	parameter in_weight179 = 32'b10111101100110010010011101110010,
	parameter in_weight180 = 32'b10111101100010101110001110100010,
	parameter in_weight181 = 32'b00111101011110101110100011100110,
	parameter in_weight182 = 32'b00111101100010100000101000010010,
	parameter in_weight183 = 32'b00111100110000100101111000101110,
	parameter in_weight184 = 32'b10111101101001011110001111001100,
	parameter in_weight185 = 32'b10111101000011100110010101101100,
	parameter in_weight186 = 32'b10111100101001110000000011111000,
	parameter in_weight187 = 32'b00111101000011110001000000001111,
	parameter in_weight188 = 32'b10111100110111001010000111100001,
	parameter in_weight189 = 32'b10111101011100010011010111100010,
	parameter in_weight190 = 32'b00111101001100000100110010101000,
	parameter in_weight191 = 32'b00111101001010101010011100010000,
	parameter in_weight192 = 32'b10111101000010111100011011001001,
	parameter in_weight193 = 32'b00111101011101111110100000111101,
	parameter in_weight194 = 32'b10111101100000110101101001010110,
	parameter in_weight195 = 32'b00111101100100011011011100011010,
	parameter in_weight196 = 32'b00111101100111110001110010111101,
	parameter in_weight197 = 32'b10111101000000000000110111110011,
	parameter in_weight198 = 32'b10111101001001110111101111101110,
	parameter in_weight199 = 32'b00111010001101100010010010010110,
	parameter in_weight200 = 32'b00111101000111110011000011111011,
	parameter in_weight201 = 32'b10111011101101111111001011010110,
	parameter in_weight202 = 32'b10111100101010100110001110010100,
	parameter in_weight203 = 32'b00111101100100100110010111100100,
	parameter in_weight204 = 32'b10111100100011000110101011101110,
	parameter in_weight205 = 32'b00111100110001111001010001000111,
	parameter in_weight206 = 32'b10111100110100110011001101011010,
	parameter in_weight207 = 32'b00111101100010111110100101001001,
	parameter in_weight208 = 32'b10111101100011010100101110000111,
	parameter in_weight209 = 32'b10111101100000111101000011100010,
	parameter in_weight210 = 32'b00111101100110110000000100100110,
	parameter in_weight211 = 32'b10111101011010000010011110100001,
	parameter in_weight212 = 32'b00111101001011010100010100000110,
	parameter in_weight213 = 32'b00111101011000100010001010010101,
	parameter in_weight214 = 32'b00111011101100101000101001001010,
	parameter in_weight215 = 32'b10111100110000010101101110110010,
	parameter in_weight216 = 32'b10111101100100100011110110110011,
	parameter in_weight217 = 32'b10111101100011001111111000010001,
	parameter in_weight218 = 32'b10111101101000111001101001010000,
	parameter in_weight219 = 32'b00111100110000100110010011010010,
	parameter in_weight220 = 32'b10111100111011011111001100111000,
	parameter in_weight221 = 32'b10111101100101110000011001100011,
	parameter in_weight222 = 32'b00111101011010111010110010100110,
	parameter in_weight223 = 32'b10111100001011101101110011000101,
	parameter in_weight224 = 32'b00111101000010000101101111111000,
	parameter in_weight225 = 32'b00111011110100010010110000111111,
	parameter in_weight226 = 32'b10111101001010110000100100010100,
	parameter in_weight227 = 32'b10111101101000111110011001000001,
	parameter in_weight228 = 32'b00111101100110100100100001111011,
	parameter in_weight229 = 32'b00111101000010111111110101100101,
	parameter in_weight230 = 32'b10111100100101000111101000101100,
	parameter in_weight231 = 32'b00111101101001110101111011100001,
	parameter in_weight232 = 32'b10111101100001100100100011111001,
	parameter in_weight233 = 32'b00111101011010101010101000111011,
	parameter in_weight234 = 32'b10111101100110110101010111101111,
	parameter in_weight235 = 32'b00111101100101011011111101010100,
	parameter in_weight236 = 32'b10111100100001010001010000110111,
	parameter in_weight237 = 32'b10111101001110000000111100111101,
	parameter in_weight238 = 32'b10111100110101100100111111011111,
	parameter in_weight239 = 32'b10111101100110000000000100001011,
	parameter in_weight240 = 32'b00111101100010011000010001101011,
	parameter in_weight241 = 32'b10111101100011100111101011110110,
	parameter in_weight242 = 32'b00111101100001000100111010110101,
	parameter in_weight243 = 32'b10111101001101101000001100011111,
	parameter in_weight244 = 32'b00111101100100111000111001100001,
	parameter in_weight245 = 32'b00111011000101101000001011000110,
	parameter in_weight246 = 32'b00111101001111101101110110010001,
	parameter in_weight247 = 32'b10111101101010000111111100000110,
	parameter in_weight248 = 32'b00111101000111011000000000101000,
	parameter in_weight249 = 32'b10111001110101001111011101100110,
	parameter in_weight250 = 32'b00111101100100110110101010000101,
	parameter in_weight251 = 32'b10111101100101011100000110010010,
	parameter in_weight252 = 32'b00111101011010001000100110010001,
	parameter in_weight253 = 32'b10111100100000011000011000011111,
	parameter in_weight254 = 32'b10111100100100111111100001101011,
	parameter in_weight255 = 32'b10111101011010000001011010110100,
	parameter in_weight256 = 32'b00111100110111000101001001011110,
	parameter in_weight257 = 32'b10111101011100011110111001111110,
	parameter in_weight258 = 32'b10111100000101101010011001010110,
	parameter in_weight259 = 32'b00111101100100010110001111011011,
	parameter in_weight260 = 32'b00111101000001100111001011111001,
	parameter in_weight261 = 32'b10111101010110111100011101110110,
	parameter in_weight262 = 32'b10111101001001001011100111101110,
	parameter in_weight263 = 32'b10111101100111111111011000110111,
	parameter in_weight264 = 32'b10111101101000100011110101001010,
	parameter in_weight265 = 32'b00111101001110011001110111110000,
	parameter in_weight266 = 32'b10111101010000111110101110010001,
	parameter in_weight267 = 32'b00111101101000010011010001111110,
	parameter in_weight268 = 32'b10111101100011001111100110111101,
	parameter in_weight269 = 32'b10111101000001010001110001100101,
	parameter in_weight270 = 32'b00111101100011101000100000111011,
	parameter in_weight271 = 32'b00111100010010101110010111111111,
	parameter in_weight272 = 32'b00111101100011001000111000110110,
	parameter in_weight273 = 32'b00111101100001001101101011001111,
	parameter in_weight274 = 32'b10111101100111101011110100100010,
	parameter in_weight275 = 32'b00111101000111010001000001111110,
	parameter in_weight276 = 32'b00111101100111000011110010000110,
	parameter in_weight277 = 32'b10111100101001001001011000010110,
	parameter in_weight278 = 32'b10111101001000010011100000110101,
	parameter in_weight279 = 32'b10111100100100110111101110011110,
	parameter in_weight280 = 32'b10111101101001101000010010010010,
	parameter in_weight281 = 32'b10111101100011101100011111100110,
	parameter in_weight282 = 32'b00111101100101001111010010100100,
	parameter in_weight283 = 32'b10111101010010011110101110011000,
	parameter in_weight284 = 32'b10111100111111010010011100011110,
	parameter in_weight285 = 32'b00111100010111110000010010010000,
	parameter in_weight286 = 32'b00111101000000100000100111001001,
	parameter in_weight287 = 32'b00111101000111010001010011001101
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
