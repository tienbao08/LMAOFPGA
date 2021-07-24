//REMEMBER: Read counter pointer in has 1 bit larger address of ff_ram, if ADDR_WIDTH = 14, rptr has 15 bit
//Write_Pointer count 2^14 = 16384
`timescale 1ns / 1ps 

module Read_Pointer_16384

#(
	parameter ADDR_WIDTH = 14
)
(
	input clk,
	input rst,
	input fifo_re,
	output reg [ADDR_WIDTH:0] rptr
);

	always @(posedge clk)
	begin: RESET_CHECK
		if (rst) begin
			rptr <= 15'b0;
		end
		else if (fifo_re) begin
			rptr <= rptr + 15'd1;
		end	
		else begin
			rptr <= rptr;
		end
	end
endmodule
