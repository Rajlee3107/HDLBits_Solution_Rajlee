
module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 

    always @(posedge clk) begin
        if(load)
            q <= data;
        else
            q <= q^{q[510:0],1'b0} | q  & ~{1'b0,q[511:1]} ;
    end
          
endmodule
//taken from https://github.com/y-C-x/HDLBits_Solution/blob/master/3%20Circuit/3.2%20Sequential%20Logic/3.2.4%20More%20Circuits/3.2.4.2%20Rule%20110.v