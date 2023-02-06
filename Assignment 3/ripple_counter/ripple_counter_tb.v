`include "./ripple_counter.v"

// module ripple_counter_tb;
// 	reg clk, rst, flag;
// 	wire [3:0] q;

// 	initial begin
// 		rst <= 1'b1;
// 		flag <= 1'b0;
// 		clk <= 1'b0;
// 		#5 rst <= 1'b0;
// 		forever #200 flag = ~flag;
// 	end

// 	always #5 clk = ~clk;

// 	initial begin
// 		#1000 $finish;
// 	end

// 	counter RC1(.clk(clk), .rst(rst), .q(q), .control(flag));
// 	initial begin
// 		$monitor("at time = %d, %d %d %d %d", $time, q[3], q[2], q[1], q[0]);
// 	end
// endmodule

module ripple_counter_tb;
    // input to be stored in reg and output as net(wire)
    reg clk;
    reg rst;
    wire [3:0]q;
    reg dir;

    // instantiate the ripplecounter design block
    counter dut(dir, clk, rst, q);

    // generate clock pulse
    // initially provide 0
    // then inside always block toggle 
    // clock every 5 time units
    initial begin
      dir = 1;
      clk = 0;
    end
    always
      #5 clk = ~clk;

    // provide reset values as the input
    initial
       begin
         dir = 1;
         rst = 1;
         #15 rst = 0;
         #150 dir = 0;
         #180 rst = 1;
         #10 rst = 1;
         #20 $finish;
       end
       initial
        $monitor("time=%g,rst=%b,clk=%b,q=%d,dir=%d",$time,rst,clk,q,dir);
endmodule


// module ripple_counter_tb;
//     // input to be stored in reg and output as net(wire)
//     reg clk;
//     reg rst;
//     wire [3:0]q;

//     // instantiate the ripplecounter design block
//     counter uut(flag, clk, rst, q);

//     // generate clock pulse
//     // initially provide 0
//     // then inside always block toggle 
//     // clock every 5 time units
//     initial
//       clk = 0;
//     always
//       #5 clk = ~clk;

//     // provide reset values as the input
//     initial
//        begin
//         //  rst = 1;
//         //  #15 rst = 0;
//         //  #180 rst = 1;
//         //  #10 rst = 1;
//          #100 $finish;
//        end
//        initial
//         $monitor("time=%g,rst=%b,clk=%b,q=%d",$time,rst,clk,q);
// endmodule