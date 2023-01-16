`include "multiplexer.v"

module multiplexer_tb;

reg i0, i1, i2, i3, s0, s1;
wire out;

Mux4to1 uut(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), .s1(s1), .out(out));

initial 
    begin
        $dumpfile("multiplexer_tb.vcd");
        $dumpvars();
    end

initial 
    begin
        i0 = 0; i1 = 1; i2 = 0; i3 = 1;
        #4
        i0 = 1; i1 = 0; i2 = 1; i3 = 0;
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