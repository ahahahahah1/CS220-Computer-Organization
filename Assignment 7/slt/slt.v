module slt(r0, r1, r2)
    input [31:0] r1, r2;
    output r0;

    assign r0 = (r1[31] == 0 && r2[31] == 1) ? 0 :
                (r1[31] == 1 && r2[31] == 0) ? 1 :
                (r1[30:0] < r2[30:0]) ? 1 : 0;
endmodule