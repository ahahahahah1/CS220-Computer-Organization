`timescale 1ns / 1ps


module Data_memory (input clk,input [31:0] addr,input [31:0] writeData,input [31:0] ALU_final,input MemWrite,input Read_mem,input Reg_save,output reg [31:0] read_Data);
  parameter MEM_HEIGHT = 32;
 
  reg [31:0] Data_mem[0:MEM_HEIGHT - 1];  // Memory

  // initially set default data to 0
  integer i;

  initial begin
        // Data_mem[0]= 32'b000000_00000_00000_00000_00000_000100;
        // Data_mem[1]= 32'b000000_00000_00000_00000_00000_000011;
        // Data_mem[2]= 32'b000000_00000_00000_00000_00000_001000;
        // Data_mem[3]= 32'b000000_00000_00000_00000_00000_000110;
        // Data_mem[4]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[5]= 32'b000000_00000_00000_00000_00000_000010;
        // Data_mem[6]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[7]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[8]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[9]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[10]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[11]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[12]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[13]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[14]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[15]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[16]= 32'b000000_00000_00000_00000_00000_000100;
        // Data_mem[17]= 32'b000000_00000_00000_00000_00000_000011;
        // Data_mem[18]= 32'b000000_00000_00000_00000_00000_001000;
        // Data_mem[19]= 32'b000000_00000_00000_00000_00000_000110;
        // Data_mem[20]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[21]= 32'b000000_00000_00000_00000_00000_000010;
        // Data_mem[22]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[23]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[24]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[25]= 32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[26]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[27]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[28]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[29]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[30]=32'b000000_00000_00000_00000_00000_000000;
        // Data_mem[31]=32'b000000_00000_00000_00000_00000_000000;
        for (i = 0; i < MEM_HEIGHT; i = i + 1) begin
          Data_mem[i] = 32'b0;
        end
        Data_mem[0] = 8;
        Data_mem[1] = 4;
        Data_mem[2] = 3;
        Data_mem[3] = 2;
        Data_mem[4] = 1;
        Data_mem[5] = 10;
        Data_mem[6] = 9;
        Data_mem[7] = 7;
        Data_mem[8] = 6;
        Data_mem[9] = 5;
  end

  always @(addr or Read_mem or Reg_save or ALU_final) begin
    if(Read_mem == 1) begin
        if(Reg_save == 0) begin
          read_Data = ALU_final;
        end
        else begin
          read_Data = Data_mem[addr];
        end
    end
    else begin
      read_Data = ALU_final;
    end
  end

  always @(posedge clk) begin  // MemWrite, wData, addr
    if (MemWrite == 1) begin
      Data_mem[addr] = writeData;
    end
  end

  initial begin
    #50000;
    $display("Sorted array is :");
    for(i = 0; i < 10; i = i + 1) begin
      $display("%d", Data_mem[i]);
    end
  end

endmodule
