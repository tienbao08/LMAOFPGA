`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2021 10:17:20 PM
// Design Name: 
// Module Name: bias_adder_tb
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


module bias_adder_tb();
    parameter data_width = 32;
    reg [data_width-1:0] in_map0, in_map1, in_map2;
    wire [data_width-1:0] result;

bias_adder_224_64 dut(
    result,
    in_map0,
    in_map1,
    in_map2
    );

initial begin
    #10
    in_map0 = 32'h40dccccd;
    in_map1 = 32'h4119999a;
    in_map2 = 32'h4101999a;
end
endmodule
