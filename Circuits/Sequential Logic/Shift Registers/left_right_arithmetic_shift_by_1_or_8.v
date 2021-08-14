module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q);
    always @(posedge clk) begin
        if(load) q<=data;
        else if(ena) begin
            case(amount)
                0: q<={q[62:0],1'd0};
                1: q<={q[55:0],8'd0};
                2: q<={q[63],q[63:1]};
                3: begin
                    if(q[63]) q<={8'hff,q[63:8]};
                    else q<={8'd0, q[63:8]};
                end
                default: q<=q;
            endcase
        end
        else q<=q;
    end
endmodule
