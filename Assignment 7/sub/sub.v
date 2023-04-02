`include "./full_subtractor.v"
module sub(diff, a, b, overflow);
input[31:0] a, b;
output wire [31:0] diff;
output wire overflow;

wire[32:0] carry;

assign carry[0] = 0;

generate
    genvar i;
    for (i = 0; i < 32; i = i + 1) begin: subtractor
        fullsubtractor sub(.a(a[i]), .b(b[i]), .c(carry[i]), .diff(diff[i]), .bout(carry[i+1]));
    end
endgenerate

assign overflow = (a[31] != b[31] && carry[32] == diff[31]);

endmodule