module t_ff_tb;
  reg t, clk, rst, q;
  
  initial begin
    t <= 1'b1;
    clk <= 1'b0;
    forever #2 clk <= ~clk;
    rst <= 1'b0;
    forever #50 rst <= ~rst;
  end
  
  t_ff T(.t(t), .clk(clk), .q(q), .rst(rst));
  
  always&(*) begin
    $display("time = %d, t = %d, q = %d, rst = %d\n", $time, t, q, rst);
endmodule