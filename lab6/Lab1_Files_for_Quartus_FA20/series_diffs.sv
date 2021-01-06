module series_diffs (raw, rst, clk, clean);
	input logic raw, rst, clk;
	output logic clean;
	
	logic middle;
	
	always_ff @(posedge clk) begin
		if (rst) 
			clean <= 0;
		else 
			middle <= raw;
			clean  <= middle;
	end
endmodule

module series_diffs_testbench();
	 logic raw, rst, clk;
	 logic clean;
	
	series_diffs dut (raw, rst, clk, clean);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
										@(posedge clk);
			rst <= 1; 				@(posedge clk); // Always reset FSMs at start
			rst <= 0; raw <= 0; 	@(posedge clk);
										@(posedge clk);
						 raw <= 1;	@(posedge clk);
										@(posedge clk);
						 raw <= 0;  @(posedge clk);
                              @(posedge clk);
						 raw <= 1;  @(posedge clk);
			$stop; // End the simulation.
	end
endmodule
