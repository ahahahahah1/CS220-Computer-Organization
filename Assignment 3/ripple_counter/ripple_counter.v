//this file contains the code for ripple counter
`include './t_flipflop.v'

module ripple_counter(clk, flag, reset, q);
	input clk, flag, reset;
	output wire [3:0] q;

	initial begin
		q = 4'b0;
	end

	always&(*) begin
		if(flag) begin //up-counter
			t_flipflop TFF0(.t(1'b1), .clk(clk), .q(q[0]), .rst(reset));
			t_flipflop TFF1(.t(1'b1), .clk(q[0]), .q(q[1]), .rst(reset));
			t_flipflop TFF2(.t(1'b1), .clk(q[1]), .q(q[2]), .rst(reset));
			t_flipflop TFF3(.t(1'b1), .clk(q[2]), .q(q[3]), .rst(reset));
		end
		else begin
			t_flipflop TFF0(.t(1'b1), .clk(clk), .q(q[0]), .rst(reset));
			t_flipflop TFF1(.t(1'b1), .clk(~q[0]), .q(q[1]), .rst(reset));
			t_flipflop TFF2(.t(1'b1), .clk(~q[1]), .q(q[2]), .rst(reset));
			t_flipflop TFF3(.t(1'b1), .clk(~q[2]), .q(q[3]), .rst(reset));
		end
	end

endmodule