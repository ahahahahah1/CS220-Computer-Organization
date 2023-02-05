//this file contains the design for a negatively edge triggered t_flipflop
`include './d_flipflop.v'

module t_flipflop(t, clk, q, rst);
	input t, clk, rst;
	output reg q;
	wire d;

	always @(negedge clk) begin
      if(rst) begin
        q <= 0;
      end
      
      else begin
        if(t) begin
          assign d = q;
        end
        else begin
          assign d = ~q;
        end
        q <= ~d;
      end
      
endmodule