`default_nettype none
  module Register_Unit #(parameter word_size = 8)
   	      (output reg[word_size-1: 0]   data_out,
   	       input  wire [word_size-1: 0] data_in,
   	       input  wire		    load, clk,
           input  wire rst  // Active low asynchronous reset
   	       );        
   
   // if load is asserted register data_in
   always @ (posedge clk or negedge rst) begin
      if (rst == 0) 
	       data_out <= 0; 
      else if (load) 
	       data_out <= data_in;
   end

endmodule

