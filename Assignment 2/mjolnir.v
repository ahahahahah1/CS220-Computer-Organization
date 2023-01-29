`include "rippleadder.v"

module mjolnir(a, b, sum, cout);
parameter k = 16;
input [k-1:0] a, b;
output [k-1:0] sum;
output reg cout;

wire [k/2-1:0] sum1, sum21, sum22, a1, a2, b1, b2;
reg [k/2-1:0] sum2;
wire c00, c01, c02;

assign a1 = a[k/2-1:0];
assign a2 = a[k-1:k/2];
assign b1 = b[k/2-1:0];
assign b2 = b[k-1:k/2];

// adder for first halves
rippleadder radder1(.a(a1), .b(b1), .cin(0), .sum(sum1), .cout(c00));

// adder for second halves
rippleadder radder2(.a(a2), .b(b2), .cin(0), .sum(sum21), .cout(c01));
rippleadder radder3(.a(a2), .b(b2), .cin(1), .sum(sum22), .cout(c02));

// adder for sum of first halves and second halves
always @ (*) begin
    if (c00) begin
        sum2 = sum22;
    end else begin
        sum2 = sum21;
    end

    if (c00) begin
        assign cout = c02;
    end else begin
        assign cout = c01;
    end
end

// assign sum
assign sum = {sum2, sum1};

// assign cout


endmodule

