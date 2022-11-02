`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:28:37 09/14/2022
// Design Name:   Behavorial_Wrapper
// Module Name:   C:/Users/akabh/assgn_5/Behavorial_Wrapper_TestBench.v
// Project Name:  assgn_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Behavorial_Wrapper
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

module Behavorial_Wrapper_TestBench;

	// Inputs
	reg clk_high;
	reg rstn;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	Behavorial_Wrapper uut (
		.clk_high(clk_high), 
		.rstn(rstn), 
		.counter(counter)
	);

	initial begin
		clk_high = 1'b0;
		rstn = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
		rstn = 1'b1;
		
      #200
		rstn = 1'b0;

	end
	
	always #5 clk_high = ~clk_high;
      
endmodule

