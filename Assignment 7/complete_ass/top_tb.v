`timescale 1ns / 1ps
`include "top.v"

`define CYCLE_TIME 20

module top_tb;

  reg clk;
  integer i; // integer  counter

  always #(`CYCLE_TIME / 2) clk = ~clk;

  top uut (.clk(clk));

  initial begin
    // Initialize data memory
    for (i = 0; i < 32; i = i + 1) begin
      uut.u_Data_memory.Dmem[i] = 32'b0;
    end

    // initialize Register File
    for (i = 0; i < 32; i = i + 1) begin
      uut.u_Register.RegData[i] = 32'b0;
    end
   
    clk = 0;
  end

  always @(posedge clk) begin
    $display("",$time);
    $display("PC = ", uut.pc_in/4);
    $display("IM = %b", uut.im_instruction);
    $display("ALU_control = %b", uut.c_ALUcontrol);
    $display("ALU_Result = 0x%H", uut.alu_result);
    $display("ALUOp = %b", uut.c_ALUOp);
    $display("ALU_In1 = 0x%H", uut.r_read1);
    $display("Alu_In2 = 0x%H", uut.r_read2);
    $display("WB = 0x%H", uut.r_wbdata);
    $display("MemRead = ", uut.c_MemRead);
    $display("MemWrite = ", uut.c_MemWrite);
    $display("--------------------------------------------------");
  end
  
  initial begin  
    #1800;
    // $display("%0dth fibonacci number = %0d\n", uut.u_Register.RegData[16], uut.u_Register.RegData[17]);
  end
  
  initial begin
    #800 $finish;
  end


endmodule