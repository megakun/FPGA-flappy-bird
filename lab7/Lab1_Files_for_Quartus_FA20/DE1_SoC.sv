// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input logic CLOCK_50; // 50MHz clock.
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	logic nextRound, reset, PB;
	
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;

	assign reset = (SW[9] | nextRound);

	logic [31:0] div_clk;
	clock_divider cdiv (.clock(CLOCK_50),
							  .reset(SW[9]),
							  .divided_clocks(div_clk));
	// Clock selection; allows for easy switching between simulation and board clocks
	logic clkSelect;
	// Uncomment ONE of the following two lines depending on intention
	//assign clkSelect = CLOCK_50; // for simulation
	assign clkSelect = div_clk[16]; // 381 Hz clock for board
	
	
	
	bot b(.difficulty(SW[2:0]), .rst(SW[9]), .clk(clkSelect), .award_bot_point(PB)); 
	
	//series_diffs L(.raw(PB), .rst(SW[9]), .clk(clkSelect), .clean(CL));
	series_diffs R(.raw(KEY[0]), .rst(SW[9]), .clk(clkSelect), .clean(CR));
	
	//input_buffer LB(.press(CL), .rst(reset), .clk(clkSelect), .award_point(P1));
	input_buffer LR(.press(CR), .rst(SW[9]), .clk(clkSelect), .award_point(P2));
	
	light_field LF(.lights_in(LEDR[8:0]), .PL(PB), .PR(P2), .rst(reset), .clk(clkSelect), .lights_out(LEDR[8:0]));
	
	victory V(.edgelight_L(LEDR[8]), .edgelight_R(LEDR[0]), .PL(PB), .PR(P2), .rst(SW[9]), .clk(clkSelect), .LHEX(HEX5), .RHEX(HEX0), .nextRound);
	
endmodule

//divided_clocks[0]=25MHz,[1]=12.5Mhz,...[23]=3Hz,[24]=1.5Hz,[25]= 0.75Hz, ...
module clock_divider (clock, reset, divided_clocks);
	input logic reset, clock;
	output logic [31:0] divided_clocks = 0;
		
	always_ff @(posedge clock) begin
		divided_clocks <= divided_clocks + 1;
	end
endmodule


module DE1_SoC_testbench();
	logic clkSelect, CLOCK_50;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:0] LEDR;
	logic [3:0] KEY;
	logic [9:0] SW;
	
	DE1_SoC dut (.CLOCK_50(clkSelect), .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);
	// Set up a simulated clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clkSelect <= 0;
		forever #(CLOCK_PERIOD/2) clkSelect <= ~clkSelect; // Forever toggle the clock
	end
	// Test the design.
	initial begin
	
	SW[9] <= 1;	SW[2] <= 0; SW[1] <= 0; SW[0] <= 0;										@(posedge clkSelect);
															
	SW[9] <= 0; 			 @(posedge clkSelect);
								 
   KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	// @(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
   KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	KEY[0] <= 1;												@(posedge clkSelect);
	KEY[0] <= 0;												@(posedge clkSelect);
	
	SW[9] <= 1;						@(posedge clkSelect);
															
	SW[9] <= 0; repeat(2)		 @(posedge clkSelect);
								 
	
	SW[9] <= 1;	SW[2] <= 1; SW[1] <= 1; SW[0] <= 1;										@(posedge clkSelect);
															
	SW[9] <= 0; 			 @(posedge clkSelect);
	repeat(512)           @(posedge clkSelect);
	SW[9] <= 1;										@(posedge clkSelect);
															
	SW[9] <= 0; 			 @(posedge clkSelect);
	SW[9] <= 1;										@(posedge clkSelect);
															
	SW[9] <= 0; 			 @(posedge clkSelect);
	$stop; // End the simulation.
	end
endmodule