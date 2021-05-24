`timescale 1ns / 1ps

module MaxPooling_tb();
	
	parameter clk_prd = 40;
	parameter DATA_WIDTH = 32;

	reg clk, reset;
	reg [DATA_WIDTH-1:0] DATA_IN;
	wire [DATA_WIDTH-1:0] DATA_OUT;
	
	
	integer pixel_data, pixel_result, i;
	
	initial begin
		pixel_data = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/gray14_ieee754.txt", "r");
		pixel_result = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/MaxPool_Result.txt", "w");
		
		clk = 0; reset = 1; 
		#clk_prd
		reset = 0;
		
		for(i=0; i<=245; i=i+1) begin
			$fscanf(pixel_data, "%b\n", DATA_IN);
			#clk_prd
			if(i == 245) $finish;
		end
		
		$fclose(pixel_data);

	end
	always @(posedge clk) begin
      $fdisplay(pixel_result, "%b" , DATA_OUT);
	end
		
	always @(clk) #(clk_prd/2) clk <= ~clk;
	
	MaxPooling dut(clk, reset, DATA_IN, DATA_OUT);
endmodule
