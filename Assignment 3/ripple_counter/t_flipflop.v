//this file contains the design for a negatively edge triggered t_flipflop

// module t_flipflop(t, clk, q, rst);
// 	input t, clk, rst;
// 	output wire q;
//   reg d;

// 	always @(negedge clk) begin
//       if(rst) begin
//         d <= 0;
//       end
//       else begin
//         if(t) begin
//           d <= ~q;
//         end
//       end
//   end

//   assign q = d;
      
// endmodule

`include "./d_flipflop.v"

module tflipflop (q,clk,rst);
    output q;
    input clk,rst;
    wire d;
    dflipflop dff(.q(q),  .d(d), .clk(clk), .rst(rst));
    not n1(d,q);
endmodule