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

    reg [31:0] a, b, c, d;
    wire [31:0] max_final;
    
    max_1in4 uut(
    a,
    b,
    c,
    d,
    max_final
    );
    
initial begin
    a = 32'h40dccccd;
    b = 32'h40dfff2e;
    c = 32'h0;
    d = 32'h4101999a;
    #50 $finish;
end
endmodule
