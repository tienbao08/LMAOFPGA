//REMEMBER: Write counter pointer in has 1 bit larger address of ff_ram, if ADDR_WIDTH = 6, wptr has 7 bit
module Write_Pointer

#(
	parameter ADDR_WIDTH = 6
)
(
	input clk,
	input rst,
	input fifo_we,
	output reg [ADDR_WIDTH:0] wptr
);

	always @(posedge clk)
	begin
		if (rst) begin
			wptr <= 7'b0;
		end
		else if (fifo_we) begin
			wptr <= wptr + 7'd1;
		end	
		else begin
			wptr <= wptr;
		end
	end
endmodule
