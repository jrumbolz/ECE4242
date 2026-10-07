module debounce_sync (
    input wire clk,      // Slow sampling clock (333.33 Hz)
    input wire rst,      // Active-high asynchronous reset
    input wire async_in, // Bouncy switch input
    output reg debounced_out
);

    reg [2:0] sync_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sync_reg      <= 3'b000;
            debounced_out <= 1'b0;
        end else begin
            // Shift in the asynchronous input
            sync_reg <= {sync_reg[1:0], async_in};
            
            // Validate the state across all 3 stages
            if (sync_reg == 3'b111) begin
                debounced_out <= 1'b1;
            end else if (sync_reg == 3'b000) begin
                debounced_out <= 1'b0;
            end
        end
    end
endmodule

module debounce_counter (
    input wire clk,      // Fast system clock (50 MHz)
    input wire rst,      // Active-high asynchronous reset
    input wire async_in, // Bouncy switch input
    output reg debounced_out
);

    // 2-Stage synchronizer to mitigate metastability
    reg sync_0, sync_1;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sync_0 <= 1'b0;
            sync_1 <= 1'b0;
        end else begin
            sync_0 <= async_in;
            sync_1 <= sync_0;
        end
    end

    // Stable timing counter logic
    reg [17:0] counter;
    localparam TARGET_COUNT = 18'd250000; // 5ms duration target

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter       <= 18'd0;
            debounced_out <= 1'b0;
        end else begin
            // Reset counter whenever the stable level breaks
            if (sync_1 != debounced_out) begin
                if (counter == TARGET_COUNT) begin
                    debounced_out <= sync_1;
                    counter       <= 18'd0;
                end else begin
                    counter <= counter + 1'b1;
                end
            end else begin
                counter <= 18'd0; 
            end
        end
    end
endmodule

`timescale 1ns / 1ps

module tb_debounce;

    reg clk_fast;
    reg clk_slow;
    reg rst;
    reg async_in;
    
    wire out_sync;
    wire out_counter;

    // Problem 2 Instance
    debounce_sync uut_sync (
        .clk(clk_slow),
        .rst(rst),
        .async_in(async_in),
        .debounced_out(out_sync)
    );

    // Problem 3 Instance
    debounce_counter uut_counter (
        .clk(clk_fast),
        .rst(rst),
        .async_in(async_in),
        .debounced_out(out_counter)
    );

    // Fast 50 MHz Clock Generation (Period = 20ns)
    always #10 clk_fast = ~clk_fast;

    // Slow 333.33 Hz Clock Generation (Period = 3ms -> T/2 = 1.5ms)
    always #1500000 clk_slow = ~clk_slow;

    initial begin
        clk_fast = 0;
        clk_slow = 0;
        rst = 1;
        async_in = 0;
        #10000;
        rst = 0;
        #10000;

        // ========================================================
        // 1. SIMULATE LOW-TO-HIGH BOUNCING SEQUENCE (5ms Duration)
        // ========================================================
        async_in = 1; #800000;   // 0.8ms High
        async_in = 0; #200000;   // 0.2ms Low
        async_in = 1; #900000;   // 0.9ms High
        async_in = 0; #100000;   // 0.1ms Low
        async_in = 1; #700000;   // 0.7ms High
        async_in = 0; #300000;   // 0.3ms Low
        async_in = 1; #600000;   // 0.6ms High
        async_in = 0; #400000;   // 0.4ms Low
        async_in = 1; #500000;   // 0.5ms High
        async_in = 0; #500000;   // 0.5ms Low
        
        // Steady High State
        async_in = 1; 
        #10000000; // Hold for 10ms

        // ========================================================
        // 2. SIMULATE HIGH-TO-LOW BOUNCING SEQUENCE (5ms Duration)
        // ========================================================
        async_in = 0; #800000;   // 0.8ms Low
        async_in = 1; #200000;   // 0.2ms High
        async_in = 0; #900000;   // 0.9ms Low
        async_in = 1; #100000;   // 0.1ms High
        async_in = 0; #700000;   // 0.7ms Low
        async_in = 1; #300000;   // 0.3ms High
        async_in = 0; #600000;   // 0.6ms Low
        async_in = 1; #400000;   // 0.4ms High
        async_in = 0; #500000;   // 0.5ms Low
        async_in = 1; #500000;   // 0.5ms High
        
        // Steady Low State
        async_in = 0;
        #10000000; // Hold for 10ms

        $finish;
    end
endmodule