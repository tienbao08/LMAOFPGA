`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2021 09:07:34 PM
// Design Name: 
// Module Name: bias_adder_56_16
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


module bias_adder_56_16
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
    in_map7
    );
    
    input wire [data_width-1:0] in_map0, in_map1, in_map2, in_map3, in_map4, in_map5, in_map6, in_map7;
    output wire [data_width-1:0] result;
    
    wire [data_width-1:0] outadder0, outadder1, outadder2, outadder3, outadder4, outadder5, outadder6;
    
adder adder_inst[0:7](
    .a({in_map0, outadder0, outadder1, outadder2, outadder3, outadder4, outadder5, outadder6}),
    .b({in_map1, in_map2, in_map3, in_map4, in_map5, in_map6, in_map7, in_bias}),
    .out({outadder0, outadder1, outadder2, outadder3, outadder4, outadder5, outadder6, result})
    );
endmodule
