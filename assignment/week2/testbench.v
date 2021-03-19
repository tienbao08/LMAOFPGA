`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 09:44:13 PM
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
    wire [bit_width-1:0] gray;
    integer red_data, green_data, blue_data, result, i;
    initial begin
        red_data = $fopen("/home/nguyentienbao/Documents/PycharmProjects/images_processing/red.txt", "r");
        green_data = $fopen("/home/nguyentienbao/Documents/PycharmProjects/images_processing/green.txt", "r");
        blue_data = $fopen("/home/nguyentienbao/Documents/PycharmProjects/images_processing/blue.txt", "r");
        result = $fopen("/home/nguyentienbao/Documents/PycharmProjects/images_processing/gray_verilog.txt", "w");
        clk = 1'b0;
        rst = 1'b0;
        #5
        rst = 1'b1;
        for(i=0;i<=519360;i=i+1) begin
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
        $fdisplay(result, "%d" , gray);
    end
    always @(clk) begin
        #25 clk <= ~clk;
    end
 rgb2gray inst(gray, red, green, blue, clk, rst);
endmodule
