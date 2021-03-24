module SignExtend(out, in);
	input [7:0] in;
	output [23:0] out;
	
	assign out = { 16'b0, in[7:0] };
	
endmodule