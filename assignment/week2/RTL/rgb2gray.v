module rgb2gray(clk, rst, red_in, green_in, blue_in, gray_out);
	input clk, rst;
	input [7:0] red_in, green_in, blue_in;
	output [7:0] gray_out;
	
	reg [7:0] red, green, blue;
	
	always @(posedge clk) begin
		if(rst) begin
			red <= 0;
			green <= 0;
			blue <= 0;
		end 
		else begin
			red <= red_in;
			green <= green_in;
			blue <= blue_in;
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
	Mul_Red Mul_Red_inst( .red_in(se_red_out),
								 .OUT(mul_red_out)
								 );
	Mul_Green Mul_Green_inst(.green_in(se_green_out),
								 .OUT(mul_green_out)
								 );
	Mul_Blue Mul_Blue_inst(.blue_in(se_blue_out),
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
	
	