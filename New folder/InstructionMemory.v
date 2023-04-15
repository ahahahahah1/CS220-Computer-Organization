`timescale 1ns / 1ps
module VEDA_I (input [31:0] address, 
               output reg [31:0] instruction, 
               output reg [5:0] opcode, 
               output reg [4:0] rs, 
               output reg [4:0] rt, 
               output reg [4:0] rd, 
               output reg [4:0] shamt, 
               output reg [5:0] functcode
);

  parameter MEM_HEIGHT = 32;

  reg [31:0] instruction_mem[0:MEM_HEIGHT - 1];  // instruction memory

  integer i;
  initial begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1) begin
      instruction_mem[i] = 32'b11111100000000000000000000000000;
    end

    instruction_mem[0] = 32'b001000_10001_10001_0000000000001001; //addi $s1, $s1, 9 (10 is the size of the array)
    instruction_mem[1] = 32'b001000_00000_01000_0000000000000000; //addi $t0, $zero, 0 ($t0 is i)
    //outer loop begins here 
    instruction_mem[2] = 32'b001000_00000_01001_0000000000000000; //addi $t1, $zero, 0 ($t1 is j)
    instruction_mem[3] = 32'b001000_10000_10010_0000000000000000; //addi $s2, $s0, 0  (s2 is the address of the array)
    instruction_mem[4] = 32'b000000_10001_01000_10111_00000_100010; //sub $s7, $s1, $t0 (s7 = n - 1 - i)
    instruction_mem[5] = 32'b100011_10010_01010_0000000000000000; //lw $t2, 0($s2) (store arr[j] in t2)
    instruction_mem[6] = 32'b100011_10010_01011_0000000000000001; //lw $t3, 1($s2) (store arr[j + 1] in t3)
    instruction_mem[7] = 32'b000000_01011_01010_01100_00000_101010; //slt $t4, $t2, $t3 (if arr[j] < arr[j + 1] then t4 = 1)
    instruction_mem[8] = 32'b000100_01100_00000_0000000000000010; //beq $t4, $zero, outer_loop, if not equal then swap
    //swap begins here
    instruction_mem[9] = 32'b101011_10010_01010_0000000000000001; //sw $t2, 1($s2)
    instruction_mem[10] = 32'b101011_10010_01011_0000000000000000; //sw $t3, 0($s2)
    //swap ends here
    instruction_mem[11] = 32'b001000_10010_10010_0000000000000001; //addi $s2, $s2, 1 (s2 = s2 + 1)
    instruction_mem[12] = 32'b001000_01001_01001_0000000000000001; //addi $t1, $t1, 1 (j = j + 1)
    instruction_mem[13] = 32'b000101_01001_10111_1111111111110111; //bne $t1, $s7, outer_loop (if j != n - 1 - i then go to outer_loop)
    instruction_mem[14] = 32'b001000_01000_01000_0000000000000001; //addi $t0, $t0, 1 (i = i + 1)
    instruction_mem[15] = 32'b000101_01000_10001_1111111111110010; //bne $t0, $s7, outer_loop (if i != n - 1 then go to outer_loop)
    //outer loop ends here

    instruction = 32'b11111100000000000000000000000000;
  end

  always @(address) begin
    if(address == -4) begin
     instruction = 32'b11111100000000000000000000000000;
    end
    else begin
     instruction = instruction_mem[address>>2];
    end
    
    opcode = instruction[31:26];
    rs = instruction[25:21];
    rt = instruction[20:16];
    rd = instruction[15:11];
    shamt = instruction[10:6];
    functcode = instruction[5:0];
  end

endmodule