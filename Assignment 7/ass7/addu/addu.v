//add 2 unsigned 32-bit numbers a and b and give the output in sum

module addu(a, b, sum, overflow);
    input [31:0] a,b;
    output [31:0] sum;

    assign sum = a + b;
    assign overflow = ((a[31] == 1 && b[31] == 1) || (a[31] != b[31] && sum[31] == 0))
endmodule