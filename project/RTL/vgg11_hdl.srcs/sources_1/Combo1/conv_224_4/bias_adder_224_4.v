`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2021 09:07:34 PM
// Design Name: 
// Module Name: bias_adder_224_4
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


module bias_adder_224_4
    #(
    parameter in_bias = 32'b00111110010001101000010100011101,
    parameter data_width = 32
    )
    (
    result,
    in_map0,
    in_map1,
    in_map2
    );
    
    input wire [data_width-1:0] in_map0, in_map1, in_map2;
    output wire [data_width-1:0] result;
    
    wire [data_width-1:0] outadder0, outadder1;
    
adder adder_inst[0:2](
    .a({in_map0, outadder0, outadder1}),
    .b({in_map1, in_map2, in_bias}),
    .out({outadder0, outadder1, result})
    );
endmodule
