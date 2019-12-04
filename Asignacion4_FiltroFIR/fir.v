/////////////////////////////////////////
// FIR 4 taps
// Ing. Diego Salazar
//
/////////////////////////////////////////

module fir (in,out,clk);
	input wire [7:0] in;
	input wire clk;
	output wire [15:0] out;
	
	wire [15:0] a0,a1,a2;
	wire [7:0] z1,z2,z3;
	wire [15:0] x,y,z;
	
	localparam B0 = 34;
	localparam B1 = 94;
	localparam B2 = 94;
	localparam B3 = 34;


	add8 A1 (.A(a0),.B(x),.OUT(a1));
	add8 A2 (.A(a1),.B(y),.OUT(a2));
	add8 A3 (.A(a2),.B(z),.OUT(out));

	mult8 M0 (.A(in),.B(B0),.OUT(a0));
	mult8 M1 (.A(z1),.B(B1),.OUT(x));
	mult8 M2 (.A(z2),.B(B2),.OUT(y));
	mult8 M3 (.A(z3),.B(B3),.OUT(z));

	reg8 Z1 (.IN(in),.OUT(z1),.clk(clk));
	reg8 Z2 (.IN(z1),.OUT(z2),.clk(clk));
	reg8 Z3 (.IN(z2),.OUT(z3),.clk(clk));
	
endmodule 

module add8 (A,B,OUT);
	input wire [15:0] A,B;
	output wire [15:0] OUT;
	wire [16:0] result;
	assign result = A+B;
	assign OUT = (result[16]==1) ? 16'b1111111111111111 : result[15:0];
endmodule

module mult8 (A,B,OUT);
	input wire [7:0] A,B;
	output wire [15:0] OUT;
	assign OUT = A*B;
endmodule

module reg8 (IN,OUT,clk);
	input wire clk;
	input wire [7:0] IN;
	output reg [7:0] OUT;
	always @(posedge clk) begin
		OUT <= IN;
	end
endmodule
