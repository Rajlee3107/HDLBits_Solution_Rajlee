module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    
    always @(posedge clk) begin
        if(load) q<=data;
        else begin
            case(ena)
                2'd1: begin
                    for(integer i = 0; i<99; i=i+1) begin
                        q[99] <= q[0];
                        q[i]<=q[i+1];
                    end
                end
                2'd2: begin
                    for(integer i = 0; i<99; i=i+1) begin
                        q[0] <= q[99];
                        q[i+1]<=q[i];
                    end
                end
                //default: q<=q;
            endcase
        end
    end
endmodule
