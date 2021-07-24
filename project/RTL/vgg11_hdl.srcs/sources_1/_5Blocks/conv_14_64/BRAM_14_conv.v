`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:51:32
// Design Name: 
// Module Name: BRAM_14_conv
// Project Name: vgg11_hdl
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


module BRAM_14_conv
    #(
     parameter data_width = 32,
     parameter ram_depth = 4,
     parameter imgsize = 14
     )
    (
    dataOut,
    dataIn,
    clk,
    rw,
    addr
    );
    
    input wire [data_width-1:0] dataIn;
    input wire clk, rw;
    input wire [ram_depth-1:0] addr;
    output reg [data_width-1:0] dataOut;
    
    reg [data_width-1:0] BRAM [0:imgsize-4];
    
always @(posedge clk) begin
    if(rw) begin
        BRAM[addr] <= dataIn;
    end
    dataOut <= BRAM[addr];
end

endmodule
