`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: {engineername}
// 
// Create Date: {dateandtime}
// Design Name: 
// Module Name: conv_112_4
// Project Name: {projectname}
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


module conv_112_4
    #(
    {parameter_bias}
    parameter data_width = {data_width}
    )
    (
    clk,
    rst,
    {dataIn},
    {final_result}
    );
    
    input wire [data_width-1:0] {dataIn};
    input wire clk, rst;
    output wire [data_width-1:0] {final_result};

    wire [data_width-1:0] {result};
    wire [data_width-1:0] {wire_result_final};

{final_conv_inst}

{bias_adder_inst}
{relu}
endmodule
