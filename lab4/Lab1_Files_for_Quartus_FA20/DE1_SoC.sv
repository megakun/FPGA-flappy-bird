// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	
	// Default values, turns off the HEX displays
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	seg7 S1(SW[3:0], HEX0);
	seg7 s2(SW[7:4], HEX1);

	
endmodule

module DE1_SoC_testbench();
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:0] LEDR;
	logic [3:0] KEY;
	logic [9:0] SW;
	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR,
					 .SW);
	// Try all combinations of inputs.
	integer i;
	initial begin
		SW[9] = 1'b0; // since we are not using SW9 to SW8
		SW[8] = 1'b0;

		for(i = 0; i < 16; i++) begin
			SW[3:0] = i; #10; // delay by 10ns to make a visible waveform
			SW[7:4] = i; #10;
		end
	end
endmodule