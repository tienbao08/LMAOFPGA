`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: {engineername}
// 
// Create Date: {dateandtime}
// Design Name: 
// Module Name: {modulename_BRAM}
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


module {modulename_BRAM}
    #(
     parameter data_width = {data_width},
     parameter ram_depth = {ram_depth},
     parameter imgsize = {imgsize}
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
