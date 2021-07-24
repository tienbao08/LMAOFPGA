`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_15
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


module conv_28_weight6_15
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b10111100101100101110111100111011,
	parameter in_weight1 = 32'b10111100000001010111101111010001,
	parameter in_weight2 = 32'b00111101100101100101100110000001,
	parameter in_weight3 = 32'b00111101001011100000010001110001,
	parameter in_weight4 = 32'b10111100111100001011000111100001,
	parameter in_weight5 = 32'b10111100111001001111011100101000,
	parameter in_weight6 = 32'b10111101101001011000101000000011,
	parameter in_weight7 = 32'b10111101101010100100111000101010,
	parameter in_weight8 = 32'b10111101000001001000101000000000,
	parameter in_weight9 = 32'b10111101010101101100000000000000,
	parameter in_weight10 = 32'b00111100111000101111000100001001,
	parameter in_weight11 = 32'b00111100110000110110000011110001,
	parameter in_weight12 = 32'b00111100110000000101101101110011,
	parameter in_weight13 = 32'b00111011101111100000110001001100,
	parameter in_weight14 = 32'b00111100011010001001010110101101,
	parameter in_weight15 = 32'b00111011100011110001010011100101,
	parameter in_weight16 = 32'b00111101011001110111111010000010,
	parameter in_weight17 = 32'b00111101011100001110010111001100,
	parameter in_weight18 = 32'b10111101001001111111111000101001,
	parameter in_weight19 = 32'b10111100100100011001001100111101,
	parameter in_weight20 = 32'b10111011010101100010100010011001,
	parameter in_weight21 = 32'b10111101100010010100101011110100,
	parameter in_weight22 = 32'b00111101100110011111011100000111,
	parameter in_weight23 = 32'b10111011011001110010010100111110,
	parameter in_weight24 = 32'b10111101001100011110000010011011,
	parameter in_weight25 = 32'b10111101011001111011011001100001,
	parameter in_weight26 = 32'b00111101100000011110010000000001,
	parameter in_weight27 = 32'b00111100111100000000110111000010,
	parameter in_weight28 = 32'b10111100100011111110101100001000,
	parameter in_weight29 = 32'b00111101000101110110000111100110,
	parameter in_weight30 = 32'b10111101001001101100010111001011,
	parameter in_weight31 = 32'b10111100111110001101101100110010,
	parameter in_weight32 = 32'b10111100101110011011111010010111,
	parameter in_weight33 = 32'b00111101100101110010110001010011,
	parameter in_weight34 = 32'b00111101000010110110101000001110,
	parameter in_weight35 = 32'b10111101100000011111000110101101,
	parameter in_weight36 = 32'b00111101001110010100011001001110,
	parameter in_weight37 = 32'b00111101011011111100100111111001,
	parameter in_weight38 = 32'b00111101010011011010110011111010,
	parameter in_weight39 = 32'b00111100110101111010001001100000,
	parameter in_weight40 = 32'b00111100110110001101100101001101,
	parameter in_weight41 = 32'b10111011010011010000111110100100,
	parameter in_weight42 = 32'b00111101100000101101101010001100,
	parameter in_weight43 = 32'b00111101010101100001100110001010,
	parameter in_weight44 = 32'b00111100000110111111101100111100,
	parameter in_weight45 = 32'b00111100111111010011101001010111,
	parameter in_weight46 = 32'b10111101100000110001110110100011,
	parameter in_weight47 = 32'b10111101000010111101000000000110,
	parameter in_weight48 = 32'b00111100110000000110001000001110,
	parameter in_weight49 = 32'b00111100110000011010011100110100,
	parameter in_weight50 = 32'b00111100111111101011001000111010,
	parameter in_weight51 = 32'b00111100101001010010000110010010,
	parameter in_weight52 = 32'b00111100100111000000011110010111,
	parameter in_weight53 = 32'b10111101011101000000000110101110,
	parameter in_weight54 = 32'b10111011011100101011000101111111,
	parameter in_weight55 = 32'b00111101010000111100011011100011,
	parameter in_weight56 = 32'b10111100111111101101101101011110,
	parameter in_weight57 = 32'b10111100101011101111000011100110,
	parameter in_weight58 = 32'b00111101010011011001010011011111,
	parameter in_weight59 = 32'b10111101001011011000011101000101,
	parameter in_weight60 = 32'b10111100001000100101111010010110,
	parameter in_weight61 = 32'b00111101000100000100010010100100,
	parameter in_weight62 = 32'b10111101000110011101101111100110,
	parameter in_weight63 = 32'b10111101001010100011111011010000,
	parameter in_weight64 = 32'b00111100000110111101111110110000,
	parameter in_weight65 = 32'b10111101000000110000110110001010,
	parameter in_weight66 = 32'b10111011100011001110011110110110,
	parameter in_weight67 = 32'b00111101100010011000110110110101,
	parameter in_weight68 = 32'b00111101101010010011111101000011,
	parameter in_weight69 = 32'b00111011111101001100011011011001,
	parameter in_weight70 = 32'b00111100111011001100111110110111,
	parameter in_weight71 = 32'b10111101100110101000001001101110,
	parameter in_weight72 = 32'b10111101000000110000010111111111,
	parameter in_weight73 = 32'b10111101001000000001110111101100,
	parameter in_weight74 = 32'b00111101001110111010111001011000,
	parameter in_weight75 = 32'b00111101100111100110100011000111,
	parameter in_weight76 = 32'b00111101001110001011010001001011,
	parameter in_weight77 = 32'b10111011010011111111010111010110,
	parameter in_weight78 = 32'b00111101010110010001000000111011,
	parameter in_weight79 = 32'b00111100111000000111011110011011,
	parameter in_weight80 = 32'b00111100110001110000001010100001,
	parameter in_weight81 = 32'b00111100111001110011000010110111,
	parameter in_weight82 = 32'b10111101001001011111011000100001,
	parameter in_weight83 = 32'b00111101100111110101100111100001,
	parameter in_weight84 = 32'b00111101011110010101100010000001,
	parameter in_weight85 = 32'b10111100010100111000100111011001,
	parameter in_weight86 = 32'b10111101100110110111001001000110,
	parameter in_weight87 = 32'b10111101000110010011101111110100,
	parameter in_weight88 = 32'b10111101011100000110011111110010,
	parameter in_weight89 = 32'b00111100111001000011011000001010,
	parameter in_weight90 = 32'b00111011100001011000001010001000,
	parameter in_weight91 = 32'b10111101011110001000010101111001,
	parameter in_weight92 = 32'b10111101100011010110010111000000,
	parameter in_weight93 = 32'b10111101101001011010010110111110,
	parameter in_weight94 = 32'b00111101101001001010101100001010,
	parameter in_weight95 = 32'b00111101101000011101111010000000,
	parameter in_weight96 = 32'b10111101010010010111101101111110,
	parameter in_weight97 = 32'b10111101100001010111101110110001,
	parameter in_weight98 = 32'b10111101010001001100000010100110,
	parameter in_weight99 = 32'b10111101011110001000110101100111,
	parameter in_weight100 = 32'b10111101011101011000111001110100,
	parameter in_weight101 = 32'b10111101100101100000010010111011,
	parameter in_weight102 = 32'b00111101000001101100100011101111,
	parameter in_weight103 = 32'b00111101100100101000000010101101,
	parameter in_weight104 = 32'b10111101001001100101001111100101,
	parameter in_weight105 = 32'b00111101000101110011110100000011,
	parameter in_weight106 = 32'b00111101011010100001010100100111,
	parameter in_weight107 = 32'b10111100110110011010001000101111,
	parameter in_weight108 = 32'b10111100100001001010000100011000,
	parameter in_weight109 = 32'b00111101100110000001101010001110,
	parameter in_weight110 = 32'b00111101001111011101001001010000,
	parameter in_weight111 = 32'b10111101001101111100110011010110,
	parameter in_weight112 = 32'b00111101011001100010000001001001,
	parameter in_weight113 = 32'b00111101010010101011010111010111,
	parameter in_weight114 = 32'b10111100000100001001111011110001,
	parameter in_weight115 = 32'b10111011011000101001100100100101,
	parameter in_weight116 = 32'b00111101000011000010001000000001,
	parameter in_weight117 = 32'b00111100100000111110100010111100,
	parameter in_weight118 = 32'b10111101000010010111101000110111,
	parameter in_weight119 = 32'b10111101011011110011110001000001,
	parameter in_weight120 = 32'b00111100011011110111110011011011,
	parameter in_weight121 = 32'b00111101100010010110001010100101,
	parameter in_weight122 = 32'b10111100011010110110010111111101,
	parameter in_weight123 = 32'b00111101101000000110101110011100,
	parameter in_weight124 = 32'b00111101000011010001100011101010,
	parameter in_weight125 = 32'b00111101010110110000001010111111,
	parameter in_weight126 = 32'b10111100011000001101011011101100,
	parameter in_weight127 = 32'b10111101100110101000111010000000,
	parameter in_weight128 = 32'b00111101010110100111110101111111,
	parameter in_weight129 = 32'b10111101001011111111011000111110,
	parameter in_weight130 = 32'b00111101100100110011100101011101,
	parameter in_weight131 = 32'b00111100000011010011110011100101,
	parameter in_weight132 = 32'b10111100101001110000000000110101,
	parameter in_weight133 = 32'b10111101100010001101010001010111,
	parameter in_weight134 = 32'b00111011101010100011111110111011,
	parameter in_weight135 = 32'b10111101001101111010110110111010,
	parameter in_weight136 = 32'b00111101001111000000010101101100,
	parameter in_weight137 = 32'b00111101101000010110010011101111,
	parameter in_weight138 = 32'b00111100101101001011110111111100,
	parameter in_weight139 = 32'b00111101001110000111011000100011,
	parameter in_weight140 = 32'b10111101011010001001011000011110,
	parameter in_weight141 = 32'b00111100100110010111110000101001,
	parameter in_weight142 = 32'b10111011111111101010110111010100,
	parameter in_weight143 = 32'b10111101001010111110010110101100,
	parameter in_weight144 = 32'b10111101101000100111101101010111,
	parameter in_weight145 = 32'b00111101000001001001001101000111,
	parameter in_weight146 = 32'b10111101011101001100000001110101,
	parameter in_weight147 = 32'b00111100110001011000001111010111,
	parameter in_weight148 = 32'b10111101100101110011101010100001,
	parameter in_weight149 = 32'b10111101011100101101001110010010,
	parameter in_weight150 = 32'b10111101001011010011001111111001,
	parameter in_weight151 = 32'b00111101001000000000000010100001,
	parameter in_weight152 = 32'b10111101010001111000101010100001,
	parameter in_weight153 = 32'b10111101100000001011101011000000,
	parameter in_weight154 = 32'b10111101101010011000011100110010,
	parameter in_weight155 = 32'b10111101010001110001110100110111,
	parameter in_weight156 = 32'b10111100111000001101010110101010,
	parameter in_weight157 = 32'b10111101101001101010001101101010,
	parameter in_weight158 = 32'b00111101100011100001001101101101,
	parameter in_weight159 = 32'b10111101101010010000110100101111,
	parameter in_weight160 = 32'b10111100001100110110011111001001,
	parameter in_weight161 = 32'b10111101000110111011111011100110,
	parameter in_weight162 = 32'b10111100011100000011110111101010,
	parameter in_weight163 = 32'b00111101011001011111111101010100,
	parameter in_weight164 = 32'b10111101101010100011000011101111,
	parameter in_weight165 = 32'b00111101000100000010011111000111,
	parameter in_weight166 = 32'b00111100100010001100010110101101,
	parameter in_weight167 = 32'b00111101000010010100101011111111,
	parameter in_weight168 = 32'b10111101100010011100010000000101,
	parameter in_weight169 = 32'b10111101101010000111111111111010,
	parameter in_weight170 = 32'b10111101011110111100000111011111,
	parameter in_weight171 = 32'b00111101100010000000101011000101,
	parameter in_weight172 = 32'b10111100110101101001010011111011,
	parameter in_weight173 = 32'b00111101001101010101110100010111,
	parameter in_weight174 = 32'b00111101001100101110010010011111,
	parameter in_weight175 = 32'b00111011110011000100000110110110,
	parameter in_weight176 = 32'b00111101010111110101101000111111,
	parameter in_weight177 = 32'b10111101000100011010110010110111,
	parameter in_weight178 = 32'b10111101001010010111010111000111,
	parameter in_weight179 = 32'b00111100110001101000101110000011,
	parameter in_weight180 = 32'b10111100101001011100000100111101,
	parameter in_weight181 = 32'b10111101100011011011111001010101,
	parameter in_weight182 = 32'b00111101011001110111111000100111,
	parameter in_weight183 = 32'b00111101100101101100111111000111,
	parameter in_weight184 = 32'b10111101100101011000010010010111,
	parameter in_weight185 = 32'b10111101000010110001001000110111,
	parameter in_weight186 = 32'b10111101100100011001000110010010,
	parameter in_weight187 = 32'b10111010110100000001001000101010,
	parameter in_weight188 = 32'b00111101010110001101111110101011,
	parameter in_weight189 = 32'b10111101001010010010001101000000,
	parameter in_weight190 = 32'b00111101000111011111110011110000,
	parameter in_weight191 = 32'b10111101101000101110110110101000,
	parameter in_weight192 = 32'b00111011100001010011111000111001,
	parameter in_weight193 = 32'b10111101010110010100001100100011,
	parameter in_weight194 = 32'b00111101001010000000111111101000,
	parameter in_weight195 = 32'b10111101101010001101110100001010,
	parameter in_weight196 = 32'b10111101101001101001000110011000,
	parameter in_weight197 = 32'b10111101000000011101111101100001,
	parameter in_weight198 = 32'b00111011111110101001100011111111,
	parameter in_weight199 = 32'b10111101010111110010111001000011,
	parameter in_weight200 = 32'b00111100000011010111000000111011,
	parameter in_weight201 = 32'b00111101000001100101101100000000,
	parameter in_weight202 = 32'b10111100010110011101100000010011,
	parameter in_weight203 = 32'b10111011101010101011000111011011,
	parameter in_weight204 = 32'b00111100101101101110011011011000,
	parameter in_weight205 = 32'b10111101010000100101010000110101,
	parameter in_weight206 = 32'b10111101101001001001010000100110,
	parameter in_weight207 = 32'b10111100100101010000110101110000,
	parameter in_weight208 = 32'b00111011010110100010011010111011,
	parameter in_weight209 = 32'b00111101011110011000001011000101,
	parameter in_weight210 = 32'b00111100111000011111011101100001,
	parameter in_weight211 = 32'b00111101001110000100001100000000,
	parameter in_weight212 = 32'b00111011000101000110100010110011,
	parameter in_weight213 = 32'b10111100101010110011001011000000,
	parameter in_weight214 = 32'b00111101010110111110000111110101,
	parameter in_weight215 = 32'b00111101001010010001110001010010,
	parameter in_weight216 = 32'b10111100111000000111011010010100,
	parameter in_weight217 = 32'b10111100101101111100011100110011,
	parameter in_weight218 = 32'b00111101001100000100001100000110,
	parameter in_weight219 = 32'b10111101010001110100110001000100,
	parameter in_weight220 = 32'b10111101000000001010010101000110,
	parameter in_weight221 = 32'b00111101011011011101000110101111,
	parameter in_weight222 = 32'b00111011001111011000100010111100,
	parameter in_weight223 = 32'b00111011111100010000011110110101,
	parameter in_weight224 = 32'b00111101010101101110111111001111,
	parameter in_weight225 = 32'b10111101000100010001011110010000,
	parameter in_weight226 = 32'b10111101000000101110011100100010,
	parameter in_weight227 = 32'b10111101100111001000010000010010,
	parameter in_weight228 = 32'b00111101001111110000001100111000,
	parameter in_weight229 = 32'b10111100100111101010011001000110,
	parameter in_weight230 = 32'b00111101001111110010100000110100,
	parameter in_weight231 = 32'b10111101000100010011010000000101,
	parameter in_weight232 = 32'b10111100110101000111101011111001,
	parameter in_weight233 = 32'b10111101001110101101000000010011,
	parameter in_weight234 = 32'b10111101101001001100111011111010,
	parameter in_weight235 = 32'b10111101011001011110110110010101,
	parameter in_weight236 = 32'b00111100011001101110000001001100,
	parameter in_weight237 = 32'b10111100101001011100111101010000,
	parameter in_weight238 = 32'b10111100111010010110111111110110,
	parameter in_weight239 = 32'b00111010100110001101010101110110,
	parameter in_weight240 = 32'b10111101000011010000111000001000,
	parameter in_weight241 = 32'b00111100111100111000000100100101,
	parameter in_weight242 = 32'b10111100001111000110101100111110,
	parameter in_weight243 = 32'b10111101011001100000110111001100,
	parameter in_weight244 = 32'b00111101011011101110001011110100,
	parameter in_weight245 = 32'b00111100001110010111111001001101,
	parameter in_weight246 = 32'b10111101011000001110110100011111,
	parameter in_weight247 = 32'b10111100101000011011000111110001,
	parameter in_weight248 = 32'b00111101010001100100001000000101,
	parameter in_weight249 = 32'b10111101100111111100001011000111,
	parameter in_weight250 = 32'b00111101011011001011100101111111,
	parameter in_weight251 = 32'b00111100111100000000000101110101,
	parameter in_weight252 = 32'b00111101010111000010011111110111,
	parameter in_weight253 = 32'b00111011100000110111110110001110,
	parameter in_weight254 = 32'b10111101001011100101100100011111,
	parameter in_weight255 = 32'b10111101010101110010010001000110,
	parameter in_weight256 = 32'b10111101101000000000011011111101,
	parameter in_weight257 = 32'b00111011110110011000110110011110,
	parameter in_weight258 = 32'b10111101101000101001101100000010,
	parameter in_weight259 = 32'b00111101010000010000111001000110,
	parameter in_weight260 = 32'b00111101100100011110110101011000,
	parameter in_weight261 = 32'b10111101000000000010000010111000,
	parameter in_weight262 = 32'b10111100100110011110110101111110,
	parameter in_weight263 = 32'b10111101100000110010111000101101,
	parameter in_weight264 = 32'b00111100001100000001010001111001,
	parameter in_weight265 = 32'b00111101010100110011010100010010,
	parameter in_weight266 = 32'b00111101010110110100111000100100,
	parameter in_weight267 = 32'b10111101100000000101111010000101,
	parameter in_weight268 = 32'b10111100001011000110110011000101,
	parameter in_weight269 = 32'b00111101001010110101111100101100,
	parameter in_weight270 = 32'b10111001101101000001010101011101,
	parameter in_weight271 = 32'b10111100100000000011100101010011,
	parameter in_weight272 = 32'b00111100100000010010110100001110,
	parameter in_weight273 = 32'b00111100111001001010100111011111,
	parameter in_weight274 = 32'b10111101100110011111111001011110,
	parameter in_weight275 = 32'b10111011111010101111100100111110,
	parameter in_weight276 = 32'b00111101011110010101101101110110,
	parameter in_weight277 = 32'b10111100110000001101011110101110,
	parameter in_weight278 = 32'b10111100101100100010111010011001,
	parameter in_weight279 = 32'b10111100101011101100010001011111,
	parameter in_weight280 = 32'b00111100111010110101111000110100,
	parameter in_weight281 = 32'b00111101000011101000110101101011,
	parameter in_weight282 = 32'b10111101000010000101000001100010,
	parameter in_weight283 = 32'b00111101101000000100100101110111,
	parameter in_weight284 = 32'b10111100001111000111101111001111,
	parameter in_weight285 = 32'b00111100000010110101100011000101,
	parameter in_weight286 = 32'b00111100110011111011100100000010,
	parameter in_weight287 = 32'b10111011101011101101111011100101
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
