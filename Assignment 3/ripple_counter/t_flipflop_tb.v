`include "./t_flipflop.v"
module t_ff_tb;
  reg t, clk, rst;
  wire q;
  
  initial begin
    t <= 1'b1;
    clk <= 1'b0;
    rst <= 1'b1;
    forever #100 rst <= ~rst;
  end

  initial begin
    #300
    $finish;
  end

  always #2 clk <= ~clk;

  t_flipflop T(.t(t), .clk(clk), .q(q), .rst(rst));
  
  always@(*) begin
    $display("time = %d, t = %d, q = %d, rst = %d\n", $time, t, q, rst);
  end
endmodule