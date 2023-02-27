module fp_adder(
    input [31:0] a,
    input [31:0] b,
    output wire [31:0] sum
);
    wire a_sign, b_sign;
    wire [7:0] a_exp, b_exp,, exp_diff;
    wire [22:0] a_mantissa, b_mantissa;

    assign a_sign = a[31];
    assign b_sign = b[31];
    
    assign a_exp = a[30:23];
    assign b_exp = b[30:23];

    assign a_mantissa = a[22:0];
    assign b_mantissa = b[22:0];

    always@(*) begin
        if(b_exp == 8'b1111_1111) begin
            if(b_mantissa == 0) begin
                if(b_sign == 1) begin //b = -infi
                    assign sum = 32'b1_1111_1111_0000_0000_0000_0000_0000_000;
                end
                else begin //b = infi
                    assign sum = 32'b0_1111_1111_0000_0000_0000_0000_0000_000;
                end
            end
            else begin //b = NaN
                assign sum = 32'b0_1111_1111_1000_0000_0000_0000_0000_000;
            end
        end

        else if(a_exp == 8'b1111_1111) begin
            if(a_mantissa == 0) begin
                if(a_sign == 1) begin //a = -infi
                    assign sum = 32'b1_1111_1111_0000_0000_0000_0000_0000_000;
                end
                else begin //a = infi
                    assign sum = 32'b0_1111_1111_0000_0000_0000_0000_0000_000;
                end
            end
            else begin //a = NaN
                assign sum = 32'b0_1111_1111_1000_0000_0000_0000_0000_000;
            end
        end

        else if(b_exp == 0 && b_mantissa == 0) begin //b = 0
            assign sum = a;
        end

        else if(a_exp == 0 && a_mantissa == 0) begin //a = 0
            assign sum = b;
        end

        else begin
            
        end


endmodule