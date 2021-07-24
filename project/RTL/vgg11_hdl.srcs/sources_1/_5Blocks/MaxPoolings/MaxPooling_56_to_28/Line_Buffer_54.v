//Line_Buffer 222 x 32bit
`timescale 1ns / 1ps 

module Line_Buffer_54
#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 7,
	parameter DEPTH = 1 << ADDR_WIDTH,
	//
	parameter addr0 = 7'd0,
	parameter addr1 = 7'd1,
	parameter addr_max = 7'd110
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
    addr = addr0; 
  end
  else begin
	 addr = addr + addr1;
	 if(addr == addr_max) begin	//when addr = 222, addr = 0
	 	 addr = addr0; 
	 end   
  end 




end


	BRAM_64 #(DATA_WIDTH, ADDR_WIDTH, DEPTH)
	BRAM_64_inst  				(	.clk(clk),
											.we(1'b1),
											.addr(addr),
											.Din(Din),
											.Dout(Dout)
										 );

endmodule
