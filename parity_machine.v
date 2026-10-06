`default_nettype none

//////////////////////////////////////////////////////////////////////////////////////////////////////////
module controller(
    input wire clk, rst, load, parity_err, recieved,
    output reg load_hold_reg, load_correct, load_incorrect
);
    reg [1:0] cs, ns;
    parameter s_idle   = 2'b00;
    parameter s_loaded = 2'b01;
    parameter s_wait   = 2'b10;
    
    // Combinational logic for Next State and Outputs
    always @(*) begin
        ns = cs;    
        load_hold_reg = 0;
        load_correct = 0;
        load_incorrect = 0;
        
        case(cs)
            s_idle: begin
                if(load) begin
                    ns = s_loaded;
                    load_hold_reg = 1; 
                end
            end    
            s_loaded: begin
                if(parity_err) begin 
                    load_incorrect = 1;   
                end else begin 
                    load_correct = 1; 
                end
                ns = s_wait;
            end    
            s_wait: begin
                if(recieved) begin
                    ns = s_idle;
                end
            end
            default: ns = s_idle;    
        endcase
    end // always

    // Sequential logic for Current State update
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            cs <= s_idle;
        end else begin
            cs <= ns;
        end
    end // always
endmodule // controller

//////////////////////////////////////////////////////////////////////////////////////////////////////////
module datapath(
    input wire clk, rst,
    input wire [3:0] data_in,
    input wire load_hold_reg, load_correct, load_incorrect,
    output reg parity_err,
    output reg [3:0] correct, incorrect
);
    reg [3:0] hold_reg;
    
    // update parity
    always @(*) begin    
        if(^hold_reg) begin
            parity_err = 1; 
        end else begin
            parity_err = 0; 
        end
    end // always
    
    // reg update
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            hold_reg  <= 4'b0;
            correct   <= 4'b0;
            incorrect <= 4'b0;
        end else begin
            if(load_hold_reg) begin
                hold_reg <= data_in;
            end
            if(load_correct) begin
                correct <= hold_reg;
            end
            if(load_incorrect) begin
                incorrect <= hold_reg;
            end
        end
    end // always
endmodule // datapath

//////////////////////////////////////////////////////////////////////////////////////////////////////////
module parity_machine(
    input wire clk, rst, load, recieved,
    input wire [3:0] data_in,
    output wire [3:0] correct, incorrect
);    
    wire load_hold_reg;
    wire load_correct;
    wire load_incorrect;
    wire parity_err;
    
    controller controller_inst(
        .clk(clk),
        .rst(rst),
        .load(load),
        .recieved(recieved),
        .load_hold_reg(load_hold_reg),
        .load_correct(load_correct),
        .load_incorrect(load_incorrect),
        .parity_err(parity_err)
    );
    
    datapath datapath_inst(
        .clk(clk), 
        .rst(rst),
        .data_in(data_in),
        .correct(correct),
        .incorrect(incorrect),
        .load_hold_reg(load_hold_reg), 
        .load_correct(load_correct),
        .load_incorrect(load_incorrect),
        .parity_err(parity_err)
    );
endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////
module tb_parity_machine;

    	// Testbench Signals
    	reg clk;
    	reg rst;
    	reg load;
    	reg recieved;
    	reg [3:0] data_in;
    	
    	wire [3:0] correct;
    	wire [3:0] incorrect;
	
    	// 1. Clock Generation (50MHz clock, 20ns period)
    	initial begin
    	    clk = 1'b0;
    	    forever #10 clk = !clk;
    	end

    // 2. Stimulus Block
    initial begin
        // Initialize Inputs
        rst = 1'b1;
        load = 1'b0;
        recieved = 1'b0;
        data_in = 4'b0000;

        // Release reset cleanly after 2 clock cycles
        repeat (2) @(negedge clk);
        rst = 1'b0;
        @(negedge clk);

        data_in = 4'b0001;
        load = 1'b1;       // Trigger state transition to s_loaded
        @(negedge clk);
        load = 1'b0;       // Clear load signal; system goes to s_wait on next posedge
        
        @(negedge clk);    // Allow a cycle to observe outputs sitting in s_wait
        
        recieved = 1'b1;   // Release FSM from s_wait back to s_idle
        @(negedge clk);
        recieved = 1'b0;
        
        repeat (2) @(negedge clk); // Idle gap

        data_in = 4'b0011;
        load = 1'b1;
        @(negedge clk);
        load = 1'b0;
        
        @(negedge clk);
        
        recieved = 1'b1;
        @(negedge clk);
        recieved = 1'b0;

        // End Simulation
        repeat (3) @(negedge clk);
	end //intial
    // 3. Device Under Test (DUT) Instantiation
    parity_machine uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .recieved(recieved),
        .data_in(data_in),
        .correct(correct),
        .incorrect(incorrect)
    );

endmodule
