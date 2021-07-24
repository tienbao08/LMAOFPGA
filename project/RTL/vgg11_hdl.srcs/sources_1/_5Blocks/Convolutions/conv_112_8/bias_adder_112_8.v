`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2021 09:07:34 PM
// Design Name: 
// Module Name: bias_adder_112_8
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


module bias_adder_112_8
    #(
    parameter in_bias = 32'b00111110010001101000010100011101,
    parameter data_width = 32
    )
    (
    result,
    in_map0,
    in_map1,
    in_map2,
    in_map3
    );
    
    input wire [data_width-1:0] in_map0, in_map1, in_map2, in_map3;
    output wire [data_width-1:0] result;
    
    wire [data_width-1:0] outadder0, outadder1, outadder2;
    
adder adder_inst[0:3](
    .a({in_map0, outadder0, outadder1, outadder2}),
    .b({in_map1, in_map2, in_map3, in_bias}),
    .out({outadder0, outadder1, outadder2, result})
    );
endmodule
