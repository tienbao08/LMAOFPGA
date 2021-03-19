`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 09:31:36 PM
// Design Name: 
// Module Name: rgb2gray
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


module rgb2gray(gray, red, green, blue, clk, rst);
    parameter bit_width = 8;
    input wire [bit_width-1:0] red, green, blue;
    input wire clk, rst;
    output reg [bit_width-1:0] gray;
    always @(posedge clk, negedge rst) begin
        if(!rst) begin
            gray <= 8'd0;
        end
        else begin
            gray <= (red>>2) + (red>>5) + (red>>6) + (green>>1) + (green>>4) + (green>>6) + (blue>>4) + (blue>>5) + (blue>>6);
        end
    end
endmodule
