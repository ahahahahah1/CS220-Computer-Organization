module fulladder(a, b, c_in, sum, c_out);

input a, b, c_in;
output sum, c_out;

wire x, y, z;

// assign sum = a ^ b ^ c_in;
xor x1(sum, a, b, c_in);

and a1(x, a, b);
and a2(y, a, c_in);
and a3(z, b, c_in);

or o2(c_out, x, y, z);

endmodule