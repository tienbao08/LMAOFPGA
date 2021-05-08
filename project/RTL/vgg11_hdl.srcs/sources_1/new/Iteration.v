`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2021 03:29:46 PM
// Design Name: 
// Module Name: Iteration
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


module Iteration(
    operand_1,
    operand_2,
    solution
	);

    input wire [31:0] operand_1;
	input wire [31:0] operand_2;
	output wire [31:0] solution;
wire [31:0] Intermediate_Value1,Intermediate_Value2;

multiplier M1(.a(operand_1), .b(operand_2), .out(Intermediate_Value1));

//32'h4000_0000 -> 2.
adder A1(.a(32'h4000_0000), .b({1'b1,Intermediate_Value1[30:0]}), .out(Intermediate_Value2));

multiplier M2(.a(operand_1), .b(Intermediate_Value2), .out(solution));

endmodule
