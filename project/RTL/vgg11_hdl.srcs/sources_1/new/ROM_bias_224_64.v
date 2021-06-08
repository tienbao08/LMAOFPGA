`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2021 11:20:23 AM
// Design Name: 
// Module Name: ROM_bias_224_64
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


module ROM_bias_224_64(
    out
    );
    
    output wire [2047:0] out;
    
    reg [31:0] bias0 [0:63];
    
    initial begin
        $readmemb("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/bias/bias0_ieee754.txt", bias0);
    end

assign out = {bias0[0],
bias0[1],
bias0[2],
bias0[3],
bias0[4],
bias0[5],
bias0[6],
bias0[7],
bias0[8],
bias0[9],
bias0[10],
bias0[11],
bias0[12],
bias0[13],
bias0[14],
bias0[15],
bias0[16],
bias0[17],
bias0[18],
bias0[19],
bias0[20],
bias0[21],
bias0[22],
bias0[23],
bias0[24],
bias0[25],
bias0[26],
bias0[27],
bias0[28],
bias0[29],
bias0[30],
bias0[31],
bias0[32],
bias0[33],
bias0[34],
bias0[35],
bias0[36],
bias0[37],
bias0[38],
bias0[39],
bias0[40],
bias0[41],
bias0[42],
bias0[43],
bias0[44],
bias0[45],
bias0[46],
bias0[47],
bias0[48],
bias0[49],
bias0[50],
bias0[51],
bias0[52],
bias0[53],
bias0[54],
bias0[55],
bias0[56],
bias0[57],
bias0[58],
bias0[59],
bias0[60],
bias0[61],
bias0[62],
bias0[63]};

endmodule
