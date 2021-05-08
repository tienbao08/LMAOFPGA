`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2021 03:09:13 PM
// Design Name: 
// Module Name: divider
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


module divider(
    a_operand,
    b_operand,
    result
    );

    input wire [31:0] a_operand, b_operand;
	output wire [31:0] result;
	
wire sign;
wire [7:0] shift;
wire [7:0] exponent_a;
wire [31:0] divisor;
wire [31:0] operand_a;
wire [31:0] Intermediate_X0;
wire [31:0] Iteration_X0;
wire [31:0] Iteration_X1;
wire [31:0] Iteration_X2;
wire [31:0] Iteration_X3;
wire [31:0] solution;

wire [31:0] denominator;
wire [31:0] operand_a_change;


assign sign = a_operand[31] ^ b_operand[31];

assign shift = 8'd126 - b_operand[30:23];

assign divisor = {1'b0,8'd126,b_operand[22:0]};

assign denominator = divisor;

assign exponent_a = a_operand[30:23] + shift;

assign operand_a = {a_operand[31],exponent_a,a_operand[22:0]};

assign operand_a_change = operand_a;

//32'hC00B_4B4B = (-37)/17
multiplier x0(.a(32'hC00B_4B4B), .b(divisor), .out(Intermediate_X0));

//32'h4034_B4B5 = 48/17
adder X0(.a(Intermediate_X0), .b(32'h4034_B4B5) ,.out(Iteration_X0));

Iteration X1(.operand_1(Iteration_X0), .operand_2(divisor), .solution(Iteration_X1));

Iteration X2(.operand_1(Iteration_X1), .operand_2(divisor), .solution(Iteration_X2));

Iteration X3(.operand_1(Iteration_X2), .operand_2(divisor), .solution(Iteration_X3));

multiplier END(.a(Iteration_X3), .b(operand_a), .out(solution));

assign result = ((a_operand == 32'h0 || a_operand == 32'h80000000) || (b_operand == 32'h0 || b_operand == 32'h80000000) || (a_operand[30:23] == 255 || b_operand[30:23] == 255)) ? 32'h0 : {sign,solution[30:0]};
endmodule