module Pool_Buffer
#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 4 
)
(
	input clk,
	input [DATA_WIDTH-1:0] Din,
	output [DATA_WIDTH-1:0] o12,
	output reg [DATA_WIDTH-1:0] o11, o21, o22,
	output valid_out,
	output [DATA_WIDTH-1:0] rowOUT, colOUT, count_clk_OUT
);
	integer row, col, count_clk;
	
	wire [DATA_WIDTH-1:0] line_Buffer_out;
	
	Line_Buffer11x32 Line_Buffer11x32_inst	(	.clk(clk),
															.Din(o21),
															.Dout(line_Buffer_out),
															.addrOUT()
														);
	assign o12 = line_Buffer_out;
	assign valid_out = ((col%2==1) && (row%2==0)) ? 1'b1 : 1'b0;	
	assign rowOUT = row;
	assign colOUT = col;
	assign count_clk_OUT = count_clk;
	
	always @(posedge clk) 
	begin: STRIDE_2
		count_clk = count_clk + 1;
		if(count_clk >15) begin
			col = col + 1;
			if(col > 14) begin
				col = 1;
				row = row + 1;
				if(row > 13) begin
					row = 0;
				end
			end		
		end

	end
	
	always @(posedge clk) 
	begin: BUFFER
		o22 <= Din;
		o21 <= o22;
		o11 <= line_Buffer_out;
	end
endmodule	