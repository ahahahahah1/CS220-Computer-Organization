module VEDA(clk, reset, mode, write_enable, [5:0] address, data_in, data_out);

  input clk, reset, mode, write_enable;
  input [5:0] address;
  input [31:0] data_in;
  
  output reg [31:0] data_out;
  reg [31:0] memory [31:0];
  reg [31:0] temp;
  
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