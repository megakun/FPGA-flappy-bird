module bot (difficulty, rst, clk, award_bot_point);
	input logic rst, clk;
	input logic [2:0] difficulty;
	output logic award_bot_point;
	logic [8:0]rand_num;
	
	random r(.clk(clk), .rst(rst), .rand_num(rand_num));
	
	always_comb begin
	if (rand_num < difficulty)
		award_bot_point = 1;
	else 
		award_bot_point = 0;
	end	
	
endmodule

module bot_testbench();
	logic rst, clk, award_bot_point;
	logic [2:0]difficulty;
	logic [8:0]rand_num;
	
	bot dut (.rst, .clk, .award_bot_point, .difficulty);	
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2)
		clk <= ~clk;
	end
	
	
	initial begin 

	rst <= 1; difficulty <= 3'b111;		@(posedge clk);
	rst <= 0; 									@(posedge clk);
	repeat(511) 	 							@(posedge clk);
		
	$stop;
	end

endmodule
