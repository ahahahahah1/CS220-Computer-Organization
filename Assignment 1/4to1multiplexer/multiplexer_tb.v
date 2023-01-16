`include "multiplexer.v"

module multiplexer_tb;

reg [31:0] i0, i1, i2, i3;
reg s0, s1;
wire [31:0] out;

32bitMux uut(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), .s1(s1), .out(out));

initial 
    begin
        $dumpfile("multiplexer_tb.vcd");
        $dumpvars();
    end

initial 
    begin
        i0 = 32'b01011110010010001101101000110011; i1 = 32'b10010111000110101011001000111111; i2 = 32'b01101100011110101000110101010010; i3 = 32'b10101010101010101010101010101010;
        #4
        i0 = 32'b01010101010101010101011101010100; i1 = 32'b01010101101010001001000010111100; i2 = 32'b11010110011010101111101001010101; i3 = 32'b10001010100011111001110011010001;
        #3
        $finish;
    end

initial 
    begin
        s1 = 0;
        forever #2 s1 = ~s1;
    end

initial 
    begin
        s0 = 0;
        forever #1 s0 = ~s0;
    end

initial 
    begin
        $monitor("time=%0d, s0=%b, s1=%b, i0=%b, i1=%b, i2=%b, i3=%b, out=%b", $time, s0, s1, i0, i1, i2, i3, out);
    end

endmodule