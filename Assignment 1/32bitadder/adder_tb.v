`include "adder.v"

module addertb;
reg [31:0] input1;
reg [31:0] input2;
wire [31:0] sum;

adder add(input1, input2, sum);

initial begin
    input1 = 123;
    input2 = 234;
    #100;
    input1 = 234;
    input2 = 234;
    #100;
end

initial begin
    $monitor("sum: %d", sum);
end
endmodule