/////////////////////////////////////////
// comparison module tb
// Ing. Diego Salazar
//
/////////////////////////////////////////
`timescale 1ns/1ps

module comparisonmodule_tb;
	reg compare_result;
	reg rstp;
	reg clk;
	wire [3:0] adc_out;
	wire [3:0] dac_in;

	comparison_module uut(
				.adc_out(adc_out),
				.dac_in(dac_in),
				.compare_result(compare_result),
				.rstp(rstp),
				.clk(clk)
	);

	always begin
		#25 clk = ~clk;
	end
	initial begin
		$vcdpluson;
		$dumpfile("comparison_module.vcd");
		$dumpvars(0,comparison_module);
		clk = 0;
		rstp = 1;
		compare_result = 0;
		repeat (6) begin
			@(posedge clk);
		end
		rstp = 0;
		compare_result = 1;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 0;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 1;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 1;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 0;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 0;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 1;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 1;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 0;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 1;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 0;
		repeat (1) begin
			@(posedge clk);
		end
		compare_result = 1;
		repeat (1) begin
			@(posedge clk);
		end
		$finish;
	end
endmodule
