module Write_Pointer

#(
	parameter ADDR_WIDTH = 16
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
			wptr <= 17'b0;
		end
		else if (fifo_we) begin
			wptr <= wptr + 17'd1;
		end	
		else begin
			wptr <= wptr;
		end
	end
endmodule
