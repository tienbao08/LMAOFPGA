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

    reg [31:0] a_operand, b_operand;
	wire [31:0] result;
    
    divider uut(
    a_operand,
    b_operand,
    result
    );
    
initial begin
    a_operand = 32'h40d9999a;
    b_operand = 32'hc0dccccd;
    #50
    a_operand = 32'h3f19999a;
    b_operand = 32'h3f4ccccd;
    #50
    a_operand = 32'h0;
    b_operand = 32'h3f4ccccd;
    #50 $finish;
end
endmodule
