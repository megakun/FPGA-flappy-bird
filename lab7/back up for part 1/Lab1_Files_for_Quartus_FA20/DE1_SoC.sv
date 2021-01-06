// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input logic CLOCK_50; // 50MHz clock.
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	logic nextRound, reset;
	
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;

	assign reset = (SW[9] | nextRound);
	
	series_diffs L(.raw(~KEY[3]), .rst(reset), .clk(CLOCK_50), .clean(CL));
	series_diffs R(.raw(~KEY[0]), .rst(reset), .clk(CLOCK_50), .clean(CR));
	
	input_buffer LB(.press(CL), .rst(reset), .clk(CLOCK_50), .award_point(P1));
	input_buffer LR(.press(CR), .rst(reset), .clk(CLOCK_50), .award_point(P2));
	
	light_field LF(.lights_in(LEDR[8:0]), .PL(P1), .PR(P2), .rst(reset), .clk(CLOCK_50), .lights_out(LEDR[8:0]));
	
	victory V(.edgelight_L(LEDR[8]), .edgelight_R(LEDR[0]), .PL(P1), .PR(P2), .rst(SW[9]), .clk(CLOCK_50), .LHEX(HEX5), .RHEX(HEX0), .nextRound);
	
endmodule

	


module DE1_SoC_testbench();
	logic CLOCK_50;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:0] LEDR;
	logic [3:0] KEY;
	logic [9:0] SW;
	
	DE1_SoC dut (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	// Set up a simulated clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		CLOCK_50 <= 0;
		forever #(CLOCK_PERIOD/2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock
	end
	// Test the design.
	initial begin
	
	SW[9] <= 1;											@(posedge CLOCK_50);
	   
															@(posedge CLOCK_50);
	SW[9] <= 0; 										@(posedge CLOCK_50);
	          
	KEY[3] <= 0;						@(posedge CLOCK_50);

	 
		KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
			KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);

				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);
				KEY[0] <= 1; @(posedge CLOCK_50);
		KEY[0] <= 0;@(posedge CLOCK_50);

	

	KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);

		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
		KEY[3] <= 0;						@(posedge CLOCK_50);
	KEY[3] <= 1;						@(posedge CLOCK_50);
	
	$stop; // End the simulation.
	end
endmodule