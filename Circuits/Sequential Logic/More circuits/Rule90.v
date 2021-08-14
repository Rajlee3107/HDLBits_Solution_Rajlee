module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    
    always @(posedge clk) begin
        for(integer i = 0 ; i<512; i=i+1) begin
            if(load) q <= data;
            else if(i==0) q[i] <= q[i+1];
            else if(i==511) q[i] <= q[i-1];
            else q[i] <= q[i+1]^q[i-1];
        end
    end
endmodule
