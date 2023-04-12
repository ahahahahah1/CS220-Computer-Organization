module lw(r0, r1, imm, memory);
input[31:0] r1, imm;
input[31:0] memory[0:31];

output[31:0] r0;

assign r0 = memory[r1 + imm];

endmodule