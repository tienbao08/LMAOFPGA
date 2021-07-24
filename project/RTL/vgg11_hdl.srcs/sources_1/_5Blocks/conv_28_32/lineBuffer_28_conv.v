`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nguyen Tien Bao - Nguyen Phan Hoang Duc
// 
// Create Date: 23/07/2021 15:58:15
// Design Name:
// Module Name: lineBuffer_28_conv
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


module lineBuffer_28_conv
    #(
    parameter data_width = 32,
    parameter ram_depth = 5,
    parameter counter_depth = 7,
    parameter imgsize = 28
    )
    (
    dataOut_0,
    dataOut_1,
    dataOut_2,
    dataOut_3,
    dataOut_4,
    dataOut_5,
    dataOut_6,
    dataOut_7,
    dataOut_8,
    counter,
    rowcounter,
    clk,
    rst,
    dataIn
    );
    
    input wire clk, rst;
    input wire [data_width-1:0] dataIn;
    output wire [data_width-1:0] dataOut_0, dataOut_1, dataOut_2, dataOut_3, dataOut_4, dataOut_5, dataOut_6, dataOut_7, dataOut_8;
    output reg [counter_depth-1:0] counter;
    output reg [ram_depth-1:0] rowcounter;
    
    wire [data_width-1:0] dataOut0, dataOut1, dataOut2, dataOut3, dataOut4, dataOut5, dataOut6, dataOut7, dataOut8;
    reg [ram_depth-1:0] addr0, addr1;
    wire [data_width-1:0] dataOut_B0, dataOut_B1;
    
always @(posedge clk or posedge rst) begin
    if(rst || (rowcounter == 5'd26 && counter == 7'd85)) begin
        counter <= 7'd0;
        addr0 <= 5'd0;
        addr1 <= 5'd0;
        rowcounter <= 5'd0;
    end
    else begin
        addr0 <= addr0 + 5'd1;
        addr1 <= addr1 + 5'd1;
        if(counter == 7'd85 && rowcounter < 5'd26) begin
            counter <= 7'd58;
        end
        else begin
            counter <= counter + 7'd1;
            rowcounter <= rowcounter;
        end
        if(counter == 7'd85) begin
            rowcounter <= rowcounter + 5'd1;
        end
        if(addr0 == 5'd24) begin
            addr0 <= 5'd0;
        end
        if(addr1 == 5'd24) begin
            addr1 <= 5'd0;
        end
    end
end

kernalBuffer_conv #(data_width) k0(
    .dataOut0(dataOut8),
    .dataOut1(dataOut7),
    .dataOut2(dataOut6),
    .dataIn(dataIn),
    .clk(clk)
    );

BRAM_28_conv #(data_width, ram_depth, imgsize) B0(
    .dataOut(dataOut_B0),
    .dataIn(dataOut7),
    .clk(clk),
    .rw(1'b1),
    .addr(addr0)
    );

kernalBuffer_conv #(data_width) k1(
    .dataOut0(dataOut5),
    .dataOut1(dataOut4),
    .dataOut2(dataOut3),
    .dataIn(dataOut_B0),
    .clk(clk)
    );

BRAM_28_conv #(data_width, ram_depth, imgsize) B1(
    .dataOut(dataOut_B1),
    .dataIn(dataOut4),
    .clk(clk),
    .rw(1'b1),
    .addr(addr1)
    );

kernalBuffer_conv #(data_width) k2(
    .dataOut0(dataOut2),
    .dataOut1(dataOut1),
    .dataOut2(dataOut0),
    .dataIn(dataOut_B1),
    .clk(clk)
    );

assign dataOut_0 = (counter <= 7'd58 || (rowcounter == 5'd26 && counter == 7'd58)) ? 32'h0 : dataOut0;
assign dataOut_1 = (counter <= 7'd57) ? 32'h0 : dataOut1;
assign dataOut_2 = (counter <= 7'd57 || counter == 7'd85) ? 32'h0 : dataOut2;
assign dataOut_3 = (counter <= 7'd30 || counter == 7'd58 || (rowcounter == 5'd26 && counter == 7'd58)) ? 32'h0 : dataOut3;
assign dataOut_4 = (counter < 7'd30) ? 32'h0 : dataOut4;
assign dataOut_5 = (counter < 7'd30 || counter == 7'd57 || counter == 7'd85) ? 32'h0 : dataOut5;
assign dataOut_6 = (counter <= 7'd30 || counter == 7'd58 || (rowcounter == 5'd26 && counter >= 7'd58)) ? 32'h0 : dataOut6;
assign dataOut_7 = (counter < 7'd30 || (rowcounter == 5'd26 && counter >= 7'd58)) ? 32'h0 : dataOut7;
assign dataOut_8 = (counter < 7'd30 || counter == 7'd57 || counter == 7'd85 || (rowcounter == 5'd26 && counter >= 7'd58)) ? 32'h0 : dataOut8;

endmodule
