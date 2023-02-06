module dflipflop (q,d,clk,rst);
    output q;
    input clk,rst,d;
    reg q;
    always @(posedge rst or negedge clk) begin
        if(rst) begin
            q <= 1'b0;
        end
        else begin
            q <= d;
        end
    end
endmodule