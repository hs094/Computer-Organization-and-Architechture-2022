`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:31:26 09/14/2022
// Design Name:   Clock_divider
// Module Name:   C:/Users/akabh/assgn_5/Clock_divider_TestBench.v
// Project Name:  assgn_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Clock_divider
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
    # Assignment 5
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------
*/

module Clock_divider_TestBench;

	// Inputs
	reg clock_in;

	// Outputs
	wire clock_out;

	// Instantiate the Unit Under Test (UUT)
	Clock_divider uut (
		.clock_in(clock_in), 
		.clock_out(clock_out)
	);

	initial begin
		// Initialize Inputs
		clock_in = 1'b0;
		end
   always #5 clock_in = ~clock_in;
endmodule

