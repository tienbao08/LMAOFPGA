//Frame width = 112 x 112 = 12544

`timescale 1ns / 1ps 

module MaxPooling_112_to_56
#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 7,
	parameter DEPTH = 1 << ADDR_WIDTH,
	parameter frame_width = 32'd12544,
	
	//for Pool_Buffer
	parameter line_width = 32'd112,		
	parameter addr0 = 7'd0,
	parameter addr1 = 7'd1,
	parameter addr_max = 7'd110		//112 - 2 = 110
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
	

	Pool_Buffer_110 #(DATA_WIDTH, ADDR_WIDTH, DEPTH, line_width, addr0, addr1, addr_max)
	Pool_Buffer_110_inst							(	.clk(clk), .reset(reset),
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
									
	FIFO_4096 
	FIFO_4096_inst					(	.clk(clk),
											.reset(reset),
											.en(fifo_en),
											.push_pop(pp),
											.DATA_IN(maxOUT),
											.DATA_OUT(DATA_OUT),
											.full_signal(),
											.empty_signal()
											);
endmodule