`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:06:21 08/31/2022
// Design Name:   CLA_4_bit_augmented
// Module Name:   C:/Users/akabh/assgn3.2_Grp60/CLA_4_bit_augmentedTestBench.v
// Project Name:  assgn3.2_Grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_4_bit_augmented
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
# ---------------------------------------------------------
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 3
    # Problem 2
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------
*/


module CLA_4_bit_augmentedTestBench;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;

	// Outputs
	wire [3:0] s;
	wire p;
	wire g;

	// Instantiate the Unit Under Test (UUT)
	CLA_4_bit_augmented uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.s(s), 
		.p(p), 
		.g(g)
	);

	initial begin
		$monitor("@ %d, a = %d, b = %d, c_in = %d, s = %d, p = %d, g = %d", $time, a, b, c_in, s, p, g);
		// Initialize Testcases
		a = 4'b0100; b = 4'b0100; c_in = 1'b0;
		#100;
		a = 4'b1010; b = 4'b1001; c_in = 1'b1;
		#100;
		a = 4'b1100; b = 4'b1001; c_in = 1'b0;
		#100;
		a = 4'b1001; b = 4'b1001; c_in = 1'b1;
		#100;
	end
      
endmodule

