module pipe_generator#(SHIFT_THERSHOLD = 218, GAP = 1526)(clk, rst, gameover, GrnPixels);
	input logic clk, rst, gameover;
   output logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs (row x col)

	int shift, gap;
	logic[15:0][15:0] p1;
	
	pipe_picker #(.CHANGE(0)) picker (.clk(clk), .rst(rst), .pattern(p1));

	
	always_ff @ (posedge clk) begin
		//reset spawn the first pattern
		if (rst) begin
			GrnPixels = '0;
			GrnPixels <= p1;
			shift <= 0;
			gap <= 0;
			
		end
		
		else begin
			// for shifting
			if (shift > SHIFT_THERSHOLD)  begin
				shift <= 0;
				 for (int i = 0; i < 16; i++) begin
						GrnPixels[i] <= GrnPixels[i] << 1; // do something to every row
				 end

			end
			
			//enough gap then spawn
			else if (gap > GAP) begin
				gap <= 0;
				for (int j = 0; j < 16; j++) begin
					//for (int k = 0; k < 16; k++) begin
							GrnPixels[j][0] <= p1[j][0]; // do something to every pixel
					//end
				end

				//GrnPixels[0] <= p1;
			end
			
			// freeze if gameover
			else if (gameover) begin
				GrnPixels <= GrnPixels;
			end
			
			else begin
				shift <= shift + 1;
				gap <= gap +1;
			end
			
		end 
		
	
	
	end

	
endmodule



module pipe_generator_testbench();
	logic clk, rst;
	//logic [3:0] tens, ones;
   logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs (row x col)	
	
	pipe_generator #(.SHIFT_THERSHOLD(0), .GAP(0)) dut (.clk, .rst, .GrnPixels);
	
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
		
		repeat(30) @(posedge clk);
	
	$stop;
	end
	
	

	
	
endmodule

