`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2021 09:50:20 AM
// Design Name: 
// Module Name: BRAM
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


module BRAM(
    dataOut,
    dataIn,
    clk,
    rw,
    addr
    );
    
    input wire [31:0] dataIn;
    input wire clk, rw;
    input wire [7:0] addr;
    output reg [31:0] dataOut;
    
    reg [31:0] BRAM [0:220];
    
always @(posedge clk) begin
    if(rw) begin
        BRAM[addr] <= dataIn;
    end
    dataOut <= BRAM[addr];
end
endmodule
