module Mul_Blue(blue_in, OUT);
	input [23:0] blue_in;
	output [23:0] OUT;
	
	assign OUT = blue_in * 24'd7471;
	
endmodule