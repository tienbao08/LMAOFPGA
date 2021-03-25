module Mul_Red(red_in, OUT);
	input [23:0] red_in;
	output [23:0] OUT;
	
	assign OUT = red_in * 24'd19589;
	
endmodule
