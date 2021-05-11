module Operator
#(
	parameter DATA_WIDTH = 8
	//parameter ADDR_WIDTH = 3
)
(
	input [DATA_WIDTH-1:0] img11, img12, img13, img21, img22, img23, img31, img32, img33,
	input [DATA_WIDTH-1:0] kernel11, kernel12, kernel13, kernel21, kernel22, kernel23, kernel31, kernel32, kernel33,
	output [DATA_WIDTH-1:0] OUT
);

	wire [DATA_WIDTH-1:0] m1, m2, m3, m4, m5, m6, m7, m8, m9;

	
	//Multiply
	assign m1 = img11 * kernel11;
	assign m2 = img12 * kernel12;
	assign m3 = img13 * kernel13;
	assign m4 = img21 * kernel21;
	assign m5 = img22 * kernel22;
	assign m6 = img23 * kernel23;
	assign m7 = img31 * kernel31;
	assign m8 = img32 * kernel32;
	assign m9 = img33 * kernel33;
	
	//Adder Tree
	assign OUT = m1 + m2 - m3 + m4 + m5 - m6 + m7 + m8 - m9;
	
endmodule

