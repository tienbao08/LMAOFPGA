`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2021 01:26:34 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
    parameter bit_width = 8;
    reg [bit_width-1:0] red, green, blue;
    reg clk, rst;
    wire [bit_width-1:0] gray_pic;
    wire done_one;
    wire done_full;
    wire r_valid, g_valid, b_valid;
    integer red_data, green_data, blue_data, result, i, num_frame, j, hehe;
    string red_name = "/home/nguyentienbao/Documents/PycharmProjects/images_processing/red_frame/red_vid_";
    string green_name = "/home/nguyentienbao/Documents/PycharmProjects/images_processing/green_frame/green_vid_";
    string blue_name = "/home/nguyentienbao/Documents/PycharmProjects/images_processing/blue_frame/blue_vid_";

    initial begin
        red_data = $fopen(red_name, "r");
        green_data = $fopen(green_name, "r");
        blue_data = $fopen(blue_name, "r");
        result = $fopen("/home/nguyentienbao/Documents/PycharmProjects/images_processing/gray_verilog_vid.txt", "w");
        hehe = 1;
        for(j=0;j<=921600;j=j+1) begin
            $sformat(red_name, hehe, ".txt");
            $sformat(green_name, hehe, ".txt");
            $sformat(blue_name, hehe, ".txt");
            #50
            if(j==921600) begin
                hehe = hehe + 1;
                j = 0;
            end
        end
    end
    initial begin
        clk = 1'b0;
        rst = 1'b0;
        num_frame = 1;
        #50
        rst = 1'b1;
        for(i=0;i<=921600;i=i+1) begin
            $fscanf(red_data, "%d\n", red);
		    $fscanf(green_data, "%d\n", green);
		    $fscanf(blue_data, "%d\n", blue);
		    #50
		    if(i == 921600) begin
		      i = 0;
		      num_frame = num_frame + 1;
		    end
		    if(num_frame == 143) begin
		      $finish;
		    end
		end
    $fclose(red_data);
    $fclose(green_data);
    $fclose(blue_data);
    end
    always @(posedge clk) begin
        $fdisplay(result, "%d" , gray_pic);
    end
    always @(clk) begin
        #25 clk <= ~clk;
    end
 rgb2gray dut(r_valid, g_valid, b_valid, gray_pic, done_one, done_full, red, green, blue, clk, rst);
endmodule
