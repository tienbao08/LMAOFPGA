//REMEMBER: Write counter pointer in has 1 bit larger address of ff_ram, if ADDR_WIDTH = 14, wptr has 15 bit
//Write_Pointer count 2^14 = 16384
`timescale 1ns / 1ps 

module Write_Pointer_4096

#(
	parameter ADDR_WIDTH = 12,
	parameter ptr0 = 13'b0,
	parameter ptr1 = 13'b1
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
			wptr <= ptr0;
		end	
		else if(fifo_we)  begin
			wptr <= wptr + ptr1;
		end
		else begin
			wptr <= wptr;
		end
	end

	//always @(posedge clk)
	//begin: RESET_CHECK
		//if (rst) begin
			//wptr <= 15'b0;
		//end
	//end
	//always @(fifo_we) 
	//begin: COUNT_WPTR
		//if (fifo_we) begin
			//wptr <= wptr + 15'd1;
		//end	
		//else begin
			//wptr <= wptr;
		//end
	//end

endmodule