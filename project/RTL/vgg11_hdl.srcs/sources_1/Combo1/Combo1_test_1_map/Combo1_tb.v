`timescale 1ns / 1ps

module Combo1_tb();
	
	parameter clk_prd = 40;
	parameter DATA_WIDTH = 32;
	parameter conv_step = 230;
	parameter frame_in_width = 50176;   //224 x 224 = 50176
	parameter frame_out_width = 12544;   //112 x 112 = 12544
	parameter num_step = frame_in_width + frame_out_width + conv_step;
  
  //------------------
	reg clk, rst;
	reg [DATA_WIDTH-1:0] red_in;
	reg [DATA_WIDTH-1:0] green_in;
	reg [DATA_WIDTH-1:0] blue_in;
	
	wire [DATA_WIDTH-1:0] out0;

	//----------------------------
	
	integer i;
	integer red, green, blue;
	integer resultmap0;
	
	
	initial begin
		red = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/red_ieee754.txt", "r");
		green = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/green_ieee754.txt", "r");
		blue = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/blue_ieee754.txt", "r");
		resultmap0 = $fopen("D:/TaiLieuHocTapSharing/ChuyenDeThietKeViMach1/CNNProject/TxtFile/Combo1_Result_ieee754.txt", "w");
		
		clk = 1'b0;
		rst = 1'b1;
		#5
		rst = 0;
		
		for(i=0; i <= num_step; i=i+1) begin
			$fscanf(red, "%b\n", red_in);
			$fscanf(green, "%b\n", green_in);
			$fscanf(blue, "%b\n", blue_in);
			#clk_prd
			if(i == num_step) $finish;
		end
		
		$fclose(red);
		$fclose(green);
		$fclose(blue);

	end
	always @(posedge clk) begin
      $fdisplay(resultmap0, "%b" , out0);
	end
		
	always @(clk) #(clk_prd/2) clk <= ~clk;
	
	
	Combo1 
	Combo1_dut (clk, rst, 
					red_in, 
					green_in, 
					blue_in,
					out0
);

endmodule