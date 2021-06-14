module adder3
#(
    parameter data_width = 32
)
(
	input [data_width-1:0] in1, in2, in3,
	output [data_width-1:0] out
);

wire [data_width-1:0] add1;

adder adder_1(
					 .a(in1),
					 .b(in2),
					 .out(add1)
				  );
				  
adder adder_2(
					 .a(add1),
					 .b(in3),
					 .out(out)
				  );	
endmodule
			  