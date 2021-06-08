`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2021 10:43:42 AM
// Design Name: 
// Module Name: bias_adder_224_64
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


module bias_adder_224_64(
    result,
    in0,
    in1,
    in2,
    in_bias
    );
    
    input wire [31:0] in0, in1, in2, in_bias;
    output wire [31:0] result;
    
    wire [31:0] out_a0, out_a1;
    
adder a0(
    .a(in0),
    .b(in1),
    .out(out_a0)
    );

adder a1(
    .a(out_a0),
    .b(in2),
    .out(out_a1)
    );

adder a2(
    .a(out_a1),
    .b(in_bias),
    .out(result)
    );
endmodule
