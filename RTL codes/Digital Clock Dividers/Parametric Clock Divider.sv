/* Description : This design accepts a parameter DIV_BY_VALUE and divides the incoming clock by this number. The counter widths are internally calculated
                 and need not be given as an additional input by the user. The design has only been verified for 50% duty cycle input clock.
                 While this code is perfectly synthesizable, it suffers from a major drawback - the duty cycle of the output clock is maintained at 50% only 
                 for DIV_BY_VALUE = 2 . The DCD rises pro rata with increasing values of this parameter. */

module parametric_clkdivbyn #(parameter DIV_BY_VALUE = 9)(
                                                input logic rst,
                                                input logic clkin,
                                                output logic clkout
				 					 		   ) ;
				 					 		   
  localparam integer WIDTH = $clog2(DIV_BY_VALUE);
   
  logic [WIDTH-1:0] pos_count, neg_count;
  
  always_ff @ (posedge clkin or negedge rst) begin
    if (~rst) 
      	pos_count <= 1'b0;
    else if (pos_count == DIV_BY_VALUE-1)
        pos_count <= 0;
    else
        pos_count <= pos_count + 1;
  end
  

  always_ff @ (negedge clkin or negedge rst) begin
    if (~rst)
      	neg_count <= 1'b0;
    else if (neg_count == DIV_BY_VALUE-1)
        neg_count <= 0;
    else
        neg_count <= neg_count + 1;
  end
  
  always_ff @ (posedge clkin or negedge rst) begin
  if (~rst) 
        clkout <= 1'b0;
  else if (pos_count == DIV_BY_VALUE-1 || neg_count == DIV_BY_VALUE-1)
      clkout <= ~clkout;
  end
  
endmodule
