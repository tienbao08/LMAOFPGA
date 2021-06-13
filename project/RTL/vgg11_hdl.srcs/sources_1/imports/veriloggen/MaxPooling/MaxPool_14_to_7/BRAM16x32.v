module BRAM16x32
#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 4,
	parameter DEPTH = 1 << ADDR_WIDTH
)
(
	input clk,
	input we,
	input [ADDR_WIDTH-1:0] addr,
	input [DATA_WIDTH-1:0] Din,
	output reg [DATA_WIDTH-1:0] Dout	
);

reg [DATA_WIDTH-1:0] mem [DEPTH-1:0];

always @(posedge clk) begin
	if(we) begin
		mem[addr] <= Din;
	end
	Dout = mem[addr];
end

endmodule
