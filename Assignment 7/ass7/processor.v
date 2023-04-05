`include "./VEDA.v"
`include "./registers.v"
module instruction_fetch();
    
    reg [31:0] PC;
    wire [31:0] PC_NEXT;

    reg clk;
    reg [4:0] r_address, w_address;
    reg [31:0] data_in;
    reg w_enable, r_enable;
    wire [31:0] data_out;
    reg [31:0] instruction;

    reg [4:0] r_address_reg, w_address_reg;
    reg [31:0] data_in_reg;
    reg w_enable_reg, r_enable_reg;
    wire [31:0] data_out_reg;

    reg [31:0] r0, r1, imm;

    VEDA instructionmemory(clk, r_address, w_address, data_in, w_enable, r_enable, data_out);
    REG registers(clk, r_address_reg, w_address_reg, data_in_reg, w_enable_reg, r_enable_reg, data_out_reg);
    beq beq(r0, r1, imm, PC, PC_NEXT);

    initial begin
        $dumpfile("decode.vcd");
        #500 $finish;
    end
    initial begin
        #20;
        // $monitor("time: %d, PC: %d, data_out: %d, clk = %b", $time, PC, data_out, clk);
    end
    initial begin
        PC = 0;
        clk <= 0;
        #5;
        forever begin
            r_address = PC;
            w_enable = 0;
            r_enable = 1;
            #5;
            instruction = data_out;
            // $display("data_out: %d", data_out);
            $display("PC: %d", PC);
            // $display("PC: %d, instruction: %d", PC, instruction);
            if(instruction[31:26] == 6'b000100) begin
                r_address_reg = instruction[25:21];
                w_enable_reg = 0;
                // $display("r_address_reg: %d", r_address_reg);
                r_enable_reg = 1;
                #5;
                r0 = data_out_reg;
                r_address_reg = instruction[20:16];
                // $display("instruction: %b", r_address_reg);
                w_enable_reg = 0;
                // $display("r_address_reg: %d", r_address_reg);
                r_enable_reg = 1;
                #5;
                r1 = data_out_reg;
                imm = instruction[15:0];
                #5;
                // $display("PC: %d, r0: %d, r1: %d, imm: %d", PC, r0, r1, imm);
                // $display("PC_NEXT: %d", PC_NEXT);
                PC = PC_NEXT;
                // $display("PC: %d", PC);
                // $finish;
            end else begin
                // $display("\n\n\n in else block PC: %d, instruction: %d", PC, instruction);
                PC = PC + 1;

                if(PC == 10) begin
                    $finish;
                end
            end
            // PC = PC + 1;
            // if(PC == 10) begin
            //     $finish;
            // end
        end
    end

endmodule

module beq(r0, r1, imm, pc, pc_next);
input[31:0] r0, r1, imm;
input[31:0] pc;

output[31:0] pc_next;

assign pc_next = (r0 == r1) ? (pc + imm + 1) : (pc + 1);

endmodule
