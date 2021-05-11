module Read_Pointer

#(
	parameter ADDR_WIDTH = 16
)
(
	input clk,
	input rst,
	input fifo_re,
	output reg [ADDR_WIDTH:0] rptr
);

	always @(posedge clk)
	begin
		if (rst) begin
			rptr <= 17'b0;
		end
		else if (fifo_re) begin
			rptr <= rptr + 17'd1;
		end	
		else begin
			rptr <= rptr;
		end
	end
endmodule