`default_nettype none
//////////////////////////////////////////////////////////////////////////////////////////////////////////
module controller(
	input wire clk, rst, load, recieved,
	input wire parity_err,
	output reg load_hold_reg, load_correct, load_incorrect
);
	reg [1:0] cs, ns;
	parameter s_idle = 2'b00;
	parameter s_loaded = 2'b01;
	parameter s_wait = 2'b10;
	
	//
	always@(load or parity_err or recieved)begin
		load_hold_reg = 0;
		load_correct = 0;
		load_incorrect = 0;
		case(cs)
			s_idle:begin
				if(load)begin
					ns = s_loaded;
					load_hold_reg = 1; //singals to load hold reg with data_in
				end
			end	
			s_loaded:begin
				if(parity_err)begin // is even
					load_incorrect = 1; // singals to load hold_reg into incorrect	
				end else begin // is odd
					load_correct = 1; // signals to load hold_reg into correct
				end
				ns = s_wait;
			end	
			s_wait:begin
				if(recieved)begin
					ns = s_idle;
				end
			end
			default: ns = s_idle;	
		endcase
	end //always

	//current state update
	always@(posedge clk or posedge rst)begin
		if(rst)
			cs <= s_idle;
		else
			cs <= ns;
		end
	end //always
endmodule //controller
//////////////////////////////////////////////////////////////////////////////////////////////////////////
module datapath(
	input wire clk, rst,
	input wire [3:0] data_in,
	input wire load_hold_reg, load_correct, load_incorrect,
	output reg parity,
	output reg[3:0] correct, incorrect
);
	reg [3:0] hold_reg;
	
	// update parity
	always@(hold_reg)begin	
		if(^hold_reg)begin
			parity_err <= 1; // return 1 if odd
		end
		else if(~^hold_reg) begin
			parity_err <= 0; // return 0 if even
		end
	end //always
	
	// reg update
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			hold_reg <=4'b0;
		end 
		else if(load_hold_reg)begin
			hold_reg <= data_in;
		end
		else if(load_correct)begin
			correct <= hold_reg;
		end
		else if(load_incorrect)begin
			incorrect <= hold_reg;
		end
	end //always
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////
module parity_machine(
	input wire clk, rs, load, recieved,
	input wire [3:0] data_in,
	output wire [3:0] correct, incorrect
);
	
	controller controller(
		.clk(clk), //external
		.rst(rst),
		.load(load),
		.recieved(recieved),
		.load_hold_reg(load_hold_reg), //internal
		.load_correct(load_correct),
		.load_incorrect(load_incorrect),
		.parity_err(parity_err)
	);
	
	datapath datapath(
		.clk(clk), //external
		.rst(rst),
		.data_in(data_in),
		.correct(correct),
		.incorrect(incorrect),
		.load_hold_reg(load_hold_reg), //internal
		.load_correct(load_correct),
		.load_incorrect(load_incorrect),
		.parity_err(parity_err)
	);
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////
module parity_machine_tb;

endmodule
