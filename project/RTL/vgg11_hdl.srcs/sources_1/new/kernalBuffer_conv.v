`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2021 10:03:10 AM
// Design Name: 
// Module Name: kernalBuffer_conv
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


module kernalBuffer_conv(
    dataOut0,
    dataOut1,
    dataOut2,
    dataIn,
    clk
    );
    
    input wire clk;
    input wire [31:0] dataIn;
    output wire [31:0] dataOut0, dataOut1, dataOut2;
    
    reg [31:0] pos [0:2];
    
always @(posedge clk) begin
    pos[0] <= dataIn;
    pos[1] <= pos[0];
    pos[2] <= pos[1];
end

assign dataOut0 = pos[0];
assign dataOut1 = pos[1];
assign dataOut2 = pos[2];

endmodule
