module ModifiedVEDA(
  input clk,
  input reset,
  input write_enable,
  input [5:0] address_a,
  input [5:0] address_b,
  input [31:0] data_in,
  output reg [31:0] data_out
);

  reg [31:0] memory [31:0];
  reg [31:0] temp;
  
  always@(posedge clk) begin
    if(reset) begin
      data_out <= 0;
      temp <= memory[address_b];
    end 
    
    else begin
      data_out <= temp;

      if(write_enable) begin
        if(address_a != address_b) begin
          memory[address_a] <= data_in;
        end
      end

        temp <= memory[address_b];
    end
  end
  
endmodule
