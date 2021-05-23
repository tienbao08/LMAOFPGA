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
    wire [31:0] result;
    wire [9:0] counter;
    wire [7:0] rowcounter;
    wire [31:0] kernal0,
                    kernal1,
                    kernal2,
                    kernal3,
                    kernal4,
                    kernal5,
                    kernal6,
                    kernal7,
                    kernal8;

    
conv uut(
    kernal0,
    kernal1,
    kernal2,
    kernal3,
    kernal4,
    kernal5,
    kernal6,
    kernal7,
    kernal8,
    result,
    counter,
    rowcounter,
    rst,
    clk,
    dataIn
    );
    
    integer data, i, pixel;
initial begin
    data = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/gray_ieee754.txt", "r");
    pixel = $fopen("/home/nguyentienbao/Documents/PycharmProjects/week3/224test.txt", "w");
    clk = 1'b0;
    rst = 1'b1;
    #5
    rst = 1'b0;
    for(i=0;i<50176;i=i+1) begin
        $fscanf(data, "%b\n", dataIn);
        #20;
    end         
end
always @(clk) begin
    #10 clk <= ~clk;
end
always @(posedge clk) begin
     $fdisplay(pixel, "%b" , result);
end
endmodule
