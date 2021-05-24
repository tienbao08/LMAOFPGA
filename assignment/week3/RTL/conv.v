`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2021 08:04:21 PM
// Design Name: 
// Module Name: conv
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


module conv(
    kernal0,
    kernal1,
    kernal2,
    kernal3,
    kernal4,
    kernal5,
    kernal6,
    kernal7,
    kernal8,
    result,
    counter,
    rowcounter,
    rst,
    clk,
    dataIn
    );
    
    input wire [31:0] dataIn;
    input wire clk, rst;
    output wire [31:0] result;
    output reg [9:0] counter;
    output reg [7:0] rowcounter;
    output wire [31:0] kernal0,
                    kernal1,
                    kernal2,
                    kernal3,
                    kernal4,
                    kernal5,
                    kernal6,
                    kernal7,
                    kernal8;

always @(posedge clk or posedge rst) begin
    if(rst || (rowcounter == 8'd222 && counter == 10'd673)) begin
        counter <= 10'd0;
        rowcounter <= 8'd0;
    end
    else begin
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
    end
end
    
lineBuffer lbuf0(
    .dataOut0(kernal0),
    .dataOut1(kernal1),
    .dataOut2(kernal2),
    .dataOut3(kernal3),
    .dataOut4(kernal4),
    .dataOut5(kernal5),
    .dataOut6(kernal6),
    .dataOut7(kernal7),
    .dataOut8(kernal8),
    .counter(counter),
    .rowcounter(rowcounter),
    .clk(clk),
    .dataIn(dataIn)
    );
    
conv_core core0(
    .result(result),
    .in0(kernal0),
    .in1(kernal1),
    .in2(kernal2),
    .in3(kernal3),
    .in4(kernal4),
    .in5(kernal5),
    .in6(kernal6),
    .in7(kernal7),
    .in8(kernal8)
    );    
endmodule
