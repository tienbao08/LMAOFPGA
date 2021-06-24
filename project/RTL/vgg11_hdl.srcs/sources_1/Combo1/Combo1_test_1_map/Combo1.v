module Combo1
#(
	parameter DATA_WIDTH = 32
)
(	
	input clk, reset,
	input [DATA_WIDTH-1:0] red_in,
	input [DATA_WIDTH-1:0] green_in,
	input [DATA_WIDTH-1:0] blue_in,
	
	output [DATA_WIDTH-1:0] out0
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


wire [DATA_WIDTH-1:0] conv_out0;


conv_224_64 
conv_224_64_inst  		(  .counter(),
									.rowcounter(),
									.clk(clk),
									.rst(reset),
									.dataIn0(red_in),
									.dataIn1(green_in),
									.dataIn2(blue_in),
									.final_result0(conv_out0),
	.final_result1(),
	.final_result2(),
	.final_result3(),
	.final_result4(),
	.final_result5(),
	.final_result6(),
	.final_result7(),
	.final_result8(),
	.final_result9(),
	.final_result10(),
	.final_result11(),
	.final_result12(),
	.final_result13(),
	.final_result14(),
	.final_result15(),
	.final_result16(),
	.final_result17(),
	.final_result18(),
	.final_result19(),
	.final_result20(),
	.final_result21(),
	.final_result22(),
	.final_result23(),
	.final_result24(),
	.final_result25(),
	.final_result26(),
	.final_result27(),
	.final_result28(),
	.final_result29(),
	.final_result30(),
	.final_result31(),
	.final_result32(),
	.final_result33(),
	.final_result34(),
	.final_result35(),
	.final_result36(),
	.final_result37(),
	.final_result38(),
	.final_result39(),
	.final_result40(),
	.final_result41(),
	.final_result42(),
	.final_result43(),
	.final_result44(),
	.final_result45(),
	.final_result46(),
	.final_result47(),
	.final_result48(),
	.final_result49(),
	.final_result50(),
	.final_result51(),
	.final_result52(),
	.final_result53(),
	.final_result54(),
	.final_result55(),
	.final_result56(),
	.final_result57(),
	.final_result58(),
	.final_result59(),
	.final_result60(),
	.final_result61(),
	.final_result62(),
	.final_result63()
	);

MaxPooling_224_to_112 MaxPool_inst0(.clk(clk), .reset(maxPool_reset), .DATA_IN(conv_out0), .DATA_OUT(out0));
//MaxPooling_224_to_112 MaxPool_inst1(.clk(clk), .reset(maxPool_reset), .DATA_IN(conv_out1), .DATA_OUT(out1));


endmodule
