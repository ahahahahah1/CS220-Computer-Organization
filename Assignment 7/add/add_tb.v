`include "./add.v"
module add_tb();
    reg [31:0] a, b;
    wire [31:0] sum;
    wire flag;

    add uut(.a(a), .b(b), .sum(sum), .overflow(flag));

    initial begin
        a = 32'b0001_0000_0100_1010_1001_0000_0100_1010;
        b = 32'b0101_0000_0100_1010_1001_0000_0100_1111;
        #10;
        $display("a =   %b", a);
        $display("b =   %b", b);
        $display("sum = %b", sum);
        $display("flag = %d", flag);
        #10;
        a = 32'b1001_0000_0100_1010_1001_0000_0100_1010;
        b = 32'b1001_0100_0010_0110_1001_0000_0100_1010;
        #10;
        $display("a =   %b", a);
        $display("b =   %b", b);
        $display("sum = %b", sum);
        $display("flag = %d", flag);
        #10;
        a = 32'b1111_1111_1111_1111_1111_1101_1111_1000;
        b = 32'b1110_1111_1111_1111_1001_1011_1111_1111;
        #10;
        $display("a =   %b", a);
        $display("b =   %b", b);
        $display("sum = %b", sum);
        $display("flag = %d", flag);
        #10;
    end
endmodule