`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2021 09:07:34 PM
// Design Name: 
// Module Name: bias_adder_28_32
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


module bias_adder_28_32
    #(
    parameter in_bias = 32'b00111110010001101000010100011101,
    parameter data_width = 32
    )
    (
    result,
    in_map0, 
    in_map1, 
    in_map2, 
    in_map3, 
    in_map4, 
    in_map5, 
    in_map6, 
    in_map7, 
    in_map8, 
    in_map9, 
    in_map10, 
    in_map11, 
    in_map12, 
    in_map13, 
    in_map14, 
    in_map15
    );
    
    input wire [data_width-1:0] in_map0, in_map1, in_map2, in_map3, in_map4, in_map5, in_map6, in_map7, in_map8, in_map9, in_map10, in_map11, in_map12, in_map13, in_map14, in_map15;
    output wire [data_width-1:0] result;
    
    wire [data_width-1:0] outadder0, outadder1, outadder2, outadder3, outadder4, outadder5, outadder6, outadder7, outadder8, outadder9, outadder10, outadder11, outadder12, outadder13, outadder14;
    
adder adder_inst[0:15](
    .a({in_map0, outadder0, outadder1, outadder2, outadder3, outadder4, outadder5, outadder6, outadder7, outadder8, outadder9, outadder10, outadder11, outadder12, outadder13, outadder14}),
    .b({in_map1, in_map2, in_map3, in_map4, in_map5, in_map6, in_map7, in_map8, in_map9, in_map10, in_map11, in_map12, in_map13, in_map14, in_map15, in_bias}),
    .out({outadder0, outadder1, outadder2, outadder3, outadder4, outadder5, outadder6, outadder7, outadder8, outadder9, outadder10, outadder11, outadder12, outadder13, outadder14, result})
    );
endmodule
