//this file contains the code for ripple counter
`include "./t_flipflop.v"

// module ripple_counter(clk, flag, reset, q);
// 	input clk, flag, reset;
// 	output wire [3:0] q;
// 	wire clk1, clk2, clk3;
	
// 	xor x1(clk1, q[0], control);
// 	xor x2(clk2, q[1], control);
// 	xor x3(clk3, q[2], control);

// 	t_flipflop tf1(.t(1'b1), .q(q[0]), .clk(clk), .rst(reset));
// 	t_flipflop tf2(.t(1'b1), .q(q[1]), .clk(clk1), .rst(reset));
// 	t_flipflop tf3(.t(1'b1), .q(q[2]), .clk(clk2), .rst(reset));
// 	t_flipflop tf4(.t(1'b1), .q(q[3]), .clk(clk3), .rst(reset));
// endmodule

module counter (control, clk, rst, q);
    input control,clk,rst;
    output [3:0] q;

    wire clk0, clk1, clk2, clk3;
    xor x1(clk1, control, q[0]);
    xor x2(clk2, control, q[1]);
    xor x3(clk3, control, q[2]);

    tflipflop tff0(q[0], clk, rst);
    tflipflop tff1(q[1], clk1, rst);
    tflipflop tff2(q[2], clk2, rst);
    tflipflop tff3(q[3], clk3, rst);
endmodule