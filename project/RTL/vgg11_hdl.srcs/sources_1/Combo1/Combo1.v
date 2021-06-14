module Combo1
#(
	parameter DATA_WIDTH = 32
)
(	
	input clk, reset,
	input [DATA_WIDTH-1:0] red_in,
	input [DATA_WIDTH-1:0] green_in,
	input [DATA_WIDTH-1:0] blue_in,
	
	output [DATA_WIDTH-1:0] out0,
	output [DATA_WIDTH-1:0] out1,
	output [DATA_WIDTH-1:0] out2,
	output [DATA_WIDTH-1:0] out3,
	output [DATA_WIDTH-1:0] out4,
	output [DATA_WIDTH-1:0] out5,
	output [DATA_WIDTH-1:0] out6,
	output [DATA_WIDTH-1:0] out7,
	output [DATA_WIDTH-1:0] out8,
	output [DATA_WIDTH-1:0] out9,
	output [DATA_WIDTH-1:0] out10,
	output [DATA_WIDTH-1:0] out11,
	output [DATA_WIDTH-1:0] out12,
	output [DATA_WIDTH-1:0] out13,
	output [DATA_WIDTH-1:0] out14,
	output [DATA_WIDTH-1:0] out15,
	output [DATA_WIDTH-1:0] out16,
	output [DATA_WIDTH-1:0] out17,
	output [DATA_WIDTH-1:0] out18,
	output [DATA_WIDTH-1:0] out19,
	output [DATA_WIDTH-1:0] out20,
	output [DATA_WIDTH-1:0] out21,
	output [DATA_WIDTH-1:0] out22,
	output [DATA_WIDTH-1:0] out23,
	output [DATA_WIDTH-1:0] out24,
	output [DATA_WIDTH-1:0] out25,
	output [DATA_WIDTH-1:0] out26,
	output [DATA_WIDTH-1:0] out27,
	output [DATA_WIDTH-1:0] out28,
	output [DATA_WIDTH-1:0] out29,
	output [DATA_WIDTH-1:0] out30,
	output [DATA_WIDTH-1:0] out31,
	output [DATA_WIDTH-1:0] out32,
	output [DATA_WIDTH-1:0] out33,
	output [DATA_WIDTH-1:0] out34,
	output [DATA_WIDTH-1:0] out35,
	output [DATA_WIDTH-1:0] out36,
	output [DATA_WIDTH-1:0] out37,
	output [DATA_WIDTH-1:0] out38,
	output [DATA_WIDTH-1:0] out39,
	output [DATA_WIDTH-1:0] out40,
	output [DATA_WIDTH-1:0] out41,
	output [DATA_WIDTH-1:0] out42,
	output [DATA_WIDTH-1:0] out43,
	output [DATA_WIDTH-1:0] out44,
	output [DATA_WIDTH-1:0] out45,
	output [DATA_WIDTH-1:0] out46,
	output [DATA_WIDTH-1:0] out47,
	output [DATA_WIDTH-1:0] out48,
	output [DATA_WIDTH-1:0] out49,
	output [DATA_WIDTH-1:0] out50,
	output [DATA_WIDTH-1:0] out51,
	output [DATA_WIDTH-1:0] out52,
	output [DATA_WIDTH-1:0] out53,
	output [DATA_WIDTH-1:0] out54,
	output [DATA_WIDTH-1:0] out55,
	output [DATA_WIDTH-1:0] out56,
	output [DATA_WIDTH-1:0] out57,
	output [DATA_WIDTH-1:0] out58,
	output [DATA_WIDTH-1:0] out59,
	output [DATA_WIDTH-1:0] out60,
	output [DATA_WIDTH-1:0] out61,
	output [DATA_WIDTH-1:0] out62,
	output [DATA_WIDTH-1:0] out63 
);

reg [16:0] count_clk;
wire maxPool_reset;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		count_clk = 17'd0;
	end
	else begin
		count_clk = count_clk + 1;
	end
end

