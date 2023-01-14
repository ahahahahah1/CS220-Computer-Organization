`include "subtractor.v"

module addertb;
reg [31:0] input1;
reg [31:0] input2;
wire [31:0] diff;

subtractor32bit add(input1, input2, diff);

initial begin
    input1 = 234;
    input2 = 111;
    #100;
    input1 = 123;
    input2 = 52;
    #100;
end

initial begin
    $monitor("sum: %d", diff);
end
endmodule