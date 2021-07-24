`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_2
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


module conv_28_weight6_2
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b00111100011100011101101101011111,
	parameter in_weight1 = 32'b00111101001011011110001001100111,
	parameter in_weight2 = 32'b00111101011111011110111111001101,
	parameter in_weight3 = 32'b00111101100010001110100001011111,
	parameter in_weight4 = 32'b10111101011110110111000110011010,
	parameter in_weight5 = 32'b10111101010100000100000000100001,
	parameter in_weight6 = 32'b00111101001011011010010010010011,
	parameter in_weight7 = 32'b10111010111011110110110111111101,
	parameter in_weight8 = 32'b10111100110111101110101010110101,
	parameter in_weight9 = 32'b00111101100110111001101111100001,
	parameter in_weight10 = 32'b10111101101001111010111111001011,
	parameter in_weight11 = 32'b00111100100001111101100000111110,
	parameter in_weight12 = 32'b00111101100011000111100101000010,
	parameter in_weight13 = 32'b10111100101110101100111111110100,
	parameter in_weight14 = 32'b10111100111000001001011001011101,
	parameter in_weight15 = 32'b10111101011100111110010101110000,
	parameter in_weight16 = 32'b10111100000010000110110000011001,
	parameter in_weight17 = 32'b10111100101111011111000010111000,
	parameter in_weight18 = 32'b00111100101000100110001010001011,
	parameter in_weight19 = 32'b00111101100010110101010011100001,
	parameter in_weight20 = 32'b10111101101000110001001100111010,
	parameter in_weight21 = 32'b10111101001000110000110110100000,
	parameter in_weight22 = 32'b10111100000100101010110010010100,
	parameter in_weight23 = 32'b10111101001101000100011011011010,
	parameter in_weight24 = 32'b00111101011101010000010111000111,
	parameter in_weight25 = 32'b10111100100011111100100000010101,
	parameter in_weight26 = 32'b00111101001100100110101001001010,
	parameter in_weight27 = 32'b00111101100111101000111001101010,
	parameter in_weight28 = 32'b00111100000110011011010101010001,
	parameter in_weight29 = 32'b00111100111000110101001110000110,
	parameter in_weight30 = 32'b10111101101010001111011000010010,
	parameter in_weight31 = 32'b00111101010010101101010001111100,
	parameter in_weight32 = 32'b10111101001011100100011011001011,
	parameter in_weight33 = 32'b00111100100000011000110101000111,
	parameter in_weight34 = 32'b10111100110100111000100101111001,
	parameter in_weight35 = 32'b10111101010001010110100110111111,
	parameter in_weight36 = 32'b10111101011001011100101010001010,
	parameter in_weight37 = 32'b00111100110101100010100101111001,
	parameter in_weight38 = 32'b00111101011101111000101111101100,
	parameter in_weight39 = 32'b00111101011101000101110111010000,
	parameter in_weight40 = 32'b00111100010000010011101001000001,
	parameter in_weight41 = 32'b00111101011011000011001001011000,
	parameter in_weight42 = 32'b10111100101111011010001111001010,
	parameter in_weight43 = 32'b00111101101000111111110010000001,
	parameter in_weight44 = 32'b10111101011011001001110001110100,
	parameter in_weight45 = 32'b00111101100110101000101110100001,
	parameter in_weight46 = 32'b00111100110001000010000010001000,
	parameter in_weight47 = 32'b00111100001110101001000010101001,
	parameter in_weight48 = 32'b10111101100011010110001101110100,
	parameter in_weight49 = 32'b00111100100100100100110001011101,
	parameter in_weight50 = 32'b00111101100111001000000111101011,
	parameter in_weight51 = 32'b10111100010101010011111010111110,
	parameter in_weight52 = 32'b00111101001101100100111111000001,
	parameter in_weight53 = 32'b00111101100000010001001100011011,
	parameter in_weight54 = 32'b10111101100010001110101100101110,
	parameter in_weight55 = 32'b10111101000000001111011001100011,
	parameter in_weight56 = 32'b00111101011110000001010000000110,
	parameter in_weight57 = 32'b10111101000011100101101100011101,
	parameter in_weight58 = 32'b00111101100110111011010111001111,
	parameter in_weight59 = 32'b10111101100110010100000011010000,
	parameter in_weight60 = 32'b00111100010100110000001000110101,
	parameter in_weight61 = 32'b00111101011111111001100110000111,
	parameter in_weight62 = 32'b00111101000000011110011011101101,
	parameter in_weight63 = 32'b10111100011101000011001110010011,
	parameter in_weight64 = 32'b10111101100101001110100110110101,
	parameter in_weight65 = 32'b00111101000100100011111001111100,
	parameter in_weight66 = 32'b00111101100001111110001010001000,
	parameter in_weight67 = 32'b00111100100010011101101011001100,
	parameter in_weight68 = 32'b10111101100100000110011011001000,
	parameter in_weight69 = 32'b00111101001110000010111101111101,
	parameter in_weight70 = 32'b00111100110110100111110100100110,
	parameter in_weight71 = 32'b00111100101000111100000100001111,
	parameter in_weight72 = 32'b00111100110110100101000000001000,
	parameter in_weight73 = 32'b00111100110011101101000111010000,
	parameter in_weight74 = 32'b10111101100001001100010111000101,
	parameter in_weight75 = 32'b10111100111001001011110101010000,
	parameter in_weight76 = 32'b00111101011100101101111110100110,
	parameter in_weight77 = 32'b10111101011000100011110110100110,
	parameter in_weight78 = 32'b10111101001110000101011010100100,
	parameter in_weight79 = 32'b10111101011011011110011000011010,
	parameter in_weight80 = 32'b10111100001011110110101110101110,
	parameter in_weight81 = 32'b00111100010101010110000111110011,
	parameter in_weight82 = 32'b00111101100100111000101101001000,
	parameter in_weight83 = 32'b00111100011000111100010110000000,
	parameter in_weight84 = 32'b10111100110010101011111100101100,
	parameter in_weight85 = 32'b00111010010110000110000011110100,
	parameter in_weight86 = 32'b10111101100000100101111000001101,
	parameter in_weight87 = 32'b00111100101100100010010010000000,
	parameter in_weight88 = 32'b00111101101000110101011010100111,
	parameter in_weight89 = 32'b00111100101001001100011110101110,
	parameter in_weight90 = 32'b00111101100111111000010101110000,
	parameter in_weight91 = 32'b10111101010001010110111011011111,
	parameter in_weight92 = 32'b10111101010101100011100011111100,
	parameter in_weight93 = 32'b10111101010111011011101011101101,
	parameter in_weight94 = 32'b10111101001100101111010101110011,
	parameter in_weight95 = 32'b00111101011010111111100101100100,
	parameter in_weight96 = 32'b10111101010111110001110111100010,
	parameter in_weight97 = 32'b10111100100010011100100011110110,
	parameter in_weight98 = 32'b00111101011111111101100111100100,
	parameter in_weight99 = 32'b00111101011111001000011100110111,
	parameter in_weight100 = 32'b10111101011011111000011001101101,
	parameter in_weight101 = 32'b00111100111110011110011101100111,
	parameter in_weight102 = 32'b00111101100010101101001001111011,
	parameter in_weight103 = 32'b00111101100000111110101000000110,
	parameter in_weight104 = 32'b10111101011101011011100011100011,
	parameter in_weight105 = 32'b00111101010011001111100000111011,
	parameter in_weight106 = 32'b00111011111000000111011010000011,
	parameter in_weight107 = 32'b10111101010011011100010100010100,
	parameter in_weight108 = 32'b00111100100001110000000100001001,
	parameter in_weight109 = 32'b10111100111101011001110010000110,
	parameter in_weight110 = 32'b00111101001111111011100011000010,
	parameter in_weight111 = 32'b00111100001000111001001000011110,
	parameter in_weight112 = 32'b00111100101001101100011011000110,
	parameter in_weight113 = 32'b10111101100111000110011001000111,
	parameter in_weight114 = 32'b00111100101101001101110110101000,
	parameter in_weight115 = 32'b00111101100101001011001101110010,
	parameter in_weight116 = 32'b00111010011011111110001100001001,
	parameter in_weight117 = 32'b10111101000011000110001010001011,
	parameter in_weight118 = 32'b10111101011110001110001101110010,
	parameter in_weight119 = 32'b00111101100101011100000111001100,
	parameter in_weight120 = 32'b10111100001000111101010110110101,
	parameter in_weight121 = 32'b10111011010101110011100010110000,
	parameter in_weight122 = 32'b10111101001001011011001011000000,
	parameter in_weight123 = 32'b00111101011010100010000001110111,
	parameter in_weight124 = 32'b00111101101010010001000101011010,
	parameter in_weight125 = 32'b10111101010100101111111101011000,
	parameter in_weight126 = 32'b00111100111111100000110101110100,
	parameter in_weight127 = 32'b10111101000000001010111010010011,
	parameter in_weight128 = 32'b10111011110111101111110001011101,
	parameter in_weight129 = 32'b00111011110000111000000001011001,
	parameter in_weight130 = 32'b00111101100010000101001100101100,
	parameter in_weight131 = 32'b00111101011000100110000101000101,
	parameter in_weight132 = 32'b10111101010000011001101100010100,
	parameter in_weight133 = 32'b10111100011000011100111110111101,
	parameter in_weight134 = 32'b00111101100100101110000010111010,
	parameter in_weight135 = 32'b10111101100111000100011100111110,
	parameter in_weight136 = 32'b10111100011111000110000111110001,
	parameter in_weight137 = 32'b00111010100010110001001111100100,
	parameter in_weight138 = 32'b10111100000110101001001111010000,
	parameter in_weight139 = 32'b10111101100111001000011000010000,
	parameter in_weight140 = 32'b00111101100101011011011100011010,
	parameter in_weight141 = 32'b00111011111001010111010100000111,
	parameter in_weight142 = 32'b10111101100111011000000011111011,
	parameter in_weight143 = 32'b00111101010000011001100101100110,
	parameter in_weight144 = 32'b00111101001101000011011111011000,
	parameter in_weight145 = 32'b00111101100101011100110110110010,
	parameter in_weight146 = 32'b10111101100000000100101110011001,
	parameter in_weight147 = 32'b00111101001101110110111001010011,
	parameter in_weight148 = 32'b00111100011001110101000001111001,
	parameter in_weight149 = 32'b00111101101000010111101100110000,
	parameter in_weight150 = 32'b10111100001011000110010110001110,
	parameter in_weight151 = 32'b00111101011111101010111000001110,
	parameter in_weight152 = 32'b10111100011101000001000101111010,
	parameter in_weight153 = 32'b10111100000011011010001010111100,
	parameter in_weight154 = 32'b00111101001111001011011110101011,
	parameter in_weight155 = 32'b00111100111101000101111101110000,
	parameter in_weight156 = 32'b00111101100100011111000101001110,
	parameter in_weight157 = 32'b00111101011111010010100011000111,
	parameter in_weight158 = 32'b00111101011011010101110111101100,
	parameter in_weight159 = 32'b10111100001011111010000101101111,
	parameter in_weight160 = 32'b10111100101101101101010010000101,
	parameter in_weight161 = 32'b00111011110000101011111000111111,
	parameter in_weight162 = 32'b10111101100000110101011010100010,
	parameter in_weight163 = 32'b10111100110000011110110000100110,
	parameter in_weight164 = 32'b00111100100000010111100010010011,
	parameter in_weight165 = 32'b10111100000010111001110100101001,
	parameter in_weight166 = 32'b10111100000100010100000111010001,
	parameter in_weight167 = 32'b10111101100010100011000011001100,
	parameter in_weight168 = 32'b00111101100011001010000001001001,
	parameter in_weight169 = 32'b10111100000010101001011110101100,
	parameter in_weight170 = 32'b00111100010011111010101100111011,
	parameter in_weight171 = 32'b10111100011101101011000010110100,
	parameter in_weight172 = 32'b10111101100000011101011111100111,
	parameter in_weight173 = 32'b00111101101010011100110000010010,
	parameter in_weight174 = 32'b10111101001110101010010000000100,
	parameter in_weight175 = 32'b10111101011000111111001010001011,
	parameter in_weight176 = 32'b00111101001111010011001111101101,
	parameter in_weight177 = 32'b10111100100101001111010010011110,
	parameter in_weight178 = 32'b10111100000111101011001101001001,
	parameter in_weight179 = 32'b00111101000110110000110010000101,
	parameter in_weight180 = 32'b00111101011000001101001000001101,
	parameter in_weight181 = 32'b10111100111100011000110101001100,
	parameter in_weight182 = 32'b10111101010101001101010100001101,
	parameter in_weight183 = 32'b00111101000111100101011110101111,
	parameter in_weight184 = 32'b10111100010101101111011100111110,
	parameter in_weight185 = 32'b10111101100110100111001111000110,
	parameter in_weight186 = 32'b10111101011110001101011001011010,
	parameter in_weight187 = 32'b00111101000101010111001110000101,
	parameter in_weight188 = 32'b00111100110100110010100100010010,
	parameter in_weight189 = 32'b10111010101101010000010011110001,
	parameter in_weight190 = 32'b00111100111011001110000110011010,
	parameter in_weight191 = 32'b10111101100110101011110000110110,
	parameter in_weight192 = 32'b00111100101101011101011000110000,
	parameter in_weight193 = 32'b10111101100001011001010110110100,
	parameter in_weight194 = 32'b00111101100100100111000110001111,
	parameter in_weight195 = 32'b10111100011010101010000000000010,
	parameter in_weight196 = 32'b10111101100001011011111001000101,
	parameter in_weight197 = 32'b10111101100011011011111001110010,
	parameter in_weight198 = 32'b00111101100010001001100010100110,
	parameter in_weight199 = 32'b10111100100000010001010001100110,
	parameter in_weight200 = 32'b10111011001011101111111101110100,
	parameter in_weight201 = 32'b10111100010110001001101100110111,
	parameter in_weight202 = 32'b10111101001001111000011100000101,
	parameter in_weight203 = 32'b10111101100101001000010010011010,
	parameter in_weight204 = 32'b10111011101110001000010001100011,
	parameter in_weight205 = 32'b00111101100110100101110110100010,
	parameter in_weight206 = 32'b00111011000011011010110011011101,
	parameter in_weight207 = 32'b10111101101001000010101111010000,
	parameter in_weight208 = 32'b10111101100100111101011011110000,
	parameter in_weight209 = 32'b10111100000101111111111110110000,
	parameter in_weight210 = 32'b00111100110010011110100111100101,
	parameter in_weight211 = 32'b00111101000010000000010001101110,
	parameter in_weight212 = 32'b00111100010011000111000100110011,
	parameter in_weight213 = 32'b00111010110100010000000010010010,
	parameter in_weight214 = 32'b10111101010010100011011010001111,
	parameter in_weight215 = 32'b00111101101001101111110000011100,
	parameter in_weight216 = 32'b00111101100111000001001100001101,
	parameter in_weight217 = 32'b10111100101001011001111101011011,
	parameter in_weight218 = 32'b00111101011110010110000010111001,
	parameter in_weight219 = 32'b10111101011101000001111101010000,
	parameter in_weight220 = 32'b10111101001011001110100001110100,
	parameter in_weight221 = 32'b00111101011101001000011011000010,
	parameter in_weight222 = 32'b00111101000101011110001011110110,
	parameter in_weight223 = 32'b00111100010111001111111000110001,
	parameter in_weight224 = 32'b10111011100100100101000110000000,
	parameter in_weight225 = 32'b00111101100110011100110010111011,
	parameter in_weight226 = 32'b10111101100001111111110010111001,
	parameter in_weight227 = 32'b00111101010000111100001010100011,
	parameter in_weight228 = 32'b00111101010001100101010100011011,
	parameter in_weight229 = 32'b00111101000001101111101101011111,
	parameter in_weight230 = 32'b00111101011011100110011000110100,
	parameter in_weight231 = 32'b10111101000001010011011010010010,
	parameter in_weight232 = 32'b00111101101001000000110101001101,
	parameter in_weight233 = 32'b00111101100101000000011101111011,
	parameter in_weight234 = 32'b10111100111010010101010101110001,
	parameter in_weight235 = 32'b00111101010001111101100111111001,
	parameter in_weight236 = 32'b00111101010100111000101110011011,
	parameter in_weight237 = 32'b10111101011000110010110001011111,
	parameter in_weight238 = 32'b10111101010101011101011011101011,
	parameter in_weight239 = 32'b00111101000110110001010011111111,
	parameter in_weight240 = 32'b10111101010011011111100101110000,
	parameter in_weight241 = 32'b00111101001111001001101001100010,
	parameter in_weight242 = 32'b00111101000100010010100001011101,
	parameter in_weight243 = 32'b00111100100011110111111011000000,
	parameter in_weight244 = 32'b10111101100100100011101001110011,
	parameter in_weight245 = 32'b00111101000010000000101111110000,
	parameter in_weight246 = 32'b10111101101001011001000101101010,
	parameter in_weight247 = 32'b10111101101000001010000100001010,
	parameter in_weight248 = 32'b10111101000110101111101110110000,
	parameter in_weight249 = 32'b00111100001111010101010011011100,
	parameter in_weight250 = 32'b00111100100111011100110101111111,
	parameter in_weight251 = 32'b10111000001010110001111001000101,
	parameter in_weight252 = 32'b00111010110111011100010111100000,
	parameter in_weight253 = 32'b10111101010110010011111100111110,
	parameter in_weight254 = 32'b10111000000111000111101001101111,
	parameter in_weight255 = 32'b10111100000101110100011101010101,
	parameter in_weight256 = 32'b00111101011101111001111001001101,
	parameter in_weight257 = 32'b10111101100010100010010000001111,
	parameter in_weight258 = 32'b10111101010010100011000111110000,
	parameter in_weight259 = 32'b10111100000011111011101100110011,
	parameter in_weight260 = 32'b10111101100110010110010111000110,
	parameter in_weight261 = 32'b00111101100110100110000110111110,
	parameter in_weight262 = 32'b10111100000001001000111011011010,
	parameter in_weight263 = 32'b00111100100011001000101000100010,
	parameter in_weight264 = 32'b00111101100011111110111111000100,
	parameter in_weight265 = 32'b10111100100011011000000001011000,
	parameter in_weight266 = 32'b10111101010111001110101001011100,
	parameter in_weight267 = 32'b00111101100111011111110111010010,
	parameter in_weight268 = 32'b00111100000101100001001110010010,
	parameter in_weight269 = 32'b10111101001001101111000110111111,
	parameter in_weight270 = 32'b10111101010101010111001110010111,
	parameter in_weight271 = 32'b10111101001111110100010000010011,
	parameter in_weight272 = 32'b00111100100110010101011000001010,
	parameter in_weight273 = 32'b10111100010110110011010100010011,
	parameter in_weight274 = 32'b00111010110001100011000111100110,
	parameter in_weight275 = 32'b10111101011011101111111110011111,
	parameter in_weight276 = 32'b10111011111101101101010101110111,
	parameter in_weight277 = 32'b00111101001100010010011011001110,
	parameter in_weight278 = 32'b10111100100010101111000011101101,
	parameter in_weight279 = 32'b00111101100000111001000000111011,
	parameter in_weight280 = 32'b00111101010000110111001111000011,
	parameter in_weight281 = 32'b10111101000010111101111001001110,
	parameter in_weight282 = 32'b10111010110110011001101011011111,
	parameter in_weight283 = 32'b00111100111101100110111101010010,
	parameter in_weight284 = 32'b00111100111111010101110011000101,
	parameter in_weight285 = 32'b00111101000010011011011000001101,
	parameter in_weight286 = 32'b10111101011110001010001010001111,
	parameter in_weight287 = 32'b00111101100011011111101001011110
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
