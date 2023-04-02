module bgt(r0, r1, imm, pc, pc_next);
    input[31:0] r0, r1, imm;
    input[31:0] pc;

    output wire [31:0] pc_next;

    assign pc_next = (r0[31] == 0 && r1[31] == 1) ? pc + imm + 1 :
                     (r0[31] == 1 && r1[31] == 0) ? pc + 1 :
                     (r0[30:0] >= r1[30:0]) ? pc + imm + 1 : pc + 1;
endmodule