module Line_Buffer	
#(
	parameter DATA_WIDTH = 8,
	parameter ADDR_WIDTH = 8
)
(
	input clk,
	input [DATA_WIDTH-1:0] Din,
	output [DATA_WIDTH-1:0] Dout	
);
	reg [ADDR_WIDTH-1:0] addr;


always @(posedge clk) begin
	if(addr == 8'b11011010) begin	//218
		addr = 8'b00000001; 
	end
	addr = addr + 8'b00000001;
end


	BRAM BRAM_inst  (	.clk(clk),
							.we(1'b1),
							.addr(addr),
							.Din(Din),
							.Dout(Dout)
						 );

endmodule
