`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:16:58 08/26/2022
// Design Name:   Full_Adder
// Module Name:   C:/Users/akabh/assgn3_grp60/Full_AdderTestBench.v
// Project Name:  assgn3_grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Full_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Full_AdderTestBench;

	// Inputs
	reg a;
	reg b;
	reg c_0;

	// Outputs
	wire S;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	Full_Adder uut (
		.a(a), 
		.b(b), 
		.c_0(c_0), 
		.S(S), 
		.C(C)
	);

	initial begin
		$monitor("a = %d, b = %d, c_0 = %d, s = %d, c = %d", a, b, c_0, S, C);
		// Initialize Inputs
		a = 0; b = 0; c_0 = 0;
		#100;
		a = 1; b = 0; c_0 = 0;
		#100;
		a = 0; b = 1; c_0 = 0;
		#100;
		a = 0; b = 0; c_0 = 1;
		#100;
		a = 1; b = 1; c_0 = 0;
		#100;
		a = 1; b = 0; c_0 = 1;
		#100;
		a = 0; b = 1; c_0 = 1;
		#100;
		a = 1; b = 1; c_0 = 1;
	end
      
endmodule

