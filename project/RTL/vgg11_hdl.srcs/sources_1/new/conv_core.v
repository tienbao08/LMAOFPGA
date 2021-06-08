`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2021 10:28:24 AM
// Design Name: 
// Module Name: conv_core
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


module conv_core(
    result,
    in0,
    in1,
    in2,
    in3,
    in4,
    in5,
    in6,
    in7,
    in8,
    in_weight0,
    in_weight1,
    in_weight2,
    in_weight3,
    in_weight4,
    in_weight5,
    in_weight6,
    in_weight7,
    in_weight8
    );
    
    input wire [31:0] in0,
                    in1,
                    in2,
                    in3,
                    in4,
                    in5,
                    in6,
                    in7,
                    in8;
                    
    input wire [31:0] in_weight0,
                    in_weight1,
                    in_weight2,
                    in_weight3,
                    in_weight4,
                    in_weight5,
                    in_weight6,
                    in_weight7,
                    in_weight8;
    
    output wire [31:0] result;
    
    wire [31:0] in_add0,
                in_add1,
                in_add2,
                in_add3,
                in_add4,
                in_add5,
                in_add6,
                in_add7,
                in_add8;
        
multiplier_tree mt0(
    .mul0(in_add0), 
    .mul1(in_add1),
    .mul2(in_add2), 
    .mul3(in_add3), 
    .mul4(in_add4), 
    .mul5(in_add5), 
    .mul6(in_add6), 
    .mul7(in_add7), 
    .mul8(in_add8),
    .in_mul0(in0),
    .in_mul1(in1),
    .in_mul2(in2),
    .in_mul3(in3),
    .in_mul4(in4),
    .in_mul5(in5),
    .in_mul6(in6),
    .in_mul7(in7),
    .in_mul8(in8),
    .in_weight0(in_weight0),
    .in_weight1(in_weight1),
    .in_weight2(in_weight2),
    .in_weight3(in_weight3),
    .in_weight4(in_weight4),
    .in_weight5(in_weight5),
    .in_weight6(in_weight6),
    .in_weight7(in_weight7),
    .in_weight8(in_weight8)
    );
    
adder_tree at0(
    .result(result),
    .in_add0(in_add0),
    .in_add1(in_add1),
    .in_add2(in_add2),
    .in_add3(in_add3),
    .in_add4(in_add4),
    .in_add5(in_add5),
    .in_add6(in_add6),
    .in_add7(in_add7),
    .in_add8(in_add8)
    );
endmodule