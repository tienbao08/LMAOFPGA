`timescale 1ns / 1ps

module rgb2gray_tb();
	reg clk, rst;
	reg [7:0] red, green, blue;
	wire [7:0] gray_pic;
	
   integer red_data, green_data, blue_data, result, i;	
	
    initial begin
        red_data = $fopen("red.txt", "r");
        green_data = $fopen("green.txt", "r");
        blue_data = $fopen("blue.txt", "r");
        result = $fopen("gray_verilog.txt", "w");
        clk = 1'b0;
        rst = 1'b1;
        #50
        rst = 1'b0;
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
	 
	//rgb2gray(clk, rst, red_in, green_in, blue_in, gray_out);
	rgb2gray dut(clk, rst, red, green, blue, gray_pic);
endmodule