module decoder(data, type);
    input [31:0] data;
    output reg [1:0] type;
    reg [5:0] opcode;

    always @(*) begin
        opcode = data[31:26];
        // $display("data: %d", data);
        // $display("opcode: %d", opcode);
        case (opcode)
            6'b000000: type = 2'b00; // R-type
            6'b001000: type = 2'b01; // I-type
            default: type = 2'b10; // J-type
        endcase
    end
endmodule