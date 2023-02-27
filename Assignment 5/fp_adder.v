module fp_adder (
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] result
);

reg [22:0] a_mantissa;
reg [22:0] b_mantissa;
reg [7:0] a_exponent;
reg [7:0] b_exponent;
reg a_sign;
reg b_sign;
reg carry;

always @(*) begin
    a_sign = a[31];
    b_sign = b[31];

    a_mantissa = {1'b1, a[22:0]};
    b_mantissa = {1'b1, b[22:0]};
    a_exponent = a[30:23];
    b_exponent = b[30:23];

    // Calculate the difference in exponents
    reg [7:0] exponent_diff = a_exponent - b_exponent;

    // Align the mantissas based on the exponent difference
    reg [23:0] aligned_a_mantissa;
    reg [23:0] aligned_b_mantissa;

    if (exponent_diff > 0) begin
        aligned_a_mantissa = {a_mantissa, {exponent_diff{1'b0}}};
        aligned_b_mantissa = b_mantissa;
    end else begin
        aligned_a_mantissa = a_mantissa;
        aligned_b_mantissa = {b_mantissa, {-exponent_diff{1'b0}}};
    end

    // Add the mantissas
    reg [24:0] sum = {aligned_a_mantissa, 1'b0} + {aligned_b_mantissa, 1'b0};

    // Check for overflow
    if (sum[25]) begin
        sum = sum >> 1;
        exponent_diff = exponent_diff + 1;
    end

    // Round the result
    if (sum[23] && (sum[22:0] != 23'b0)) begin
        sum = sum + 1;
    end

    // Normalize the result
    while (sum[23] == 0) begin
        sum = sum << 1;
        exponent_diff = exponent_diff - 1;
    end

    // Check for underflow
    if (exponent_diff < 0) begin
        result = 32'b0;
    end else begin
        result[31] = a_sign ^ b_sign;
        result[30:23] = a_exponent + exponent_diff;
        result[22:0] = sum[23:1];
    end
end

endmodule
