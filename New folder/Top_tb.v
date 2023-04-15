`timescale 1ns / 1ps
`include "Top.v"

// CHANGES REQUIRED IN COMMENTS OF ALU_CONTROL

module Top_tb;
  reg clk;
  integer i;

  initial begin
    clk = 0; //initializing the clk
    for (i = 0; i < 32; i = i + 1) begin
      processor.uut_VEDA.Register_Data[i] = 32'b0;
    end
  end

  always #10 clk = ~clk; //clock generation - since clk is a reg, we can assign clk to ~clk (since it has memory of its state)

  Top processor(.clk(clk)); //invoking the processor

  // always@(processor.u_PC.out) begin
  //   $display("next PC : %d", processor.u_PC.out);
  //   $display("opcode : %d", processor.u_Instruction_memory.opcode);
  // end

  initial begin
    $display("Initial array is :");
    for(i = 0; i < 10; i = i + 1) begin
      $display("%d", processor.uut_Data_memory.Data_mem[i]);
    end
  end
  
  initial begin
    #50000 $finish;
  end

endmodule