`timescale 1ns / 1ps

module Block5
#(
    parameter data_width = 32
)
(
	input clk, rst,
	input valid_in,
	input [data_width-1:0] in0,
	input [data_width-1:0] in1,
	input [data_width-1:0] in2,
	input [data_width-1:0] in3,
	input [data_width-1:0] in4,
	input [data_width-1:0] in5,
	input [data_width-1:0] in6,
	input [data_width-1:0] in7,
	input [data_width-1:0] in8,
	input [data_width-1:0] in9,
	input [data_width-1:0] in10,
	input [data_width-1:0] in11,
	input [data_width-1:0] in12,
	input [data_width-1:0] in13,
	input [data_width-1:0] in14,
	input [data_width-1:0] in15,
	input [data_width-1:0] in16,
	input [data_width-1:0] in17,
	input [data_width-1:0] in18,
	input [data_width-1:0] in19,
	input [data_width-1:0] in20,
	input [data_width-1:0] in21,
	input [data_width-1:0] in22,
	input [data_width-1:0] in23,
	input [data_width-1:0] in24,
	input [data_width-1:0] in25,
	input [data_width-1:0] in26,
	input [data_width-1:0] in27,
	input [data_width-1:0] in28,
	input [data_width-1:0] in29,
	input [data_width-1:0] in30,
	input [data_width-1:0] in31,
   //
	output [data_width-1:0] out0,
	output [data_width-1:0] out1,
	output [data_width-1:0] out2,
	output [data_width-1:0] out3,
	output [data_width-1:0] out4,
	output [data_width-1:0] out5,
	output [data_width-1:0] out6,
	output [data_width-1:0] out7,
	output [data_width-1:0] out8,
	output [data_width-1:0] out9,
	output [data_width-1:0] out10,
	output [data_width-1:0] out11,
	output [data_width-1:0] out12,
	output [data_width-1:0] out13,
	output [data_width-1:0] out14,
	output [data_width-1:0] out15,
	output [data_width-1:0] out16,
	output [data_width-1:0] out17,
	output [data_width-1:0] out18,
	output [data_width-1:0] out19,
	output [data_width-1:0] out20,
	output [data_width-1:0] out21,
	output [data_width-1:0] out22,
	output [data_width-1:0] out23,
	output [data_width-1:0] out24,
	output [data_width-1:0] out25,
	output [data_width-1:0] out26,
	output [data_width-1:0] out27,
	output [data_width-1:0] out28,
	output [data_width-1:0] out29,
	output [data_width-1:0] out30,
	output [data_width-1:0] out31,
	output [data_width-1:0] out32,
	output [data_width-1:0] out33,
	output [data_width-1:0] out34,
	output [data_width-1:0] out35,
	output [data_width-1:0] out36,
	output [data_width-1:0] out37,
	output [data_width-1:0] out38,
	output [data_width-1:0] out39,
	output [data_width-1:0] out40,
	output [data_width-1:0] out41,
	output [data_width-1:0] out42,
	output [data_width-1:0] out43,
	output [data_width-1:0] out44,
	output [data_width-1:0] out45,
	output [data_width-1:0] out46,
	output [data_width-1:0] out47,
	output [data_width-1:0] out48,
	output [data_width-1:0] out49,
	output [data_width-1:0] out50,
	output [data_width-1:0] out51,
	output [data_width-1:0] out52,
	output [data_width-1:0] out53,
	output [data_width-1:0] out54,
	output [data_width-1:0] out55,
	output [data_width-1:0] out56,
	output [data_width-1:0] out57,
	output [data_width-1:0] out58,
	output [data_width-1:0] out59,
	output [data_width-1:0] out60,
	output [data_width-1:0] out61,
	output [data_width-1:0] out62,
	output [data_width-1:0] out63
);

wire [data_width-1:0]   conv_out0, conv_out1, conv_out2, conv_out3, conv_out4, conv_out5, conv_out6, conv_out7, 
								conv_out8, conv_out9, conv_out10, conv_out11, conv_out12, conv_out13, conv_out14, conv_out15, 
								conv_out16, conv_out17, conv_out18, conv_out19, conv_out20, conv_out21, conv_out22, conv_out23, 
								conv_out24, conv_out25, conv_out26, conv_out27, conv_out28, conv_out29, conv_out30, conv_out31, 
								conv_out32, conv_out33, conv_out34, conv_out35, conv_out36, conv_out37, conv_out38, conv_out39, 
								conv_out40, conv_out41, conv_out42, conv_out43, conv_out44, conv_out45, conv_out46, conv_out47, 
								conv_out48, conv_out49, conv_out50, conv_out51, conv_out52, conv_out53, conv_out54, conv_out55, 
								conv_out56, conv_out57, conv_out58, conv_out59, conv_out60, conv_out61, conv_out62, conv_out63; 
								
reg [16:0] count_clk;
wire maxPool_reset;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		count_clk = 17'd0;
	end
	else if (valid_in) begin
		count_clk = count_clk + 1;
	end
	else begin
		count_clk = 17'd0;
	end
end

assign maxPool_reset = (count_clk < 17'd16) ? 1'b1 : 1'b0;
 
conv_14_64 
conv_14_64_dut
(
	.clk(clk),
	.rst(rst),
	//
	.dataIn0(in0),
	.dataIn1(in1),
	.dataIn2(in2),
	.dataIn3(in3),
	.dataIn4(in4),
	.dataIn5(in5),
	.dataIn6(in6),
	.dataIn7(in7),
	.dataIn8(in8),
	.dataIn9(in9),
	.dataIn10(in10),
	.dataIn11(in11),
	.dataIn12(in12),
	.dataIn13(in13),
	.dataIn14(in14),
	.dataIn15(in15),
	.dataIn16(in16),
	.dataIn17(in17),
	.dataIn18(in18),
	.dataIn19(in19),
	.dataIn20(in20),
	.dataIn21(in21),
	.dataIn22(in22),
	.dataIn23(in23),
	.dataIn24(in24),
	.dataIn25(in25),
	.dataIn26(in26),
	.dataIn27(in27),
	.dataIn28(in28),
	.dataIn29(in29),
	.dataIn30(in30),
	.dataIn31(in31),
	//
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

MaxPooling_14_to_7
MaxPooling_14_to_7_dut0
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out0),
	.DATA_OUT(out0)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut1
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out1),
	.DATA_OUT(out1)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut2
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out2),
	.DATA_OUT(out2)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut3
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out3),
	.DATA_OUT(out3)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut4
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out4),
	.DATA_OUT(out4)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut5
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out5),
	.DATA_OUT(out5)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut6
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out6),
	.DATA_OUT(out6)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut7
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out7),
	.DATA_OUT(out7)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut8
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out8),
	.DATA_OUT(out8)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut9
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out9),
	.DATA_OUT(out9)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut10
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out10),
	.DATA_OUT(out10)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut11
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out11),
	.DATA_OUT(out11)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut12
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out12),
	.DATA_OUT(out12)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut13
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out13),
	.DATA_OUT(out13)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut14
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out14),
	.DATA_OUT(out14)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut15
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out15),
	.DATA_OUT(out15)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut16
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out16),
	.DATA_OUT(out16)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut17
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out17),
	.DATA_OUT(out17)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut18
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out18),
	.DATA_OUT(out18)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut19
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out19),
	.DATA_OUT(out19)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut20
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out20),
	.DATA_OUT(out20)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut21
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out21),
	.DATA_OUT(out21)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut22
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out22),
	.DATA_OUT(out22)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut23
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out23),
	.DATA_OUT(out23)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut24
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out24),
	.DATA_OUT(out24)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut25
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out25),
	.DATA_OUT(out25)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut26
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out26),
	.DATA_OUT(out26)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut27
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out27),
	.DATA_OUT(out27)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut28
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out28),
	.DATA_OUT(out28)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut29
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out29),
	.DATA_OUT(out29)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut30
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out30),
	.DATA_OUT(out30)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut31
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out31),
	.DATA_OUT(out31)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut32
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out32),
	.DATA_OUT(out32)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut33
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out33),
	.DATA_OUT(out33)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut34
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out34),
	.DATA_OUT(out34)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut35
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out35),
	.DATA_OUT(out35)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut36
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out36),
	.DATA_OUT(out36)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut37
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out37),
	.DATA_OUT(out37)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut38
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out38),
	.DATA_OUT(out38)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut39
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out39),
	.DATA_OUT(out39)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut40
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out40),
	.DATA_OUT(out40)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut41
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out41),
	.DATA_OUT(out41)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut42
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out42),
	.DATA_OUT(out42)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut43
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out43),
	.DATA_OUT(out43)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut44
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out44),
	.DATA_OUT(out44)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut45
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out45),
	.DATA_OUT(out45)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut46
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out46),
	.DATA_OUT(out46)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut47
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out47),
	.DATA_OUT(out47)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut48
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out48),
	.DATA_OUT(out48)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut49
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out49),
	.DATA_OUT(out49)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut50
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out50),
	.DATA_OUT(out50)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut51
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out51),
	.DATA_OUT(out51)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut52
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out52),
	.DATA_OUT(out52)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut53
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out53),
	.DATA_OUT(out53)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut54
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out54),
	.DATA_OUT(out54)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut55
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out55),
	.DATA_OUT(out55)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut56
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out56),
	.DATA_OUT(out56)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut57
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out57),
	.DATA_OUT(out57)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut58
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out58),
	.DATA_OUT(out58)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut59
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out59),
	.DATA_OUT(out59)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut60
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out60),
	.DATA_OUT(out60)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut61
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out61),
	.DATA_OUT(out61)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut62
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out62),
	.DATA_OUT(out62)
);

MaxPooling_14_to_7
MaxPooling_14_to_7_dut63
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out63),
	.DATA_OUT(out63)
);
                                                                                                                                            
endmodule
