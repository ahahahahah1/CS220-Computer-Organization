`include "VEDA.v"

// store 2 values in VEDA, and the output of their floating point addition also in VEDA
// carry out the floating point addition in the top module using the values from the VEDA module
// compare the results of the floating point addition in the top module with the output of the VEDA module
// if they are the same, then the floating point addition is correct
// if they are different, then the floating point addition is incorrect

module fp_adder_top(
    input clk,
    input reset,
    output reg [31:0] result
);

    reg [31:0] a_fromVEDA;
    reg [31:0] b_fromVEDA;
    reg [31:0] result_fromVEDA;
    reg [31:0] value_fromVEDA;
    reg [4:0] address_a;
    reg [4:0] address_b;
    reg [4:0] address_result;
    reg mode;
    reg write_enable;

    // take random value for a and b
    wire a_temp = 32'0_0000010_111_1000_0000_0000_0000_0000;
    wire b_temp = 32'0_0000010_111_1000_0000_0000_0000_0000;
    // store floating point addition of a_temp and b_temp in result_temp
    wire result_temp = 32'0_0000011_000_0000_0000_0000_0000_0000;

    VEDA VEDA1(
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .write_enable(write_enable),
        .address(address_a),
        .data_in(a_temp),
        .data_out(value_fromVEDA)
    );

    wire [31:0] inp1;
    wire [31:0] inp2;
    wire [31:0] out;

    fp_adder fp_adder1(
        .a(inp1),
        .b(inp2),
        .result(out)
    );

    always@(*) begin

    end

endmodule