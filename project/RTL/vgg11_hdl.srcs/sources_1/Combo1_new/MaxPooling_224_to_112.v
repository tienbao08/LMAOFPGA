//Frame width = 224 x 224 = 50176
//Output start affter 12544 clock, done after 245 clock
`timescale 1ns / 1ps 

module MaxPooling_224_to_112
#(
	parameter DATA_WIDTH = 32,
	parameter frame_width = 32'd50176		
)
(
	input clk, reset, 
	input [DATA_WIDTH-1:0] DATA_IN,
	output [DATA_WIDTH-1:0] DATA_OUT
	
);
	
	wire [DATA_WIDTH-1:0] o11, o12, o21, o22;
	wire [DATA_WIDTH-1:0] maxOUT;
	wire [DATA_WIDTH-1:0] rowOUT, colOUT, count_clk_OUT;
	wire valid_w, pp, fifo_en;
	
	
	assign fifo_en = (count_clk_OUT > frame_width) ? 1'b1 : valid_w;
	assign pp = (count_clk_OUT > frame_width) ? 1'b0 : 1'b1;
	

	Pool_Buffer_222 Pool_Buffer_222_inst(		.clk(clk), .reset(reset),
															.Din(DATA_IN),
															.o12(o12),
															.o11(o11), .o21(o21), .o22(o22),
															.valid_out(valid_w),
															.rowOUT(rowOUT), .colOUT(colOUT), .count_clk_OUT(count_clk_OUT)
															);
											
	Max_1_in_4 Max_1_in_4_inst (   .a(o11),
											 .b(o12),
											 .c(o21),
											 .d(o22),
											 .max_final(maxOUT)
										);
									
	FIFO_16384 FIFO_16384_inst(	.clk(clk),
											.reset(reset),
											.en(fifo_en),
											.push_pop(pp),
											.DATA_IN(maxOUT),
											.DATA_OUT(DATA_OUT),
											.full_signal(),
											.empty_signal()
											);
endmodule
