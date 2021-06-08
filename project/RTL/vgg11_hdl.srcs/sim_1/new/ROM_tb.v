`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2021 11:43:26 AM
// Design Name: 
// Module Name: ROM_tb
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


module ROM_tb();
    reg [31:0] in0,
                    in1,
                    in2,
                    in3,
                    in4,
                    in5,
                    in6,
                    in7,
                    in8;
                    
    wire [31:0] result;

filter_64_224_red dut(
    result,
    in0,
    in1,
    in2,
    in3,
    in4,
    in5,
    in6,
    in7,
    in8
    );
initial begin
    in0 = 32'h0;
    in1 = 32'h0;
    in2 = 32'h0;
    in3 = 32'h0;
    in4 = 32'h0;
    in5 = 32'h0;
    in6 = 32'h0;
    in7 = 32'h0;
    in8 = 32'h0;
    #10000 $finish;
end
endmodule
