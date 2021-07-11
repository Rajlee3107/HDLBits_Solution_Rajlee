`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2021 07:08:05
// Design Name: 
// Module Name: 4bitCounter_up
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


module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q);
    
    always @(posedge clk) begin
        if(reset) q <= 0;
        else q <= q + 4'd1;
    end
    
endmodule