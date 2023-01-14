module subtractor32bit(input1, input2, diff);
input [31:0] input1, input2;
output [31:0] diff;

wire [32:0] borrow;
assign borrow[0] = 0;

genvar i;

for(i=0; i<32; i=i+1) begin
    fullsubtractor f(.a(input1[i]), .b(input2[i]), .c(borrow[i]), .B_out(borrow[i+1]), .diff(diff[i]));
end
endmodule


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