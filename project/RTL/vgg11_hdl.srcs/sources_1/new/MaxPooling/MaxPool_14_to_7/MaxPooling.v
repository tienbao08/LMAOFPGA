//Output start affter 196 clock
module MaxPooling
#(
	parameter DATA_WIDTH = 32
	//parameter ADDR_WIDTH = 4 
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
	
	
	assign fifo_en = (count_clk_OUT > 196) ? 1'b1 : valid_w;
	assign pp = (count_clk_OUT > 196) ? 1'b0 : 1'b1;
	

	Pool_Buffer Pool_Buffer_inst(		.clk(clk), .reset(reset),
												.Din(DATA_IN),
												.o12(o12),
												.o11(o11), .o21(o21), .o22(o22),
												.valid_out(valid_w),
												.rowOUT(rowOUT), .colOUT(colOUT), .count_clk_OUT(count_clk_OUT)
												);
											
	max_1in4 max_1in4_inst (    .a(o11),
										 .b(o12),
										 .c(o21),
										 .d(o22),
										 .max_final(maxOUT)
									);
									
	FIFO FIFO_inst(	.clk(clk),
							.reset(reset),
							.en(fifo_en),
							.push_pop(pp),
							.DATA_IN(maxOUT),
							.DATA_OUT(DATA_OUT),
							.full_signal(),
							.empty_signal()
							);
endmodule