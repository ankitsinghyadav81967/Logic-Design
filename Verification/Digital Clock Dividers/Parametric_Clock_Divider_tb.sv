`timescale 1ns/1ps
module parametric_clkdivbyn_test ();
  logic rst,clkin,clkout;

  parametric_clkdivbyn dut (.*);
  initial begin
    clkin = 1'b0;
  end
  always #10 clkin = ~clkin;
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,parametric_clkdivbyn_test);
    rst = 1'b0; #20;
    rst = 1'b1; #2000;
    $finish;
  end
endmodule
