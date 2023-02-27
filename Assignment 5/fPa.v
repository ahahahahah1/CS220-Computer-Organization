module fp_adder (
  input [31:0] a, // 32-bit operand a
  input [31:0] b, // 32-bit operand b
  output reg [31:0] sum // 32-bit result sum
);

  reg [31:0] a_expanded; // Expanded a
  reg [31:0] b_expanded; // Expanded b
  reg greater_exp;
  reg [31:0] a_swapped;
  reg [31:0] b_swapped;
  reg [7:0] exp_diff;
  reg [31:0] b_shifted;
  reg sign;
  reg [31:0] mant_sum;
  reg [31:0] sum_expanded;
  reg overflow;
  reg underflow;

  always @* begin
    a_expanded = {1'b0, a[22:0], 8'h7F}; // Expand a
    b_expanded = {1'b0, b[22:0], 8'h7F}; // Expand b

    // Determine which operand has the greater exponent
    greater_exp = (a_expanded[30:23] > b_expanded[30:23]);

    // Swap operands if necessary so that a has the greater exponent
    if (greater_exp) begin
      a_swapped = a_expanded;
      b_swapped = b_expanded;
    end else begin
      a_swapped = b_expanded;
      b_swapped = a_expanded;
    end

    // Calculate the difference in exponents
    exp_diff = a_swapped[30:23] - b_swapped[30:23];

    // Right-shift the mantissa of the smaller operand
    b_shifted = {1'b0, b_swapped[22:0]} >> exp_diff;

    // Determine the sign of the result
    sign = a_swapped[31];

    // Calculate the new exponent and mantissa
    mant_sum = sign ? a_swapped - b_shifted : a_swapped + b_shifted;
    sum_expanded = {sign, mant_sum[30:23], mant_sum[22:0]};

    // Check for overflow or underflow
    overflow = (mant_sum[30:23] == 8'hFF) && (mant_sum[22:0] == 0);
    underflow = (mant_sum[30:23] == 0) && (mant_sum[22:0] == 0);

    // Handle overflow or underflow
    if (overflow) begin
      sum = {1'b0, 8'hFE, 23'h0};
    end else if (underflow) begin
      sum = {sign, 8'h01, 23'h0};
    end else begin
      sum = sum_expanded;
    end
  end

endmodule
