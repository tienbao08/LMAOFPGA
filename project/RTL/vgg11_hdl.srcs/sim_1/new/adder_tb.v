`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2021 11:21:05 AM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();

    reg [31:0] a, b;
    wire [31:0] max;
    
    maxab uut(
    a,
    b,
    max
    );
    
initial begin
    a = 32'h40d9999a;
    b = 32'hc0dccccd;
    #50
    a = 32'h3f19999a;
    b = 32'h3f4ccccd;
    #50
    a = 32'h0;
    b = 32'h3f4ccccd;
    #50 $finish;
end
endmodule
