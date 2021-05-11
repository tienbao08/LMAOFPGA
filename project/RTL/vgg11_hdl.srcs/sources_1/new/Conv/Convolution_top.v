module Convolution_top
#(
	parameter DATA_WIDTH = 8
)
(
	input clk, reset, valid_in,
	input [DATA_WIDTH-1:0] pixel_IN,
	output [DATA_WIDTH-1:0] pixel_OUT,
	output full_fifo1, empty_fifo1, ful_fifo2, empty_fifo2,
	output [16:0] step
);

	wire en_ff1, en_ff2, pp1, pp2;

	Convolution_control Conv_ctrl_inst( .clk(clk), .reset(reset), .valid_in(valid_in),
													.en_ff1(en_ff1), .en_ff2(en_ff2), .pp1(pp1), .pp2(pp2),
													.step(step)
													);
	
	Convolution_datapath Conv_dapath_inst( .clk(clk), .reset(reset), .valid_in(en_ff1), .oe(en_ff2), .pp1(pp1), .pp2(pp2),
														.pixel_IN(pixel_IN),
														.pixel_OUT(pixel_OUT),
														.full_fifo1(full_fifo1), .empty_fifo1(empty_fifo1), .ful_fifo2(ful_fifo2), .empty_fifo2(empty_fifo2)
														);
endmodule
