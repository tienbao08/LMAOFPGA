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
    
always @(*) begin
    if(a[31] == b[31]) begin
        if(a[30:23] > b[30:23] && a[22:0] > b[22:0]) begin
            max = a;
        end
        else if(a[30:23] < b[30:23] && a[22:0] < b[22:0]) begin
            max = b;
        end
        else if(a[30:23] == b[30:23] && a[22:0] == b[22:0]) begin
            max = a;
        end
        else if(a[30:23] == b[30:23] && a[22:0] > b[22:0]) begin
            max = a;
        end
        else if(a[30:23] == b[30:23] && a[22:0] < b[22:0]) begin
            max = b;
        end
        else if(a[30:23] > b[30:23] && a[22:0] == b[22:0]) begin
            max = a;
        end
        else begin
            max = b;
        end
    end
    else if(a[31] == 1'b0 && b[31] == 1'b1) begin
        max = a;
    end
    else begin
        max = b;
    end
end
endmodule
