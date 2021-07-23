`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2021 02:31:50 PM
// Design Name: 
// Module Name: test_tb
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


module test_tb
    #(
    parameter data_width = 32,
    parameter conv_step = 226,
	parameter frame_in_width = 50176,  //224 x 224 = 50176
	parameter frame_out_width = 12544,   //112 x 112 = 12544
	parameter num_step = frame_in_width + frame_out_width + conv_step
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
    
Block1
dut(
    clk, 
    rst,
    red_in,
    green_in,
    blue_in,
    //
    out0,
    out1,
    out2,
    out3   
); 
    integer red, green, blue, i;
    integer pixel;
initial begin
    red = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/red_ieee754.txt", "r");
    green = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/green_ieee754.txt", "r");
    blue = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/blue_ieee754.txt", "r");
    pixel = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/block1_result_ieee754.txt", "w");
    clk = 1'b0;
    rst = 1'b1;
    #5
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
    #20 clk <= ~clk;
end
always @(posedge clk) begin
     $fdisplay(pixel, "%b" , out0);
end
endmodule
