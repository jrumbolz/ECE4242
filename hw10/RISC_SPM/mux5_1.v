`default_nettype none
  // A generic 5-1 mux. 
  module mux5_1 #(parameter word_size = 8, sel_width=3)
   (input wire [word_size-1: 0] data_in0, data_in1, data_in2, data_in3, data_in4,
    input wire [sel_width-1:0] sel,

    output reg [word_size-1: 0] data_out
    );

   // Implement a 5 to 1 mux
   always @* begin
      case (sel) 
	      0: data_out = data_in0;
	      1: data_out = data_in1;
       	2: data_out = data_in2;
	      3: data_out = data_in3;
       	4: data_out = data_in4;
	      default: data_out = 0;
      endcase
   end

endmodule