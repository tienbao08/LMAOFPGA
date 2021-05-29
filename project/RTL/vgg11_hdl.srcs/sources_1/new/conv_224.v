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
                    
    wire [31:0] dataOut0, dataOut1, dataOut2, dataOut3, dataOut4, dataOut5, dataOut6, dataOut7, dataOut8;
                        

assign kernal0 = (counter <= 10'd450 || (rowcounter == 8'd222 && counter == 10'd450)) ? 32'h0 : dataOut0;
assign kernal1 = (counter <= 10'd449) ? 32'h0 : dataOut1;
assign kernal2 = (counter <= 10'd449 || counter == 10'd673) ? 32'h0 : dataOut2;
assign kernal3 = (counter <= 10'd226 || counter == 10'd450 || (rowcounter == 8'd222 && counter == 10'd450)) ? 32'h0 : dataOut3;
assign kernal4 = (counter < 10'd226) ? 32'h0 : dataOut4;
assign kernal5 = (counter < 10'd226 || counter == 10'd449 || counter == 10'd673) ? 32'h0 : dataOut5;
assign kernal6 = (counter <= 10'd226 || counter == 10'd450 || (rowcounter == 8'd222 && counter >= 10'd450)) ? 32'h0 : dataOut6;
assign kernal7 = (counter < 10'd226 || (rowcounter == 8'd222 && counter >= 10'd450)) ? 32'h0 : dataOut7;
assign kernal8 = (counter < 10'd226 || counter == 10'd449 || counter == 10'd673 || (rowcounter == 8'd222 && counter >= 10'd450)) ? 32'h0 : dataOut8;

lineBuffer_conv line0(
    .dataOut0(dataOut0),
    .dataOut1(dataOut1),
    .dataOut2(dataOut2),
    .dataOut3(dataOut3),
    .dataOut4(dataOut4),
    .dataOut5(dataOut5),
    .dataOut6(dataOut6),
    .dataOut7(dataOut7),
    .dataOut8(dataOut8),
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
