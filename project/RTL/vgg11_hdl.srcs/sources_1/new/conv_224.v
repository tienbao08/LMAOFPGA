`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2021 02:46:23 PM
// Design Name: 
// Module Name: conv_224
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


module conv_224(
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
    output wire [9:0] counter;
    output wire [7:0] rowcounter;
    output wire [31:0] kernal0,
                    kernal1,
                    kernal2,
                    kernal3,
                    kernal4,
                    kernal5,
                    kernal6,
                    kernal7,
                    kernal8;
                   
lineBuffer_conv line0(
    .dataOut_0(kernal0),
    .dataOut_1(kernal1),
    .dataOut_2(kernal2),
    .dataOut_3(kernal3),
    .dataOut_4(kernal4),
    .dataOut_5(kernal5),
    .dataOut_6(kernal6),
    .dataOut_7(kernal7),
    .dataOut_8(kernal8),
    .counter(counter),
    .rowcounter(rowcounter),
    .clk(clk),
    .rst(rst),
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
