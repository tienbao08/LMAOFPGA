//REMEMBER: Write counter pointer in has 1 bit larger address of ff_ram, if ADDR_WIDTH = 14, wptr has 15 bit
//Write_Pointer count 2^14 = 16384
module Write_Pointer_16384

#(
	parameter ADDR_WIDTH = 14
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
			wptr <= 15'b0;
		end
		else if (fifo_we) begin
			wptr <= wptr + 15'd1;
		end	
		else begin
			wptr <= wptr;
		end
	end
endmodule