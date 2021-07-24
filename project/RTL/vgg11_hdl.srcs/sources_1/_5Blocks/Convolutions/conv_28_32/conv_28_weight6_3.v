`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_3
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


module conv_28_weight6_3
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b00111100001101000100011011101001,
	parameter in_weight1 = 32'b10111101011101010111000110000000,
	parameter in_weight2 = 32'b00111101001010110110110011001001,
	parameter in_weight3 = 32'b10111100101010111100010011001010,
	parameter in_weight4 = 32'b10111011101101011101010111110011,
	parameter in_weight5 = 32'b10111101011110111100101001110011,
	parameter in_weight6 = 32'b00111101100110101111001100100100,
	parameter in_weight7 = 32'b10111101001111101010001010101101,
	parameter in_weight8 = 32'b10111101000010100100111010011011,
	parameter in_weight9 = 32'b10111101000101110101110010001110,
	parameter in_weight10 = 32'b00111011011000110000010101100010,
	parameter in_weight11 = 32'b00111101000101101101000010010011,
	parameter in_weight12 = 32'b00111101010010111110001110110111,
	parameter in_weight13 = 32'b10111100011001110110110110110100,
	parameter in_weight14 = 32'b00111100100101010010000110000101,
	parameter in_weight15 = 32'b00111101100101111110101100110101,
	parameter in_weight16 = 32'b00111101100110101000000000110001,
	parameter in_weight17 = 32'b00111100111101100011101110011101,
	parameter in_weight18 = 32'b10111100111000010010101100100110,
	parameter in_weight19 = 32'b10111100110001100101100000101011,
	parameter in_weight20 = 32'b00111101000001101001001110010110,
	parameter in_weight21 = 32'b10111100100001011011001111101101,
	parameter in_weight22 = 32'b10111101001000010111100111110000,
	parameter in_weight23 = 32'b00111101101000010110100011100000,
	parameter in_weight24 = 32'b00111101100010100000010101010001,
	parameter in_weight25 = 32'b00111010100110011011000111110011,
	parameter in_weight26 = 32'b10111101100000000011011001100001,
	parameter in_weight27 = 32'b00111011111110101000100101100100,
	parameter in_weight28 = 32'b10111100100110110110010111001110,
	parameter in_weight29 = 32'b10111101010010100000111111011001,
	parameter in_weight30 = 32'b00111100101110101010100100010101,
	parameter in_weight31 = 32'b00111101100000100000100000100110,
	parameter in_weight32 = 32'b00111011000001110110100111111101,
	parameter in_weight33 = 32'b10111011000110001000011010110101,
	parameter in_weight34 = 32'b00111101000011101001000010000100,
	parameter in_weight35 = 32'b10111011011111001010100110001101,
	parameter in_weight36 = 32'b10111101101000001101110100110101,
	parameter in_weight37 = 32'b10111100100000010101010010110001,
	parameter in_weight38 = 32'b10111101001100101101100100110010,
	parameter in_weight39 = 32'b00111100101110001011000101110110,
	parameter in_weight40 = 32'b00111101001110100111101000101100,
	parameter in_weight41 = 32'b10111101011010001110010111111001,
	parameter in_weight42 = 32'b10111101100111011000011101111001,
	parameter in_weight43 = 32'b10111101011110011111111111100010,
	parameter in_weight44 = 32'b10111100100100011111101001100000,
	parameter in_weight45 = 32'b00111101101000111100000110001001,
	parameter in_weight46 = 32'b10111100110011011101011100011011,
	parameter in_weight47 = 32'b10111101011001001100000000101000,
	parameter in_weight48 = 32'b00111101000101100101110001100010,
	parameter in_weight49 = 32'b10111101010000001110110111100110,
	parameter in_weight50 = 32'b00111101101000000111011011000001,
	parameter in_weight51 = 32'b00111100010110001110001010111000,
	parameter in_weight52 = 32'b10111101000000101100111111001101,
	parameter in_weight53 = 32'b00111101010000110011101100011001,
	parameter in_weight54 = 32'b10111100011000110111010101100001,
	parameter in_weight55 = 32'b10111101100011000111100101110110,
	parameter in_weight56 = 32'b00111101100110001110111111101000,
	parameter in_weight57 = 32'b00111100100100010110101010100110,
	parameter in_weight58 = 32'b00111100110101110001101010101110,
	parameter in_weight59 = 32'b00111011110100010000101001010101,
	parameter in_weight60 = 32'b10111101000010110100101101000111,
	parameter in_weight61 = 32'b00111100100000001111111000010001,
	parameter in_weight62 = 32'b00111101100101110010011010110111,
	parameter in_weight63 = 32'b00111101000101110000011100110000,
	parameter in_weight64 = 32'b10111101001101110101001111001110,
	parameter in_weight65 = 32'b10111101001010011111001011000011,
	parameter in_weight66 = 32'b10111101101010110000100000011101,
	parameter in_weight67 = 32'b00111101011001110001000011010111,
	parameter in_weight68 = 32'b10111100000011001011111111011001,
	parameter in_weight69 = 32'b10111100010110000010011011000001,
	parameter in_weight70 = 32'b10111011010011110100011011001100,
	parameter in_weight71 = 32'b10111011100011101001001111010110,
	parameter in_weight72 = 32'b10111100111101000100011100101110,
	parameter in_weight73 = 32'b00111100100100100110010001110111,
	parameter in_weight74 = 32'b00111101000010100110010000110001,
	parameter in_weight75 = 32'b10111101011110101011001001000101,
	parameter in_weight76 = 32'b10111100110111011101011001110101,
	parameter in_weight77 = 32'b10111101000110101110111000000111,
	parameter in_weight78 = 32'b10111100100011110011100111010001,
	parameter in_weight79 = 32'b00111101100010011111010001101010,
	parameter in_weight80 = 32'b10111100111111001100010001101001,
	parameter in_weight81 = 32'b10111101100110011101001100011101,
	parameter in_weight82 = 32'b10111100100000001000101000001111,
	parameter in_weight83 = 32'b10111100001111010000010010001101,
	parameter in_weight84 = 32'b10111101101000110011101001000010,
	parameter in_weight85 = 32'b10111101011010100111111001011101,
	parameter in_weight86 = 32'b00111101100010110010100001011000,
	parameter in_weight87 = 32'b00111101100011011111100010101001,
	parameter in_weight88 = 32'b10111101011011001101001001100001,
	parameter in_weight89 = 32'b00111101010100001000110100000100,
	parameter in_weight90 = 32'b00111101100010011000011010110111,
	parameter in_weight91 = 32'b10111100111011100110110101111110,
	parameter in_weight92 = 32'b00111101010110111111111111011110,
	parameter in_weight93 = 32'b00111101011101110000010001011011,
	parameter in_weight94 = 32'b10111100100010110110010000111111,
	parameter in_weight95 = 32'b10111101000100101111011101100001,
	parameter in_weight96 = 32'b10111101011011111110100001000010,
	parameter in_weight97 = 32'b00111101001100011110001001001001,
	parameter in_weight98 = 32'b00111101100100010000101011110011,
	parameter in_weight99 = 32'b10111101100010001001010011010110,
	parameter in_weight100 = 32'b00111100101010101001100100010011,
	parameter in_weight101 = 32'b00111101101000000011010010001111,
	parameter in_weight102 = 32'b10111100001001101001100111000010,
	parameter in_weight103 = 32'b00111100111010110010100000100110,
	parameter in_weight104 = 32'b00111101101000011101010000001011,
	parameter in_weight105 = 32'b00111101100011001011000010000000,
	parameter in_weight106 = 32'b10111101101000100011001101111111,
	parameter in_weight107 = 32'b00111100111111011111110001111111,
	parameter in_weight108 = 32'b00111101100100110000010101110000,
	parameter in_weight109 = 32'b10111101001101101010101010011111,
	parameter in_weight110 = 32'b00111101100100111101111000000001,
	parameter in_weight111 = 32'b10111100111000111100110010011000,
	parameter in_weight112 = 32'b00111101101000011011110111110101,
	parameter in_weight113 = 32'b00111101000000010110001110100010,
	parameter in_weight114 = 32'b10111101100100100011110110111100,
	parameter in_weight115 = 32'b00111100110110000011110100010110,
	parameter in_weight116 = 32'b10111101011000101011110001111100,
	parameter in_weight117 = 32'b10111100100000100000110110010100,
	parameter in_weight118 = 32'b10111101101010000110110000100011,
	parameter in_weight119 = 32'b10111101101000101001011010110110,
	parameter in_weight120 = 32'b00111100101111100001111110110001,
	parameter in_weight121 = 32'b10111011100001000110101000000000,
	parameter in_weight122 = 32'b00111000010000010011110101110000,
	parameter in_weight123 = 32'b10111101101001101010110111000010,
	parameter in_weight124 = 32'b00111101001100010010101000010011,
	parameter in_weight125 = 32'b10111101001011101000010001101101,
	parameter in_weight126 = 32'b10111101100011100101101101110111,
	parameter in_weight127 = 32'b00111100000111101110001100110100,
	parameter in_weight128 = 32'b00111101001000001110010001110100,
	parameter in_weight129 = 32'b10111101000100110100011110110111,
	parameter in_weight130 = 32'b00111101011011100100010001011111,
	parameter in_weight131 = 32'b00111101010110010111010110100000,
	parameter in_weight132 = 32'b10111100010110101000010011000100,
	parameter in_weight133 = 32'b10111101000111010011110101100110,
	parameter in_weight134 = 32'b00111101000001101111110001100001,
	parameter in_weight135 = 32'b00111101101001101000001011101010,
	parameter in_weight136 = 32'b00111101101100001101011111100010,
	parameter in_weight137 = 32'b00111101000010010001101100011011,
	parameter in_weight138 = 32'b00111101010011000000111110110110,
	parameter in_weight139 = 32'b00111101101100010111000010010010,
	parameter in_weight140 = 32'b10111100010000010111100000110010,
	parameter in_weight141 = 32'b00111101100101110111100000011010,
	parameter in_weight142 = 32'b10111101000010001111001000100011,
	parameter in_weight143 = 32'b10111101001011100111010100111011,
	parameter in_weight144 = 32'b10111100101011111010110101110010,
	parameter in_weight145 = 32'b00111100111110010011110111111100,
	parameter in_weight146 = 32'b10111010101100011111001101110011,
	parameter in_weight147 = 32'b10111100101111101111100010001110,
	parameter in_weight148 = 32'b10111100001000000010011100111001,
	parameter in_weight149 = 32'b10111101101001001110010101011100,
	parameter in_weight150 = 32'b00111100111010100000111110101000,
	parameter in_weight151 = 32'b00111101010011011111110011000010,
	parameter in_weight152 = 32'b10111101100110111100010111110000,
	parameter in_weight153 = 32'b10111101001100010100110101101001,
	parameter in_weight154 = 32'b00111101011000000000000010000101,
	parameter in_weight155 = 32'b10111010010101001110011100001010,
	parameter in_weight156 = 32'b00111101000100110110110001100101,
	parameter in_weight157 = 32'b10111101001101111010000111100111,
	parameter in_weight158 = 32'b10111101010111111000110110101011,
	parameter in_weight159 = 32'b00111100101100011111001001100000,
	parameter in_weight160 = 32'b00111101101001011001100100010000,
	parameter in_weight161 = 32'b00111100111101011111011100010111,
	parameter in_weight162 = 32'b00111101001101001000110001001011,
	parameter in_weight163 = 32'b10111011100111100100001011101101,
	parameter in_weight164 = 32'b10111101011100110010111001000011,
	parameter in_weight165 = 32'b10111101001110110010001011110010,
	parameter in_weight166 = 32'b00111100101101000101011000111010,
	parameter in_weight167 = 32'b00111100000000001101010101101100,
	parameter in_weight168 = 32'b10111011111111000100100100110111,
	parameter in_weight169 = 32'b00111101100000001010011100010111,
	parameter in_weight170 = 32'b10111101100111111110000101101101,
	parameter in_weight171 = 32'b10111101100001001110000111001010,
	parameter in_weight172 = 32'b00111100110100011010110010010010,
	parameter in_weight173 = 32'b00111101100100111000001110011111,
	parameter in_weight174 = 32'b00111101100001010101101001101000,
	parameter in_weight175 = 32'b00111101101011111011110001000101,
	parameter in_weight176 = 32'b00111101100110011010101110000011,
	parameter in_weight177 = 32'b00111101100001010101001111100101,
	parameter in_weight178 = 32'b10111101010011100010010100100101,
	parameter in_weight179 = 32'b00111101000010110010101000000000,
	parameter in_weight180 = 32'b00111011101110011000010001010101,
	parameter in_weight181 = 32'b10111011010011011011001101110111,
	parameter in_weight182 = 32'b10111010000010111101100011011001,
	parameter in_weight183 = 32'b10111101000100011110011101111010,
	parameter in_weight184 = 32'b10111100110000110110011110001100,
	parameter in_weight185 = 32'b10111100110010000000011010110101,
	parameter in_weight186 = 32'b10111101000001110010100000001101,
	parameter in_weight187 = 32'b10111100100111110111010001010110,
	parameter in_weight188 = 32'b00111011111001101011101111001010,
	parameter in_weight189 = 32'b10111011010111001011001100101001,
	parameter in_weight190 = 32'b00111101000101110101100001111000,
	parameter in_weight191 = 32'b00111101101000000010000001011100,
	parameter in_weight192 = 32'b00111101000101101010010011010001,
	parameter in_weight193 = 32'b00111101101000101011111001010111,
	parameter in_weight194 = 32'b10111100111000110111110100101011,
	parameter in_weight195 = 32'b10111100011010111101100000001000,
	parameter in_weight196 = 32'b00111000100110100101000001010011,
	parameter in_weight197 = 32'b00111100111001111011001110011100,
	parameter in_weight198 = 32'b10111100110111110000011111110101,
	parameter in_weight199 = 32'b10111101000011000000001001100101,
	parameter in_weight200 = 32'b10111101010010010011010001101111,
	parameter in_weight201 = 32'b10111100011001111100010011101111,
	parameter in_weight202 = 32'b10111101010000111011110101101000,
	parameter in_weight203 = 32'b00111100110001111111011101011111,
	parameter in_weight204 = 32'b10111101011011001011110100000110,
	parameter in_weight205 = 32'b10111011100100011100110001001011,
	parameter in_weight206 = 32'b00111101010101001101110100111010,
	parameter in_weight207 = 32'b00111101000101111101101111011000,
	parameter in_weight208 = 32'b10111101000111110000001101011101,
	parameter in_weight209 = 32'b10111101000101000111100100110111,
	parameter in_weight210 = 32'b10111011011000010110010100011111,
	parameter in_weight211 = 32'b00111101100010000110010100100010,
	parameter in_weight212 = 32'b10111101000100000111011000110101,
	parameter in_weight213 = 32'b00111101001111000011111100100111,
	parameter in_weight214 = 32'b00111100110110001110011000000101,
	parameter in_weight215 = 32'b10111101010100100101111000011000,
	parameter in_weight216 = 32'b00111101000010101001100100011010,
	parameter in_weight217 = 32'b10111101010110001111110100010001,
	parameter in_weight218 = 32'b00111101101001111101100000101100,
	parameter in_weight219 = 32'b10111101100111001011110000100001,
	parameter in_weight220 = 32'b10111100100100101010010110110001,
	parameter in_weight221 = 32'b10111101011101000001001110000100,
	parameter in_weight222 = 32'b10111100111110101100010101000010,
	parameter in_weight223 = 32'b00111101100111001111110101110110,
	parameter in_weight224 = 32'b00111101010010100011110010000011,
	parameter in_weight225 = 32'b10111101000000100011101110111100,
	parameter in_weight226 = 32'b10111101011101110001001000001100,
	parameter in_weight227 = 32'b10111101100001010000010011110001,
	parameter in_weight228 = 32'b00111101000111011100010001101011,
	parameter in_weight229 = 32'b10111100000010001110010110101100,
	parameter in_weight230 = 32'b10111101100011011111111100111001,
	parameter in_weight231 = 32'b00111101100010011101000111000110,
	parameter in_weight232 = 32'b10111101100000101110001101101000,
	parameter in_weight233 = 32'b10111101010010101111011001011110,
	parameter in_weight234 = 32'b10111101101000010010011001100010,
	parameter in_weight235 = 32'b10111011001010010100110100101010,
	parameter in_weight236 = 32'b10111101101001110000110111110011,
	parameter in_weight237 = 32'b00111100011111001010100001001010,
	parameter in_weight238 = 32'b10111101000100010001100101001011,
	parameter in_weight239 = 32'b10111101010110111011111001011000,
	parameter in_weight240 = 32'b00111101001100010001101001001110,
	parameter in_weight241 = 32'b10111101000100001101110100000110,
	parameter in_weight242 = 32'b10111100001011101110001111110100,
	parameter in_weight243 = 32'b00111101000010100101001000011010,
	parameter in_weight244 = 32'b00111101011110100110100110101010,
	parameter in_weight245 = 32'b10111101010101100000100101000100,
	parameter in_weight246 = 32'b10111101010010001011100000011000,
	parameter in_weight247 = 32'b10111101011001001111101000001001,
	parameter in_weight248 = 32'b10111100001000100010001100001110,
	parameter in_weight249 = 32'b10111100110110111111101011011111,
	parameter in_weight250 = 32'b00111101011110010101000001110001,
	parameter in_weight251 = 32'b00111100110001101001010101000110,
	parameter in_weight252 = 32'b00111011101011011001001010011000,
	parameter in_weight253 = 32'b10111101001101110101010111111010,
	parameter in_weight254 = 32'b10111100111110101100111001110011,
	parameter in_weight255 = 32'b00111101010111001000100100110011,
	parameter in_weight256 = 32'b00111101011011110010111000110111,
	parameter in_weight257 = 32'b00111101100101110101100110101111,
	parameter in_weight258 = 32'b00111101000010001001110110001011,
	parameter in_weight259 = 32'b10111101100000111011111011000100,
	parameter in_weight260 = 32'b10111100111100101111110010010101,
	parameter in_weight261 = 32'b00111101100010110001110010000001,
	parameter in_weight262 = 32'b10111101101000100001100000101011,
	parameter in_weight263 = 32'b00111100111001100111111011111001,
	parameter in_weight264 = 32'b10111101101001100110111111110111,
	parameter in_weight265 = 32'b00111100110101100011100111110100,
	parameter in_weight266 = 32'b00111101000110001111000000110011,
	parameter in_weight267 = 32'b10111101011100100010101010010101,
	parameter in_weight268 = 32'b10111101000001110111000101010110,
	parameter in_weight269 = 32'b10111101100101111010110110110010,
	parameter in_weight270 = 32'b00111101000010110110001111001110,
	parameter in_weight271 = 32'b10111100111011001001000001111101,
	parameter in_weight272 = 32'b10111011100101100011010111101101,
	parameter in_weight273 = 32'b00111101010000000000100111001010,
	parameter in_weight274 = 32'b10111100000010001001001000111100,
	parameter in_weight275 = 32'b00111101010011001101001100110010,
	parameter in_weight276 = 32'b10111100100100001111100010110110,
	parameter in_weight277 = 32'b10111100011110011111111110111101,
	parameter in_weight278 = 32'b00111100110000111010100010110000,
	parameter in_weight279 = 32'b10111101010000100111000110111000,
	parameter in_weight280 = 32'b00111100011000000011000100110011,
	parameter in_weight281 = 32'b00111101011100111011011010111110,
	parameter in_weight282 = 32'b10111100101011101111101001101001,
	parameter in_weight283 = 32'b10111101000011011100001010011101,
	parameter in_weight284 = 32'b00111101001011111000010011101100,
	parameter in_weight285 = 32'b10111010000100101010011111111010,
	parameter in_weight286 = 32'b10111100001000101100011000101110,
	parameter in_weight287 = 32'b10111101010000011111100110111110
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
