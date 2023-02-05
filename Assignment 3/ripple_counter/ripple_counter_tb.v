`include './ripple_counter_top.v'

module ripple_counter_tb;
	wire flag;
	reg [3:0] q;

	initial begin
		assign flag = 1'b0;
		q <= 4'b0;
		forever #200 flag = ~flag;
	end

	initial begin
		#1000 $finish
	end

	ripple_counter_top(.q(q), .flag(flag));

	always@(*) begin
		$display("at time = %d, %d %d %d %d", $time, q[3], q[2], q[1], q[0]);
	end

endmodule