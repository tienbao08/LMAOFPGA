`timescale 1ns / 1ps

module _5Blocks_tb
#(
	parameter clk_prd = 40;
	parameter data_width = 32;

	parameter frame_in_width = 67280;  
	parameter frame_out_width = 49;   
	parameter num_step = frame_in_width + frame_out_width;
)
();
	reg clk, rst;
	reg [data_width-1:0] red_in;
	reg [data_width-1:0] green_in;
	reg [data_width-1:0] blue_in;
	//
	wire [data_width-1:0] out0;
	wire [data_width-1:0] out1;
	wire [data_width-1:0] out2;
	wire [data_width-1:0] out3;
	wire [data_width-1:0] out4;
	wire [data_width-1:0] out5;
	wire [data_width-1:0] out6;
	wire [data_width-1:0] out7;
	wire [data_width-1:0] out8;
	wire [data_width-1:0] out9;
	wire [data_width-1:0] out10;
	wire [data_width-1:0] out11;
	wire [data_width-1:0] out12;
	wire [data_width-1:0] out13;
	wire [data_width-1:0] out14;
	wire [data_width-1:0] out15;
	wire [data_width-1:0] out16;
	wire [data_width-1:0] out17;
	wire [data_width-1:0] out18;
	wire [data_width-1:0] out19;
	wire [data_width-1:0] out20;
	wire [data_width-1:0] out21;
	wire [data_width-1:0] out22;
	wire [data_width-1:0] out23;
	wire [data_width-1:0] out24;
	wire [data_width-1:0] out25;
	wire [data_width-1:0] out26;
	wire [data_width-1:0] out27;
	wire [data_width-1:0] out28;
	wire [data_width-1:0] out29;
	wire [data_width-1:0] out30;
	wire [data_width-1:0] out31;
	wire [data_width-1:0] out32;
	wire [data_width-1:0] out33;
	wire [data_width-1:0] out34;
	wire [data_width-1:0] out35;
	wire [data_width-1:0] out36;
	wire [data_width-1:0] out37;
	wire [data_width-1:0] out38;
	wire [data_width-1:0] out39;
	wire [data_width-1:0] out40;
	wire [data_width-1:0] out41;
	wire [data_width-1:0] out42;
	wire [data_width-1:0] out43;
	wire [data_width-1:0] out44;
	wire [data_width-1:0] out45;
	wire [data_width-1:0] out46;
	wire [data_width-1:0] out47;
	wire [data_width-1:0] out48;
	wire [data_width-1:0] out49;
	wire [data_width-1:0] out50;
	wire [data_width-1:0] out51;
	wire [data_width-1:0] out52;
	wire [data_width-1:0] out53;
	wire [data_width-1:0] out54;
	wire [data_width-1:0] out55;
	wire [data_width-1:0] out56;
	wire [data_width-1:0] out57;
	wire [data_width-1:0] out58;
	wire [data_width-1:0] out59;
	wire [data_width-1:0] out60;
	wire [data_width-1:0] out61;
	wire [data_width-1:0] out62;
	wire [data_width-1:0] out63;
	
	integer red, green, blue, i;
	integer pixel_result;
	initial begin
		 red = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/red_ieee754.txt", "r");
		 green = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/green_ieee754.txt", "r");
		 blue = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/blue_ieee754.txt", "r");
		 pixel_result = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/5Block_map1_ieee754.txt", "w");
		 clk = 1'b0;
		 rst = 1'b1;
		 #clk_prd
		 rst = 1'b0;
		 for(i=0;i<=num_step;i=i+1) begin
			  $fscanf(red, "%b\n", red_in);
			  $fscanf(green, "%b\n", green_in);
			  $fscanf(blue, "%b\n", blue_in);
			  #40;
			  if(i==num_step) begin
					$finish;
			  end
		 end
	end
	always @(clk) begin
		 #(clk_prd/2) clk <= ~clk;
	end
	always @(posedge clk) begin
		  $fdisplay(pixel_result, "%b", out0);
	end
	
	_5Blocks
	_5Blocks_dut
	(
		clk, rst,
		//
		red_in,
		green_in,
		blue_in,
		//
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
