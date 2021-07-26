`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2021 02:31:50 PM
// Design Name: 
// Module Name: conv_224_4_tb
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


module conv_224_4_tb
    #(
    parameter data_width = 32,
	parameter num_step = 50402
    )
    ();
    reg [data_width-1:0] dataIn0,
	dataIn1,
	dataIn2;
    reg clk, rst;
    wire [data_width-1:0] final_result0,
	final_result1,
	final_result2,
	final_result3;
	
conv_224_4    
dut(
    clk,
    rst,
    dataIn0,
	dataIn1,
	dataIn2,
    final_result0,
	final_result1,
	final_result2,
	final_result3
    );
    integer red, green, blue, i;
initial begin
    red = $fopen("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/red_ieee754.txt", "r");
    green = $fopen("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/green_ieee754.txt", "r");
    blue = $fopen("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/blue_ieee754.txt", "r");
    clk = 1'b0;
    rst = 1'b1;
    #5
    rst = 1'b0;
    for(i=0;i<=num_step;i=i+1) begin
        $fscanf(red, "%b\n", dataIn0);
        $fscanf(green, "%b\n", dataIn1);
        $fscanf(blue, "%b\n", dataIn2);
        #40;
        if(i==num_step) begin
            $finish;
        end
    end
    
end
always @(clk) begin
    #20 clk <= ~clk;
end
endmodule
