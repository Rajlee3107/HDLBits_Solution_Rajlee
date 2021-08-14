module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [7:0]q;
    wire [2:0]n;
    assign n = {A,B,C};
    always @(posedge clk) begin
        if (enable) q<={q[6:0],S};
        else q<=q;
    end
    assign Z = q[n];
endmodule
