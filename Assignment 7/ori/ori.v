module ori(r0, r1, imm);
    input [31:0] r1;
    input [15:0] imm;
    output [31:0] r0;

    wire b ={{16{imm[15]}}, imm};

    assign r0 = r1 | b;

endmodule
