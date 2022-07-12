`default_nettype none
module Four_bit_UP_counter(
                                  input logic clk,
                                  input logic rst,
                                  output logic [3:0] out  
                          );

logic [3:0] out_int ;                        

  always_ff @ (posedge clk or negedge rst) begin  // few compilers like Icarus don't understand always_ff statement, so use always in such cases
      if (~rst)   
         out_int <= 'b0;
      else begin
         out_int <= out_int + 1;
      end
end

assign out = out_int ; 

endmodule 
