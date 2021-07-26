`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2021 07:52:43 PM
// Design Name: 
// Module Name: exponential
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


module exponential
    #(
    parameter data_width = 32
    )
    (
    in,
    out
    );
    
    input wire [data_width-1:0] in;
    output wire [data_width-1:0] out;

exp exp_inst(
  .s_axis_a_tvalid(1'b1),
  .s_axis_a_tdata(in),
  .m_axis_result_tvalid(),
  .m_axis_result_tdata(out)
);
endmodule
