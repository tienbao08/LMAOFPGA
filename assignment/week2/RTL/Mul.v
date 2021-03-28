module Mul(a, b, OUT);
	input [23:0] a, b;
	output [23:0] OUT;
	
	assign OUT = a * b;
	
endmodule
