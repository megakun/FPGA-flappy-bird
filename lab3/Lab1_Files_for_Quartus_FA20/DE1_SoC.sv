// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	
	// Default values, turns off the HEX displays
	assign HEX0 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	// Logic to check if SW[3]..SW[0] match your bottom digit,
	// and SW[7]..SW[4] match the next.
   // Result should drive LEDR[0].
	
	// Please use switch Sw9, Sw8, Sw7 for U, P, C, respectively; 
	// Sw6 for the secret Mark; 
	// LEDR1 for the Discount alert
	// LEDR0 for the Stolen alert.
	assign LEDR[1] = SW[8] | (SW[9] & SW[7]);
	assign LEDR[0] = (~SW[8] & ~SW[7] & ~SW[6]) | (SW[9] & SW[7] & ~SW[6]);
	
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
		SW[0] = 1'b0; // since we are not using SW0 to SW5
		SW[1] = 1'b0;
		SW[2] = 1'b0;
		SW[3] = 1'b0;
		SW[4] = 1'b0;
		SW[5] = 1'b0;
		
		for(i = 0; i < 16; i++) begin
			SW[9:6] = i; #10; // delay by 10ns to make a visible waveform
		end
	end
endmodule