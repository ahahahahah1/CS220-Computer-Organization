`include "./full_adder.v"

module add(a, b, sum, overflow);
    //This module takes 2 32-bit signed numbers a and b as input and outputs their 32-bit signed sum. flag indicates if overflow/underflow has occured.
    input [31:0] a, b;
    output wire [31:0] sum;
    output wire overflow;
    wire [32:0] carry;

    assign carry[0] = 0;
    
    generate
        genvar i;
        for (i = 0; i < 32; i = i + 1) begin : FA_GEN
            fulladder FA (.a(a[i]), .b(b[i]), .cin(carry[i]), .sum(sum[i]), .cout(carry[i+1]));
        end
    endgenerate

    assign overflow = (a[31] == b[31] && a[31] != sum[31]);
endmodule
