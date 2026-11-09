`default_nettype none
`timescale 1ns/1ns
module Clock_Unit (output reg clock);
   parameter delay = 0;
   parameter half_cycle = 10;
   initial begin
      #delay clock = 0;
      forever #half_cycle clock = ~clock;
   end
endmodule
