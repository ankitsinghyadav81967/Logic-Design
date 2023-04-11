/*

Simple pulse generator

*/
module pulse_gen (
  					input logic sig,
  					input logic clk,
  					input logic rstn,
  					output logic pulse_sig
				  );
  
logic gate;
  
always_ff @ (posedge clk or negedge rstn) begin
    if (~rstn)
       gate <= 0;
    else 
       gate <= ~sig;
end
  
assign pulse_sig = gate & sig;

endmodule
