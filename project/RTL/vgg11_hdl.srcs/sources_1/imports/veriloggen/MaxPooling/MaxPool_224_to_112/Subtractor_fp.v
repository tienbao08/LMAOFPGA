module Subtractor_fp(
    a,
    b,
    out
    );
    
    input wire [31:0] a, b;
    output wire [31:0] out;
    
Adder_fp a1(
    .a(a),
    .b({~b[31], b[30:0]}),
    .out(out)
    );

endmodule