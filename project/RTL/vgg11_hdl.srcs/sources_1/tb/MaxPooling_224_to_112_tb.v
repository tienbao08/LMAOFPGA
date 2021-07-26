`timescale 1ns / 1ps

module MaxPooling_224_to_112_tb();
	
	parameter clk_prd = 40;
	parameter DATA_WIDTH = 32;
	parameter frame_in_width = 12544;   //224 x 224 = 50176
	parameter frame_out_width = 3136;   //112 x 112 = 12544
	parameter num_step = frame_in_width + frame_out_width;

	reg clk, reset;
	reg [DATA_WIDTH-1:0] DATA_IN;
	wire [DATA_WIDTH-1:0] DATA_OUT;
	
	
	integer pixel_data, pixel_result, i;
	
	initial begin
		pixel_data = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/gray_dog_ieee754.txt", "r");
		pixel_result = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/MaxPool224_Result_ieee754.txt", "w");
		
		clk = 0; reset = 1; 
		#clk_prd
		reset = 0;
		
		for(i=0; i <= num_step; i=i+1) begin
			$fscanf(pixel_data, "%b\n", DATA_IN);
			#clk_prd
			if(i == num_step) $finish;
		end
		
		$fclose(pixel_data);

	end
	always @(posedge clk) begin
      $fdisplay(pixel_result, "%b" , DATA_OUT);
	end
		
	always @(clk) #(clk_prd/2) clk <= ~clk;
	
	MaxPooling_112_to_56 MaxPooling_112_to_56_dut(clk, reset, DATA_IN, DATA_OUT);
endmodule
