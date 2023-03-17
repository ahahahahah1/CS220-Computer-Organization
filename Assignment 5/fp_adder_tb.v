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

`include "float_adder.v"

module fp_adder_tb();
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] result;
    reg clk;
    adder fp_adder1(
        .operand_1(a),
        .operand_2(b),
        .clk(clk),
        .Sum(result)
    );

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        a = 32'h42BA8000; //93.25
        b = 32'h41453333; //12.375
        // #20;
        // a = 32'h3E00D1B7; //0.1258
        // b = 32'h3F8051EC; //1.0025
        // #20;
        // a = 32'hC12CCCCD; //-10.8 // 11000001 00101100 11001100 11001101
        // b = 32'hC1480000; //-12.5 // 11000001 01000100 10000000 00000000
        // #20;
        // a = 32'hC12CCCCD; //-10.8
        // b = 32'h41480000; //12.5
        // #20;
        #40
        $finish;
    end

    initial begin
        $monitor("time: %t : a = %h, b = %h, result = %h", $time, a, b, result);
        //expected result is 
        //1st : 42D34000
        //2nd : 1.1283
        //3rd : -23.3
        //4th : 1.3
    end
endmodule