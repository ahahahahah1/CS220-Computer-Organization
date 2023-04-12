`include "./or_operator.v"
module or_tb();
    //This module sends two 32-bit numbers to the and module and checks the output
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] or_output;

    or_operator uut(.r1(a), .r2(b), .r0(or_output));

    initial begin
        a = 32'b0101_0100_0101_0010_0100_0000_0000_0000;
        b = 32'b0100_0101_1001_0010_0000_0000_0000_0000;
        #10;
        $display("a   = %b\nb   = %b\nand = %b", a, b, or_output);
    end
endmodule