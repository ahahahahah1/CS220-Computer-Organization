module fullsubtractor(a, b, c, diff, B_out);
input a, b, c;
output diff, B_out;

wire diff, B_out;
wire a1, a2, xo1;

// assign diff = a ^ b ^ c;
xor x1(diff, a, b, c);

// assign a1 = (c & ~(a ^ b));
// assign a2 = (~a & b);
// assign B_out = a1 | a2;

xor x2(xo1, a, b);
and A1(a1, c, ~xo1);
and A2(a2, ~a, b);
or o1(B_out, a1, a2);

endmodule