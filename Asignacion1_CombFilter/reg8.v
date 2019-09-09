/////////////////////////////////////////
// Reg 8bits
// Ing. Diego Salazar
//
/////////////////////////////////////////

module reg8(D,Q,clk);
	input [7:0] D;
	input clk;
	output reg [7:0] Q;

	always @(posedge clk) begin
		Q <= D;
	end

endmodule
