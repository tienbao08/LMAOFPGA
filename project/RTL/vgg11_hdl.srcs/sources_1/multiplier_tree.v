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


module multiplier_tree
    #(
    parameter in_weight0 = 32'b10111111100000000000000000000000,
    parameter in_weight1 = 32'b0,
    parameter in_weight2 = 32'b00111111100000000000000000000000,
    parameter in_weight3 = 32'b11000000000000000000000000000000,
    parameter in_weight4 = 32'b0,
    parameter in_weight5 = 32'b01000000000000000000000000000000,
    parameter in_weight6 = 32'b10111111100000000000000000000000,
    parameter in_weight7 = 32'b0,
    parameter in_weight8 = 32'b00111111100000000000000000000000
    )
    (
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
    in_mul8
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
