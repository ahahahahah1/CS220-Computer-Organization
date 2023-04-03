module addiu(a, imm, sum, overflow);
    input [31:0] a;
    input [15:0] imm;
    output [31:0] sum;

    wire [31:0] b;
    assign b = {{16{imm[15]}}, imm};
    
    assign sum = a + b;
    assign overflow = ((a[31] == 1 && b[31] == 1) || (a[31] != b[31] && sum[31] == 0))
endmodule