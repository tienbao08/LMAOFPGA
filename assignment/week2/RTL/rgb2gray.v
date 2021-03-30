module rgb2gray(clk, rst, red_in, green_in, blue_in, gray_out, valid_in, valid_out);
	input clk, rst;
	input valid_in;
	input [7:0] red_in, green_in, blue_in;
	output [7:0] gray_out;
	output reg valid_out;
	
	reg [7:0] red, green, blue;
	
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			red <= 0;
			green <= 0;
			blue <= 0;
			valid_out <= 0;
		end 
		else if(valid_in) begin
			red <= red_in;
			green <= green_in;
			blue <= blue_in;
			valid_out <= 1;
		end
	end
	
	wire [23:0] se_red_out, se_green_out, se_blue_out, mul_red_out, mul_green_out, mul_blue_out, add_out;
	
	SignExtend SignExtend_red( .out(se_red_out),
										  .in(red)
									    );
	SignExtend SignExtend_green( .out(se_green_out),
										  .in(green)
									    );
	SignExtend SignExtend_blue( .out(se_blue_out),
										  .in(blue)
									    );
	Mul Mul_Red_inst( .a(se_red_out),
			 .b(24'd19595),
					  .OUT(mul_red_out)
					);
	Mul Mul_Green_inst( .a(se_green_out),
	                  .b(24'd38469),
					  .OUT(mul_green_out)
					);
	Mul Mul_Blue_inst( .a(se_blue_out),
	                  .b(24'd7471),
					  .OUT(mul_blue_out)
					);
	adder3input adder3input_inst( .in1(mul_red_out),
											.in2(mul_green_out),
											.in3(mul_blue_out),
											.out(add_out)
											); 
	shifter shifter_inst( .in(add_out),
								 .out(gray_out)
								 );
endmodule
	
	
