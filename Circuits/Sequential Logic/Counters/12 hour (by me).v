module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    till_60_counter seconds(clk, reset, ena, ss);
    till_60_counter minutes(clk, reset, ss == 8'h59, mm);
    hour_counter hours(clk, reset, ss == 8'h59 && mm == 8'h59, pm, hh);
endmodule
              
module till_60_counter(
    input clk,
    input reset, // Synchronous active-high reset
    input en,
    output reg [7:0] q);
    BCD_counter inst_1(clk, reset || q[3:0] == 9, en, q[3:0]);
    BCD_counter inst_2(clk, reset || q== 8'h59, en && q[3:0]==9, q[7:4]);
endmodule
        
module hour_counter(
    input clk,
    input reset, // Synchronous active-high reset
    input en,
    output reg pm,
    output reg [7:0] q);
    always @(posedge clk) begin
        if( reset ) begin 
            q<=8'h12;
            pm <= 0;
        end
        else if(en && q == 8'h11) begin
            q<=q + 8'h1;
            pm <= ~pm;
        end
        else if(en && q==8'h12) begin
            q <= 8'h1; 
            pm<=pm;
        end
        else if(en) begin
            q[3:0] <= q[3:0] + 8'h1;
            q[7:4] <= q[7:4] + 8'h1;
            pm<=pm;
        end
        else begin
            q<=q;
            pm<=pm;
        end
    end
endmodule

module BCD_counter(
    input clk,
    input reset, // Synchronous active-high reset
    input en,
    output reg [3:0] q);
    
    always @(posedge clk) begin
        if(reset ) q<=0;
        else if(en) q <= q + 4'd1;
        else q <= q;
    end
endmodule
