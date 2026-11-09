`default_nettype none
  // A generic 3-1 mux. 
  module mux3_1 #(parameter word_size = 8, sel_width=2)
   (input wire [word_size-1: 0] data_in0, data_in1, data_in2,
    input wire [sel_width-1:0] sel,

    output reg [word_size-1: 0] data_out
    );

   // Implement a 3 to 1 mux
   always @* begin
      case (sel) 
	      0: data_out = data_in0;
	      1: data_out = data_in1;
	      2: data_out = data_in2;
	      default: data_out = 0;
      endcase
   end

endmodule