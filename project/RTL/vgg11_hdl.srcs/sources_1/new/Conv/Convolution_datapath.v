module Convolution_datapath
#(
	parameter DATA_WIDTH = 8
)
(
	input clk, reset, valid_in, oe, pp1, pp2,
	input [DATA_WIDTH-1:0] pixel_IN,
	output [DATA_WIDTH-1:0] pixel_OUT,
	output full_fifo1, empty_fifo1, ful_fifo2, empty_fifo2
);
	
	wire [DATA_WIDTH-1:0] pixel_from_ff;
	wire [DATA_WIDTH-1:0] filter_out;
	wire [DATA_WIDTH-1:0] px11, px12, px13, px21, px22, px23, px31, px32, px33;

	FIFO FIFO_inst_IN(.clk(clk),
							.reset(reset),
							.en(valid_in),
							.push_pop(pp1),
							.DATA_IN(pixel_IN),
							.DATA_OUT(pixel_from_ff),
							.full_signal(full_fifo1),
							.empty_signal(empty_fifo1)
							);
	
	Window_Buffer Window_Buffer_inst(.clk(clk),
												.Data_IN(pixel_from_ff),
												.o23(px23), .o13(px13),
												.o11(px11), .o12(px12), .o21(px21), .o22(px22), .o31(px31), .o32(px32), .o33(px33)
												);
	
	Operator Operator_inst (.img11(px11), .img12(px12), .img13(px13), .img21(px21), .img22(px22), .img23(px23), .img31(px31), .img32(px32), .img33(px33),
									.kernel11(8'd1), .kernel12(8'd0), .kernel13(8'd1), .kernel21(8'd2), .kernel22(8'd0), .kernel23(8'd2), .kernel31(8'd1), .kernel32(8'd0), .kernel33(8'd1),
									.OUT(filter_out)
									);
	
	FIFO FIFO_inst_OUT ( .clk(clk),
								.reset(reset),
								.en(oe),
								.push_pop(pp2),
								.DATA_IN(filter_out),
								.DATA_OUT(pixel_OUT),
								.full_signal(ful_fifo2),
								.empty_signal(empty_fifo2)
								);
								
endmodule

	
	