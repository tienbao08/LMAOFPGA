`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2021 05:17:30 PM
// Design Name: 
// Module Name: maxpool_core
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


module maxpool_core(
    in0,
    in1,
    in2,
    in3,
    max
    );
    
    input wire [31:0] in0, in1, in2, in3;
    output wire [31:0] max;
    
    wire [31:0] max0, max1;
    
maxab ab0(
    .a(in0),
    .b(in1),
    .max(max0)
    );
    
maxab ab1(
    .a(in2),
    .b(in3),
    .max(max1)
    );
    
maxab ab2(
    .a(max0),
    .b(max1),
    .max(max)
    );
endmodule
