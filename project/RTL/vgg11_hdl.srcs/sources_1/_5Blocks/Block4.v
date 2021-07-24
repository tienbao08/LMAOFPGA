`timescale 1ns / 1ps

module Block4
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
	output [data_width-1:0] out31

);

wire [data_width-1:0]   conv_out0, conv_out1, conv_out2, conv_out3, conv_out4, conv_out5, conv_out6, conv_out7, 
								conv_out8, conv_out9, conv_out10, conv_out11, conv_out12, conv_out13, conv_out14, conv_out15, 
								conv_out16, conv_out17, conv_out18, conv_out19, conv_out20, conv_out21, conv_out22, conv_out23, 
								conv_out24, conv_out25, conv_out26, conv_out27, conv_out28, conv_out29, conv_out30, conv_out31;

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

assign maxPool_reset = (count_clk < 17'd30) ? 1'b1 : 1'b0;
 
conv_28_32 
conv_28_32_dut
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
	.final_result31(conv_out31)
);
MaxPooling_28_to_14
MaxPooling_28_to_14_dut0
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out0),
	.DATA_OUT(out0)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut1
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out1),
	.DATA_OUT(out1)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut2
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out2),
	.DATA_OUT(out2)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut3
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out3),
	.DATA_OUT(out3)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut4
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out4),
	.DATA_OUT(out4)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut5
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out5),
	.DATA_OUT(out5)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut6
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out6),
	.DATA_OUT(out6)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut7
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out7),
	.DATA_OUT(out7)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut8
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out8),
	.DATA_OUT(out8)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut9
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out9),
	.DATA_OUT(out9)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut10
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out10),
	.DATA_OUT(out10)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut11
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out11),
	.DATA_OUT(out11)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut12
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out12),
	.DATA_OUT(out12)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut13
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out13),
	.DATA_OUT(out13)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut14
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out14),
	.DATA_OUT(out14)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut15
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out15),
	.DATA_OUT(out15)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut16
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out16),
	.DATA_OUT(out16)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut17
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out17),
	.DATA_OUT(out17)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut18
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out18),
	.DATA_OUT(out18)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut19
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out19),
	.DATA_OUT(out19)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut20
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out20),
	.DATA_OUT(out20)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut21
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out21),
	.DATA_OUT(out21)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut22
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out22),
	.DATA_OUT(out22)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut23
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out23),
	.DATA_OUT(out23)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut24
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out24),
	.DATA_OUT(out24)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut25
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out25),
	.DATA_OUT(out25)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut26
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out26),
	.DATA_OUT(out26)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut27
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out27),
	.DATA_OUT(out27)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut28
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out28),
	.DATA_OUT(out28)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut29
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out29),
	.DATA_OUT(out29)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut30
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out30),
	.DATA_OUT(out30)
);

MaxPooling_28_to_14
MaxPooling_28_to_14_dut31
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out31),
	.DATA_OUT(out31)
);


                                                                                                                                            
endmodule
