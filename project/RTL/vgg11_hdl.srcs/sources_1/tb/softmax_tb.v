`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2021 08:09:54 PM
// Design Name: 
// Module Name: softmax_tb
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


module softmax_tb();
    parameter data_width = 32;
    reg [data_width-1:0] in0, in1;
    wire [data_width-1:0] out0, out1;

softmax
    dut(
    in0,
    in1,
    out0,
    out1
    );

initial begin
    #10
    in0 = 32'h3e800000;
    in1 = 32'h3f28f5c3;
    #10
    in0 = 32'h3df5c28f;
    in1 = 32'hbf30a3d7;
end
endmodule

