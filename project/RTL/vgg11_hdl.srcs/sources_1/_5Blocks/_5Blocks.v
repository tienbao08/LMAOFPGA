module _5Blocks
#(
    parameter data_width = 32
)
(
	input clk, rst,
	input [data_width-1:0] red_in,
	input [data_width-1:0] green_in,
	input [data_width-1:0] blue_in,
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

wire [data_width-1:0] Block1_out0, Block1_out1, Block1_out2, Block1_out3;
wire [data_width-1:0] Block2_out0, Block2_out1, Block2_out2, Block2_out3, Block2_out4, Block2_out5, Block2_out6, Block2_out7;
wire [data_width-1:0] Block3_out0, Block3_out1, Block3_out2, Block3_out3, Block3_out4, Block3_out5, Block3_out6, Block3_out7, 
							 Block3_out8, Block3_out9, Block3_out10, Block3_out11, Block3_out12, Block3_out13, Block3_out14, Block3_out15;
wire [data_width-1:0] Block4_out0, Block4_out1, Block4_out2, Block4_out3, Block4_out4, Block4_out5, Block4_out6, Block4_out7, 
							 Block4_out8, Block4_out9, Block4_out10, Block4_out11, Block4_out12, Block4_out13, Block4_out14, Block4_out15, 
							 Block4_out16, Block4_out17, Block4_out18, Block4_out19, Block4_out20, Block4_out21, Block4_out22, Block4_out23, 
							 Block4_out24, Block4_out25, Block4_out26, Block4_out27, Block4_out28, Block4_out29, Block4_out30, Block4_out31;

wire valid_in1, valid_in2, valid_in3, valid_in4, valid_in5;

Control
Control_inst
(
	.clk(clk), rst(rst),
	//
	.valid_Block1(valid_in1), 
	.valid_Block2(valid_in2), 
	.valid_Block3(valid_in3), 
	.valid_Block4(valid_in4), 
	.valid_Block5(valid_in5)
);							 
							 
							 
Block1
Block1_inst
(
    .clk(clk), rst(rst),
	 .valid_in(valid_in1),
    .red_in(red_in),
    .green_in(green_in),
    .blue_in(blue_in),
    //
    .out0(Block1_out0),
    .out1(Block1_out1),
    .out2(Block1_out2),
    .out3(Block1_out3)
);

Block2
Block2_inst
(
   .clk(clk), rst(rst),
	.valid_in(valid_in2),
	//
	.in0(Block1_out0),
	.in1(Block1_out1),
	.in2(Block1_out2),
	.in3(Block1_out3),
	//
	.out0(Block2_out0),
	.out1(Block2_out1),
	.out2(Block2_out2),
	.out3(Block2_out3),
	.out4(Block2_out4),
	.out5(Block2_out5),
	.out6(Block2_out6),
	.out7(Block2_out7)
);

Block3
Block3_inst
(
   .clk(clk), rst(rst),
	.valid_in(valid_in3),
	//
	.in0(Block2_out0),
	.in1(Block2_out1),
	.in2(Block2_out2),
	.in3(Block2_out3),
	.in4(Block2_out4),
	.in5(Block2_out5),
	.in6(Block2_out6),
	.in7(Block2_out7),
	//
	.out0(Block3_out0),
	.out1(Block3_out1),
	.out2(Block3_out2),
	.out3(Block3_out3),
	.out4(Block3_out4),
	.out5(Block3_out5),
	.out6(Block3_out6),
	.out7(Block3_out7),
	.out8(Block3_out8),
	.out9(Block3_out9),
	.out10(Block3_out10),
	.out11(Block3_out11),
	.out12(Block3_out12),
	.out13(Block3_out13),
	.out14(Block3_out14),
	.out15(Block3_out15)
);

Block4
Block4_inst
(
   .clk(clk), rst(rst),
	.valid_in(valid_in4),
	//
	.in0(Block3_out0),
	.in1(Block3_out1),
	.in2(Block3_out2),
	.in3(Block3_out3),
	.in4(Block3_out4),
	.in5(Block3_out5),
	.in6(Block3_out6),
	.in7(Block3_out7),
	.in8(Block3_out8),
	.in9(Block3_out9),
	.in10(Block3_out10),
	.in11(Block3_out11),
	.in12(Block3_out12),
	.in13(Block3_out13),
	.in14(Block3_out14),
	.in15(Block3_out15),
	//
	.out0(Block4_out0),
	.out1(Block4_out1),
	.out2(Block4_out2),
	.out3(Block4_out3),
	.out4(Block4_out4),
	.out5(Block4_out5),
	.out6(Block4_out6),
	.out7(Block4_out7),
	.out8(Block4_out8),
	.out9(Block4_out9),
	.out10(Block4_out10),
	.out11(Block4_out11),
	.out12(Block4_out12),
	.out13(Block4_out13),
	.out14(Block4_out14),
	.out15(Block4_out15),
	.out16(Block4_out16),
	.out17(Block4_out17),
	.out18(Block4_out18),
	.out19(Block4_out19),
	.out20(Block4_out20),
	.out21(Block4_out21),
	.out22(Block4_out22),
	.out23(Block4_out23),
	.out24(Block4_out24),
	.out25(Block4_out25),
	.out26(Block4_out26),
	.out27(Block4_out27),
	.out28(Block4_out28),
	.out29(Block4_out29),
	.out30(Block4_out30),
	.out31(Block4_out31)
);

Block5
Block5_inst
(
   .clk(clk), rst(rst),
	.valid_in(valid_in5),
	//
	.in0(Block4_out0),
	.in1(Block4_out1),
	.in2(Block4_out2),
	.in3(Block4_out3),
	.in4(Block4_out4),
	.in5(Block4_out5),
	.in6(Block4_out6),
	.in7(Block4_out7),
	.in8(Block4_out8),
	.in9(Block4_out9),
	.in10(Block4_out10),
	.in11(Block4_out11),
	.in12(Block4_out12),
	.in13(Block4_out13),
	.in14(Block4_out14),
	.in15(Block4_out15),
	.in16(Block4_out16),
	.in17(Block4_out17),
	.in18(Block4_out18),
	.in19(Block4_out19),
	.in20(Block4_out20),
	.in21(Block4_out21),
	.in22(Block4_out22),
	.in23(Block4_out23),
	.in24(Block4_out24),
	.in25(Block4_out25),
	.in26(Block4_out26),
	.in27(Block4_out27),
	.in28(Block4_out28),
	.in29(Block4_out29),
	.in30(Block4_out30),
	.in31(Block4_out31),
	//
	.out0(out0),
	.out1(out1),
	.out2(out2),
	.out3(out3),
	.out4(out4),
	.out5(out5),
	.out6(out6),
	.out7(out7),
	.out8(out8),
	.out9(out9),
	.out10(out10),
	.out11(out11),
	.out12(out12),
	.out13(out13),
	.out14(out14),
	.out15(out15),
	.out16(out16),
	.out17(out17),
	.out18(out18),
	.out19(out19),
	.out20(out20),
	.out21(out21),
	.out22(out22),
	.out23(out23),
	.out24(out24),
	.out25(out25),
	.out26(out26),
	.out27(out27),
	.out28(out28),
	.out29(out29),
	.out30(out30),
	.out31(out31),
	.out32(out32),
	.out33(out33),
	.out34(out34),
	.out35(out35),
	.out36(out36),
	.out37(out37),
	.out38(out38),
	.out39(out39),
	.out40(out40),
	.out41(out41),
	.out42(out42),
	.out43(out43),
	.out44(out44),
	.out45(out45),
	.out46(out46),
	.out47(out47),
	.out48(out48),
	.out49(out49),
	.out50(out50),
	.out51(out51),
	.out52(out52),
	.out53(out53),
	.out54(out54),
	.out55(out55),
	.out56(out56),
	.out57(out57),
	.out58(out58),
	.out59(out59),
	.out60(out60),
	.out61(out61),
	.out62(out62),
	.out63(out63)
);

endmodule