`timescale 1ns/1ps                // to ensure tight compatibility between TB and design timescales
`default_nettype none
module Four_bit_DOWN_counter(
                                  input logic clk,
                                  input logic rst,
                                  output logic [3:0] out  
                          );

logic [3:0] out_int ;                        

  always_ff @ (posedge clk or negedge rst) begin  // few compilers like Icarus don't understand always_ff statement, so use always in such cases
      if (~rst)   
         out_int <= 'b1;
      else begin
         out_int <= out_int - 1;
      end
end

assign out = out_int ; 

endmodule 
