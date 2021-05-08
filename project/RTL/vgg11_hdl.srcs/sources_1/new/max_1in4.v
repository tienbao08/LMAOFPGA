`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2021 08:15:33 PM
// Design Name: 
// Module Name: max_1in4
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


module max_1in4(
    a,
    b,
    c,
    d,
    max_final
    );
    
    input wire [31:0] a, b, c, d;
    output reg [31:0] max_final;
    wire [31:0] max1, max2;
    
maxab max1_inst(
    .a(a),
    .b(b),
    .max(max1)
    );

maxab max2_inst(
    .a(c),
    .b(d),
    .max(max2)
    );

always @(*) begin
    if(max1[31] == max2[31]) begin
        if(max1[30:23] > max2[30:23] && max1[22:0] > max2[22:0]) begin
            max_final = max1;
        end
        else if(max1[30:23] < max2[30:23] && max1[22:0] < max2[22:0]) begin
            max_final = max2;
        end
        else if(max1[30:23] == max2[30:23] && max1[22:0] == max2[22:0]) begin
            max_final = max1;
        end
        else if(max1[30:23] == max2[30:23] && max1[22:0] > max2[22:0]) begin
            max_final = max1;
        end
        else if(max1[30:23] == max2[30:23] && max1[22:0] < max2[22:0]) begin
            max_final = max2;
        end
        else if(max1[30:23] > max2[30:23] && max1[22:0] == max2[22:0]) begin
            max_final = max1;
        end
        else begin
            max_final = max2;
        end
    end
    else if(max1[31] > max2[31]) begin
        max_final = max1;
    end
    else begin
        max_final = max2;
    end
end
endmodule
