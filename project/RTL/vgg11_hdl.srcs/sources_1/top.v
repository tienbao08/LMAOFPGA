`timescale 1ns/1ps
module top
#(
	parameter DATA_WIDTH = 32
)
(
	input clk, rst,
	//
	input [DATA_WIDTH-1:0] red_in,
	input [DATA_WIDTH-1:0] green_in,
	input [DATA_WIDTH-1:0] blue_in,
	//
	output [DATA_WIDTH-1:0] out0,
	output [DATA_WIDTH-1:0] out1,
	output done
);

	wire valid_in1, valid_in2, valid_in3, valid_in4, valid_in5, valid_RAM_FC;

datapath
datapath_inst
(
	.clk(clk), .rst(rst),
	//
	.red_in(red_in),
	.green_in(green_in),
	.blue_in(blue_in),
	//
	.valid_in1(valid_in1), 
	.valid_in2(valid_in2), 
	.valid_in3(valid_in3), 
	.valid_in4(valid_in4), 
	.valid_in5(valid_in5),
	.valid_RAM_FC(valid_RAM_FC),
	//
	.out0(out0),
	.out1(out1)
);

Control
Control_inst
(
	.clk(clk), .rst(rst),
	.done(done),
	.valid_Block1(valid_in1),
	.valid_Block2(valid_in2),
	.valid_Block3(valid_in3),
	.valid_Block4(valid_in4),
	.valid_Block5(valid_in5),
	.valid_RAM_FC(valid_RAM_FC)
);

endmodule
