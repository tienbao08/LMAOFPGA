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


module test_tb();
    reg [31:0] dataIn;
    reg clk, rst;
    wire [31:0] result0,
                    result1,
                    result2,
                    result3,
                    result4,
                    result5,
                    result6,
                    result7,
                    result8,
                    result9,
                    result10,
                    result11,
                    result12,
                    result13,
                    result14,
                    result15,
                    result16,
                    result17,
                    result18,
                    result19,
                    result20,
                    result21,
                    result22,
                    result23,
                    result24,
                    result25,
                    result26,
                    result27,
                    result28,
                    result29,
                    result30,
                    result31,
                    result32,
                    result33,
                    result34,
                    result35,
                    result36,
                    result37,
                    result38,
                    result39,
                    result40,
                    result41,
                    result42,
                    result43,
                    result44,
                    result45,
                    result46,
                    result47,
                    result48,
                    result49,
                    result50,
                    result51,
                    result52,
                    result53,
                    result54,
                    result55,
                    result56,
                    result57,
                    result58,
                    result59,
                    result60,
                    result61,
                    result62,
                    result63;
    wire [9:0] counter;
    wire [7:0] rowcounter;
    
conv224_64_red dut(
    result0,
    result1,
    result2,
    result3,
    result4,
    result5,
    result6,
    result7,
    result8,
    result9,
    result10,
    result11,
    result12,
    result13,
    result14,
    result15,
    result16,
    result17,
    result18,
    result19,
    result20,
    result21,
    result22,
    result23,
    result24,
    result25,
    result26,
    result27,
    result28,
    result29,
    result30,
    result31,
    result32,
    result33,
    result34,
    result35,
    result36,
    result37,
    result38,
    result39,
    result40,
    result41,
    result42,
    result43,
    result44,
    result45,
    result46,
    result47,
    result48,
    result49,
    result50,
    result51,
    result52,
    result53,
    result54,
    result55,
    result56,
    result57,
    result58,
    result59,
    result60,
    result61,
    result62,
    result63,
    counter,
    rowcounter,
    rst,
    clk,
    dataIn
    );
    
    integer data, i;
    integer pixel;
initial begin
    data = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/gray_ieee754.txt", "r");
    pixel = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/Conv_result_ieee754.txt", "w");
    clk = 1'b0;
    rst = 1'b1;
    #5
    rst = 1'b0;
    for(i=0;i<50402;i=i+1) begin
        $fscanf(data, "%b\n", dataIn);
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
     $fdisplay(pixel, "%b" , result0);
end
endmodule
