//module adder 3 input

module adder3input(in1, in2, in3, out);
	input [23:0] in1;
	input [23:0] in2;
	input [23:0] in3;
	output [23:0] out;
	
	wire [23:0] w1;
	
	adder adder_inst1(in1, in2, w1);
	adder adder_inst2(w1, in3, out);
	
endmodule