`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2021 07:56:22 PM
// Design Name: 
// Module Name: softmax
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


module softmax
    #(
    parameter data_width = 32
    )
    (
    in0,
    in1,
    out0,
    out1
    );
    
    input wire [data_width-1:0] in0, in1;
    output wire [data_width-1:0] out0, out1;
    
    wire [data_width-1:0] exp_class0, exp_class1, sum_exp;
    
exponential
    exp0(
    .in(in0),
    .out(exp_class0)
    );

exponential
    exp1(
    .in(in1),
    .out(exp_class1)
    );
    
adder
    add0(
    .a(exp_class0),
    .b(exp_class1),
    .out(sum_exp)
    );

divider div0(
    .a_operand(exp_class0),
    .b_operand(sum_exp),
    .result(out0)
    );

divider div1(
    .a_operand(exp_class1),
    .b_operand(sum_exp),
    .result(out1)
    );
endmodule
