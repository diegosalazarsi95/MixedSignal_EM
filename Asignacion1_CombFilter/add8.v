/////////////////////////////////////////
// Add 8bits
// Ing. Diego Salazar
//
/////////////////////////////////////////

module add8 (A,B,Out);
	input wire [7:0] A,B;
	output wire [7:0] Out;

	assign Out = A+B;
endmodule 
