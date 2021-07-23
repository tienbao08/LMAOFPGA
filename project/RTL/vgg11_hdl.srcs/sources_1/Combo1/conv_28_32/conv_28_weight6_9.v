`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name: 
// Module Name: conv_28_weight6_9
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


module conv_28_weight6_9
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28,
    parameter in_weight0 = 32'b00111101010100010100011011011111,
	parameter in_weight1 = 32'b10111101001100111000000101010110,
	parameter in_weight2 = 32'b10111100100100001000010000001000,
	parameter in_weight3 = 32'b00111100000001010001101001010101,
	parameter in_weight4 = 32'b00111101101000010000001101110001,
	parameter in_weight5 = 32'b10111101100100101010100100000100,
	parameter in_weight6 = 32'b00111101001000101000001010000011,
	parameter in_weight7 = 32'b10111101010010011001010010001010,
	parameter in_weight8 = 32'b00111101011010000110110010001110,
	parameter in_weight9 = 32'b10111101011111111110000100100100,
	parameter in_weight10 = 32'b00111001111100100001011111010011,
	parameter in_weight11 = 32'b00111100000110010111001111101101,
	parameter in_weight12 = 32'b00111101011000011111010111111110,
	parameter in_weight13 = 32'b10111101010110100101100111100010,
	parameter in_weight14 = 32'b00111101010110101111110001010011,
	parameter in_weight15 = 32'b00111101100110101101001111001100,
	parameter in_weight16 = 32'b00111101100001001110100000101001,
	parameter in_weight17 = 32'b00111101000101111101000110001011,
	parameter in_weight18 = 32'b00111101001011111101011100110010,
	parameter in_weight19 = 32'b00111100101000011011000111001111,
	parameter in_weight20 = 32'b00111100110011010100110011101001,
	parameter in_weight21 = 32'b00111101100100010111000100111101,
	parameter in_weight22 = 32'b00111101011000011011101000101000,
	parameter in_weight23 = 32'b00111101011111110101011110000000,
	parameter in_weight24 = 32'b00111101011111111111001110100010,
	parameter in_weight25 = 32'b10111100111010111110001011010100,
	parameter in_weight26 = 32'b10111101100110000010001101011100,
	parameter in_weight27 = 32'b10111101000011101001000111110110,
	parameter in_weight28 = 32'b10111101100011110110001001101110,
	parameter in_weight29 = 32'b00111101011101001111110011001010,
	parameter in_weight30 = 32'b00111101001000011101110011010100,
	parameter in_weight31 = 32'b00111100111111001101111010011000,
	parameter in_weight32 = 32'b00111101100011100100001111010111,
	parameter in_weight33 = 32'b10111101100011110011101101101101,
	parameter in_weight34 = 32'b10111100010110101001101110111001,
	parameter in_weight35 = 32'b10111010110010010001011111000000,
	parameter in_weight36 = 32'b10111101011110011111001010011001,
	parameter in_weight37 = 32'b00111100011011110100111011010000,
	parameter in_weight38 = 32'b00111100101101110001100101000001,
	parameter in_weight39 = 32'b00111101010101111010000101011111,
	parameter in_weight40 = 32'b10111101100010100101110011100001,
	parameter in_weight41 = 32'b00111100101001101111000010110010,
	parameter in_weight42 = 32'b10111101011110000000111000110110,
	parameter in_weight43 = 32'b10111011110010100001101001101111,
	parameter in_weight44 = 32'b00111101011110011111001000011000,
	parameter in_weight45 = 32'b00111101010001111010111100011101,
	parameter in_weight46 = 32'b00111101000111000101111101100100,
	parameter in_weight47 = 32'b00111100101011011010110010111010,
	parameter in_weight48 = 32'b00111101100011100000010110011101,
	parameter in_weight49 = 32'b10111101101011010101011011011000,
	parameter in_weight50 = 32'b00111101010111011110110110010100,
	parameter in_weight51 = 32'b00111100101010100100000001101000,
	parameter in_weight52 = 32'b10111011000000001000101110101010,
	parameter in_weight53 = 32'b10111101000001101010100011001010,
	parameter in_weight54 = 32'b00111100100010000101101100001100,
	parameter in_weight55 = 32'b10111101100111000101010010110011,
	parameter in_weight56 = 32'b00111101100000000101100110110001,
	parameter in_weight57 = 32'b10111101001101000111100101010001,
	parameter in_weight58 = 32'b00111101010000110001111101000110,
	parameter in_weight59 = 32'b10111100101000011011111100111010,
	parameter in_weight60 = 32'b10111100110100111001011100000010,
	parameter in_weight61 = 32'b10111101010000000110111110100001,
	parameter in_weight62 = 32'b00111101000101100001111100111101,
	parameter in_weight63 = 32'b00111101001000100011101111111010,
	parameter in_weight64 = 32'b00111100100000100101110101000100,
	parameter in_weight65 = 32'b10111011111110110001010001110110,
	parameter in_weight66 = 32'b00111011110001001100010100101011,
	parameter in_weight67 = 32'b10111011100000111100000111110011,
	parameter in_weight68 = 32'b10111100001001010011101100110100,
	parameter in_weight69 = 32'b10111100101101111110111011011111,
	parameter in_weight70 = 32'b10111101100001101000011110010100,
	parameter in_weight71 = 32'b10111101000010011011000011100001,
	parameter in_weight72 = 32'b00111100111110011110011111111111,
	parameter in_weight73 = 32'b00111100100100100101101100011111,
	parameter in_weight74 = 32'b10111101010000101101011100101001,
	parameter in_weight75 = 32'b00111101100100110101101001010100,
	parameter in_weight76 = 32'b00111100110001110001001000010011,
	parameter in_weight77 = 32'b00111101000100111001010001001010,
	parameter in_weight78 = 32'b10111100000010100110101111000001,
	parameter in_weight79 = 32'b00111011011010101111111101101110,
	parameter in_weight80 = 32'b00111101100111001001110000000111,
	parameter in_weight81 = 32'b00111100000000111001011010000101,
	parameter in_weight82 = 32'b00111101000100110000100010011001,
	parameter in_weight83 = 32'b00111100010010101011110001010111,
	parameter in_weight84 = 32'b10111101100100110110011001110110,
	parameter in_weight85 = 32'b00111100101100110111001001011000,
	parameter in_weight86 = 32'b00111101100111111100110100010110,
	parameter in_weight87 = 32'b10111100110001110100010100100110,
	parameter in_weight88 = 32'b10111100111100000010011111010010,
	parameter in_weight89 = 32'b10111101011011111111111100110001,
	parameter in_weight90 = 32'b10111101100101001101101101011011,
	parameter in_weight91 = 32'b10111101100111011010010010111111,
	parameter in_weight92 = 32'b10111101001000010001011101001101,
	parameter in_weight93 = 32'b10111101011000110100000001101000,
	parameter in_weight94 = 32'b00111101100000001001100011010111,
	parameter in_weight95 = 32'b00111101011010001101111001011000,
	parameter in_weight96 = 32'b10111101011110111110000000111101,
	parameter in_weight97 = 32'b10111101011100010101101000000111,
	parameter in_weight98 = 32'b10111011110011001111111111010101,
	parameter in_weight99 = 32'b00111101000001010100010011111001,
	parameter in_weight100 = 32'b10111100011000101000001000011001,
	parameter in_weight101 = 32'b00111101100001000001000111011100,
	parameter in_weight102 = 32'b00111011000101110010011101011110,
	parameter in_weight103 = 32'b10111101100000101100000011110111,
	parameter in_weight104 = 32'b10111101001001010001010111110111,
	parameter in_weight105 = 32'b00111011001101000111010100010110,
	parameter in_weight106 = 32'b00111101000001001001001011011010,
	parameter in_weight107 = 32'b00111101010011110111100011010001,
	parameter in_weight108 = 32'b10111100100111001100000000111011,
	parameter in_weight109 = 32'b00111101100101011101101011101101,
	parameter in_weight110 = 32'b10111101010011110000110000110110,
	parameter in_weight111 = 32'b00111101100010100101101010010100,
	parameter in_weight112 = 32'b10111100011110110101000011111000,
	parameter in_weight113 = 32'b10111101001111100010111111100100,
	parameter in_weight114 = 32'b10111101100000001010101101000010,
	parameter in_weight115 = 32'b10111101011011001111001111101000,
	parameter in_weight116 = 32'b00111011001111011110010110111011,
	parameter in_weight117 = 32'b00111101010100001100001101100111,
	parameter in_weight118 = 32'b10111011100010101000101010001010,
	parameter in_weight119 = 32'b00111101000001101000001100110110,
	parameter in_weight120 = 32'b10111101001001111010010100001101,
	parameter in_weight121 = 32'b10111100110100000110011001011111,
	parameter in_weight122 = 32'b00111101001100110010011000101100,
	parameter in_weight123 = 32'b10111101000010011100100100100100,
	parameter in_weight124 = 32'b10111101010110011000011001101100,
	parameter in_weight125 = 32'b00111100111110101001001111111110,
	parameter in_weight126 = 32'b10111101001010111111111000000000,
	parameter in_weight127 = 32'b10111011001000100110000101000101,
	parameter in_weight128 = 32'b00111101100101111101000001010001,
	parameter in_weight129 = 32'b00111100101001001000100101111101,
	parameter in_weight130 = 32'b10111101100000110110010110111110,
	parameter in_weight131 = 32'b10111101101010000101101011011001,
	parameter in_weight132 = 32'b00111100110101010101010010011011,
	parameter in_weight133 = 32'b00111100100110011010111101100011,
	parameter in_weight134 = 32'b10111101011011111010010100101010,
	parameter in_weight135 = 32'b00111101001001000100011101100011,
	parameter in_weight136 = 32'b00111101011011001111010100110111,
	parameter in_weight137 = 32'b00111101011110001101001101001000,
	parameter in_weight138 = 32'b10111101000001011110101001101110,
	parameter in_weight139 = 32'b00111101011111000000000010111011,
	parameter in_weight140 = 32'b10111100000011010011000110111101,
	parameter in_weight141 = 32'b00111100100000001110010000111010,
	parameter in_weight142 = 32'b00111011111101010111011101100011,
	parameter in_weight143 = 32'b00111101101001111110101000110111,
	parameter in_weight144 = 32'b10111101001100100011110111101010,
	parameter in_weight145 = 32'b10111101011111001100111111001011,
	parameter in_weight146 = 32'b10111101001001011001100101111010,
	parameter in_weight147 = 32'b10111100100011010010100000011100,
	parameter in_weight148 = 32'b00111100110110100101000100111100,
	parameter in_weight149 = 32'b10111101000000001010100011011001,
	parameter in_weight150 = 32'b00111101000000010110101101000111,
	parameter in_weight151 = 32'b10111101010101011100101011111000,
	parameter in_weight152 = 32'b00111100010110011001011000011000,
	parameter in_weight153 = 32'b10111101100101101110111111011100,
	parameter in_weight154 = 32'b00111100011000111001111100001010,
	parameter in_weight155 = 32'b10111100101000111010001101101010,
	parameter in_weight156 = 32'b10111100000001001111111001111011,
	parameter in_weight157 = 32'b10111100100110100000000001001011,
	parameter in_weight158 = 32'b10111011101000111101111000000101,
	parameter in_weight159 = 32'b00111101010011100011011101001011,
	parameter in_weight160 = 32'b00111101100101010111110111011111,
	parameter in_weight161 = 32'b00111011111011011000100110010000,
	parameter in_weight162 = 32'b10111100101100101011111000001000,
	parameter in_weight163 = 32'b00111100101100110010100101001100,
	parameter in_weight164 = 32'b10111101001001101011101101110110,
	parameter in_weight165 = 32'b10111100100100111000110010110100,
	parameter in_weight166 = 32'b10111011110000010110100111000000,
	parameter in_weight167 = 32'b10111100001100101010101001101100,
	parameter in_weight168 = 32'b00111101010111100111000101010100,
	parameter in_weight169 = 32'b10111101001000101110111000000101,
	parameter in_weight170 = 32'b10111101001100101001010100011010,
	parameter in_weight171 = 32'b10111101100001111011101011100010,
	parameter in_weight172 = 32'b00111101011101000110110010000001,
	parameter in_weight173 = 32'b00111101100110011111010000010101,
	parameter in_weight174 = 32'b00111101100001101011100011010101,
	parameter in_weight175 = 32'b00111101011010111101110110000110,
	parameter in_weight176 = 32'b00111101011011000101011101111011,
	parameter in_weight177 = 32'b00111101100010100010111100110101,
	parameter in_weight178 = 32'b00111101101001100000011100001111,
	parameter in_weight179 = 32'b10111101010101111110000101010010,
	parameter in_weight180 = 32'b10111100101101010001011011111010,
	parameter in_weight181 = 32'b00111100101010110000010110011110,
	parameter in_weight182 = 32'b00111101100001111100010100110111,
	parameter in_weight183 = 32'b00111101101000001101101101100101,
	parameter in_weight184 = 32'b10111100101111010111010001000100,
	parameter in_weight185 = 32'b10111100101000111010100110011111,
	parameter in_weight186 = 32'b10111101001011100110000010110100,
	parameter in_weight187 = 32'b00111101101000110001011000011101,
	parameter in_weight188 = 32'b00111100100111000001001100000001,
	parameter in_weight189 = 32'b00111101001011001100100101111111,
	parameter in_weight190 = 32'b10111101000100110001111100100000,
	parameter in_weight191 = 32'b10111011011011010010111010100101,
	parameter in_weight192 = 32'b10111101010101000000011101101000,
	parameter in_weight193 = 32'b10111100111000101110110000000110,
	parameter in_weight194 = 32'b00111101001110101010001100110010,
	parameter in_weight195 = 32'b00111101000101111010110101100110,
	parameter in_weight196 = 32'b00111100111100001001000100100111,
	parameter in_weight197 = 32'b10111101010000110001110011101000,
	parameter in_weight198 = 32'b10111100001100000111101101001101,
	parameter in_weight199 = 32'b00111011101011110001110000001111,
	parameter in_weight200 = 32'b00111101100101111100111111100010,
	parameter in_weight201 = 32'b10111101000110000111110111001000,
	parameter in_weight202 = 32'b00111100110101000111100010000001,
	parameter in_weight203 = 32'b00111101100101101100110110010011,
	parameter in_weight204 = 32'b00111101100110011001001101000010,
	parameter in_weight205 = 32'b00111101101010011100001011010000,
	parameter in_weight206 = 32'b10111101011101110000100111101111,
	parameter in_weight207 = 32'b10111101010100011001100001110011,
	parameter in_weight208 = 32'b10111101100001010000000000110001,
	parameter in_weight209 = 32'b00111100010010011011100010101001,
	parameter in_weight210 = 32'b00111101100100100001000011010111,
	parameter in_weight211 = 32'b10111100101101011010100100001100,
	parameter in_weight212 = 32'b10111011111101101000001100011110,
	parameter in_weight213 = 32'b00111101100111111001110100001110,
	parameter in_weight214 = 32'b00111101010110011111011011111101,
	parameter in_weight215 = 32'b10111101011101010000011001000001,
	parameter in_weight216 = 32'b00111101010110110110000000110010,
	parameter in_weight217 = 32'b10111101010110110001010110100111,
	parameter in_weight218 = 32'b10111101000001010010100111101010,
	parameter in_weight219 = 32'b00111011100000111001111100000111,
	parameter in_weight220 = 32'b10111101100100111100001101111110,
	parameter in_weight221 = 32'b10111100101000101110111000011111,
	parameter in_weight222 = 32'b10111101100011110011001111101000,
	parameter in_weight223 = 32'b00111101011101111101000000100111,
	parameter in_weight224 = 32'b10111101100110011100011010101000,
	parameter in_weight225 = 32'b10111101100010001010011110111010,
	parameter in_weight226 = 32'b00111100110111011100111001010101,
	parameter in_weight227 = 32'b00111100111100001101101111001110,
	parameter in_weight228 = 32'b10111100100111111110100111100011,
	parameter in_weight229 = 32'b00111101001010000010000111110101,
	parameter in_weight230 = 32'b00111101010110011011010001001101,
	parameter in_weight231 = 32'b00111101100110101001110000111000,
	parameter in_weight232 = 32'b00111100101111100001000001100010,
	parameter in_weight233 = 32'b00111101010111111111110100001000,
	parameter in_weight234 = 32'b00111101101011001100010100110100,
	parameter in_weight235 = 32'b10111101011101010111100111000001,
	parameter in_weight236 = 32'b10111101100011011111101001100111,
	parameter in_weight237 = 32'b10111100000100010011110010100011,
	parameter in_weight238 = 32'b00111100101011110110101100110010,
	parameter in_weight239 = 32'b10111101100110101111011011011010,
	parameter in_weight240 = 32'b10111100110101100111001010101000,
	parameter in_weight241 = 32'b00111100001111010001100111101111,
	parameter in_weight242 = 32'b00111100101000011101001110101100,
	parameter in_weight243 = 32'b00111100110010000101011001001010,
	parameter in_weight244 = 32'b00111101001100110010010001100010,
	parameter in_weight245 = 32'b10111101000011111100000101110011,
	parameter in_weight246 = 32'b10111001110011000111010011011110,
	parameter in_weight247 = 32'b00111101010100010100011010111101,
	parameter in_weight248 = 32'b00111101010110111110001111101110,
	parameter in_weight249 = 32'b10111011111101001011111100010010,
	parameter in_weight250 = 32'b10111100010110100001100110010111,
	parameter in_weight251 = 32'b10111010010011011101000010100101,
	parameter in_weight252 = 32'b00111100101100000101010110101110,
	parameter in_weight253 = 32'b00111101011010000110011110001111,
	parameter in_weight254 = 32'b10111100110000111001111001000111,
	parameter in_weight255 = 32'b10111100100000110101000000101011,
	parameter in_weight256 = 32'b10111010010111001010000011001110,
	parameter in_weight257 = 32'b10111100111110100001110010000101,
	parameter in_weight258 = 32'b00111101000010010101101010011011,
	parameter in_weight259 = 32'b10111101001110110011111100010011,
	parameter in_weight260 = 32'b10111100001111100110101100101101,
	parameter in_weight261 = 32'b10111101101001100101010100100011,
	parameter in_weight262 = 32'b00111101100000111000100001000011,
	parameter in_weight263 = 32'b10111101101000110010101011011111,
	parameter in_weight264 = 32'b00111101000101001000011100100011,
	parameter in_weight265 = 32'b10111100111100111000110011110001,
	parameter in_weight266 = 32'b10111101001111111101011010111101,
	parameter in_weight267 = 32'b10111101101000101011001100000000,
	parameter in_weight268 = 32'b10111100110101000100111000010010,
	parameter in_weight269 = 32'b10111101100000011111001110110001,
	parameter in_weight270 = 32'b10111101101000010100100000100000,
	parameter in_weight271 = 32'b00111101001001101111110000000110,
	parameter in_weight272 = 32'b00111101010100011010001001101110,
	parameter in_weight273 = 32'b10111101011101000010110110111011,
	parameter in_weight274 = 32'b10111011101010111100100111000000,
	parameter in_weight275 = 32'b00111100111101100011010111001101,
	parameter in_weight276 = 32'b00111101100010011000000101010000,
	parameter in_weight277 = 32'b00111100101010100000111000011011,
	parameter in_weight278 = 32'b10111101010000111010011010101100,
	parameter in_weight279 = 32'b00111101001011110011111001100101,
	parameter in_weight280 = 32'b00111100111011000101111111011100,
	parameter in_weight281 = 32'b00111011111000110111010101110101,
	parameter in_weight282 = 32'b00111101001011011010101011000011,
	parameter in_weight283 = 32'b00111011100100110110010010011100,
	parameter in_weight284 = 32'b00111100110010011101011010010001,
	parameter in_weight285 = 32'b00111101001100000101000100001110,
	parameter in_weight286 = 32'b00111101100010001011100001101001,
	parameter in_weight287 = 32'b10111101011000001111011101001100
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
