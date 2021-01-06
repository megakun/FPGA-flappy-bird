/* divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... 
  [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ... */
module clock_divider (clk, rst, divided_clocks);
 input logic clk, rst;
 output logic [31:0] divided_clocks = 0;

 always_ff @(posedge clk) begin
	divided_clocks <= divided_clocks + 1;
 end

endmodule 