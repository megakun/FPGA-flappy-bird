module victory (edgelight_L, edgelight_R, PL, PR, rst, clk, display);
	input logic edgelight_L, edgelight_R, PL, PR, clk, rst;
	output logic [6:0] display;
	
	enum {nw, lw, rw} ps, ns;
	
	always_comb begin 
		case(ps)  
			nw:  if (edgelight_L & PL & ~PR )    ns = lw;
				  else if(edgelight_R & PR & ~PL) ns = rw;
				  else                            ns = nw;
				  
			rw :	ns = rw;
			lw :  ns = lw;
			
		endcase
		
		if (ps == rw)        display = 7'b0100100;
		else if (ps == lw)   display = 7'b1111001;
		else 					   display = 7'b1111111; // nw
	end 
	
	always_ff @(posedge clk) begin
		if(rst)
			ps <= nw; 
		else 
			ps <= ns;
	end
	
endmodule


module victory_testbench();
	logic edgelight_L, edgelight_R, PL, PR, clk, rst;
	logic [6:0] display;
	
	victory dut (.edgelight_L, .edgelight_R, .PL, .PR, .clk, .rst, .display);
	
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
																				@(posedge clk);
		$stop;
	end
endmodule