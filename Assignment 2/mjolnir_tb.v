`include "mjolnir.v"
module mjolnir_tb();
reg [15:0] a, b;
wire [15:0] sum;
wire cout;
mjolnir mjolnir(.a(a), .b(b), .sum(sum), .cout(cout));
initial begin
$dumpfile("mjolnir_tb.vcd");
$dumpvars(0, mjolnir_tb);
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
a = 123;
b = 456;
#10;
a = 128;
b = 128;
#10;
a = 32768;
b = 32768;
#10;
$finish;
end

initial begin
    $monitor("a = %b, b = %b, sum = %b, sum_in_decimal = %d cout = %b", a, b, sum, sum,cout);
end
endmodule
