module sll(r0, r1, shamt);
input[31:0] r1;
input[4:0] shamt;
output[31:0] r0;

assign r0 = r1 << shamt;

endmodule