assign maxPool_reset = (count_clk < 17'd226) ? 1'b1 : 0;

wire [DATA_WIDTH-1:0] red_out0,
							red_out1,
							red_out2,
							red_out3,
							red_out4,
							red_out5,
							red_out6,
							red_out7,
							red_out8,
							red_out9,
							red_out10,
							red_out11,
							red_out12,
							red_out13,
							red_out14,
							red_out15,
							red_out16,
							red_out17,
							red_out18,
							red_out19,
							red_out20,
							red_out21,
							red_out22,
							red_out23,
							red_out24,
							red_out25,
							red_out26,
							red_out27,
							red_out28,
							red_out29,
							red_out30,
							red_out31,
							red_out32,
							red_out33,
							red_out34,
							red_out35,
							red_out36,
							red_out37,
							red_out38,
							red_out39,
							red_out40,
							red_out41,
							red_out42,
							red_out43,
							red_out44,
							red_out45,
							red_out46,
							red_out47,
							red_out48,
							red_out49,
							red_out50,
							red_out51,
							red_out52,
							red_out53,
							red_out54,
							red_out55,
							red_out56,
							red_out57,
							red_out58,
							red_out59,
							red_out60,
							red_out61,
							red_out62,
							red_out63;
							
wire [DATA_WIDTH-1:0] green_out0,
							green_out1,
							green_out2,
							green_out3,
							green_out4,
							green_out5,
							green_out6,
							green_out7,
							green_out8,
							green_out9,
							green_out10,
							green_out11,
							green_out12,
							green_out13,
							green_out14,
							green_out15,
							green_out16,
							green_out17,
							green_out18,
							green_out19,
							green_out20,
							green_out21,
							green_out22,
							green_out23,
							green_out24,
							green_out25,
							green_out26,
							green_out27,
							green_out28,
							green_out29,
							green_out30,
							green_out31,
							green_out32,
							green_out33,
							green_out34,
							green_out35,
							green_out36,
							green_out37,
							green_out38,
							green_out39,
							green_out40,
							green_out41,
							green_out42,
							green_out43,
							green_out44,
							green_out45,
							green_out46,
							green_out47,
							green_out48,
							green_out49,
							green_out50,
							green_out51,
							green_out52,
							green_out53,
							green_out54,
							green_out55,
							green_out56,
							green_out57,
							green_out58,
							green_out59,
							green_out60,
							green_out61,
							green_out62,
							green_out63;

wire [DATA_WIDTH-1:0] blue_out0,
							blue_out1,
							blue_out2,
							blue_out3,
							blue_out4,
							blue_out5,
							blue_out6,
							blue_out7,
							blue_out8,
							blue_out9,
							blue_out10,
							blue_out11,
							blue_out12,
							blue_out13,
							blue_out14,
							blue_out15,
							blue_out16,
							blue_out17,
							blue_out18,
							blue_out19,
							blue_out20,
							blue_out21,
							blue_out22,
							blue_out23,
							blue_out24,
							blue_out25,
							blue_out26,
							blue_out27,
							blue_out28,
							blue_out29,
							blue_out30,
							blue_out31,
							blue_out32,
							blue_out33,
							blue_out34,
							blue_out35,
							blue_out36,
							blue_out37,
							blue_out38,
							blue_out39,
							blue_out40,
							blue_out41,
							blue_out42,
							blue_out43,
							blue_out44,
							blue_out45,
							blue_out46,
							blue_out47,
							blue_out48,
							blue_out49,
							blue_out50,
							blue_out51,
							blue_out52,
							blue_out53,
							blue_out54,
							blue_out55,
							blue_out56,
							blue_out57,
							blue_out58,
							blue_out59,
							blue_out60,
							blue_out61,
							blue_out62,
							blue_out63;

wire [DATA_WIDTH-1:0] add_out0,
							add_out1,
							add_out2,
							add_out3,
							add_out4,
							add_out5,
							add_out6,
							add_out7,
							add_out8,
							add_out9,
							add_out10,
							add_out11,
							add_out12,
							add_out13,
							add_out14,
							add_out15,
							add_out16,
							add_out17,
							add_out18,
							add_out19,
							add_out20,
							add_out21,
							add_out22,
							add_out23,
							add_out24,
							add_out25,
							add_out26,
							add_out27,
							add_out28,
							add_out29,
							add_out30,
							add_out31,
							add_out32,
							add_out33,
							add_out34,
							add_out35,
							add_out36,
							add_out37,
							add_out38,
							add_out39,
							add_out40,
							add_out41,
							add_out42,
							add_out43,
							add_out44,
							add_out45,
							add_out46,
							add_out47,
							add_out48,
							add_out49,
							add_out50,
							add_out51,
							add_out52,
							add_out53,
							add_out54,
							add_out55,
							add_out56,
							add_out57,
							add_out58,
							add_out59,
							add_out60,
							add_out61,
							add_out62,
							add_out63;


conv_224_weight0_0 
conv_224_weight0_0_inst  ( .counter(),
									.rowcounter(),
									.clk(clk),
									.rst(reset),
									.dataIn(red_in),
									.result0(red_out0),
									.result1(red_out1),
									.result2(red_out2),
									.result3(red_out3),
									.result4(red_out4),
									.result5(red_out5),
									.result6(red_out6),
									.result7(red_out7),
									.result8(red_out8),
									.result9(red_out9),
									.result10(red_out10),
									.result11(red_out11),
									.result12(red_out12),
									.result13(red_out13),
									.result14(red_out14),
									.result15(red_out15),
									.result16(red_out16),
									.result17(red_out17),
									.result18(red_out18),
									.result19(red_out19),
									.result20(red_out20),
									.result21(red_out21),
									.result22(red_out22),
									.result23(red_out23),
									.result24(red_out24),
									.result25(red_out25),
									.result26(red_out26),
									.result27(red_out27),
									.result28(red_out28),
									.result29(red_out29),
									.result30(red_out30),
									.result31(red_out31),
									.result32(red_out32),
									.result33(red_out33),
									.result34(red_out34),
									.result35(red_out35),
									.result36(red_out36),
									.result37(red_out37),
									.result38(red_out38),
									.result39(red_out39),
									.result40(red_out40),
									.result41(red_out41),
									.result42(red_out42),
									.result43(red_out43),
									.result44(red_out44),
									.result45(red_out45),
									.result46(red_out46),
									.result47(red_out47),
									.result48(red_out48),
									.result49(red_out49),
									.result50(red_out50),
									.result51(red_out51),
									.result52(red_out52),
									.result53(red_out53),
									.result54(red_out54),
									.result55(red_out55),
									.result56(red_out56),
									.result57(red_out57),
									.result58(red_out58),
									.result59(red_out59),
									.result60(red_out60),
									.result61(red_out61),
									.result62(red_out62),
									.result63(red_out63)
								);

conv_224_weight0_1 
conv_224_weight0_1_inst  ( .counter(),
									.rowcounter(),
									.clk(clk),
									.rst(reset),
									.dataIn(green_in),
									.result0(green_out0),
									.result1(green_out1),
									.result2(green_out2),
									.result3(green_out3),
									.result4(green_out4),
									.result5(green_out5),
									.result6(green_out6),
									.result7(green_out7),
									.result8(green_out8),
									.result9(green_out9),
									.result10(green_out10),
									.result11(green_out11),
									.result12(green_out12),
									.result13(green_out13),
									.result14(green_out14),
									.result15(green_out15),
									.result16(green_out16),
									.result17(green_out17),
									.result18(green_out18),
									.result19(green_out19),
									.result20(green_out20),
									.result21(green_out21),
									.result22(green_out22),
									.result23(green_out23),
									.result24(green_out24),
									.result25(green_out25),
									.result26(green_out26),
									.result27(green_out27),
									.result28(green_out28),
									.result29(green_out29),
									.result30(green_out30),
									.result31(green_out31),
									.result32(green_out32),
									.result33(green_out33),
									.result34(green_out34),
									.result35(green_out35),
									.result36(green_out36),
									.result37(green_out37),
									.result38(green_out38),
									.result39(green_out39),
									.result40(green_out40),
									.result41(green_out41),
									.result42(green_out42),
									.result43(green_out43),
									.result44(green_out44),
									.result45(green_out45),
									.result46(green_out46),
									.result47(green_out47),
									.result48(green_out48),
									.result49(green_out49),
									.result50(green_out50),
									.result51(green_out51),
									.result52(green_out52),
									.result53(green_out53),
									.result54(green_out54),
									.result55(green_out55),
									.result56(green_out56),
									.result57(green_out57),
									.result58(green_out58),
									.result59(green_out59),
									.result60(green_out60),
									.result61(green_out61),
									.result62(green_out62),
									.result63(green_out63)
								);								
								
conv_224_weight0_2 
conv_224_weight0_2_inst  ( .counter(),
									.rowcounter(),
									.clk(clk),
									.rst(reset),
									.dataIn(blue_in),
									.result0(blue_out0),
									.result1(blue_out1),
									.result2(blue_out2),
									.result3(blue_out3),
									.result4(blue_out4),
									.result5(blue_out5),
									.result6(blue_out6),
									.result7(blue_out7),
									.result8(blue_out8),
									.result9(blue_out9),
									.result10(blue_out10),
									.result11(blue_out11),
									.result12(blue_out12),
									.result13(blue_out13),
									.result14(blue_out14),
									.result15(blue_out15),
									.result16(blue_out16),
									.result17(blue_out17),
									.result18(blue_out18),
									.result19(blue_out19),
									.result20(blue_out20),
									.result21(blue_out21),
									.result22(blue_out22),
									.result23(blue_out23),
									.result24(blue_out24),
									.result25(blue_out25),
									.result26(blue_out26),
									.result27(blue_out27),
									.result28(blue_out28),
									.result29(blue_out29),
									.result30(blue_out30),
									.result31(blue_out31),
									.result32(blue_out32),
									.result33(blue_out33),
									.result34(blue_out34),
									.result35(blue_out35),
									.result36(blue_out36),
									.result37(blue_out37),
									.result38(blue_out38),
									.result39(blue_out39),
									.result40(blue_out40),
									.result41(blue_out41),
									.result42(blue_out42),
									.result43(blue_out43),
									.result44(blue_out44),
									.result45(blue_out45),
									.result46(blue_out46),
									.result47(blue_out47),
									.result48(blue_out48),
									.result49(blue_out49),
									.result50(blue_out50),
									.result51(blue_out51),
									.result52(blue_out52),
									.result53(blue_out53),
									.result54(blue_out54),
									.result55(blue_out55),
									.result56(blue_out56),
									.result57(blue_out57),
									.result58(blue_out58),
									.result59(blue_out59),
									.result60(blue_out60),
									.result61(blue_out61),
									.result62(blue_out62),
									.result63(blue_out63)
								);			
						
adder3 adder3_inst0(.in1(red_out0), .in2(green_out0), .in3(blue_out0), .out(add_out0));
adder3 adder3_inst1(.in1(red_out1), .in2(green_out1), .in3(blue_out1), .out(add_out1));
adder3 adder3_inst2(.in1(red_out2), .in2(green_out2), .in3(blue_out2), .out(add_out2));
adder3 adder3_inst3(.in1(red_out3), .in2(green_out3), .in3(blue_out3), .out(add_out3));
adder3 adder3_inst4(.in1(red_out4), .in2(green_out4), .in3(blue_out4), .out(add_out4));
adder3 adder3_inst5(.in1(red_out5), .in2(green_out5), .in3(blue_out5), .out(add_out5));
adder3 adder3_inst6(.in1(red_out6), .in2(green_out6), .in3(blue_out6), .out(add_out6));
adder3 adder3_inst7(.in1(red_out7), .in2(green_out7), .in3(blue_out7), .out(add_out7));
adder3 adder3_inst8(.in1(red_out8), .in2(green_out8), .in3(blue_out8), .out(add_out8));
adder3 adder3_inst9(.in1(red_out9), .in2(green_out9), .in3(blue_out9), .out(add_out9));
adder3 adder3_inst10(.in1(red_out10), .in2(green_out10), .in3(blue_out10), .out(add_out10));
adder3 adder3_inst11(.in1(red_out11), .in2(green_out11), .in3(blue_out11), .out(add_out11));
adder3 adder3_inst12(.in1(red_out12), .in2(green_out12), .in3(blue_out12), .out(add_out12));
adder3 adder3_inst13(.in1(red_out13), .in2(green_out13), .in3(blue_out13), .out(add_out13));
adder3 adder3_inst14(.in1(red_out14), .in2(green_out14), .in3(blue_out14), .out(add_out14));
adder3 adder3_inst15(.in1(red_out15), .in2(green_out15), .in3(blue_out15), .out(add_out15));
adder3 adder3_inst16(.in1(red_out16), .in2(green_out16), .in3(blue_out16), .out(add_out16));
adder3 adder3_inst17(.in1(red_out17), .in2(green_out17), .in3(blue_out17), .out(add_out17));
adder3 adder3_inst18(.in1(red_out18), .in2(green_out18), .in3(blue_out18), .out(add_out18));
adder3 adder3_inst19(.in1(red_out19), .in2(green_out19), .in3(blue_out19), .out(add_out19));
adder3 adder3_inst20(.in1(red_out20), .in2(green_out20), .in3(blue_out20), .out(add_out20));
adder3 adder3_inst21(.in1(red_out21), .in2(green_out21), .in3(blue_out21), .out(add_out21));
adder3 adder3_inst22(.in1(red_out22), .in2(green_out22), .in3(blue_out22), .out(add_out22));
adder3 adder3_inst23(.in1(red_out23), .in2(green_out23), .in3(blue_out23), .out(add_out23));
adder3 adder3_inst24(.in1(red_out24), .in2(green_out24), .in3(blue_out24), .out(add_out24));
adder3 adder3_inst25(.in1(red_out25), .in2(green_out25), .in3(blue_out25), .out(add_out25));
adder3 adder3_inst26(.in1(red_out26), .in2(green_out26), .in3(blue_out26), .out(add_out26));
adder3 adder3_inst27(.in1(red_out27), .in2(green_out27), .in3(blue_out27), .out(add_out27));
adder3 adder3_inst28(.in1(red_out28), .in2(green_out28), .in3(blue_out28), .out(add_out28));
adder3 adder3_inst29(.in1(red_out29), .in2(green_out29), .in3(blue_out29), .out(add_out29));
adder3 adder3_inst30(.in1(red_out30), .in2(green_out30), .in3(blue_out30), .out(add_out30));
adder3 adder3_inst31(.in1(red_out31), .in2(green_out31), .in3(blue_out31), .out(add_out31));
adder3 adder3_inst32(.in1(red_out32), .in2(green_out32), .in3(blue_out32), .out(add_out32));
adder3 adder3_inst33(.in1(red_out33), .in2(green_out33), .in3(blue_out33), .out(add_out33));
adder3 adder3_inst34(.in1(red_out34), .in2(green_out34), .in3(blue_out34), .out(add_out34));
adder3 adder3_inst35(.in1(red_out35), .in2(green_out35), .in3(blue_out35), .out(add_out35));
adder3 adder3_inst36(.in1(red_out36), .in2(green_out36), .in3(blue_out36), .out(add_out36));
adder3 adder3_inst37(.in1(red_out37), .in2(green_out37), .in3(blue_out37), .out(add_out37));
adder3 adder3_inst38(.in1(red_out38), .in2(green_out38), .in3(blue_out38), .out(add_out38));
adder3 adder3_inst39(.in1(red_out39), .in2(green_out39), .in3(blue_out39), .out(add_out39));
adder3 adder3_inst40(.in1(red_out40), .in2(green_out40), .in3(blue_out40), .out(add_out40));
adder3 adder3_inst41(.in1(red_out41), .in2(green_out41), .in3(blue_out41), .out(add_out41));
adder3 adder3_inst42(.in1(red_out42), .in2(green_out42), .in3(blue_out42), .out(add_out42));
adder3 adder3_inst43(.in1(red_out43), .in2(green_out43), .in3(blue_out43), .out(add_out43));
adder3 adder3_inst44(.in1(red_out44), .in2(green_out44), .in3(blue_out44), .out(add_out44));
adder3 adder3_inst45(.in1(red_out45), .in2(green_out45), .in3(blue_out45), .out(add_out45));
adder3 adder3_inst46(.in1(red_out46), .in2(green_out46), .in3(blue_out46), .out(add_out46));
adder3 adder3_inst47(.in1(red_out47), .in2(green_out47), .in3(blue_out47), .out(add_out47));
adder3 adder3_inst48(.in1(red_out48), .in2(green_out48), .in3(blue_out48), .out(add_out48));
adder3 adder3_inst49(.in1(red_out49), .in2(green_out49), .in3(blue_out49), .out(add_out49));
adder3 adder3_inst50(.in1(red_out50), .in2(green_out50), .in3(blue_out50), .out(add_out50));
adder3 adder3_inst51(.in1(red_out51), .in2(green_out51), .in3(blue_out51), .out(add_out51));
adder3 adder3_inst52(.in1(red_out52), .in2(green_out52), .in3(blue_out52), .out(add_out52));
adder3 adder3_inst53(.in1(red_out53), .in2(green_out53), .in3(blue_out53), .out(add_out53));
adder3 adder3_inst54(.in1(red_out54), .in2(green_out54), .in3(blue_out54), .out(add_out54));
adder3 adder3_inst55(.in1(red_out55), .in2(green_out55), .in3(blue_out55), .out(add_out55));
adder3 adder3_inst56(.in1(red_out56), .in2(green_out56), .in3(blue_out56), .out(add_out56));
adder3 adder3_inst57(.in1(red_out57), .in2(green_out57), .in3(blue_out57), .out(add_out57));
adder3 adder3_inst58(.in1(red_out58), .in2(green_out58), .in3(blue_out58), .out(add_out58));
adder3 adder3_inst59(.in1(red_out59), .in2(green_out59), .in3(blue_out59), .out(add_out59));
adder3 adder3_inst60(.in1(red_out60), .in2(green_out60), .in3(blue_out60), .out(add_out60));
adder3 adder3_inst61(.in1(red_out61), .in2(green_out61), .in3(blue_out61), .out(add_out61));
adder3 adder3_inst62(.in1(red_out62), .in2(green_out62), .in3(blue_out62), .out(add_out62));
adder3 adder3_inst63(.in1(red_out63), .in2(green_out63), .in3(blue_out63), .out(add_out63));
			
MaxPooling_224_to_112 MaxPool_inst0(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out0), .DATA_OUT(out0));
MaxPooling_224_to_112 MaxPool_inst1(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out1), .DATA_OUT(out1));
MaxPooling_224_to_112 MaxPool_inst2(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out2), .DATA_OUT(out2));
MaxPooling_224_to_112 MaxPool_inst3(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out3), .DATA_OUT(out3));
MaxPooling_224_to_112 MaxPool_inst4(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out4), .DATA_OUT(out4));
MaxPooling_224_to_112 MaxPool_inst5(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out5), .DATA_OUT(out5));
MaxPooling_224_to_112 MaxPool_inst6(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out6), .DATA_OUT(out6));
MaxPooling_224_to_112 MaxPool_inst7(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out7), .DATA_OUT(out7));
MaxPooling_224_to_112 MaxPool_inst8(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out8), .DATA_OUT(out8));
MaxPooling_224_to_112 MaxPool_inst9(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out9), .DATA_OUT(out9));
MaxPooling_224_to_112 MaxPool_inst10(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out10), .DATA_OUT(out10));
MaxPooling_224_to_112 MaxPool_inst11(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out11), .DATA_OUT(out11));
MaxPooling_224_to_112 MaxPool_inst12(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out12), .DATA_OUT(out12));
MaxPooling_224_to_112 MaxPool_inst13(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out13), .DATA_OUT(out13));
MaxPooling_224_to_112 MaxPool_inst14(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out14), .DATA_OUT(out14));
MaxPooling_224_to_112 MaxPool_inst15(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out15), .DATA_OUT(out15));
MaxPooling_224_to_112 MaxPool_inst16(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out16), .DATA_OUT(out16));
MaxPooling_224_to_112 MaxPool_inst17(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out17), .DATA_OUT(out17));
MaxPooling_224_to_112 MaxPool_inst18(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out18), .DATA_OUT(out18));
MaxPooling_224_to_112 MaxPool_inst19(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out19), .DATA_OUT(out19));
MaxPooling_224_to_112 MaxPool_inst20(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out20), .DATA_OUT(out20));
MaxPooling_224_to_112 MaxPool_inst21(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out21), .DATA_OUT(out21));
MaxPooling_224_to_112 MaxPool_inst22(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out22), .DATA_OUT(out22));
MaxPooling_224_to_112 MaxPool_inst23(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out23), .DATA_OUT(out23));
MaxPooling_224_to_112 MaxPool_inst24(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out24), .DATA_OUT(out24));
MaxPooling_224_to_112 MaxPool_inst25(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out25), .DATA_OUT(out25));
MaxPooling_224_to_112 MaxPool_inst26(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out26), .DATA_OUT(out26));
MaxPooling_224_to_112 MaxPool_inst27(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out27), .DATA_OUT(out27));
MaxPooling_224_to_112 MaxPool_inst28(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out28), .DATA_OUT(out28));
MaxPooling_224_to_112 MaxPool_inst29(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out29), .DATA_OUT(out29));
MaxPooling_224_to_112 MaxPool_inst30(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out30), .DATA_OUT(out30));
MaxPooling_224_to_112 MaxPool_inst31(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out31), .DATA_OUT(out31));
MaxPooling_224_to_112 MaxPool_inst32(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out32), .DATA_OUT(out32));
MaxPooling_224_to_112 MaxPool_inst33(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out33), .DATA_OUT(out33));
MaxPooling_224_to_112 MaxPool_inst34(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out34), .DATA_OUT(out34));
MaxPooling_224_to_112 MaxPool_inst35(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out35), .DATA_OUT(out35));
MaxPooling_224_to_112 MaxPool_inst36(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out36), .DATA_OUT(out36));
MaxPooling_224_to_112 MaxPool_inst37(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out37), .DATA_OUT(out37));
MaxPooling_224_to_112 MaxPool_inst38(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out38), .DATA_OUT(out38));
MaxPooling_224_to_112 MaxPool_inst39(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out39), .DATA_OUT(out39));
MaxPooling_224_to_112 MaxPool_inst40(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out40), .DATA_OUT(out40));
MaxPooling_224_to_112 MaxPool_inst41(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out41), .DATA_OUT(out41));
MaxPooling_224_to_112 MaxPool_inst42(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out42), .DATA_OUT(out42));
MaxPooling_224_to_112 MaxPool_inst43(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out43), .DATA_OUT(out43));
MaxPooling_224_to_112 MaxPool_inst44(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out44), .DATA_OUT(out44));
MaxPooling_224_to_112 MaxPool_inst45(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out45), .DATA_OUT(out45));
MaxPooling_224_to_112 MaxPool_inst46(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out46), .DATA_OUT(out46));
MaxPooling_224_to_112 MaxPool_inst47(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out47), .DATA_OUT(out47));
MaxPooling_224_to_112 MaxPool_inst48(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out48), .DATA_OUT(out48));
MaxPooling_224_to_112 MaxPool_inst49(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out49), .DATA_OUT(out49));
MaxPooling_224_to_112 MaxPool_inst50(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out50), .DATA_OUT(out50));
MaxPooling_224_to_112 MaxPool_inst51(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out51), .DATA_OUT(out51));
MaxPooling_224_to_112 MaxPool_inst52(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out52), .DATA_OUT(out52));
MaxPooling_224_to_112 MaxPool_inst53(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out53), .DATA_OUT(out53));
MaxPooling_224_to_112 MaxPool_inst54(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out54), .DATA_OUT(out54));
MaxPooling_224_to_112 MaxPool_inst55(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out55), .DATA_OUT(out55));
MaxPooling_224_to_112 MaxPool_inst56(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out56), .DATA_OUT(out56));
MaxPooling_224_to_112 MaxPool_inst57(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out57), .DATA_OUT(out57));
MaxPooling_224_to_112 MaxPool_inst58(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out58), .DATA_OUT(out58));
MaxPooling_224_to_112 MaxPool_inst59(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out59), .DATA_OUT(out59));
MaxPooling_224_to_112 MaxPool_inst60(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out60), .DATA_OUT(out60));
MaxPooling_224_to_112 MaxPool_inst61(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out61), .DATA_OUT(out61));
MaxPooling_224_to_112 MaxPool_inst62(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out62), .DATA_OUT(out62));
MaxPooling_224_to_112 MaxPool_inst63(.clk(clk), .reset(maxPool_reset), .DATA_IN(add_out63), .DATA_OUT(out63));

endmodule
