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
    parameter ram_depth = 8,
    parameter counter_depth = 10,
    parameter imgsize = 224
    )
    ();   
    reg [data_width-1:0] dataIn0, dataIn1, dataIn2;
    reg clk, rst;
    wire [data_width-1:0] final_result0,
	final_result1,
	final_result2,
	final_result3,
	final_result4,
	final_result5,
	final_result6,
	final_result7,
	final_result8,
	final_result9,
	final_result10,
	final_result11,
	final_result12,
	final_result13,
	final_result14,
	final_result15,
	final_result16,
	final_result17,
	final_result18,
	final_result19,
	final_result20,
	final_result21,
	final_result22,
	final_result23,
	final_result24,
	final_result25,
	final_result26,
	final_result27,
	final_result28,
	final_result29,
	final_result30,
	final_result31,
	final_result32,
	final_result33,
	final_result34,
	final_result35,
	final_result36,
	final_result37,
	final_result38,
	final_result39,
	final_result40,
	final_result41,
	final_result42,
	final_result43,
	final_result44,
	final_result45,
	final_result46,
	final_result47,
	final_result48,
	final_result49,
	final_result50,
	final_result51,
	final_result52,
	final_result53,
	final_result54,
	final_result55,
	final_result56,
	final_result57,
	final_result58,
	final_result59,
	final_result60,
	final_result61,
	final_result62,
	final_result63;
    wire [ram_depth-1:0] rowcounter;
    wire [counter_depth-1:0] counter;

    
    conv_224_64 dut(
    counter,
    rowcounter,
    clk,
    rst,
    dataIn0,
    dataIn1,
    dataIn2,
    final_result0,
	final_result1,
	final_result2,
	final_result3,
	final_result4,
	final_result5,
	final_result6,
	final_result7,
	final_result8,
	final_result9,
	final_result10,
	final_result11,
	final_result12,
	final_result13,
	final_result14,
	final_result15,
	final_result16,
	final_result17,
	final_result18,
	final_result19,
	final_result20,
	final_result21,
	final_result22,
	final_result23,
	final_result24,
	final_result25,
	final_result26,
	final_result27,
	final_result28,
	final_result29,
	final_result30,
	final_result31,
	final_result32,
	final_result33,
	final_result34,
	final_result35,
	final_result36,
	final_result37,
	final_result38,
	final_result39,
	final_result40,
	final_result41,
	final_result42,
	final_result43,
	final_result44,
	final_result45,
	final_result46,
	final_result47,
	final_result48,
	final_result49,
	final_result50,
	final_result51,
	final_result52,
	final_result53,
	final_result54,
	final_result55,
	final_result56,
	final_result57,
	final_result58,
	final_result59,
	final_result60,
	final_result61,
	final_result62,
	final_result63
    );
    
   
    integer red, green, blue, i;
    integer pixel;
initial begin
    red = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/red_ieee754.txt", "r");
    green = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/green_ieee754.txt", "r");
    blue = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/blue_ieee754.txt", "r");
    pixel = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/Conv_result_ieee754.txt", "w");
    clk = 1'b0;
    rst = 1'b1;
    #5
    rst = 1'b0;
    for(i=0;i<50402;i=i+1) begin
        $fscanf(red, "%b\n", dataIn0);
        $fscanf(green, "%b\n", dataIn1);
        $fscanf(blue, "%b\n", dataIn2);
        #20;
        if(i==50401) begin
            $finish;
        end
    end         
end
always @(clk) begin
    #10 clk <= ~clk;
end
always @(posedge clk) begin
     $fdisplay(pixel, "%b" , final_result0);
end
endmodule
