module top_module(
    input clk,
    input in,
    input reset,
    output out); //
	parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;
    // State transition logic
    always @(*) begin    // This is a combinational always block
        case(state)
            A:next_state = in?B:A;
            B:next_state = in?B:C;
            C:next_state = in?D:A;
            D:next_state = in?B:C;
        endcase
    end

    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(reset) state = A;
        else state = next_state;
    end

    // Output logic
    assign out = (state == D);

endmodule
