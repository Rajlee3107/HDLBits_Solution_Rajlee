module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output reg [15:0] q);
    
    assign ena = { q[11:8]==9 && q[3:0]==9 && q[7:4]==9 , q[3:0]==9 && q[7:4]==9 , q[3:0]==9};
    BCD_counter inst_1(clk, reset || q[3:0]==9, 1, q[3:0]);
    BCD_counter inst_2(clk, reset || q[3:0]==9 && q[7:4]==9, ena[1], q[7:4]);
    BCD_counter inst_3(clk, reset || q[11:8]==9 && q[3:0]==9 && q[7:4]==9, ena[2], q[11:8]);
    BCD_counter inst_4(clk, reset || q[15:12]==9 && q[11:8]==9 && q[3:0]==9 && q[7:4]==9, ena[3], q[15:12]);

endmodule
                    
module BCD_counter(
    input clk,
    input reset, // Synchronous active-high reset
    input en,
    output reg [3:0] q);
    
    always @(posedge clk) begin
        if(reset) q<=0;
        else if(en) q <= q + 4'd1;
        else q <= q;
    end
    
endmodule

