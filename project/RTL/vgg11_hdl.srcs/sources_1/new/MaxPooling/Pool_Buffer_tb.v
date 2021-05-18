`timescale 1ns / 1ps

module Pool_Buffer_tb();
	
	parameter clk_prd = 40;
	parameter DATA_WIDTH = 32;

	reg clk;
	reg [DATA_WIDTH-1:0] Din;
	wire [DATA_WIDTH-1:0] o12;
	wire [DATA_WIDTH-1:0] o11, o21, o22;
	wire valid_out;
	wire [DATA_WIDTH-1:0] rowOUT, colOUT, count_clk_OUT;
	
	
	integer pixel_data, pixel_o11, pixel_o12, pixel_o21, pixel_o22, i;
	
	initial begin
		pixel_data = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/fp_ieee754.txt", "r");
		pixel_o11 = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/PoolResult11.txt", "w");
		pixel_o12 = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/PoolResult12.txt", "w");
		pixel_o21 = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/PoolResult21.txt", "w");
		pixel_o22 = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/PoolResult22.txt", "w");
		
		clk = 0; 
		#clk_prd
		
		for(i=0; i<=250; i=i+1) begin
			$fscanf(pixel_data, "%b\n", Din);
			#clk_prd
			if(i == 250) $finish;
		end
		
		$fclose(pixel_data);

	end
	always @(posedge clk) begin
      $fdisplay(pixel_o11, "%b" , o11);
		$fdisplay(pixel_o12, "%b" , o12);
		$fdisplay(pixel_o21, "%b" , o21);
		$fdisplay(pixel_o22, "%b" , o22);
	end
		
	always @(clk) #(clk_prd/2) clk <= ~clk;
	
	Pool_Buffer dut(
						clk,
						Din,
						o12,
						o11, o21, o22,
						valid_out,
						rowOUT, colOUT, count_clk_OUT
					);
endmodule
