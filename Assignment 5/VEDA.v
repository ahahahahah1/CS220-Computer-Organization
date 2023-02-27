module VEDA(clk, reset, mode, write_enable, address, data_in, data_out);

  input clk, reset, mode, write_enable;
  input [5:0] address;
  input [31:0] data_in;
  
  output reg [31:0] data_out;
  reg [31:0] memory [31:0];
  reg [31:0] temp;
  
  memory[0] = 32'b0_1000_0101_0111_0101_0000_0000_0000_000; //93.25
  memory[1] = 32'b0_1000_0010_1001_1010_0000_0000_0000_000; //12.8125
  memory[2] = 32'b0_1000_0101_1010_1000_0100_0000_0000_000; //106.0625 - the correct sum
  memory[3] = 32'b0_1000_0101_0010_1000_0100_0000_0000_000; //incorrect sum

  always@(posedge clk) begin
    if(reset) begin
      data_out <= 0;
    end

    else begin
      data_out = temp;

      if(mode == 0) begin
        if(write_enable) begin
          memory[address] <= data_in;
          temp <= data_in;
        end
      end

      else if(mode == 1) begin
        temp = memory[address];
        if(write_enable) begin
          memory[address] <= data_in;
        end
      end
    end
  end
endmodule
