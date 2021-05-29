`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2021 10:12:32 AM
// Design Name: 
// Module Name: lineBuffer_conv
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


module lineBuffer_conv(
    dataOut0,
    dataOut1,
    dataOut2,
    dataOut3,
    dataOut4,
    dataOut5,
    dataOut6,
    dataOut7,
    dataOut8,
    counter,
    rowcounter,
    clk,
    rst,
    dataIn
    );
    
    input wire clk, rst;
    input wire [31:0] dataIn;
    output wire [31:0] dataOut0, dataOut1, dataOut2, dataOut3, dataOut4, dataOut5, dataOut6, dataOut7, dataOut8;
    output reg [9:0] counter;
    output reg [7:0] rowcounter;
    
    reg [7:0] addr0, addr1;
    wire [31:0] dataOut_B0, dataOut_B1;
    
always @(posedge clk or posedge rst) begin
    if(rst || (rowcounter == 8'd222 && counter == 10'd673)) begin
        counter <= 10'd0;
        addr0 <= 8'd0;
        addr1 <= 8'd0;
        rowcounter <= 8'd0;
    end
    else begin
        addr0 <= addr0 + 8'd1;
        addr1 <= addr1 + 8'd1;
        if(counter == 10'd673 && rowcounter < 8'd222) begin
            counter <= 10'd450;
        end
        else begin
            counter <= counter + 10'd1;
            rowcounter <= rowcounter;
        end
        if(counter == 10'd673) begin
            rowcounter <= rowcounter + 8'd1;
        end
        if(addr0 == 8'd220) begin
            addr0 <= 8'd0;
        end
        if(addr1 == 8'd220) begin
            addr1 <= 8'd0;
        end
    end
end

kernalBuffer_conv k0(
    .dataOut0(dataOut8),
    .dataOut1(dataOut7),
    .dataOut2(dataOut6),
    .dataIn(dataIn),
    .clk(clk)
    );

BRAM B0(
    .dataOut(dataOut_B0),
    .dataIn(dataOut7),
    .clk(clk),
    .rw(1'b1),
    .addr(addr0)
    );

kernalBuffer_conv k1(
    .dataOut0(dataOut5),
    .dataOut1(dataOut4),
    .dataOut2(dataOut3),
    .dataIn(dataOut_B0),
    .clk(clk)
    );

BRAM B1(
    .dataOut(dataOut_B1),
    .dataIn(dataOut4),
    .clk(clk),
    .rw(1'b1),
    .addr(addr1)
    );

kernalBuffer_conv k2(
    .dataOut0(dataOut2),
    .dataOut1(dataOut1),
    .dataOut2(dataOut0),
    .dataIn(dataOut_B1),
    .clk(clk)
    );

endmodule