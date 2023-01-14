`include "full_adder.v"

module full_adder_tb;

reg a, b, cin;
wire sum, cout;

fulladder foo(.a(a), .b(b), .c_in(cin), .c_out(cout), .sum(sum));

initial begin
    $dumpfile("full_adder_tb.vcd");
    $dumpvars();
end

initial begin
    a = 1;
    #4;
    a = 0;
    #3;
    $finish;
end

initial begin
    b = 1;
    forever #2 b = ~b;
end

initial begin
    cin = 1;
    forever #1 cin = ~cin;
end

initial begin
    $monitor("time=%0d, A=%b, B=%b, Cin=%b, Sum=%b, Cout=%b", $time, a, b, cin, sum, cout);
end

endmodule