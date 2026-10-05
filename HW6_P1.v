`default_nettype = none
//////////////////////////////////////////////////////////////////////////////////////
module controller(
	input wire clk, reset, 
	input wire En, Ld,
	output reg load_P1_P0, clear_P1_P0, load_R0
);
	reg [1:0] current_state, next_state;
	parameter S_idle = 2'b00; 
	parameter S_1 = 2'b01;
	parameter S_full = 2'b10;
	always @(current_state or En or Ld) begin
		load_P1_P0 = 1'b0;
		clear_P1_P0 = 1'b0;
		load_R0 = 1'b0;
		case (current_state)
			S_idle: begin
				if (En) begin
					next_state = S_1;
					load_P1_P0 = 1'b1;
				end
				else begin // !En
					next_state = S_idle;
				end
			end // S_idle
			S_1: begin
				next_state = S_full;
				load_P1_P0 = 1'b1;
			end // S_1
			S_full: begin
				if (Ld) begin
				load_R0 = 1'b1;
				if (En) begin
					next_state = S_1;
					load_P1_P0 = 1'b1;
				end
				else begin
					next_state = S_idle;
					clear_P1_P0 = 1'b1;
				end
				end
				else
					next_state = S_full;
			end // S_full
			default: next_state = S_idle;
		endcase
	end //end always
	// Current state registers
	always @(posedge clk or posedge reset) begin
	if (reset)
		current_state <= S_idle;
	else
		current_state <= next_state;
	end //end always
endmodule

/////////////////////////////////////////////////////////////////////////////////////
module datapath(
	input wire clk, reset, 
	input wire load_P1_P0, clear_P1_P0, load_R0, 
	input wire [7:0] Data, 
	output reg [15:0] R0
);
	reg [7:0] P0, P1;
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			P1 <= 8'b0;
			P0 <= 8'b0;
		end
		else if (clear_P1_P0) begin
			P1 <= 8'b0;
			P0 <= 8'b0;
		end
		else if (load_P1_P0) begin
			P1 <= Data;
			P0 <= P1;
		end
	end //end always
	// datapath for R0
	always @(posedge clk or posedge reset) begin
	if (reset)
	R0 <= 16'b0;
	else if (load_R0)
	R0 <= {P1,P0};
	end //end always
endmodule

///////////////////////////////////////////////////////////////////////////////////////////
module two_stage_pipe(
	input wire clk, reset, En, Ld,
	input wire [7:0] Data, 
	output wire [15:0] R0
);
	wire load_P1_P0, clear_P1_P0, load_R0;
	datapath datapath(
		.clk(clk),
		.reset(reset),
		.load_P1_P0(load_P1_P0),
		.clear_P1_P0(clear_P1_P0),
		.load_R0(load_R0),
		.Data(Data),
		.R0(R0)
	);
	controller controller(
		.clk(clk),
		.reset(reset),
		.En(En),
		.Ld(Ld),
		.load_P1_P0(load_P1_P0),
		.clear_P1_P0(clear_P1_P0),
		.load_R0(load_R0)
	);
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////
module two_stage_pipe_tb;
	reg clk, reset, En, Ld;
	reg [7:0] Data;
	wire [15:0] R0;
	initial begin
		clk = 1'b0;
		forever #10 clk = !clk;
	end
	initial begin
		En=0; Ld=0; Data=0;
		reset = 1'b1;
		@(negedge clk);
		@(negedge clk);
		reset = 1'b0;
		Data = 8'hA3;
		En = 1@(negedge clk);
		En = 0;
		Data = 8'hC3;
		@(negedge clk);
		@(negedge clk);
		Ld=1;
		@(negedge clk);
		Ld=0;
		end // initial
	two_stage_pipe two_stage_pipe(
		.clk(clk), 
		.reset(reset), 
		.En(En), 
		.Ld(Ld),
		.Data(Data), 
		.R0(R0));
endmodule
