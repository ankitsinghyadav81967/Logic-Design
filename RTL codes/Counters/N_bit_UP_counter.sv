// Code your design here
`timescale 1ns/1ps
`default_nettype none
module N_bit_UP_counter  # (parameter MOD_VALUE = 3)    (                                           // this param is provided in design/TB for programmability
                                                            input logic clk,
                                                            input logic rst,
                              	                            output logic [MOD_VALUE-1:0] out  
                          	                            );
                        
always @ (posedge clk or negedge rst) begin
      if (~rst)   
         out <= 'b0;
      else begin
         out <= out + 1;
      end
end


endmodule 
