`timescale 1ns / 1ps

module Program_counter (input clk, input [31:0] nextPC,  output reg [31:0] out);
  initial begin
    out = -4;
  end

  always @(posedge clk) begin
    out = nextPC;
  end

endmodule
