`default_nettype none
///////////////////////////////////////////////////
module HW8p1_tb;
	reg clk, rst;
	wire [5:0] stimulus_generator_out;
	wire add12, add34, data1, data2, data3, data4;
	wire [1:0] adder_orig_out, adder_final_out;
	wire comparator_out;
	
	stimulus_generator uut1(
		.clk(clk),
		.rst(rst),
		.out(stimulus_generator_out)
	);

	//convert stim gen out to adder inputs
	assign add12 = |(stimulus_generator_out & 100000); //checks for 1 in 6th bit
	assign add34 = |(stimulus_generator_out & 010000); //checks for 1 in 5th bit
	assign data1 = |(stimulus_generator_out & 001000); //checks for 1 in 4th bit
	assign data2 = |(stimulus_generator_out & 000100); //checks for 1 in 3rd bit
	assign data3 = |(stimulus_generator_out & 000010); //checks for 1 in 2nd bit
	assign data4 = |(stimulus_generator_out & 000001); //checks for 1 in 1st bit

	adder_orig uut2(
		.add12(add12),
		.add34(add34),
		.data1(data1),
		.data2(data2),
		.data3(data3),
		.data4(data4),
		.data_out(adder_orig_out)
	);

	adder_final uut3(
		.add12(add12),
		.add34(add34),
		.data1(data1),
		.data2(data2),
		.data3(data3),
		.data4(data4),
		.data_out(adder_final_out)
	);

	comparator uut4(
		.in1(adder_orig_out),
		.in2(adder_final_out),
		.out(comparator_out)
	);

	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end//initial

	initial begin
		rst = 1; #20;
		rst = 0; 
		#((2**6)*20);//run for 2^num bits * clk period (all possible stim gen outputs)
i		$finish;
	end//initial

endmodule
