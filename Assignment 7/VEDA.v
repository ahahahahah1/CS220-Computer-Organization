module VEDA(clk, r_address, w_address, data_in, w_enable, r_enable, data_out);
    parameter MEM_SIZE = 32;
    input clk;
    input [4:0] r_address, w_address;
    input [31:0] data_in;
    input w_enable, r_enable;
    output reg [31:0] data_out;

    reg [31:0] memory [0:MEM_SIZE-1];

    initial begin
        memory[0] = 32'h00000001;
        memory[1] = 32'h00000001;
        memory[2] = 32'h00000003;
        memory[3] = 32'h00000004;
        memory[4] = 32'b000100_00000_00010_0000_0000_0000_0010;
        memory[5] = 32'h00000006;
        memory[6] = 32'h00000007;
        memory[7] = 32'h00000008;
        memory[8] = 32'h00000000;
        memory[9] = 32'h00000010;
        memory[10] = 32'h00000001;
        memory[11] = 32'h00000002;
        memory[12] = 32'h00000003;
        memory[13] = 32'h00000004;
        memory[14] = 32'h00000000;
        memory[15] = 32'h00000000;

    end

    always @(*) begin
        if (w_enable) begin
            memory[w_address] <= data_in;
        end

        if (r_enable) begin
            // $display("here");
            // $display("r_address: %d", r_address);
            data_out = memory[r_address];
            // $display("data_out here: %d", data_out);
        end
    end
endmodule