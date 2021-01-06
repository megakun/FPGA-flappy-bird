module pipe_picker#(CHANGE = 218)(rst, clk, pattern);
	input logic rst, clk;
	output logic [15:0][15:0] pattern;
	
	int pattern_num, cycle;
	
	always_ff @ (posedge clk) begin
			if (rst) begin
				cycle <= 0;
				pattern_num <= 1;
			end
			
			else if (cycle > CHANGE) begin
				cycle <= 0;
				pattern_num <= pattern_num + 1;
			end
			
			else begin
				cycle <= cycle + 1;
			end
	end
	
	always_comb begin
	
		if (pattern_num % 8 == 1) begin
			pattern = '0;
			for (int i = 4; i < 8; i++) begin
				pattern[i][0] = 1'b1;
			end
			//pattern[ = 16'b0000111100000000;
		end
		
		else if(pattern_num % 8 == 2) begin
			pattern = '0;
			for (int i = 0; i < 8; i++) begin
				pattern[i][0] = 1'b1;
			end
		end
		
		else if(pattern_num % 8 == 3) begin
			pattern = '0;
			for (int i = 0; i < 4; i++) begin
				pattern[i][0] = 1'b1;
			end
			for (int i = 15; i > 11 ; i--) begin
				pattern[i][0] = 1'b1;
			end
		end

		else if(pattern_num % 8 == 4) begin
			//pattern = 16'b1100000111111111;
			pattern = '0;
			for (int i = 0; i < 2; i++) begin
				pattern[i][0] = 1'b1;
			end
			for (int i = 15; i > 7 ; i--) begin
				pattern[i][0] = 1'b1;
			end
		end
		
		else if(pattern_num % 8 == 5) begin
			//pattern = 16'b0011110000111111;
			pattern = '0;
			for (int i = 1; i < 4; i++) begin
				pattern[i][0] = 1'b1;
			end
			for (int i = 15; i > 9 ; i--) begin
				pattern[i][0] = 1'b1;
			end
		end
		
		else if(pattern_num % 8 == 6) begin
			//pattern = 16'b0000001111111111;
			pattern = '0;
			for (int i = 15; i > 6 ; i--) begin
				pattern[i][0] = 1'b1;
			end

		end
		
		else if(pattern_num % 8 == 7) begin
			//pattern = 16'b0000000000001111;
			pattern = '0;
			for (int i = 15; i > 11 ; i--) begin
				pattern[i][0] = 1'b1;
			end

		end
		
		else begin  // %8 == 0
			//pattern = 16'b0000000011110000;
			pattern = '0;
			for (int i = 11; i > 7 ; i--) begin
				pattern[i][0] = 1'b1;
			end

		end
	end
	
	
endmodule


module pipe_picker_testbench();
	logic rst, clk;
	logic [15:0][15:0] pattern;
	
	pipe_picker#(.CHANGE(0)) dut(.rst, .clk, .pattern);
	
	// Set up a simulated clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		rst <= 1;  @(posedge clk);
					  @(posedge clk);
		rst <= 0;  @(posedge clk);
		
		repeat(20) @(posedge clk);
	
	$stop;
	end
	

endmodule
