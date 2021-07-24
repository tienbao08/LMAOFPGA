`timescale 1ns / 1ps

module Block3
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
	output [data_width-1:0] out15
);

wire [data_width-1:0] conv_out0, conv_out1, conv_out2, conv_out3, conv_out4, conv_out5, conv_out6, conv_out7, 
							 conv_out8, conv_out9, conv_out10, conv_out11, conv_out12, conv_out13, conv_out14, conv_out15;

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

assign maxPool_reset = (count_clk < 17'd58) ? 1'b1 : 1'b0;
 
conv_56_16 conv_56_16_dut(
									.clk(clk),
									.rst(rst),
									.dataIn0(in0),
									.dataIn1(in1),
									.dataIn2(in2),
									.dataIn3(in3),
									.dataIn4(in4),
									.dataIn5(in5),
									.dataIn6(in6),
									.dataIn7(in7),
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
									.final_result15(conv_out15)
                           );
                            
MaxPooling_56_to_28
MaxPooling_56_to_28_dut0
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out0),
	.DATA_OUT(out0)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut1
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out1),
	.DATA_OUT(out1)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut2
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out2),
	.DATA_OUT(out2)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut3
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out3),
	.DATA_OUT(out3)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut4
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out4),
	.DATA_OUT(out4)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut5
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out5),
	.DATA_OUT(out5)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut6
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out6),
	.DATA_OUT(out6)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut7
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out7),
	.DATA_OUT(out7)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut8
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out8),
	.DATA_OUT(out8)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut9
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out9),
	.DATA_OUT(out9)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut10
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out10),
	.DATA_OUT(out10)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut11
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out11),
	.DATA_OUT(out11)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut12
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out12),
	.DATA_OUT(out12)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut13
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out13),
	.DATA_OUT(out13)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut14
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out14),
	.DATA_OUT(out14)
);

MaxPooling_56_to_28
MaxPooling_56_to_28_dut15
(
	.clk(clk), .reset(maxPool_reset),
	.DATA_IN(conv_out15),
	.DATA_OUT(out15)
);



                                                                                                                                            
endmodule
