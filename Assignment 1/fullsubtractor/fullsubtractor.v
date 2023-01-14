module fullsubtractor(a, b, c, diff, B_out);
input a, b, c;
output diff, B_out;

wire diff, B_out;
wire a1, a2;

assign diff = a ^ b ^ c;

assign a1 = (c & ~(a ^ b));
assign a2 = (~a & b);
assign B_out = a1 | a2; 

endmodule