module Status_Signal_16384

#(
	parameter ADDR_WIDTH = 3
)

(
	input ff_en,
	input ff_push_pop,
	input [ADDR_WIDTH:0] wptr,
	input [ADDR_WIDTH:0] rptr,
	output ff_we,
	output ff_re,
	output ff_cs,
	output full_signal,
	output empty_signal
);

	wire pointer_equal;
	wire fbit_equal;
	wire overflow, underflow;
	
	
	assign fbit_equal = wptr[ADDR_WIDTH] ~^ rptr[ADDR_WIDTH];
	assign pointer_equal = (wptr[ADDR_WIDTH-1:0] == rptr[ADDR_WIDTH-1:0]) ? 1 : 0;
	
	assign full_signal = (~fbit_equal) & pointer_equal;
	assign empty_signal = fbit_equal & pointer_equal;
	
	assign ff_we = (~full_signal) & ff_push_pop & ff_en;
	assign ff_re = (~empty_signal) & (~ff_push_pop) & ff_en;
	
	assign overflow = full_signal & ff_push_pop;
	assign underflow = empty_signal & (~ff_push_pop);
	
	assign ff_cs = ~(overflow || underflow) & ff_en;
	
endmodule
	
	
	
	
