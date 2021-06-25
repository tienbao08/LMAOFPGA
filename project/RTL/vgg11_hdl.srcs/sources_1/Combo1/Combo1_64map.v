module Combo1_64map
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

wire [DATA_WIDTH-1:0]  conv_out0,
							 conv_out1,
							 conv_out2,
							 conv_out3,
							 conv_out4,
							 conv_out5,
							 conv_out6,
							 conv_out7,
							 conv_out8,
							 conv_out9,
							 conv_out10,
							 conv_out11,
							 conv_out12,
							 conv_out13,
							 conv_out14,
							 conv_out15,
							 conv_out16,
							 conv_out17,
							 conv_out18,
							 conv_out19,
							 conv_out20,
							 conv_out21,
							 conv_out22,
							 conv_out23,
							 conv_out24,
							 conv_out25,
							 conv_out26,
							 conv_out27,
							 conv_out28,
							 conv_out29,
							 conv_out30,
							 conv_out31,
							 conv_out32,
							 conv_out33,
							 conv_out34,
							 conv_out35,
							 conv_out36,
							 conv_out37,
							 conv_out38,
							 conv_out39,
							 conv_out40,
							 conv_out41,
							 conv_out42,
							 conv_out43,
							 conv_out44,
							 conv_out45,
							 conv_out46,
							 conv_out47,
							 conv_out48,
							 conv_out49,
							 conv_out50,
							 conv_out51,
							 conv_out52,
							 conv_out53,
							 conv_out54,
							 conv_out55,
							 conv_out56,
							 conv_out57,
							 conv_out58,
							 conv_out59,
							 conv_out60,
							 conv_out61,
							 conv_out62,
							 conv_out63;


conv_224_64
conv_224_64_inst  ( .counter(),
									.rowcounter(),
									.clk(clk),
									.rst(reset),
									.dataIn0(red_in),
									.dataIn1(green_in),
									.dataIn2(blue_in),

									.final_result0(conv_out0),
									.final_result1(conv_out1),
									.final_result2(conv_out2),
									.final_result3(conv_out3),
									.final_result4(conv_out4),
									.final_result5(conv_out5),
									.final_result6(conv_out6),
									.final_result7(conv_out7),
									.final_result8(conv_out8),
									.final_result9(conv_out9),
									.final_result10(conv_out10),
									.final_result11(conv_out11),
									.final_result12(conv_out12),
									.final_result13(conv_out13),
									.final_result14(conv_out14),
									.final_result15(conv_out15),
									.final_result16(conv_out16),
									.final_result17(conv_out17),
									.final_result18(conv_out18),
									.final_result19(conv_out19),
									.final_result20(conv_out20),
									.final_result21(conv_out21),
									.final_result22(conv_out22),
									.final_result23(conv_out23),
									.final_result24(conv_out24),
									.final_result25(conv_out25),
									.final_result26(conv_out26),
									.final_result27(conv_out27),
									.final_result28(conv_out28),
									.final_result29(conv_out29),
									.final_result30(conv_out30),
									.final_result31(conv_out31),
									.final_result32(conv_out32),
									.final_result33(conv_out33),
									.final_result34(conv_out34),
									.final_result35(conv_out35),
									.final_result36(conv_out36),
									.final_result37(conv_out37),
									.final_result38(conv_out38),
									.final_result39(conv_out39),
									.final_result40(conv_out40),
									.final_result41(conv_out41),
									.final_result42(conv_out42),
									.final_result43(conv_out43),
									.final_result44(conv_out44),
									.final_result45(conv_out45),
									.final_result46(conv_out46),
									.final_result47(conv_out47),
									.final_result48(conv_out48),
									.final_result49(conv_out49),
									.final_result50(conv_out50),
									.final_result51(conv_out51),
									.final_result52(conv_out52),
									.final_result53(conv_out53),
									.final_result54(conv_out54),
									.final_result55(conv_out55),
									.final_result56(conv_out56),
									.final_result57(conv_out57),
									.final_result58(conv_out58),
									.final_result59(conv_out59),
									.final_result60(conv_out60),
									.final_result61(conv_out61),
									.final_result62(conv_out62),
									.final_result63(conv_out63)
								);

			
