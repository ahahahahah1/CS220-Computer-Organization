`include "../add/full_adder.v"
module addi (
    input [31:0] a,
    input [15:0] b,
    output [31:0] sum,
    output overflow
);

wire [31:0] b_ext;
assign b_ext = {{16{b[15]}}, b};
wire [32:0] carry;

assign carry[0] = 0;

generate
    genvar i;
    for (i = 0; i < 32; i = i + 1) begin : FA_GEN
        fulladder FA (.a(a[i]), .b(b_ext[i]), .cin(carry[i]), .sum(sum[i]), .cout(carry[i+1]));
    end
endgenerate

assign overflow = (a[31] == b_ext[31]) && (sum[31] != a[31]);

endmodule