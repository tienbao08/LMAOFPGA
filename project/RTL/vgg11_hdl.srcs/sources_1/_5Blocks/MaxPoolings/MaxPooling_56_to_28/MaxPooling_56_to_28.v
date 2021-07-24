//Frame width = 56 x 56 = 3136

`timescale 1ns / 1ps 

module MaxPooling_56_to_28
#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 6,
	parameter DEPTH = 1 << ADDR_WIDTH,
	parameter frame_width = 32'd3136,
	
	//for Pool_Buffer
	parameter line_width = 32'd56,		
	parameter addr0 = 6'd0,
	parameter addr1 = 6'd1,
	parameter addr_max = 6'd54		//56-2=54
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
	

	Pool_Buffer_54 #(DATA_WIDTH, ADDR_WIDTH, DEPTH, line_width, addr0, addr1, addr_max)
	Pool_Buffer_54_inst							(	.clk(clk), .reset(reset),
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
									
	FIFO_1024 
	FIFO_1024_inst					(	.clk(clk),
											.reset(reset),
											.en(fifo_en),
											.push_pop(pp),
											.DATA_IN(maxOUT),
											.DATA_OUT(DATA_OUT),
											.full_signal(),
											.empty_signal()
											);
endmodule
