// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	
	upc_name s1(SW[9:7], HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	upc_check s2(SW[9:6], LEDR[1], LEDR[0]);

	
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
		SW[7:0] = 1'b0; // since we are not using SW9 to SW8

		for(i = 0; i < 16; i++) begin // delay by 10ns to make a visible waveform
			SW[9:6] = i; #10;
		end
	end
endmodule