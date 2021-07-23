`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_13
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


module conv_28_weight6_13
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b00111011100000010111100100000001,
	parameter in_weight1 = 32'b00111100010101010110110000001111,
	parameter in_weight2 = 32'b10111101100110100011001011010100,
	parameter in_weight3 = 32'b00111101100111010000011101001100,
	parameter in_weight4 = 32'b00111100000011110010001010001011,
	parameter in_weight5 = 32'b00111100101000001001110101011111,
	parameter in_weight6 = 32'b00111101100000101111101010000110,
	parameter in_weight7 = 32'b00111100110001000011001110000011,
	parameter in_weight8 = 32'b00111101011110001101010011101110,
	parameter in_weight9 = 32'b10111101011110010111110000010111,
	parameter in_weight10 = 32'b10111101101011100110100100010010,
	parameter in_weight11 = 32'b00111100111100010100011100111110,
	parameter in_weight12 = 32'b00111100101110000011111100011110,
	parameter in_weight13 = 32'b10111100000101111111010001111001,
	parameter in_weight14 = 32'b00111011001100001001100010111110,
	parameter in_weight15 = 32'b00111101101000011010010001011100,
	parameter in_weight16 = 32'b10111100111101110110010000001010,
	parameter in_weight17 = 32'b00111101100001110011110011100010,
	parameter in_weight18 = 32'b10111101100101000011001101011011,
	parameter in_weight19 = 32'b10111100001110111000010101010010,
	parameter in_weight20 = 32'b00111101010111011100000011101000,
	parameter in_weight21 = 32'b00111100101101101010001101110010,
	parameter in_weight22 = 32'b10111100110001110011101101111110,
	parameter in_weight23 = 32'b10111101000011101011100011011001,
	parameter in_weight24 = 32'b00111101000010011000001001100101,
	parameter in_weight25 = 32'b10111101100010100100101101101001,
	parameter in_weight26 = 32'b10111101100000101101010101101001,
	parameter in_weight27 = 32'b10111100100010001000011010110011,
	parameter in_weight28 = 32'b00111101100010110001111010000111,
	parameter in_weight29 = 32'b00111011010110100101001010101010,
	parameter in_weight30 = 32'b00111101001011111011101100110010,
	parameter in_weight31 = 32'b10111101011111001111101010011110,
	parameter in_weight32 = 32'b10111101100001011110110001010001,
	parameter in_weight33 = 32'b00111101100101101110111111011000,
	parameter in_weight34 = 32'b00111101001101000000110100010111,
	parameter in_weight35 = 32'b00111101011101010001100111000010,
	parameter in_weight36 = 32'b10111101010101100101110101101011,
	parameter in_weight37 = 32'b10111101000100001001011111001000,
	parameter in_weight38 = 32'b00111101010101000110111000000100,
	parameter in_weight39 = 32'b10111101000100010100100011111011,
	parameter in_weight40 = 32'b10111101001110010100111011011011,
	parameter in_weight41 = 32'b10111101100111001110011010011011,
	parameter in_weight42 = 32'b00111101001101101101010101100011,
	parameter in_weight43 = 32'b00111101010101011010010110101101,
	parameter in_weight44 = 32'b00111100100110100000000000110001,
	parameter in_weight45 = 32'b00111101100010100111100111000011,
	parameter in_weight46 = 32'b00111011100101100001110010010011,
	parameter in_weight47 = 32'b10111100010111000000101111101010,
	parameter in_weight48 = 32'b10111101010111011000101011110101,
	parameter in_weight49 = 32'b00111011011001111001100001111011,
	parameter in_weight50 = 32'b00111101010101011000110110110101,
	parameter in_weight51 = 32'b00111101011100000110111100100010,
	parameter in_weight52 = 32'b00111101100100000001110000111110,
	parameter in_weight53 = 32'b00111101000100110001011001100101,
	parameter in_weight54 = 32'b10111011100110101110000101111111,
	parameter in_weight55 = 32'b00111101000011011101000010110110,
	parameter in_weight56 = 32'b00111101100010010000010000011100,
	parameter in_weight57 = 32'b00111101001100111001111010011101,
	parameter in_weight58 = 32'b00111100110111110011000010001100,
	parameter in_weight59 = 32'b00111101001111001010110011011101,
	parameter in_weight60 = 32'b10111101000011011100000110100101,
	parameter in_weight61 = 32'b10111100100000110000101000000110,
	parameter in_weight62 = 32'b10111101000100111001010010000001,
	parameter in_weight63 = 32'b10111101001010101010110111110000,
	parameter in_weight64 = 32'b00111100000000100100100000111100,
	parameter in_weight65 = 32'b10111100000001011000011101111011,
	parameter in_weight66 = 32'b10111011111011011011001100111001,
	parameter in_weight67 = 32'b10111101001010111110000101110111,
	parameter in_weight68 = 32'b10111101001110010011100101101011,
	parameter in_weight69 = 32'b00111101010000001111100000101010,
	parameter in_weight70 = 32'b10111100100001011000001101110111,
	parameter in_weight71 = 32'b10111101001100000011100110001101,
	parameter in_weight72 = 32'b00111101100100101110101110101010,
	parameter in_weight73 = 32'b00111101001001101101100110101100,
	parameter in_weight74 = 32'b00111101101000101001110111101010,
	parameter in_weight75 = 32'b00111101010100000101001000101000,
	parameter in_weight76 = 32'b10111101010010111001110110101110,
	parameter in_weight77 = 32'b10111101001001011011111101110001,
	parameter in_weight78 = 32'b00111101010001010010111000000011,
	parameter in_weight79 = 32'b00111101000010001110110100110010,
	parameter in_weight80 = 32'b00111100001011111100011101000100,
	parameter in_weight81 = 32'b10111100001101100100010111010111,
	parameter in_weight82 = 32'b10111101000111011010001110001010,
	parameter in_weight83 = 32'b10111101101001110010000100111111,
	parameter in_weight84 = 32'b10111100110111110000000001011101,
	parameter in_weight85 = 32'b00111100111110100110011010001000,
	parameter in_weight86 = 32'b00111100001111101010100101001111,
	parameter in_weight87 = 32'b10111101000010010100100110100101,
	parameter in_weight88 = 32'b10111011100101000001101000000100,
	parameter in_weight89 = 32'b00111101100111100010100101110100,
	parameter in_weight90 = 32'b10111100111100011000111001010011,
	parameter in_weight91 = 32'b00111101011101101001001000001111,
	parameter in_weight92 = 32'b00111101100001110101001000011000,
	parameter in_weight93 = 32'b00111010111100010010000101001101,
	parameter in_weight94 = 32'b00111101000011000000011011010001,
	parameter in_weight95 = 32'b10111101100011100001111011111100,
	parameter in_weight96 = 32'b10111011110100001001110001101110,
	parameter in_weight97 = 32'b00111101001111010101101010011000,
	parameter in_weight98 = 32'b10111100111110000001010011101001,
	parameter in_weight99 = 32'b10111101000110010011111011000011,
	parameter in_weight100 = 32'b00111100011100111100000011101001,
	parameter in_weight101 = 32'b10111101010100100011111100101011,
	parameter in_weight102 = 32'b00111100011110111100000001101110,
	parameter in_weight103 = 32'b00111101101010110101111010100100,
	parameter in_weight104 = 32'b00111101001010111010011100100100,
	parameter in_weight105 = 32'b00111101101001101111000011110011,
	parameter in_weight106 = 32'b10111101001100101010001100111111,
	parameter in_weight107 = 32'b00111011000001100110010110010010,
	parameter in_weight108 = 32'b00111101000100001011100101011111,
	parameter in_weight109 = 32'b10111101011000100101100110001101,
	parameter in_weight110 = 32'b10111100100011101111111111000001,
	parameter in_weight111 = 32'b00111101101001111000010001011001,
	parameter in_weight112 = 32'b10111101011011110011110100000000,
	parameter in_weight113 = 32'b00111100111100111001111001101101,
	parameter in_weight114 = 32'b10111010001010100001111110000001,
	parameter in_weight115 = 32'b00111101010000000001101100000111,
	parameter in_weight116 = 32'b00111101001110110011100011000001,
	parameter in_weight117 = 32'b00111100011111100000011001111011,
	parameter in_weight118 = 32'b10111101001010010101000011011010,
	parameter in_weight119 = 32'b00111101101001001111000110000010,
	parameter in_weight120 = 32'b10111101010111011100100111000101,
	parameter in_weight121 = 32'b10111100110100011110001111011101,
	parameter in_weight122 = 32'b10111100100010101110001100010111,
	parameter in_weight123 = 32'b00111101011000000000000011110010,
	parameter in_weight124 = 32'b00111101000100011111111111111010,
	parameter in_weight125 = 32'b00111001111010111011101110010101,
	parameter in_weight126 = 32'b00111101010100111000000100100010,
	parameter in_weight127 = 32'b00111010011101100011011101111110,
	parameter in_weight128 = 32'b00111101000011010101110001101011,
	parameter in_weight129 = 32'b00111101100000101011110011110011,
	parameter in_weight130 = 32'b10111101100110001111100001000010,
	parameter in_weight131 = 32'b00111101001010001111111010111011,
	parameter in_weight132 = 32'b10111011100001001000111011000010,
	parameter in_weight133 = 32'b00111101100010000010011010000010,
	parameter in_weight134 = 32'b00111101101000000001011001111000,
	parameter in_weight135 = 32'b10111101100011111001010000010000,
	parameter in_weight136 = 32'b10111101010100000101010101010101,
	parameter in_weight137 = 32'b00111101100011101011011001000111,
	parameter in_weight138 = 32'b10111101011101010100011001100110,
	parameter in_weight139 = 32'b10111101100010000010110111111001,
	parameter in_weight140 = 32'b00111101100110101101011010111110,
	parameter in_weight141 = 32'b10111101001100011001011000100111,
	parameter in_weight142 = 32'b00111011010111001101101110110000,
	parameter in_weight143 = 32'b00111101100011011001111100010100,
	parameter in_weight144 = 32'b00111011000000001000001001000111,
	parameter in_weight145 = 32'b00111100101100110000001000011001,
	parameter in_weight146 = 32'b00111011100010110010101011011111,
	parameter in_weight147 = 32'b00111101011101111001101110110100,
	parameter in_weight148 = 32'b00111101011111001001010111111110,
	parameter in_weight149 = 32'b00111100001000000000110101110100,
	parameter in_weight150 = 32'b00111101100111011011111011110010,
	parameter in_weight151 = 32'b10111101010101011101000010100110,
	parameter in_weight152 = 32'b00111100111110011111100100111010,
	parameter in_weight153 = 32'b00111101001101100001010111011101,
	parameter in_weight154 = 32'b10111101000001000110110100110001,
	parameter in_weight155 = 32'b00111101100101110000101111000010,
	parameter in_weight156 = 32'b10111101100001011010110010000101,
	parameter in_weight157 = 32'b00111101001000101101011101001000,
	parameter in_weight158 = 32'b10111100110101101001000001110110,
	parameter in_weight159 = 32'b00111011100111110010110010001111,
	parameter in_weight160 = 32'b10111011111011100011000010110101,
	parameter in_weight161 = 32'b10111101101000000011111011010111,
	parameter in_weight162 = 32'b10111101011110100110111010101011,
	parameter in_weight163 = 32'b10111101001010010001010001101100,
	parameter in_weight164 = 32'b10111100100011001110110010010000,
	parameter in_weight165 = 32'b00111100111101011111111101101101,
	parameter in_weight166 = 32'b00111100101110101111011011000100,
	parameter in_weight167 = 32'b00111101100011010111011001111101,
	parameter in_weight168 = 32'b10111101000111000011011000010110,
	parameter in_weight169 = 32'b10111101000011010111111001010100,
	parameter in_weight170 = 32'b00111100101101110111101001010100,
	parameter in_weight171 = 32'b00111100010100110100011111011010,
	parameter in_weight172 = 32'b00111101001001110010101011000010,
	parameter in_weight173 = 32'b10111101000010010110000101001010,
	parameter in_weight174 = 32'b00111101010010011011101100110100,
	parameter in_weight175 = 32'b10111011101010100100110010010110,
	parameter in_weight176 = 32'b10111100010000100101100101100011,
	parameter in_weight177 = 32'b00111011010001011110101010101010,
	parameter in_weight178 = 32'b10111100001110011011000111000111,
	parameter in_weight179 = 32'b00111101100111011001011000000011,
	parameter in_weight180 = 32'b10111101000000010110111111101111,
	parameter in_weight181 = 32'b10111101100010101011101000101000,
	parameter in_weight182 = 32'b10111100001001011101100011011011,
	parameter in_weight183 = 32'b00111101011011011000111100000011,
	parameter in_weight184 = 32'b10111100110010110111001011011011,
	parameter in_weight185 = 32'b00111100111100110000010100010110,
	parameter in_weight186 = 32'b00111101010001000010001010111001,
	parameter in_weight187 = 32'b00111101100110101011111100010001,
	parameter in_weight188 = 32'b10111100110001000111001100000101,
	parameter in_weight189 = 32'b00111101010100001111010011111110,
	parameter in_weight190 = 32'b00111101000000000111011101111101,
	parameter in_weight191 = 32'b10111100100110100101011001010110,
	parameter in_weight192 = 32'b00111101010111100111000101001111,
	parameter in_weight193 = 32'b10111100101101001000111110110110,
	parameter in_weight194 = 32'b00111101100101000101110110011110,
	parameter in_weight195 = 32'b00111100100101001010100011100011,
	parameter in_weight196 = 32'b10111101100100000001111011101101,
	parameter in_weight197 = 32'b00111101101000111101110110011011,
	parameter in_weight198 = 32'b10111100100000010101110100110001,
	parameter in_weight199 = 32'b00111101100010101011111111011111,
	parameter in_weight200 = 32'b00111100100100001101001010011001,
	parameter in_weight201 = 32'b10111100110011111011000011100001,
	parameter in_weight202 = 32'b10111010100010010100000111100101,
	parameter in_weight203 = 32'b10111101101000100001000100000000,
	parameter in_weight204 = 32'b00111101100100001001110010011011,
	parameter in_weight205 = 32'b00111101010100111111001011101000,
	parameter in_weight206 = 32'b10111101000100001001110010000010,
	parameter in_weight207 = 32'b00111101001000110101001000111001,
	parameter in_weight208 = 32'b10111101101001101000000111111011,
	parameter in_weight209 = 32'b00111101001001101000000011100111,
	parameter in_weight210 = 32'b00111101001110001111111100111011,
	parameter in_weight211 = 32'b10111011101110001110001010101011,
	parameter in_weight212 = 32'b00111100111010101000011001100011,
	parameter in_weight213 = 32'b10111100110111101000001101100111,
	parameter in_weight214 = 32'b00111101100010000011100110001000,
	parameter in_weight215 = 32'b10111101100111011111011100001101,
	parameter in_weight216 = 32'b10111010110100101001010111010011,
	parameter in_weight217 = 32'b00111100100010001110001111100001,
	parameter in_weight218 = 32'b10111101001100111101010111010100,
	parameter in_weight219 = 32'b10111101000000010110000000101010,
	parameter in_weight220 = 32'b10111101011110001011011110001001,
	parameter in_weight221 = 32'b00111100111000001100110100101010,
	parameter in_weight222 = 32'b10111101010110000110000001110011,
	parameter in_weight223 = 32'b00111100100010110011110010001000,
	parameter in_weight224 = 32'b00111101100100111010110101011100,
	parameter in_weight225 = 32'b10111101010101010000110101101101,
	parameter in_weight226 = 32'b00111101001011011000000110000111,
	parameter in_weight227 = 32'b00111011100111011101111101001011,
	parameter in_weight228 = 32'b10111101100011000000010111111111,
	parameter in_weight229 = 32'b00111101010101110011000111101110,
	parameter in_weight230 = 32'b00111101011101101101001101010001,
	parameter in_weight231 = 32'b10111101011110000010111111100100,
	parameter in_weight232 = 32'b00111101100100000110101000001101,
	parameter in_weight233 = 32'b00111101000100000011011010111010,
	parameter in_weight234 = 32'b00111100101101100001000001011001,
	parameter in_weight235 = 32'b10111101001011101101100111000010,
	parameter in_weight236 = 32'b00111100101011111101101011000110,
	parameter in_weight237 = 32'b00111100101000111000010111001101,
	parameter in_weight238 = 32'b00111101000010010000110001010110,
	parameter in_weight239 = 32'b10111100000010000011101110101110,
	parameter in_weight240 = 32'b00111101010000011000100101011011,
	parameter in_weight241 = 32'b00111101001001110011001110010101,
	parameter in_weight242 = 32'b10111100110001011001010101110101,
	parameter in_weight243 = 32'b00111101001101111011011011110111,
	parameter in_weight244 = 32'b10111101000110011101110001011100,
	parameter in_weight245 = 32'b00111101100111011010100110000100,
	parameter in_weight246 = 32'b00111100101010110100010010001011,
	parameter in_weight247 = 32'b10111100111101100101100110010010,
	parameter in_weight248 = 32'b10111101011000010100001100001011,
	parameter in_weight249 = 32'b10111100100100000011110100111010,
	parameter in_weight250 = 32'b00111101000000010001001011101000,
	parameter in_weight251 = 32'b10111101101000011011100000111001,
	parameter in_weight252 = 32'b10111101100111100110111101011101,
	parameter in_weight253 = 32'b00111100111111101001110000100111,
	parameter in_weight254 = 32'b10111101010010001000000000010010,
	parameter in_weight255 = 32'b00111100101111100010101000000110,
	parameter in_weight256 = 32'b00111100110100100010111000010101,
	parameter in_weight257 = 32'b00111100101110111101100101010011,
	parameter in_weight258 = 32'b00111100000011011000100000011110,
	parameter in_weight259 = 32'b10111101100000011100111111100111,
	parameter in_weight260 = 32'b00111101101001010011110101010111,
	parameter in_weight261 = 32'b10111100101111110011010001101110,
	parameter in_weight262 = 32'b00111100100100100011111011011010,
	parameter in_weight263 = 32'b00111101100001100110000001111011,
	parameter in_weight264 = 32'b10111101000111011110011010000011,
	parameter in_weight265 = 32'b10111101001000011011111100000011,
	parameter in_weight266 = 32'b10111101100111010001001111110011,
	parameter in_weight267 = 32'b00111100101101011101100010101110,
	parameter in_weight268 = 32'b00111101001100111110110111110001,
	parameter in_weight269 = 32'b10111100100000011101001011010111,
	parameter in_weight270 = 32'b10111101000110110101010110101010,
	parameter in_weight271 = 32'b00111101011110001100110110111000,
	parameter in_weight272 = 32'b10111101100111100001011001011001,
	parameter in_weight273 = 32'b00111101101000010011110001110011,
	parameter in_weight274 = 32'b00111101010110010000001101100100,
	parameter in_weight275 = 32'b00111101101001000001100100100110,
	parameter in_weight276 = 32'b10111101101001101001001011000001,
	parameter in_weight277 = 32'b10111100010111110000110100011101,
	parameter in_weight278 = 32'b00111101000100010001100010001100,
	parameter in_weight279 = 32'b10111100010100011110111100101111,
	parameter in_weight280 = 32'b10111100011111101111000111110001,
	parameter in_weight281 = 32'b00111101100010000011000001111111,
	parameter in_weight282 = 32'b00111010111011010110101011100001,
	parameter in_weight283 = 32'b00111101100010110001100011011000,
	parameter in_weight284 = 32'b00111101010100101000110010111001,
	parameter in_weight285 = 32'b10111010101001110100011101100100,
	parameter in_weight286 = 32'b10111101011111100010001010011001,
	parameter in_weight287 = 32'b10111101001101100101101000010111
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
