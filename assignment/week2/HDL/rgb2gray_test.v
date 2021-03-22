`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 05:09:18 PM
// Design Name: 
// Module Name: rgb2gray_test
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


module rgb2gray_test();
    parameter bit_width = 8;
    reg [bit_width-1:0] red, green, blue;
    reg clk, rst;
    wire [bit_width-1:0] gray_pic;
    wire done_one;
    wire done_full;
    wire r_valid, g_valid, b_valid;
    integer red_data, green_data, blue_data, result, i;
    initial begin
        red_data = $fopen("/home/nguyentienbao/Documents/PycharmProjects/images_processing/red.txt", "r");
        green_data = $fopen("/home/nguyentienbao/Documents/PycharmProjects/images_processing/green.txt", "r");
        blue_data = $fopen("/home/nguyentienbao/Documents/PycharmProjects/images_processing/blue.txt", "r");
        result = $fopen("/home/nguyentienbao/Documents/PycharmProjects/images_processing/gray_verilog.txt", "w");
        clk = 1'b0;
        rst = 1'b0;
        #50
        rst = 1'b1;
        for(i=0;i<=591360;i=i+1) begin
            $fscanf(red_data, "%d\n", red);
	    $fscanf(green_data, "%d\n", green);
	    $fscanf(blue_data, "%d\n", blue);
	    #50
		if(i == 519360) begin
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
