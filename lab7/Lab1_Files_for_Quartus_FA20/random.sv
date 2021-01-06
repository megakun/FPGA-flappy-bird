module random (rst, clk, rand_num);
	input logic rst, clk;
	output logic[8:0] rand_num;
	

	
	always_ff @(posedge clk) begin
		if(rst) begin
			rand_num[8:0] <= 9'b000000000;
		end
		
		else begin
			rand_num[8] <= rand_num[0] ~^ rand_num[4];
			rand_num[7] <= rand_num[8];
			rand_num[6] <= rand_num[7];
			rand_num[5] <= rand_num[6];
			rand_num[4] <= rand_num[5];
			rand_num[3] <= rand_num[4];
			rand_num[2] <= rand_num[3];
			rand_num[1] <= rand_num[2];
			rand_num[0] <= rand_num[1];
		end
	end
	


endmodule



module random_testbench();
	logic rst, clk;
	logic [8:0] rand_num;
	
	random dut (.rst, .clk, .rand_num);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2)
		clk <= ~clk;
	end
	
	initial begin 
	
	rst <= 1; 			@(posedge clk);
	rst <= 0;			@(posedge clk);
	repeat(513) 	 	@(posedge clk);
	
	$stop;
	end
endmodule

	
	