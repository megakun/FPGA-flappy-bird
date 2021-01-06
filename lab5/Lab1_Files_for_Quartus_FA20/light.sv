module light (clk, reset, SW, LEDR);
	input logic clk, reset; 
	input logic [1:0] SW;
	output logic [2:0] LEDR;
	
	// State variables
	// A = 010, B = 101, C = 001, D =100
	enum {A, B, C, D} ps, ns;
	
	// Next State logic
	always_comb begin
		case (ps)
		
			A: if (~SW[1] & ~SW[0]) 
					ns = B;
				else if (SW[1] & ~ SW[0]) 
					ns = C;
				else 
					ns = D;
				
			B: 	ns = A;
		
			C: if (SW[1] & ~SW[0])
					ns = D;
				else
					ns = A;
		
			D: if (~SW[1] & SW[0])
					ns = C;
				else 
					ns = A;
				
		endcase
	end
	// Output logic - could also be another always_comb block.
	always_comb begin
		case (ps)
			A: LEDR[2:0] = 3'b010;
				
			B:	LEDR[2:0] = 3'b101;
				
			C:	LEDR[2:0] = 3'b001;
				
			D: LEDR[2:0] = 3'b100;
		endcase
	end
	// DFFs
	always_ff @(posedge clk) begin
		if (reset)
			ps <= A;
		else
			ps <= ns;
	end
	
endmodule

module light_testbench();
	logic [1:0] SW;
	logic [2:0]	LEDR;
	logic clk, reset;

	light dut (.LEDR, .SW, .clk, .reset);

	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end

	initial begin
		@(posedge clk);
		reset <= 1;	 @(posedge clk);
		reset <= 0;	 @(posedge clk);
		SW <= 2'b00; @(posedge clk);
						 @(posedge clk);
						 @(posedge clk);
						 @(posedge clk);
		SW <= 2'b01; @(posedge clk);
						 @(posedge clk);
						 @(posedge clk);
						 @(posedge clk);
						 @(posedge clk);
		SW <= 2'b10; @(posedge clk);
						 @(posedge clk);
						 @(posedge clk);
						 @(posedge clk);
						 @(posedge clk);
		
		 $stop; // End the simulation.
	 end

endmodule