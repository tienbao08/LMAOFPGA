`timescale 1ns / 1ps

module Block1
#(
    parameter data_width = 32
)
(
    input clk, rst,
	 input valid_in,
    input [data_width-1:0] red_in,
    input [data_width-1:0] green_in,
    input [data_width-1:0] blue_in,
    //
    output [data_width-1:0] out0,
    output [data_width-1:0] out1,
    output [data_width-1:0] out2,
    output [data_width-1:0] out3   
);

wire [data_width-1:0] conv_out0, conv_out1, conv_out2, conv_out3;

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

assign maxPool_reset = (count_clk < 17'd226) ? 1'b1 : 1'b0;
    
conv_224_4 conv_224_4_dut(  .clk(clk),
                            .rst(rst),
                            .dataIn0(red_in),
                            .dataIn1(green_in),
                            .dataIn2(blue_in),
                            .final_result0(conv_out0),
                            .final_result1(conv_out1),
                            .final_result2(conv_out2),
                            .final_result3(conv_out3)
                            );
                            
MaxPooling_224_to_112 MaxPooling_224_to_112_dut0(
                                                .clk(clk), .reset(maxPool_reset), 
                                                .DATA_IN(conv_out0),
                                                .DATA_OUT(out0)
                                                );
MaxPooling_224_to_112 MaxPooling_224_to_112_dut1(
                                                .clk(clk), .reset(maxPool_reset), 
                                                .DATA_IN(conv_out1),
                                                .DATA_OUT(out1)
                                                );
MaxPooling_224_to_112 MaxPooling_224_to_112_dut2(
                                                .clk(clk), .reset(maxPool_reset), 
                                                .DATA_IN(conv_out2),
                                                .DATA_OUT(out2)
                                                );
MaxPooling_224_to_112 MaxPooling_224_to_112_dut3(
                                                .clk(clk), .reset(maxPool_reset), 
                                                .DATA_IN(conv_out3),
                                                .DATA_OUT(out3)
                                                );                                                                                                                                             
endmodule
