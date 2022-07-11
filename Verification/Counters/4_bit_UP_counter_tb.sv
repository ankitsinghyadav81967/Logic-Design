`timescale 1ns/1ps
module Four_bit_UP_counter_tb ();

logic clk,rst;
logic [3:0] out;

Four_bit_UP_counter counter_1(
                           .clk(clk),
                           .rst(rst),
                           .out(out)  
                    );    

initial begin
   clk = 1'b0;
   rst = 1'b1;
end

initial forever begin
   #1 clk = ~clk ;
end


initial
 begin
     rst = 1'b0; #5;
     rst = 1'b1; #30;
     rst = 1'b0; #50;
     $finish;
 end

initial 
 begin
            $display("Reset\t\t\tCount");
            $monitor("%b\t\t\t%b",rst,out);
 end

endmodule
