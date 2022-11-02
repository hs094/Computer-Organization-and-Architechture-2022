`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:59:01 09/14/2022
// Design Name:   Counter_4_bit_Structural
// Module Name:   C:/Users/akabh/assgn_5/Counter_4_bit_Structural_TestBench.v
// Project Name:  assgn_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter_4_bit_Structural
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

module Counter_4_bit_Structural_TestBench;

	// Inputs
	reg clk;
	reg rstn;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	Counter_4_bit_Structural uut (
		.clk(clk), 
		.rstn(rstn), 
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rstn = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rstn=1'b1;
		#100;
		rstn=1'b0;
		
		// Add stimulus here

	end
	always #5  clk = ~clk;
      
endmodule

