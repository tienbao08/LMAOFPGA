`timescale 1ns / 1ps
//(1280 x 720 x 143) x 50ns = 6 589 440 000 ns

module rgb2gray_tb();
	reg clk, rst, valid_in;
	reg [7:0] red, green, blue;
	wire [7:0] gray_pic;
	wire valid_out;
	
   integer red_data, green_data, blue_data, result, i;	
	
    initial begin
        red_data = $fopen("/home/duc/Documents/RGBtoGRAY/Txtfiles/red_frame/all_red_frame.txt", "r");
        green_data = $fopen("/home/duc/Documents/RGBtoGRAY/Txtfiles/green_frame/all_green_frame.txt", "r");
        blue_data = $fopen("/home/duc/Documents/RGBtoGRAY/Txtfiles/blue_frame/all_blue_frame.txt", "r");
        result = $fopen("/home/duc/Documents/RGBtoGRAY/Txtfiles/gray_verilog.txt", "w");
        clk = 1'b0;
        rst = 1'b1;
        valid_in = 1'b1;
        #50
        rst = 1'b0;
        //1280 x 720 x 143 = 131 788 800
        for(i=0;i<=131788800;i=i+1) begin
            $fscanf(red_data, "%d\n", red);
	    $fscanf(green_data, "%d\n", green);
	    $fscanf(blue_data, "%d\n", blue);
	    #50
	    if(i == 131788800) begin
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
	rgb2gray dut(clk, rst, red, green, blue, gray_pic, valid_in, valid_out);
endmodule
