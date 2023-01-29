`include "rippleadder.v"
module rippleadder_tb();
reg [7:0] a, b;
wire [7:0] sum;
wire cout;
rippleadder radder(.a(a), .b(b), .cin(0), .sum(sum), .cout(cout));
initial begin
$dumpfile("rippleadder_tb.vcd");
$dumpvars(0, rippleadder_tb);
a = 0;
b = 0;
#10;
a = 1;
b = 1;
#10;
a = 2;
b = 2;
#10;
a = 3;
b = 3;
#10;
a = 4;
b = 4;
#10;
a = 5;
b = 5;
#10;
a = 6;
b = 6;
#10;
a = 7;
b = 7;
#10;
#10;
$finish;
end

initial begin
    $monitor("a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
end
endmodule