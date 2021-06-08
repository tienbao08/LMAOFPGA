`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2021 09:33:29 AM
// Design Name: 
// Module Name: multiplier_tree
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


module multiplier_tree(
    mul0, 
    mul1,
    mul2, 
    mul3, 
    mul4, 
    mul5, 
    mul6, 
    mul7, 
    mul8,
    in_mul0,
    in_mul1,
    in_mul2,
    in_mul3,
    in_mul4,
    in_mul5,
    in_mul6,
    in_mul7,
    in_mul8,
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
    
    input wire [31:0] in_mul0,
                    in_mul1,
                    in_mul2,
                    in_mul3,
                    in_mul4,
                    in_mul5,
                    in_mul6,
                    in_mul7,
                    in_mul8;
                    
    input wire [31:0] in_weight0,
                    in_weight1,
                    in_weight2,
                    in_weight3,
                    in_weight4,
                    in_weight5,
                    in_weight6,
                    in_weight7,
                    in_weight8;
    
    output wire [31:0] mul0, 
                    mul1,
                    mul2, 
                    mul3, 
                    mul4, 
                    mul5, 
                    mul6, 
                    mul7, 
                    mul8;
 
multiplier m0(
    .a(in_mul0),
    .b(in_weight0),
    .out(mul0)
);

multiplier m1(
    .a(in_mul1),
    .b(in_weight1),
    .out(mul1)
);

multiplier m2(
    .a(in_mul2),
    .b(in_weight2),
    .out(mul2)
);

multiplier m3(
    .a(in_mul3),
    .b(in_weight3),
    .out(mul3)
);    

multiplier m4(
    .a(in_mul4),
    .b(in_weight4),
    .out(mul4)
);    

multiplier m5(
    .a(in_mul5),
    .b(in_weight5),
    .out(mul5)
);    

multiplier m6(
    .a(in_mul6),
    .b(in_weight6),
    .out(mul6)
);   

multiplier m7(
    .a(in_mul7),
    .b(in_weight7),
    .out(mul7)
);   

multiplier m8(
    .a(in_mul8),
    .b(in_weight8),
    .out(mul8)
);
endmodule
