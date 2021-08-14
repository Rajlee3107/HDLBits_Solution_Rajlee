module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    reg [4:0]d;
    assign d[4:0] = {q[0], q[4], q[3]^q[0], q[2], q[1]};
    always @(posedge clk) begin
        if(reset) q<=5'h1;
        else q<=d;
    end
endmodule
