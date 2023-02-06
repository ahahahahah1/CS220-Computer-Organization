//this file contains the code for ripple counter
`include "./t_flipflop.v"

module ripple_counter(clk, flag, reset, q);
	input clk, flag, reset;
	output reg [3:0] q;

	// initial begin
	// 	q = 4'b0;
	// end

	// parameter i = 1'b0;
	// parameter i = flag;

	// generate
	// 	genvar i, j;
	// 	for(i = flag, j = 0; j == 0; j = j + 1) begin: conditional_instantiate
	// 		if(i) begin //up-counter
	// 			t_flipflop TFF0(.t(1'b1), .clk(clk), .q(q[0]), .rst(reset));
	// 			t_flipflop TFF1(.t(1'b1), .clk(q[0]), .q(q[1]), .rst(reset));
	// 			t_flipflop TFF2(.t(1'b1), .clk(q[1]), .q(q[2]), .rst(reset));
	// 			t_flipflop TFF3(.t(1'b1), .clk(q[2]), .q(q[3]), .rst(reset));
	// 		end
	// 		else begin
	// 			t_flipflop TFF0(.t(1'b1), .clk(clk), .q(q[0]), .rst(reset));
	// 			t_flipflop TFF1(.t(1'b1), .clk(~q[0]), .q(q[1]), .rst(reset));
	// 			t_flipflop TFF2(.t(1'b1), .clk(~q[1]), .q(q[2]), .rst(reset));
	// 			t_flipflop TFF3(.t(1'b1), .clk(~q[2]), .q(q[3]), .rst(reset));
	// 		end
	// 	end
	// endgenerate
  // initiate 4 T-FF to update the count

  t_flipflop tf1(.t(1'b1), .q(q[0]), .clk(clk), .rst(rst));
  t_flipflop tf2(.t(1'b1), .q(q[1]), .clk(q[0]), .rst(rst));
  t_flipflop tf3(.t(1'b1), .q(q[2]), .clk(q[1]), .rst(rst));
  t_flipflop tf4(.t(1'b1), .q(q[3]), .clk(q[2]), .rst(rst));
endmodule