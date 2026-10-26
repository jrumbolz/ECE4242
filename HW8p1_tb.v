`default_nettype none
///////////////////////////////////////////////////
module HW8p1_tb;
	reg clk, rst;
	wire [5:0] out;
	wire add12, add34, data1, data2, data3, data4;
	wire [1:0] data_out;
	
	stimulus_generator uut1(
		.clk(clk),
		.rst(rst),
		.out(out)
	);

	assign add12 = |(out & 100000); //checks for 1 in 6th bit
	assign add34 = |(out & 010000); //checks for 1 in 5th bit
	assign data1 = |(out & 001000); //checks for 1 in 4th bit
	assign data2 = |(out & 000100); //checks for 1 in 3rd bit
	assign data3 = |(out & 000010); //checks for 1 in 2nd bit
	assign data4 = |(out & 000001); //checks for 1 in 1st bit

	adder_orig uut2(
		.add12(add12),
		.add34(add34),
		.data1(data1),
		.data2(data2),
		.data3(data3),
		.data4(data4),
		.data_out(data_out)
	);

	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end//initial

	initial begin
		rst = 1; #20;
		rst = 0; 
		#((2**6)*20);//run for 2^num bits * clk period
		$finish;
	end//initial

endmodule
