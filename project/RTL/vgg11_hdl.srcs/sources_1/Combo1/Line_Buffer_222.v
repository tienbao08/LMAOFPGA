//Line_Buffer 222 x 32bit
	
module Line_Buffer_222
#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 8
)
(
	input clk, reset,
	input [DATA_WIDTH-1:0] Din,
	output [DATA_WIDTH-1:0] Dout,
	output [ADDR_WIDTH-1:0] addrOUT
);
	reg [ADDR_WIDTH-1:0] addr;

assign addrOUT = addr;
always @(posedge clk) begin
  if (reset) begin
    addr = 8'd0; 
  end
  else begin
	 addr = addr + 8'd1;
	 if(addr == 8'd222) begin	//when addr = 222, addr = 0
	 	 addr = 8'd0; 
	 end   
  end 




end


	BRAM_256 BRAM_256_inst  (	.clk(clk),
											.we(1'b1),
											.addr(addr),
											.Din(Din),
											.Dout(Dout)
										 );

endmodule
