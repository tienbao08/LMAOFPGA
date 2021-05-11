`timescale 1ns / 1ps

module Conv_tb();
	
	parameter clk_prd = 40;
	parameter DATA_WIDTH = 8;

	reg clk, reset, valid_in;
	reg [DATA_WIDTH-1:0] pixel_IN;
	wire [DATA_WIDTH-1:0] pixel_OUT;
	wire full_fifo1, empty_fifo1, ful_fifo2, empty_fifo2;
	wire [16:0] step;
	
	
	integer pixel_data, pixel_result, i;
	
	initial begin
		//pixel_data = $fopen("D:\TaiLieuHocTapSharing\ChuyenDeThietKeViMach1\Quick_Assignment\Conv\TextFiles\gray_lenna.txt", "r");
		pixel_data = $fopen("gray_lenna.txt", "r");
		pixel_result = $fopen("D:\TaiLieuHocTapSharing\ChuyenDeThietKeViMach1\Quick_Assignment\Conv\TextFiles\Lena_convoled.txt", "w");
		
		clk = 0; reset = 1; valid_in = 1;
		#clk_prd
		reset = 0;
		
		for(i=0; i<=144325; i=i+1) begin
			$fscanf(pixel_data, "%d\n", pixel_IN);
			#clk_prd
			if(i == 144325) $finish;
		end
		
		$fclose(pixel_data);

	end
	always @(posedge clk) begin
      $fdisplay(pixel_result, "%d" , pixel_OUT);
	end
		
	always @(clk) #(clk_prd/2) clk <= ~clk;
	
	Convolution_top dut(clk, reset, valid_in, pixel_IN, pixel_OUT, full_fifo1, empty_fifo1, ful_fifo2, empty_fifo2, step);
endmodule
