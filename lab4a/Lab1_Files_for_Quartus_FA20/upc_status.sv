module upc_status(upcm, D, S);
	input logic [9:6] upcm;
	output logic D, S;
	
	always_comb begin
		case (upcm)
			// red
			4'b0000: begin	// without m
						D = 0;
						S = 1;
						end
			4'b0001: begin	// with m
						D = 0;
						S = 0;
						end
			// blue
			4'b0010:	begin
						D = 0;
						S = 0;
						end
			// green		
			4'b0110:	begin
						D = 1;
						S = 0;
						end
			// black
			4'b1000:	begin // without m
						D = 0;
						S = 1;
						end
						
			4'b1001:	begin // with m
						D = 0;
						S = 0;
						end
			// purple			
			4'b1010:	begin // without m
						D = 1;
						S = 1;
						end
						
			4'b1011:	begin // with m
						D = 1;
						S = 0;
						end
			// pink
			4'b1100:	begin 
						D = 1;
						S = 0;
						end		
						
			default:	begin
						D = 0;
						S = 0;
						end
		endcase
	end
endmodule

module upc_status_testbench();
	logic D, S;
	logic [9:6] upcm;
		
	upc_status dut (.upcm, .D, .S);
	
	integer i;
	initial begin
		
		for(i = 0; i < 16; i++) begin
			upcm[9:6] = i; #10;
		end
	end
endmodule