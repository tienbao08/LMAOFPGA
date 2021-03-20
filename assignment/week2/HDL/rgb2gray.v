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


module rgb2gray(r_valid, g_valid, b_valid, gray_pic, done_one, done_full, red, green, blue, clk, rst);
    parameter bit_width = 8;
    input wire [bit_width-1:0] red, green, blue;
    input wire clk, rst;
    output wire [bit_width-1:0] gray_pic;
    output reg done_one;
    output reg done_full;
    output wire r_valid, g_valid, b_valid;
    reg [23:0] gray;
    reg [19:0] pixel;
    assign r_valid = (red >= 8'd0 | red <= 8'd255) ? 1'b1 : 1'b0; 
    assign g_valid = (green >= 8'd0 | green <= 8'd255) ? 1'b1 : 1'b0;
    assign b_valid = (blue >= 8'd0 | blue <= 8'd255) ? 1'b1 : 1'b0;
    always @(posedge clk, negedge rst) begin
        if(!rst) begin
            gray <= 8'd0;
            done_one <= 1'b0;
            pixel <= 20'd0;
        end
        else if(!r_valid | !g_valid | !b_valid) begin
            gray <= 24'd0;
        end
        else if(pixel == 20'd591360) begin
            done_full <= 1'b1;
        end
        else begin
            gray <= 19589 * red + 38469 * green + 7471 * blue;
            done_one <= 1'b1;
            pixel <= pixel + 20'd1;
            done_full <= 1'b0;
        end
    end
    assign gray_pic = gray>>16;
endmodule