MaxPooling_224_to_112 MaxPool_inst0(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out0), .DATA_OUT(out0));
MaxPooling_224_to_112 MaxPool_inst1(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out1), .DATA_OUT(out1));
MaxPooling_224_to_112 MaxPool_inst2(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out2), .DATA_OUT(out2));
MaxPooling_224_to_112 MaxPool_inst3(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out3), .DATA_OUT(out3));
MaxPooling_224_to_112 MaxPool_inst4(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out4), .DATA_OUT(out4));
MaxPooling_224_to_112 MaxPool_inst5(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out5), .DATA_OUT(out5));
MaxPooling_224_to_112 MaxPool_inst6(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out6), .DATA_OUT(out6));
MaxPooling_224_to_112 MaxPool_inst7(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out7), .DATA_OUT(out7));
MaxPooling_224_to_112 MaxPool_inst8(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out8), .DATA_OUT(out8));
MaxPooling_224_to_112 MaxPool_inst9(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out9), .DATA_OUT(out9));
MaxPooling_224_to_112 MaxPool_inst10(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out10), .DATA_OUT(out10));
MaxPooling_224_to_112 MaxPool_inst11(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out11), .DATA_OUT(out11));
MaxPooling_224_to_112 MaxPool_inst12(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out12), .DATA_OUT(out12));
MaxPooling_224_to_112 MaxPool_inst13(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out13), .DATA_OUT(out13));
MaxPooling_224_to_112 MaxPool_inst14(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out14), .DATA_OUT(out14));
MaxPooling_224_to_112 MaxPool_inst15(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out15), .DATA_OUT(out15));
MaxPooling_224_to_112 MaxPool_inst16(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out16), .DATA_OUT(out16));
MaxPooling_224_to_112 MaxPool_inst17(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out17), .DATA_OUT(out17));
MaxPooling_224_to_112 MaxPool_inst18(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out18), .DATA_OUT(out18));
MaxPooling_224_to_112 MaxPool_inst19(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out19), .DATA_OUT(out19));
MaxPooling_224_to_112 MaxPool_inst20(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out20), .DATA_OUT(out20));
MaxPooling_224_to_112 MaxPool_inst21(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out21), .DATA_OUT(out21));
MaxPooling_224_to_112 MaxPool_inst22(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out22), .DATA_OUT(out22));
MaxPooling_224_to_112 MaxPool_inst23(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out23), .DATA_OUT(out23));
MaxPooling_224_to_112 MaxPool_inst24(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out24), .DATA_OUT(out24));
MaxPooling_224_to_112 MaxPool_inst25(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out25), .DATA_OUT(out25));
MaxPooling_224_to_112 MaxPool_inst26(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out26), .DATA_OUT(out26));
MaxPooling_224_to_112 MaxPool_inst27(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out27), .DATA_OUT(out27));
MaxPooling_224_to_112 MaxPool_inst28(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out28), .DATA_OUT(out28));
MaxPooling_224_to_112 MaxPool_inst29(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out29), .DATA_OUT(out29));
MaxPooling_224_to_112 MaxPool_inst30(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out30), .DATA_OUT(out30));
MaxPooling_224_to_112 MaxPool_inst31(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out31), .DATA_OUT(out31));
MaxPooling_224_to_112 MaxPool_inst32(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out32), .DATA_OUT(out32));
MaxPooling_224_to_112 MaxPool_inst33(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out33), .DATA_OUT(out33));
MaxPooling_224_to_112 MaxPool_inst34(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out34), .DATA_OUT(out34));
MaxPooling_224_to_112 MaxPool_inst35(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out35), .DATA_OUT(out35));
MaxPooling_224_to_112 MaxPool_inst36(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out36), .DATA_OUT(out36));
MaxPooling_224_to_112 MaxPool_inst37(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out37), .DATA_OUT(out37));
MaxPooling_224_to_112 MaxPool_inst38(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out38), .DATA_OUT(out38));
MaxPooling_224_to_112 MaxPool_inst39(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out39), .DATA_OUT(out39));
MaxPooling_224_to_112 MaxPool_inst40(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out40), .DATA_OUT(out40));
MaxPooling_224_to_112 MaxPool_inst41(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out41), .DATA_OUT(out41));
MaxPooling_224_to_112 MaxPool_inst42(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out42), .DATA_OUT(out42));
MaxPooling_224_to_112 MaxPool_inst43(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out43), .DATA_OUT(out43));
MaxPooling_224_to_112 MaxPool_inst44(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out44), .DATA_OUT(out44));
MaxPooling_224_to_112 MaxPool_inst45(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out45), .DATA_OUT(out45));
MaxPooling_224_to_112 MaxPool_inst46(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out46), .DATA_OUT(out46));
MaxPooling_224_to_112 MaxPool_inst47(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out47), .DATA_OUT(out47));
MaxPooling_224_to_112 MaxPool_inst48(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out48), .DATA_OUT(out48));
MaxPooling_224_to_112 MaxPool_inst49(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out49), .DATA_OUT(out49));
MaxPooling_224_to_112 MaxPool_inst50(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out50), .DATA_OUT(out50));
MaxPooling_224_to_112 MaxPool_inst51(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out51), .DATA_OUT(out51));
MaxPooling_224_to_112 MaxPool_inst52(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out52), .DATA_OUT(out52));
MaxPooling_224_to_112 MaxPool_inst53(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out53), .DATA_OUT(out53));
MaxPooling_224_to_112 MaxPool_inst54(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out54), .DATA_OUT(out54));
MaxPooling_224_to_112 MaxPool_inst55(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out55), .DATA_OUT(out55));
MaxPooling_224_to_112 MaxPool_inst56(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out56), .DATA_OUT(out56));
MaxPooling_224_to_112 MaxPool_inst57(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out57), .DATA_OUT(out57));
MaxPooling_224_to_112 MaxPool_inst58(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out58), .DATA_OUT(out58));
MaxPooling_224_to_112 MaxPool_inst59(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out59), .DATA_OUT(out59));
MaxPooling_224_to_112 MaxPool_inst60(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out60), .DATA_OUT(out60));
MaxPooling_224_to_112 MaxPool_inst61(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out61), .DATA_OUT(out61));
MaxPooling_224_to_112 MaxPool_inst62(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out62), .DATA_OUT(out62));
MaxPooling_224_to_112 MaxPool_inst63(.clk(clk), .reset(maxPool_reset), .DATA_IN( conv_out63), .DATA_OUT(out63));

endmodule
