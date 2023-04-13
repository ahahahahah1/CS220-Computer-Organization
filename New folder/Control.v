`timescale 1ns / 1ps


module Control ( input [31:0] instruction, output reg instruction_check, output reg Jump, output reg Branch, output reg Bne,  output reg MemRead,output reg MemtoReg,output reg [1:0] ALUOp,output reg MemWrite,output reg ALUSrc,output reg RegWrite);

    
  initial begin
    instruction_check = 0;
    Jump = 0;
    Branch = 0;
    MemRead = 0;
    MemtoReg = 0;
    ALUOp = 2'b00;
    MemWrite = 0;
    ALUSrc = 0;
    RegWrite = 0;
  end

  always @(instruction) begin
    case (instruction[31:26])
      6'b000000: begin  // ARITHMETIC
        instruction_check = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b10;
        Jump = 0;
      end
      6'b001000: begin  // addi
        instruction_check = 1;
        ALUSrc = 1;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b00;
        Jump = 0;
      end
      6'b001100: begin  // andi
        instruction_check = 1;
        ALUSrc = 1;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b11;
        Jump = 0;
      end
      6'b100011: begin  // lw
        instruction_check = 1;
        ALUSrc = 1;
        MemtoReg = 1;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b00;
        Jump = 0;
      end
      6'b101011: begin  // sw
        instruction_check = 1;  // X
        ALUSrc = 1;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 1;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b00;
        Jump = 0;
      end
      6'b000100: begin  // beq
        instruction_check = 1;  // X
        ALUSrc = 0;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        Bne = 0;
        ALUOp = 2'b01;
        Jump = 0;
      end
      6'b000101: begin  // bne
        instruction_check = 1;  // X
        ALUSrc = 0;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        Bne = 1;
        ALUOp = 2'b01;
        Jump = 0;
      end
      6'b000010: begin  // j
        instruction_check = 1;  // X
        ALUSrc = 0;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b01;
        Jump = 1;
      end
      default: begin
        instruction_check = 1;  // X
        ALUSrc = 0;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b00;
        Jump = 0;
      end
    endcase
  end

endmodule