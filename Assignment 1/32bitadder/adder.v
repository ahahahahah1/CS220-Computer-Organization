// `include "../full_adder.v"

module adder(input1, input2, sum);

    input [31:0] input1, input2;
    output [31:0] sum;

    wire [32:0] carry;
    assign carry[0] = 0;

    genvar i;

    for(i=0; i<32; i=i+1) begin
        fulladder f(.a(input1[i]), .b(input2[i]), .c_in(carry[i]), .c_out(carry[i+1]), .sum(sum[i]));
    end

endmodule

module fulladder(a, b, c_in, sum, c_out);

input a, b, c_in;
output sum, c_out;

wire x, y, z;

assign sum = a ^ b ^ c_in;

and a1(x, a, b);
and a2(y, a, c_in);
and a3(z, b, c_in);

or o2(c_out, x, y, z);

endmodule