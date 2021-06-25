`timescale 1ns / 1ps

module Combo1_64map_tb();
	
	parameter clk_prd = 20;
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
	wire [DATA_WIDTH-1:0] out1;
	wire [DATA_WIDTH-1:0] out2;
	wire [DATA_WIDTH-1:0] out3;
	wire [DATA_WIDTH-1:0] out4;
	wire [DATA_WIDTH-1:0] out5;
	wire [DATA_WIDTH-1:0] out6;
	wire [DATA_WIDTH-1:0] out7;
	wire [DATA_WIDTH-1:0] out8;
	wire [DATA_WIDTH-1:0] out9;
	wire [DATA_WIDTH-1:0] out10;
	wire [DATA_WIDTH-1:0] out11;
	wire [DATA_WIDTH-1:0] out12;
	wire [DATA_WIDTH-1:0] out13;
	wire [DATA_WIDTH-1:0] out14;
	wire [DATA_WIDTH-1:0] out15;
	wire [DATA_WIDTH-1:0] out16;
	wire [DATA_WIDTH-1:0] out17;
	wire [DATA_WIDTH-1:0] out18;
	wire [DATA_WIDTH-1:0] out19;
	wire [DATA_WIDTH-1:0] out20;
	wire [DATA_WIDTH-1:0] out21;
	wire [DATA_WIDTH-1:0] out22;
	wire [DATA_WIDTH-1:0] out23;
	wire [DATA_WIDTH-1:0] out24;
	wire [DATA_WIDTH-1:0] out25;
	wire [DATA_WIDTH-1:0] out26;
	wire [DATA_WIDTH-1:0] out27;
	wire [DATA_WIDTH-1:0] out28;
	wire [DATA_WIDTH-1:0] out29;
	wire [DATA_WIDTH-1:0] out30;
	wire [DATA_WIDTH-1:0] out31;
	wire [DATA_WIDTH-1:0] out32;
	wire [DATA_WIDTH-1:0] out33;
	wire [DATA_WIDTH-1:0] out34;
	wire [DATA_WIDTH-1:0] out35;
	wire [DATA_WIDTH-1:0] out36;
	wire [DATA_WIDTH-1:0] out37;
	wire [DATA_WIDTH-1:0] out38;
	wire [DATA_WIDTH-1:0] out39;
	wire [DATA_WIDTH-1:0] out40;
	wire [DATA_WIDTH-1:0] out41;
	wire [DATA_WIDTH-1:0] out42;
	wire [DATA_WIDTH-1:0] out43;
	wire [DATA_WIDTH-1:0] out44;
	wire [DATA_WIDTH-1:0] out45;
	wire [DATA_WIDTH-1:0] out46;
	wire [DATA_WIDTH-1:0] out47;
	wire [DATA_WIDTH-1:0] out48;
	wire [DATA_WIDTH-1:0] out49;
	wire [DATA_WIDTH-1:0] out50;
	wire [DATA_WIDTH-1:0] out51;
	wire [DATA_WIDTH-1:0] out52;
	wire [DATA_WIDTH-1:0] out53;
	wire [DATA_WIDTH-1:0] out54;
	wire [DATA_WIDTH-1:0] out55;
	wire [DATA_WIDTH-1:0] out56;
	wire [DATA_WIDTH-1:0] out57;
	wire [DATA_WIDTH-1:0] out58;
	wire [DATA_WIDTH-1:0] out59;
	wire [DATA_WIDTH-1:0] out60;
	wire [DATA_WIDTH-1:0] out61;
	wire [DATA_WIDTH-1:0] out62;
	wire [DATA_WIDTH-1:0] out63;

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
	
	
Combo1_64map
Combo1_64map_dut (clk, rst, 
	red_in, 
	green_in, 
	blue_in,
	out0,
	out1,
	out2,
	out3,
	out4,
	out5,
	out6,
	out7,
	out8,
	out9,
	out10,
	out11,
	out12,
	out13,
	out14,
	out15,
	out16,
	out17,
	out18,
	out19,
	out20,
	out21,
	out22,
	out23,
	out24,
	out25,
	out26,
	out27,
	out28,
	out29,
	out30,
	out31,
	out32,
	out33,
	out34,
	out35,
	out36,
	out37,
	out38,
	out39,
	out40,
	out41,
	out42,
	out43,
	out44,
	out45,
	out46,
	out47,
	out48,
	out49,
	out50,
	out51,
	out52,
	out53,
	out54,
	out55,
	out56,
	out57,
	out58,
	out59,
	out60,
	out61,
	out62,
	out63
);

endmodule