module srl(r0, r1, shamt);
input[31:0] r1, shamt;
output[31:0] r0;

assign r0 = r1 >> shamt;

endmodule
