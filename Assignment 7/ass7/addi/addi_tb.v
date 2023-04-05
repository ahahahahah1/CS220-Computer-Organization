`include "./addi.v"
module addi_tb();
    reg [31:0] a;
    reg [15:0] b;
    wire [31:0] sum;
    wire flag;

    addi uut(.a(a), .b(b), .sum(sum), .overflow(flag));

    initial begin
        b = 16'b0001_0000_0100_1010;
        a = 32'b0001_0000_0100_1010_1001_0000_0100_1010;
        #10;
        b = 16'b1001_0000_0100_1010;
        a = 32'b1101_0000_0100_1010_1001_0000_0100_1111;
        #10;
        b = 16'b1001_0000_0100_1010;
        a = 32'b1111_1111_1111_1111_1111_1101_1111_1000;
        #10;
        b = 16'b0001_0000_0000_0000;
        a = 32'b0111_1111_1111_1111_1111_1111_1111_1111;
    end
    initial begin
        $monitor("a = %b, b = %b\nsum = %b, flag = %b", a, b, sum, flag);
    end
endmodule