module adder(a, b, out);
	input [23:0] a;
	input [23:0] b;
	output [23:0] out;
	
	assign out = a + b;
endmodule

