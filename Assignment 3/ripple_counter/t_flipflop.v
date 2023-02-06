//this file contains the design for a negatively edge triggered t_flipflop

module t_flipflop(t, clk, q, rst);
	input t, clk, rst;
	output reg q;

	always @(negedge clk) begin
      if(rst) begin
        q <= 0;
      end
      else begin
        if(t) begin
          q <= ~q;
        end
      end
  end
      
endmodule