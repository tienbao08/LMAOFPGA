`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2021 04:35:43 PM
// Design Name: 
// Module Name: maxab
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


module maxab(
    a,
    b,
    max
    );
    
    input wire [31:0] a, b;
    output reg [31:0] max;
    
    reg a_s, b_s;
    reg [7:0] a_e, b_e;
    reg [22:0] a_m, b_m;
    reg [31:0] operand_a, operand_b;
    
always @(*) begin
    operand_a = a;
    operand_b = b;
    a_s = operand_a[31];
    b_s = operand_b[31];
    a_e = operand_a[30:23];
    b_e = operand_b[30:23];
    a_m = operand_a[22:0];
    b_m = operand_b[22:0];
    if(a_s == b_s) begin
        if(a_e > b_e && a_m > b_m) begin
            max = operand_a;
        end
        else if(a_e < b_e && a_m < b_m) begin
            max = operand_b;
        end
        else if(a_e == b_e && a_m == b_m) begin
            max = operand_a;
        end
        else if(a_e == b_e && a_m > b_m) begin
            max = operand_a;
        end
        else if(a_e == b_e && a_m < b_m) begin
            max = operand_b;
        end
        else if(a_e > b_e && a_m == b_m) begin
            max = operand_a;
        end
        else if(a_e < b_e && a_m == b_m) begin
            max = operand_b;
        end
    end
    else if(a_s == 1'b0 && b_s == 1'b1) begin
        max = operand_a;
    end
    else if(a_s == 1'b1 && b_s == 1'b0) begin
        max = operand_b;
    end
end
endmodule
