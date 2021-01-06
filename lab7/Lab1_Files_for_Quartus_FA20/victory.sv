module victory (edgelight_L, edgelight_R, PL, PR, rst, clk, LHEX, RHEX, nextRound);
	input logic edgelight_L, edgelight_R, PL, PR, clk, rst;
	output logic [6:0] LHEX, RHEX;
	output logic nextRound;
	
	logic [3:0] l_Score, r_Score;
	//logic nextRound;
	
	enum {nw, lw, rw} ps, ns;
	
	always_comb begin 
		case(ps)  
			nw:  if (edgelight_L & PL & ~PR )    ns = lw;
				  else if(edgelight_R & PR & ~PL) ns = rw;
				  else                            ns = nw;
				  
			rw :	ns = rw;
			lw :  ns = lw;
			
		endcase
		

	end 
	
	always_ff @(posedge clk) begin
		if(rst) begin
			ps <= nw; 
			l_Score <= 4'b0000;
			r_Score <= 4'b0000;
			nextRound <= 0;
		end
		
		else if (ps == nw & ns == rw) begin
			ps <= ns;
			r_Score <= r_Score + 1'b1;
		end 
		
		else if (ps == nw & ns == lw) begin
			ps <= ns;
			l_Score <= l_Score + 1'b1;
		end
		
		else if (ps == lw | ps == rw) begin
			ps <= nw;
			nextRound <= 1;
		end 
		
		else if (nextRound) begin 
			ps <= ns;
			nextRound <= 0;
		end
		
		else begin
			ps <= ns;
		end
	end
	
	seg7 left(l_Score, LHEX);
	seg7 right(r_Score, RHEX);
	
endmodule


module seg7 (bcd, leds);
	input logic [3:0] bcd;
	output logic [6:0] leds;
	
	always_comb begin
		case (bcd)
			// Light: 6543210
			4'b0000: leds = 7'b1000000; // 0
			4'b0001: leds = 7'b1111001; // 1
			4'b0010: leds = 7'b0100100; // 2
			4'b0011: leds = 7'b0110000; // 3
			4'b0100: leds = 7'b0011001; // 4
			4'b0101: leds = 7'b0010010; // 5
			4'b0110: leds = 7'b0000010; // 6
			4'b0111: leds = 7'b1111000; // 7
			4'b1000: leds = 7'b0000000; // 8
			4'b1001: leds = 7'b0010000; // 9
			default: leds = 7'b1111111;
		endcase
	end
endmodule

module victory_testbench();
	logic edgelight_L, edgelight_R, PL, PR, clk, rst, nextRound;
	logic [6:0] LHEX, RHEX;
	
	victory dut (.edgelight_L, .edgelight_R, .PL, .PR, .clk, .rst, .LHEX, .RHEX, .nextRound);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2)
		clk <= ~clk;
	end
	
	initial begin
		rst <= 1;															@(posedge clk);
																				@(posedge clk);
		rst <= 0;															@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 1; edgelight_R <= 0; PL <= 1; PR <= 0;	@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 1; edgelight_R <= 1;							@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 1; edgelight_R <= 0;			   PR <= 1; @(posedge clk);
		
		edgelight_L <= 1; edgelight_R <= 0; PL <= 1; PR <= 0; repeat(5)	@(posedge clk);
		
																				@(posedge clk);
		rst <= 1;															@(posedge clk);
																				@(posedge clk);
		rst <= 0;															@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 0; edgelight_R <= 1; PL <= 0; PR <= 1;	@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 1;				 									@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 0; 				     	PL <= 1;				@(posedge clk);
		
		edgelight_L <= 0; edgelight_R <= 1; PL <= 0; PR <= 1;	repeat(5) @(posedge clk);
		
																				@(posedge clk);
		rst <= 1;															@(posedge clk);
																				@(posedge clk);
		rst <= 0;															@(posedge clk);
		edgelight_L <= 1; edgelight_R <= 0; PL <= 1; PR <= 0;	@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 0; edgelight_R <= 1; PL <= 0; PR <= 1;	@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 0; edgelight_R <= 1; PL <= 0; PR <= 1;	@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 1; edgelight_R <= 0; PL <= 1; PR <= 0;	@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 0; edgelight_R <= 1; PL <= 0; PR <= 1;	@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 1; edgelight_R <= 0; PL <= 1; PR <= 0;	@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 1; edgelight_R <= 0; PL <= 1; PR <= 0;	@(posedge clk);
																				@(posedge clk);
		edgelight_L <= 1; edgelight_R <= 0; PL <= 1; PR <= 0;	@(posedge clk);
																				@(posedge clk);		
		$stop;
	end
endmodule