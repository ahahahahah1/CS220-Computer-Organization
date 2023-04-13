`timescale 1ns / 1ps
`include "Top.v"
module Top_tb;

  reg clk;
  integer i;

  always #10 clk = ~clk; //clock generation - since clk is a reg, we can assign clk to ~clk (since it has memory of its state)

  Top processor(.clk(clk)); //invoking the processor

  initial begin
    clk = 0; //initializing the clk
    for (i = 0; i < 32; i = i + 1) begin
      processor.u_VEDA.Register_Data[i] = 32'b0;
    end
  end
  
  initial begin
    #55000 $finish;
  end


endmodule