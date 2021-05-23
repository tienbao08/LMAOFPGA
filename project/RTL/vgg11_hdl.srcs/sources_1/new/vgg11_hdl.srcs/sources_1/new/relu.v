`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2021 11:25:53 PM
// Design Name: 
// Module Name: relu
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


module relu(
    out_conv,
    out_relu
    );
    
    input wire [31:0] out_conv;
    output wire [31:0] out_relu;
    
    assign out_relu = (out_conv[31]) ? 32'h0 : out_conv;
endmodule
