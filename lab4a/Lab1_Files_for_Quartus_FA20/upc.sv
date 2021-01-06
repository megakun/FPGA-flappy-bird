module upc_name(upc, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input logic [9:7] upcm;
	output logic [6:0]	HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	
					
	always_comb begin
		case (upc)
			// red
			3'b000: 	begin
						HEX2 = 7'b0001000; // R
						HEX1 = 7'b0110000; // E
						HEX0 = 7'b0000001; // D
						end
			// blue
			3'b001:	begin
						HEX3 = 7'b0000000; // B
						HEX2 = 7'b1110001; // L
						HEX1 = 7'b1000001; // U
						HEX0 = 7'b0110000; // E
						end
			// green		
			3'b010:	begin
						HEX4 = 7'b0100001; // G
						HEX3 = 7'b0001000; // R
						HEX2 = 7'b0110000; // E
						HEX1 = 7'b0110000; // E
						HEx0 = 7'b0010001; // N
						end
			// black
			3'b011:	begin
						HEX4 = 7'b0000000; // B
						HEX3 = 7'b1110001; // L
						HEX2 = 7'b0001000; // A
						HEX1 = 7'b0110001; // C
						HEx0 = 7'b1001000; // K
						end
			// purple			
			3'b100:	begin
						HEX5 = 7'b0011000; // P
						HEX4 = 7'b1000001; // U
						HEX3 = 7'b0001000; // R
						HEX2 = 7'b0011000; // P
						HEX1 = 7'b1110001; // L
						HEX0 = 7'b0110000; // E		
						end
			// pink
			3'b101:	begin
						HEX3 = 7'b0011000; // P
						HEX2 = 7'b1111001; // I
						HEx1 = 7'b0010001; // N
						HEx0 = 7'b1010000; // K
						end
						
			default:	begin
						HEX5 = 7'bx; 
						HEX4 = 7'bx; 
						HEX3 = 7'bx; 
						HEX2 = 7'bx; 
						HEX1 = 7'bx; 
						HEX0 = 7'bx; 
						end
		endcase
	end
endmodule

module upc_name_testbench();
	wire  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire  [9:0] LEDR;
	reg   [3:0] KEY;
	reg   [9:0] SW;
		
	upc_name dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, SW);

	integer i;
	initial begin
		SW[6;0] = 1'b0;
		for(i = 0; i < 16; i++) begin
			SW[9:7] = i; #10;
		end
	end
endmodule