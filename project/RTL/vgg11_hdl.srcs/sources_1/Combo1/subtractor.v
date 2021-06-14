`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2021 02:29:27 PM
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    a,
    b,
    out
    );
    
    input wire [31:0] a, b;
    output wire [31:0] out;
    
adder a1(
    .a(a),
    .b({~b[31], b[30:0]}),
    .out(out)
    );

endmodule
