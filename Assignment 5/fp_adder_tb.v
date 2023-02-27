// // write testbench for floating point adder
// `include "fp_adder.v"

// module fp_adder_tb();
//     reg [31:0] a;
//     reg [31:0] b;
//     wire [31:0] result;

//     fp_adder fp_adder1(
//         .a(a),
//         .b(b),
//         .result(result)
//     );

//     initial begin
//         a = 32'0_0000010_111_1000_0000_0000_0000_0000;
//         b = 32'0_0000010_111_1000_0000_0000_0000_0000;
//         #10;
//         a = 32'0_0000011_111_1000_0000_0000_0000_0000;
//         b = 32'0_0000010_111_1000_0000_0000_0000_0000;
//         #10;
//         a = 32'0_0000010_111_1100_0000_0000_0000_0000;
//         b = 32'0_0000010_111_1000_0000_0000_0000_0000;
//         #10;
//         a = 32'0_0000010_111_1001_0000_0000_0000_0000;
//         b = 32'0_0000110_111_1000_0000_0000_0000_0000;
//         #10;
//     end

//     initial begin
//         $monitor("a = %b, b = %b, result = %b", a, b, result);
//     end

`include "fp_adder.v"

module fp_adder_tb();
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] result;

    fp_adder fp_adder1(
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        a = 32'h00A38000;
        b = 32'h00A38000;
        #10;
        a = 32'h00B38000;
        b = 32'h00A38000;
        #10;
        a = 32'h00A3C000;
        b = 32'h00A38000;
        #10;
        a = 32'h00A38900;
        b = 32'h01838000;
        #10;
    end

    initial begin
        $monitor("a = %h, b = %h, result = %h", a, b, result);
    end
endmodule