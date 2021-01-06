module upc_check(SW, D, S);
	input logic [9:6] SW;
	output logic D, S;
	
	assign D = SW[8] | (SW[9] & SW[7]);
	assign S = (~SW[8] & ~SW[7] & ~SW[6]) | (SW[9] & SW[7] & ~SW[6]);
	
endmodule

module upc_check_testbench();
	logic D, S;
	logic [9:6] SW;
		
	upc_check dut (.SW, .D, .S);
	
	integer i;
	initial begin
		
		for(i = 0; i < 16; i++) begin
			SW[9:6] = i; #10;
		end
	end
endmodule