module centerLight (clk, rst, PL, PR, NL, NR, light);
	input logic clk, rst, NL, NR, PL, PR;
	output logic light;
	// PL is true when Player 1 (left) gets a point
	// PR is true when Player 2 (right) gets a point
	// NL is true when the light directly to the left is on
	// NR is true when the light directly to the right is on
	// when light is true, this light should be on.
	
	enum {on, off} ps, ns;
	
	always_comb begin
		case(ps)
			on:  if(PL & ~PR | PR & ~PL)  ns = off;
				  else                     ns = on;
				  
			off: if(NR & PL & ~PR | NL & PR & ~PL)  ns = on;
				  else										 ns = off;
				 
		endcase
	end

	always_ff @(posedge clk) begin
		if(rst)
			ps <= on; // game start
		else 
			ps <= ns;
	end
	
	assign light = (ps == on);
endmodule

module centerLight_testbench();
	logic clk, rst, NL, NR, PL, PR;
	logic light;
	
	normalLight dut (clk, rst, NL, NR, PL, PR, light);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
														@(posedge clk);
		rst <= 1;									@(posedge clk);
														@(posedge clk);
		rst <= 0;									@(posedge clk);
														@(posedge clk);
		PL <= 1; PR <= 0; NL <= 0; NR <= 1;	@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
							   NL <= 1; NR <= 0;	@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		PL <= 0; PR <= 1; 						@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
							   NL <= 0; NR <= 1; @(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		PL <= 1; PR <= 1;	NL <= 1; NR <= 0;	@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		rst <= 1;									@(posedge clk);
														@(posedge clk);
		rst <= 0;									@(posedge clk);
														@(posedge clk);
		PL <= 1; PR <= 1; NL <= 0; NR <= 0;	@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		PL <= 1; PR <= 0; NL <= 0; NR <= 0;	@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		PL <= 0; PR <= 1; NL <= 0; NR <= 0;	@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		$stop; 
	end 
endmodule 
