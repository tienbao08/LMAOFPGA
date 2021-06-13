`timescale 1ns / 1ps

module max_1in4(
    a,
    b,
    c,
    d,
    max_final
    );
    
    input wire [31:0] a, b, c, d;
    output [31:0] max_final;
    wire [31:0] max1, max2;
    
maxab max1_inst(
    .a(a),
    .b(b),
    .max(max1)
    );

maxab max2_inst(
    .a(c),
    .b(d),
    .max(max2)
    );
    
maxab max3_inst(
    .a(max1),
    .b(max2),
    .max(max_final)
    );
endmodule
