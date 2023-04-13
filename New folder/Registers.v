`timescale 1ns / 1ps

module VEDA(input clk, input [31:0] instruction, input write_enable, input instruction_check, input [31:0] WriteData,  output [31:0] ReadData1, output [31:0] ReadData2);  

wire[4:0] address1,address2, address3;
reg [31:0] Register_Data[31:0];  // 32 registers of 32 bits width

  integer i;  
  assign address3 = instruction[15:11];
  assign address2 = instruction[20:16];
  assign address1 = instruction[25:21];
  assign ReadData2 = Register_Data[address2];
  assign ReadData1 = Register_Data[address1];

  always @(posedge clk) begin  
    case (write_enable)
        1'b1: begin
            case (instruction_check)
            1'b0: begin
                Register_Data[address3] = WriteData; // if instruction_check is 0, write to rd as it is for function with constant
            end
            1'b1: begin
                Register_Data[address2] = WriteData;  //if instruction_check is 1, write to rt which is for operations on value in given register
            end
            endcase
        end
    endcase 
  end

endmodule
