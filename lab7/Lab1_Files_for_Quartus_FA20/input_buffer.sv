module input_buffer (press, rst, clk, award_point);
	input logic press, rst, clk;
	output logic award_point;
	
	enum {on, off} ps, ns;
	
	always_comb begin
		case(ps)
			on:  if(press)   ns = on;
				  else		  ns = off;
				 
			off: if(press)   ns = on;
				  else  		  ns = off;
		endcase
	end
	
	assign award_point = (ps == on & ns == off);
	
	always_ff @(posedge clk) begin
		if(rst)
			ps <= on;
		else
			ps <= ns;
			
	end
endmodule

module input_buffer_testbench();
	logic press, rst, clk;
	logic award_point;
	
	input_buffer dut (press, rst, clk, award_point);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
											@(posedge clk);
			rst <= 1; 					@(posedge clk); // Always reset FSMs at start
			rst <= 0; press <= 0; 	@(posedge clk);
											@(posedge clk);
											@(posedge clk);
						 press <= 1;	@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
						 press <= 0;  	@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
						 press <= 1;	@(posedge clk);
						 press <= 0;	@(posedge clk);
			$stop; // End the simulation.
	end
endmodule