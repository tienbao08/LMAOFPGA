`timescale 1ns / 1ps 

module Pool_Buffer_54
#(
	parameter DATA_WIDTH = 32,
	parameter ADDR_WIDTH = 7,
	parameter DEPTH = 1 << ADDR_WIDTH,
		
	//For counting column, row & count_clk
	parameter line_width = 32'd112,

	//for Line_Buffer
	parameter addr0 = 7'd0,
	parameter addr1 = 7'd1,
	parameter addr_max = 7'd110
)
(
	input clk, reset,
	input [DATA_WIDTH-1:0] Din,
	output [DATA_WIDTH-1:0] o12,
	output reg [DATA_WIDTH-1:0] o11, o21, o22,
	output valid_out,
	output [DATA_WIDTH-1:0] rowOUT, colOUT, count_clk_OUT
);
	reg [DATA_WIDTH-1:0] row, col, count_clk;
	
	wire [DATA_WIDTH-1:0] line_Buffer_out;
	
	Line_Buffer_54 #(DATA_WIDTH, ADDR_WIDTH, DEPTH, addr0, addr1, addr_max)
	Line_Buffer_54_inst							(	.clk(clk), .reset(reset),
															.Din(o21),
															.Dout(line_Buffer_out),
															.addrOUT()
														);
	assign o12 = line_Buffer_out;
	assign valid_out = ((col%2==1) && (row%2==0) && clk) ? 1'b1 : 1'b0;	
	assign rowOUT = row;
	assign colOUT = col;
	assign count_clk_OUT = count_clk;
	
	
	
	always @(posedge clk) 
	begin: STRIDE_2
	  if (reset) begin
	    row = 32'd0;
	    col = 32'd0;
	    count_clk = 32'd0;
	  end
	  else begin
		  count_clk = count_clk + 32'd1;
		  if(count_clk > (line_width + 32'd1)) begin
			   col = col + 32'd1;
			   if(col > line_width) begin
			   	 col = 32'd1;
				   row = row + 32'd1;
				   if(row > (line_width - 32'd1)) begin
					   row = 32'd0;
				   end
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
