module Mul_Green(green_in, OUT);
	input [23:0] green_in;
	output [23:0] OUT;
	
	assign OUT = green_in * 24'd38469;
	
endmodule
