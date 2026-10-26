`default_nettype none
/////////////////////////////////////////////////////
module dff_tb;
	reg clk, reset, set, data_in; 
	wire data_out;

	dff uut(
		.clk(clk),
		.reset(reset),
		.set(set),
		.data_in(data_in),
		.data_out(data_out)
	);
	
	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;  
	end//intial
	
	initial begin 
		reset = 1; set = 1; data_in = 1; #25;
		reset = 0; set = 1; data_in = 1; #30;
		reset = 0; set = 1; data_in = 0; #20;
		reset = 0; set = 0; data_in = 0; #10;
		reset = 0; set = 1; data_in = 0; #35;
	
		$finish;
	end//intial	
	
endmodule
/////////////////////////////////////////////////////