`include "fullsubtractor.v"

module fullsubtractor_tb;

reg a, b, bin;
wire d, bout;

fullsubtractor foo(.a(a), .b(b), .c(bin), .B_out(bout), .diff(d));

initial begin
    $dumpfile("full_subtractor_tb.vcd");
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
    bin = 1;
    forever #1 bin = ~bin;
end

initial begin
    $monitor("time=%0d, A=%b, B=%b, Bin=%b, Diff=%b, Bout=%b", $time, a, b, bin, d, bout);
end

endmodule