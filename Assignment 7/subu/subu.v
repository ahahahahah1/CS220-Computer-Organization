module subu(a, b, diff);
    input [31:0] a, b;
    output [31:0] diff;

    assign diff = a - b;
endmodule