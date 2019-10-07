/////////////////////////////////////////
// comparison module
// Ing. Diego Salazar
//
/////////////////////////////////////////
`timescale 1ns/1ps

module comparison_module(adc_out,dac_in,compare_result,rstp,clk);
	input compare_result;
	input rstp;
	input clk;
	output wire [3:0] adc_out;
	output wire [3:0] dac_in;
	
	wire s3,s2,s1,s0; //Shift reg output
	wire d3,d2,d1,d0; //And result
	reg [3:0] state; //SM count
	wire rst; // reset for internal modules
	wire adc3,adc2,adc1,adc0;

	always@(posedge clk or posedge rstp) begin
		if(rstp)begin
			state = 4'd0;
		end
		else begin
			if(state == 4'd4) begin
				state = 4'd0;
			end
			else begin
				state = state + 4'd1;
			end
		end
	end
	assign rst = (state == 4'd0) ? 1 : 0;
	assign adc_out = (state == 4'd0) ? {adc3,adc2,adc1,adc0} : adc_out;

	shift_reg sreg(.out({s3,s2,s1,s0}),.rst(rst),.clk(clk));

	and_m and3 (.A(compare_result),.B(s3),.O(d3));
	and_m and2 (.A(compare_result),.B(s2),.O(d2));
	and_m and1 (.A(compare_result),.B(s1),.O(d1));
	and_m and0 (.A(compare_result),.B(s0),.O(d0));

	FF ff3 (.D(d3),.Q(adc3),.en(s3),.rst(rst),.clk(clk));
	FF ff2 (.D(d2),.Q(adc2),.en(s2),.rst(rst),.clk(clk));
	FF ff1 (.D(d1),.Q(adc1),.en(s1),.rst(rst),.clk(clk));
	FF ff0 (.D(d0),.Q(adc0),.en(s0),.rst(rst),.clk(clk));

	digital_comparison dcomp (.adc_out({adc3,adc2,adc1,adc0}),.dac_in(dac_in),.selector(state),.rst(rst),.clk(clk));
	

endmodule

/////////////////////////////////////////
// digital_comparison value module
// Ing. Diego Salazar
//
/////////////////////////////////////////

module digital_comparison(adc_out,dac_in,selector,rst,clk);
	input rst;
	input clk;
	input 		[3:0] adc_out;
	input 		[3:0] selector;
	output	reg 	[3:0] dac_in;

	always@(posedge clk or posedge rst) begin
		if(rst) begin
			dac_in = 4'b1000;
		end
		else begin
			case(selector)
			4'd0: begin
				dac_in = 4'b1000;
			end
			4'd1: begin
				dac_in = {adc_out[3],3'b100};
			end
			4'd2: begin
				dac_in = {adc_out[3:2],2'b10};
			end
			4'd3: begin
				dac_in = {adc_out[3:1],1'b1};
			end
			4'd4: begin
				dac_in = adc_out[3:0];
			end
			//default: selector = 0;
			endcase
		end
	end
endmodule

/////////////////////////////////////////
// and module
// Ing. Diego Salazar
//
/////////////////////////////////////////

module and_m(A,B,O);
	input A;
	input B;
	output wire O;

	assign O = A && B;
endmodule

/////////////////////////////////////////
// shift reg module
// Ing. Diego Salazar
//
/////////////////////////////////////////

module shift_reg(out,rst,clk);
	input rst;
	input clk;
	output reg [3:0] out;

	always@(posedge clk or posedge rst) begin
		if(rst) begin
			out = 4'b1000;
		end
		else begin
			out = {1'b0,out[3:1]};
		end
	end
endmodule

/////////////////////////////////////////
// FF with enable
// Ing. Diego Salazar
//
/////////////////////////////////////////

module FF(D,Q,en,rst,clk);
	input en;
	input rst;
	input clk;
	input D;
	output reg Q;

	always@(posedge clk or posedge rst) begin
		if(rst) begin
			Q = 0;
		end
		else begin
			if(en) begin
				Q = D;
			end
			else begin
				Q = Q;
			end
		end
	end
endmodule
