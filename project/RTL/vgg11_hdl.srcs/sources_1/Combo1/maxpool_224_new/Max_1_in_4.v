`timescale 1ns / 1ps

module Max_1_in_4(
    a,
    b,
    c,
    d,
    max_final
    );
    
    input wire [31:0] a, b, c, d;
    output [31:0] max_final;
    wire [31:0] max1, max2;
    
Max_1_in_2 max1_inst(
    .a(a),
    .b(b),
    .max(max1)
    );

Max_1_in_2 max2_inst(
    .a(c),
    .b(d),
    .max(max2)
    );
    
Max_1_in_2 max3_inst(
    .a(max1),
    .b(max2),
    .max(max_final)
    );
endmodule
