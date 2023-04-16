`timescale 1ns / 1ps

module VEDA_R(input clk, 
              input [4:0] rs, 
              input [4:0] rt, 
              input [4:0] rd, 
              input write_enable, 
              input instruction_check, 
              input [31:0] WriteData,  
              output [31:0] ReadData1, 
              output [31:0] ReadData2
);

  parameter VEDA_SIZE = 32;

  reg [31:0] Register_Data[VEDA_SIZE - 1 :0];  // 32 registers of 32 bits width

  integer i;
  assign ReadData2 = Register_Data[rt];
  assign ReadData1 = Register_Data[rs];

  always @(posedge clk) begin  
    if(write_enable == 1'b1) begin
      if(instruction_check == 1) begin
        Register_Data[rt] = WriteData;  //if instruction_check is 1, write to rt which is for operations on value in given register
      end
      else begin
            Register_Data[rd] = WriteData; // if instruction_check is 0, write to rd as it is for function with constant
      end
    end
  end

endmodule
