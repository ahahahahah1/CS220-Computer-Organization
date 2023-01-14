`include "decoder.v"
module decoder_tb;
wire [7:0] out;
reg en;
reg [2:0] in;
integer i;

decoder deco(in,out,en);

initial begin  
    $monitor( "en=%b, in=%d, out=%b ", en, in, out);
end

initial begin
    en = 1;
    #8;
    en = 0;
    #7;
    $finish;
end

initial begin
    in = 0;
    for(i=0; i<16; i=i+1) begin
        #1;
        in = (in+1)%8;
    end
end

endmodule