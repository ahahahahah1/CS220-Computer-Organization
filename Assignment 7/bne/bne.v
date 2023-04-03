module bne(r0, r1, imm, pc, pc_next);
input[31:0] r0, r1, imm;
input[31:0] pc;

output[31:0] pc_next;

assign pc_next = (r0 != r1) ? pc + imm + 4 : pc + 4;

endmodule