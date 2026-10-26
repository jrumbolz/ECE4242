`default_nettype none
////////////////////////////////////////////////
module dff(
	input wire clk, reset, set, data_in,
	output reg data_out
);
	
	always@(negedge clk or negedge set)begin 
		if(!set)//async neg set
			data_out <= 1'b0;
		else if(reset)//sync pos reset
			data_out <= 1'b1;
		else//q update 
			data_out <= data_in;
	end//always
endmodule
////////////////////////////////////////////////