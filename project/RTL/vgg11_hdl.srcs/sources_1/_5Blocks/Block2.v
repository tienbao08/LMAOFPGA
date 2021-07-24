`timescale 1ns / 1ps

module Block2
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
   //
	output [data_width-1:0] out0,
	output [data_width-1:0] out1,
	output [data_width-1:0] out2,
	output [data_width-1:0] out3,
	output [data_width-1:0] out4,
	output [data_width-1:0] out5,
	output [data_width-1:0] out6,
	output [data_width-1:0] out7  
);

wire [data_width-1:0] conv_out0, conv_out1, conv_out2, conv_out3, conv_out4, conv_out5, conv_out6, conv_out7;

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

assign maxPool_reset = (count_clk < 17'd114) ? 1'b1 : 1'b0;
 
conv_112_8 conv_112_8_dut(
									.clk(clk),
									.rst(rst),
									.dataIn0(in0),
									.dataIn1(in1),
									.dataIn2(in2),
									.dataIn3(in3),
									.final_result0(conv_out0),
									.final_result1(conv_out1),
									.final_result2(conv_out2),
									.final_result3(conv_out3),
									.final_result4(conv_out4),
									.final_result5(conv_out5),
									.final_result6(conv_out6),
									.final_result7(conv_out7)
                           );
                            
MaxPooling_112_to_56 MaxPooling_112_to_56_dut0(
											.clk(clk), .reset(maxPool_reset),
											.DATA_IN(conv_out0),
											.DATA_OUT(out0)
											);
MaxPooling_112_to_56 MaxPooling_112_to_56_dut1(
											.clk(clk), .reset(maxPool_reset),
											.DATA_IN(conv_out1),
											.DATA_OUT(out1)
											);
MaxPooling_112_to_56 MaxPooling_112_to_56_dut2(
											.clk(clk), .reset(maxPool_reset),
											.DATA_IN(conv_out2),
											.DATA_OUT(out2)
											);
MaxPooling_112_to_56 MaxPooling_112_to_56_dut3(
											.clk(clk), .reset(maxPool_reset),
											.DATA_IN(conv_out3),
											.DATA_OUT(out3)
											);
MaxPooling_112_to_56 MaxPooling_112_to_56_dut4(
											.clk(clk), .reset(maxPool_reset),
											.DATA_IN(conv_out4),
											.DATA_OUT(out4)
											);
MaxPooling_112_to_56 MaxPooling_112_to_56_dut5(
											.clk(clk), .reset(maxPool_reset),
											.DATA_IN(conv_out5),
											.DATA_OUT(out5)
											);
MaxPooling_112_to_56 MaxPooling_112_to_56_dut6(
											.clk(clk), .reset(maxPool_reset),
											.DATA_IN(conv_out6),
											.DATA_OUT(out6)
											);
MaxPooling_112_to_56 MaxPooling_112_to_56_dut7(
											.clk(clk), .reset(maxPool_reset),
											.DATA_IN(conv_out7),
											.DATA_OUT(out7)
											);
                                                                                                                                            
endmodule
