//Line_Buffer 11 x 32bit
	
module Line_Buffer11x32	
#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 4
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
    addr = 4'd0; 
  end
  else begin
	 addr = addr + 4'd1;
	 if(addr == 4'd12) begin	//when addr = 11, addr = 1
	 	 addr = 4'd0; 
	 end   
  end 




end


	BRAM16x32 BRAM16x32_inst  (	.clk(clk),
											.we(1'b1),
											.addr(addr),
											.Din(Din),
											.Dout(Dout)
										 );

endmodule
