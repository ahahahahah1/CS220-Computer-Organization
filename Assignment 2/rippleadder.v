`include "fulladder.v"
module rippleadder(a, b, cin, sum, cout);
parameter k = 8;
input [k-1:0] a, b;
input cin;
output [k-1:0] sum;
output cout;
wire [k-1:0] sum;
wire [k:0] cout_temp;

assign cout_temp[0] = cin;

genvar i;
generate
for (i=0; i<k; i=i+1) begin
fulladder u_fulladder (.a(a[i]), .b(b[i]), .cin(cout_temp[i]), .sum(sum[i]), .cout(cout_temp[i+1]));
end
endgenerate

assign cout = cout_temp[k];
endmodule
