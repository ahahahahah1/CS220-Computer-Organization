`timescale 1ns / 1ps
module Instruction_memory (input [31:0] address, output reg [5:0] control,output reg [5:0] functcode, output reg [31:0] instruction);

  parameter MEM_HEIGHT = 32;

  reg [31:0] instruction_mem[0:MEM_HEIGHT - 1];  // instruction memory

  integer i;
  initial begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1) begin
      instruction_mem[i] = 32'b11111100000000000000000000000000;
    end

    instruction_mem[0] = 32'b001000_10001_10001_0000000000001001; //addi $s1, $s1, 9 (10 is the size of the array)
    instruction_mem[1] = 32'b001000_00000_01001_0000000000000000; //addi $t1, $zero, 0
    //outer loop begins here 
    instruction_mem[2] = 32'b001000_00000_01010_0000000000000000; //addi $t2, $zero, 0
    instruction_mem[3] = 32'b000000_10001_01001_10111_00000_100010; //sub $s7, $s1, $t1
    instruction_mem[4] = 32'b001000_10000_10010_0000000000000000; //addi $s2, $s0, 0 
    instruction_mem[5] = 32'b100011_10010_01011_0000000000000000; //lw $t3, 0($s2)
    instruction_mem[6] = 32'b100011_10010_01100_0000000000000001; //lw $t4, 1($s2)
    instruction_mem[7] = 32'b000000_01100_01011_1100000000101010; //slt $t5, $t3, $t4  
    instruction_mem[8] = 32'b000100_11000_00000_0000000000000010; //beq $t5, $zero, outer_loop, if not equal then swap
    instruction_mem[9] = 32'b101011_10010_01011_0000000000000001; //sw $t4, 1($s2)
    instruction_mem[10] = 32'b101011_10010_01100_0000000000000000; //sw $t4, 0($s2)   
    instruction_mem[11] = 32'b001000_10010_10010_0000000000000001; //addi $s2, $s2, 1
    instruction_mem[12] = 32'b001000_01010_01010_0000000000000001; //addi $t2, $t2, 1
    instruction_mem[13] = 32'b000101_01010_10111_1111111111110111; //bne $t2, $s7, outer_loop
    instruction_mem[14] = 32'b001000_01001_01001_0000000000000001; //addi $t1, $t1, 1
    instruction_mem[15] = 32'b000101_01001_10001_1111111111110010; //bne $t1, $s7, outer_loop

    instruction = 32'b11111100000000000000000000000000;
  end

  always @(address) begin
    if(address == -4) begin
     instruction = 32'b11111100000000000000000000000000;
    end
    else begin
     instruction = instruction_mem[address>>2];
    end
    control = instruction[31:26];
    functcode = instruction[5:0];
  end

endmodule