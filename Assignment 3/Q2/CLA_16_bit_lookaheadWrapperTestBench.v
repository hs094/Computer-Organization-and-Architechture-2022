`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:02:05 11/02/2022
// Design Name:   CLA_16_bit_lookaheadWrapper
// Module Name:   C:/Users/akabh/assgn3.2_Grp60/CLA_16_bit_lookaheadWrapperTestBench.v
// Project Name:  assgn3.2_Grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_16_bit_lookaheadWrapper
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CLA_16_bit_lookaheadWrapperTestBench;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] a;
	reg [15:0] b;
	reg c_in;

	// Outputs
	wire [15:0] s;
	wire c_out;
	wire p;
	wire g;

	// Instantiate the Unit Under Test (UUT)
	CLA_16_bit_lookaheadWrapper uut (
		.clk(clk), 
		.rst(rst), 
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.s(s), 
		.c_out(c_out), 
		.p(p), 
		.g(g)
	);

	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		
		#20
		rst = 0;
		a = 7;
		b = 8;
		c_in = 0;
		#10
		a = 5;
		b = 8;
		c_in = 0;
		#2
		a = 6;
		b = 8;
		c_in = 0;
		#20
		a = 1;
		b = 8;
		c_in = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

