`timescale 1ns / 1ps

module Max_1_in_2(
    a,
    b,
    max
    );
    
    input wire [31:0] a, b;
    output [31:0] max;
		
	 wire [31:0] sub_out;
	 
	 assign max = (sub_out[31] == 1'b0) ? a : b;
	
    Subtractor_fp Subtractor_fp_inst (     .a(a),
														 .b(b),
														 .out(sub_out)
													);

endmodule






