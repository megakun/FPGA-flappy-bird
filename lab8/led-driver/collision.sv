module collision (rst, clk, RedPixels, GrnPixels, gameover);
	input logic rst, clk;
	input	logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs (row x col)
   input logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs (row x col)
	output logic gameover;
	
	logic [15:0][15:0] PixelOn;
	
	always_ff @(posedge clk) begin
			if(rst) begin
				gameover <= 0;
				PixelOn <= RedPixels & GrnPixels;
				
			end
			
			else if(|PixelOn == 1) begin
				gameover <= 1;
			end
			
			else begin
				PixelOn <= RedPixels & GrnPixels;
			end
	end
	
endmodule

module collision_testbench();
	logic rst, clk;
	logic [15:0][15:0]RedPixels; // 16 x 16 array representing red LEDs (row x col)
   logic [15:0][15:0]GrnPixels; // 16 x 16 array representing green LEDs (row x col)
	logic gameover;
	
	collision dut(.rst, .clk, .RedPixels, .GrnPixels, .gameover);
	
		// Set up a simulated clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		rst <= 1;  GrnPixels = '0; RedPixels = '0; @(posedge clk);
		
		for (int i = 0; i < 16; i++) begin @(posedge clk);
				GrnPixels[i][10] = 1'b1;
		end		
		
		rst <= 0; @(posedge clk);
		
		RedPixels[0][4] = 1'b1; @(posedge clk);
		
		for(int k = 0; k < 16; k++) begin @(posedge clk);
			for (int i = 0; i < 16; i++) begin  
				RedPixels[i] <= RedPixels[i] << 1; // do something to every row
			end
		end
		
	$stop;
	end
	
endmodule