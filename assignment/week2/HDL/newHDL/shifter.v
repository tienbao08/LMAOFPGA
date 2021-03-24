module shifter(in, out);
	input [23:0] in;
	output [7:0] out;
	
	assign out = in[23:16];

endmodule