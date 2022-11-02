`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:31:22 09/14/2022
// Design Name:   add_by_one
// Module Name:   C:/Users/akabh/assgn_5/add_by_one_TestBench.v
// Project Name:  assgn_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: add_by_one
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

module add_by_one_TestBench;

	// Inputs
	reg [3:0] in;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	add_by_one uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 4'b0000;
		
		// Wait 100 ns for global reset to finish
		#100;
      in = 4'b0011;
		#100;
      in = 4'b1011;
		#100;
      in = 4'b1111;
	end
      
endmodule

