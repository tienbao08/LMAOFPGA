`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2021 02:31:50 PM
// Design Name: 
// Module Name: ant0_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ant0_tb
    #(
    parameter DATA_WIDTH = 32,
	parameter frame_in_width = 67280,  //224 x 224 = 50176
	parameter frame_out_width = 49,   //112 x 112 = 12544
	parameter num_step = frame_in_width + frame_out_width
    )
    ();
    reg clk, rst;
	//
	reg [DATA_WIDTH-1:0] red_in;
	reg [DATA_WIDTH-1:0] green_in;
	reg [DATA_WIDTH-1:0] blue_in;
	//
	wire [DATA_WIDTH-1:0] out0;
	wire [DATA_WIDTH-1:0] out1;
	wire done;
    
top
top_dut
(
	clk, rst,
	red_in,
	green_in,
	blue_in,
	//
	out0,
	out1,
	done
);

    integer red, green, blue, i;
    integer pixel0, pixel1;
initial begin
    red = $fopen("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/red_ieee754.txt", "r");
    green = $fopen("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/green_ieee754.txt", "r");
    blue = $fopen("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/blue_ieee754.txt", "r");
    pixel0 = $fopen("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/out0_ant0_ieee754.txt", "w");
    pixel1 = $fopen("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/out1_ant0_ieee754.txt", "w");
    clk = 1'b0;
    rst = 1'b1;
    #5
    rst = 1'b0;
    for(i=0;i<=num_step+1;i=i+1) begin
        $fscanf(red, "%b\n", red_in);
        $fscanf(green, "%b\n", green_in);
        $fscanf(blue, "%b\n", blue_in);
        #40;
        if(i==num_step+1) begin
            $finish;
        end
    end
    
end
always @(clk) begin
    #20 clk <= ~clk;
end
always @(posedge clk) begin
     $fdisplay(pixel0, "%b" , out0);
end
always @(posedge clk) begin
     $fdisplay(pixel1, "%b" , out1);
end
endmodule
