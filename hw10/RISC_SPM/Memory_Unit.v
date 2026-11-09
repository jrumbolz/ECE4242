`default_nettype none
  module Memory_Unit #(parameter word_size = 8, memory_size = 256)
   (
    output wire [word_size-1: 0] data_out,
    input wire [word_size-1: 0] data_in,
    input wire [word_size-1: 0] address,
    input wire clk, write
    );

   
   reg [word_size-1: 0] memory [memory_size-1: 0];

   assign data_out = memory[address];

   always @ (posedge clk) begin
      if (write) 
	memory[address] <= data_in;
   end
   
endmodule
