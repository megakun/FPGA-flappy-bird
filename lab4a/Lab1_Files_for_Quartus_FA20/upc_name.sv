module upc_name(upc, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input logic [9:7] upc;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
					
	always_comb begin
		case (upc)
			// red
			3'b000: 	begin
						HEX5 = 7'b1111111; 
						HEX4 = 7'b1111111; 
						HEX3 = 7'b1111111; 
						HEX2 = 7'b0001000; // R
						HEX1 = 7'b0000110; // E
						HEX0 = 7'b1000000; // D
						end
			// blue
			3'b001:	begin
						HEX5 = 7'b1111111; 
						HEX4 = 7'b1111111;
						HEX3 = 7'b0000000; // B
						HEX2 = 7'b1000111; // L
						HEX1 = 7'b1000001; // U
						HEX0 = 7'b0000110; // E
						end
			// green		
			3'b011:	begin
						HEX5 = 7'b1111111;
						HEX4 = 7'b1000010; // G
						HEX3 = 7'b0001000; // R
						HEX2 = 7'b0000110; // E
						HEX1 = 7'b0000110; // E
						HEX0 = 7'b1001000; // N
						end
			// black
			3'b100:	begin
						HEX5 = 7'b1111111;
						HEX4 = 7'b0000000; // B
						HEX3 = 7'b1000111; // L
						HEX2 = 7'b0001000; // A
						HEX1 = 7'b1000110; // C
						HEX0 = 7'b0001001; // K
						end
			// purple			
			3'b101:	begin
						HEX5 = 7'b0001100; // P
						HEX4 = 7'b1000001; // U
						HEX3 = 7'b0001000; // R
						HEX2 = 7'b0001100; // P
						HEX1 = 7'b1000111; // L
						HEX0 = 7'b0000110; // E		
						end
			// pink
			3'b110:	begin
						HEX5 = 7'b1111111; 
						HEX4 = 7'b1111111;
						HEX3 = 7'b0001100; // P
						HEX2 = 7'b1001111; // I
						HEX1 = 7'b1001000; // N
						HEX0 = 7'b0001001; // K
						end
						
			default:	begin
						HEX5 = 7'bx; 
						HEX4 = 7'bx; 
						HEX3 = 7'bx;
						HEX2 = 7'bx; 
						HEX1 = 7'bx; 
						HEX0 = 7'bx;; 
						end
		endcase
	end
endmodule

module upc_name_testbench();
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic [9:7] upc;
		
	upc_name dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .upc);
	integer i;
	initial begin
		for(i = 0; i < 8; i++) begin
			upc[9:7] = i; #10;
		end
	end
endmodule