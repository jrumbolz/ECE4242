`default_nettype none
///////////////////////////////////////////////
module stimulus_generator(
	input wire clk, rst,
	output reg [5:0] out
);
	
	reg [5:0] counter = 6'b000000;
	
	always@(posedge clk or posedge rst)begin
		if(rst)
			counter <= 4'b000000;
		else
			counter <= counter +1;
		
		out  <=counter;
	end//always
endmodule
///////////////////////////////////////////////
module adder_orig(
	input wire add12, add34,
	input wire data1, data2, data3, data4,
	output reg [1:0] data_out
);
	wire [1:0] add_of_12, add_of_34;
	assign add_of_34 = data3 + data4;
	assign add_of_12 = data1 + data2;
	
	always @* begin
		if (add12)
			data_out = add_of_12;
		else if (add34)
			data_out = add_of_34;
		else
			data_out = 2'b0;
	end
endmodule
///////////////////////////////////////////////
module adder_final(
    input wire add12, add34, data1, data2, data3, data4,
    output reg [1:0] data_out
);
    reg op1, op2; 

    always @* begin
        if (add12) begin
            op1 = data1;
            op2 = data2;
        end 
        else if (add34) begin
            op1 = data3;
            op2 = data4;
        end 
        else begin
            op1 = 1'b0;
            op2 = 1'b0;
        end

        data_out = op1 + op2;
    end
endmodule
///////////////////////////////////////////////
module comparator(
	input wire [1:0] in1, in2,
	output reg out
);
	
	always@(*)begin
		out <= 0;//default only throws 1 if !=
		if(in2 != in1)
			out <= 1;
	end//always
endmodule
///////////////////////////////////////////////