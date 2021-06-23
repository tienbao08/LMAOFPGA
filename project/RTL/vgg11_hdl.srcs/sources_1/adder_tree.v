`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2021 09:38:31 AM
// Design Name: 
// Module Name: adder_tree
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


module adder_tree(
    result,
    in_add0,
    in_add1,
    in_add2,
    in_add3,
    in_add4,
    in_add5,
    in_add6,
    in_add7,
    in_add8
    );
    
    input wire [31:0] in_add0,
                    in_add1,
                    in_add2,
                    in_add3,
                    in_add4,
                    in_add5,
                    in_add6,
                    in_add7,
                    in_add8;
    
    output wire [31:0] result;
      
    wire [31:0] add0,
                add1,
                add2,
                add3,
                add4,
                add5,
                add6;
             
           
adder a0(
    .a(in_add0),
    .b(in_add1),
    .out(add0)
);

adder a1(
    .a(add0),
    .b(in_add2),
    .out(add1)
);

adder a2(
    .a(add1),
    .b(in_add3),
    .out(add2)
);

adder a3(
    .a(add2),
    .b(in_add4),
    .out(add3)
);

adder a4(
    .a(add3),
    .b(in_add5),
    .out(add4)
);

adder a5(
    .a(add4),
    .b(in_add6),
    .out(add5)
);

adder a6(
    .a(add5),
    .b(in_add7),
    .out(add6)
);

adder a7(
    .a(add6),
    .b(in_add8),
    .out(result)
);
endmodule
