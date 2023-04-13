`timescale 1ns / 1ps
`include "InstructionMemory.v"
`include "PC.v"
`include "Registers.v"
`include "Control.v"
`include "ALU.v"
`include "DataMemory.v"
`include "ALUControl.v"
`include "UpdatePC.v"


module Top (input clk);

  wire [ 5:0] control_instruction_mem, functcode_instruction_mem;
  wire [31:0] instrcution_taken, input_prog_count, output_program_count, r_wbdata, r_read1, r_read2;
  wire destination, c_Jump, c_Branch, c_Bne, c_MemRead, c_MemtoReg, c_MemWrite, c_ALUSrc, c_RegWrite, c_zero;
  wire [1:0] c_ALUOp;
  wire [3:0] c_ALUcontrol;
  wire [31:0] alu_result;


  Program_counter u_Program_counter (
      .clk (clk),
      .next(input_prog_count),
      .out (output_program_count)
  );

  Instruction_memory u_Instruction_memory (
      .address       (output_program_count),
      .control        (control_instruction_mem),
      .functcode    (functcode_instruction_mem),
      .instruction(instrcution_taken)
  );


  VEDA u_VEDA (
      .clk        (clk),
      .instruction(instrcution_taken),
      .write_enable  (c_RegWrite),
      .instruction_check     (destination),
      .WriteData  (r_wbdata),
      .ReadData1  (r_read1),
      .ReadData2  (r_read2)
  );


  ALU u_ALU (
      .data1      (r_read1),
      .read2      (r_read2),
      .instruction(instrcution_taken),
      .ALUSrc     (c_ALUSrc),
      .ALUcontrol (c_ALUcontrol),
      .zero       (c_zero),
      .ALUresult  (alu_result)
  );


  ALU_control u_ALU_control (
      .ALUOp      (c_ALUOp),
      .instruction(functcode_instruction_mem),
      .ALUcontrol (c_ALUcontrol)
  );

  Control u_Control (
      .instruction(instrcution_taken),
      .instruction_check     (destination),
      .Jump       (c_Jump),
      .Branch     (c_Branch),
      .Bne        (c_Bne),
      .MemRead    (c_MemRead),
      .MemtoReg   (c_MemtoReg),
      .ALUOp      (c_ALUOp),
      .MemWrite   (c_MemWrite),
      .ALUSrc     (c_ALUSrc),
      .RegWrite   (c_RegWrite)
  );


  Data_memory u_Data_memory (
      .clk      (clk),
      .addr     (alu_result),  // im_instruction
      .writeData    (r_read2),
      .ALU_final(alu_result),
      .MemWrite (c_MemWrite),
      .Read_mem  (c_MemRead),
      .Reg_save (c_MemtoReg),
      .read_Data    (r_wbdata)
  );


  Next_pc u_Next_pc (
      .old        (output_program_count),
      .instruction(instrcution_taken),
      .Jump       (c_Jump),
      .Branch     (c_Branch),
      .Bne        (c_Bne),
      .zero       (c_zero),
      .next       (input_prog_count)
  );

endmodule
