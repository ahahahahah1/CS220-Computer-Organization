`include './ripple_counter.v'

module ripple_counter_top(flag, q);
	parameter freq = 50_000_000;
	input flag;
	output q;
	reg [3:0] q;

	reg [31:0] counter;
	reg clk, rst;

	initial begin
		counter <= 32'b0;
		clk <= 1'b0;
	end

	ripple_counter RC(.clk(clk), .flag(flag), .reset(1'b0), .q(q));

	always@(*) begin
		counter <= counter + 1;
	if(counter > freq) begin
		clk = ~clk;
	end
endmodule