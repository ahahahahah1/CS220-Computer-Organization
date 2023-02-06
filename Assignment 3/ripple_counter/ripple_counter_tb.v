`include "./ripple_counter.v"

module ripple_counter_tb;
	reg clk, rst, flag;
	reg [3:0] q;

	initial begin
		rst <= 1'b0;
		flag <= 1'b0;
		clk <= 1'b0;
		forever #200 flag = ~flag;
	end
	
	always #5 clk = ~clk;

	initial begin
		#1000 $finish;
	end

	ripple_counter RC1(.clk(clk), .reset(rst), .q(q), .flag(flag));

	always@(*) begin
		$display("at time = %d, %d %d %d %d", $time, q[3], q[2], q[1], q[0]);
	end

endmodule