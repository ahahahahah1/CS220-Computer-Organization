module Mux4to1(i0, i1, i2, i3, s0, s1, out);
//s0 is the less significant bit of the control lines and s1 is the more significant bit

input i0, i1, i2, i3, s0, s1;
output wire out;
wire a1, a2, a3, a4;

// assign a1 = (~s0) & (~s1) & i0;
// assign a2 = (s0) & (~s1) & i1;
// assign a3 = (~s0) & (s1) & i2;
// assign a4 = (s0) & (s1) & i3;
and A1(a1, ~s0, ~s1, i0);
and A2(a2, s0, ~s1, i1);
and A3(a3, ~s0, s1, i2);
and A4(a4, s0, s1, i3);

// assign out = a1 | a2 | a3 | a4;
or o1(out, a1, a2, a3, a4);

endmodule