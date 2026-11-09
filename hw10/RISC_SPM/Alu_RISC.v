`default_nettype none
  module Alu_RISC #(parameter word_size = 8, op_size = 4)
                  (output wire               	     alu_zero_flag, // ALU=0
                   output reg  [word_size-1: 0] alu_out,          // Output of ALU
                   input  wire [word_size-1: 0] dest, src,         // Input data
                   input  wire [op_size-1: 0]     opcode            // Opcode to execute
		   );
  `include "opcodes_include.v" 
  
   assign  alu_zero_flag = ~|alu_out;
   
   always @ (opcode or dest or src) begin
      case  (opcode)
	       NOP: alu_out = 0;
	       ADD: alu_out = dest + src;
	       SUB: alu_out = dest - src;
	       AND: alu_out = dest & src;
        	// NOT: alu_out = ~src;
	       NOT: alu_out = ~dest;
	       default:  alu_out = 0;
      endcase // case (opcode)
   end
endmodule