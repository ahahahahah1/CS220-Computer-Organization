module fullsubtractor(a, b, c, diff, bout);
    input a, b, c;
    output diff, bout;

    wire diff, bout;
    wire a1, a2, xo1;

    // assign diff = a ^ b ^ c;
    xor x1(diff, a, b, c);

    // assign a1 = (c & ~(a ^ b));
    // assign a2 = (~a & b);
    // assign B_out = a1 | a2;
    xor x2(xo1, a, b);
    and A1(a1, c, ~xo1);
    and A2(a2, ~a, b); 
    or o1(bout, a1, a2);

endmodule