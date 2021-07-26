`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2021 11:33:27 PM
// Design Name: 
// Module Name: relu_tb
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


module relu_tb();
    reg [31:0] out_conv;
    wire [31:0] out_relu;
    
    relu uut(
    out_conv,
    out_relu
    );

initial begin
    out_conv = 32'hc3e48000;
    #20
    out_conv = 32'h43e48000;
    #20
    out_conv = 32'hc101999a;
end
endmodule
