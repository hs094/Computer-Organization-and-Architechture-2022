`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:18 08/31/2022
// Design Name:   CLA_16_bit_ripple
// Module Name:   C:/Users/akabh/assgn3.2_Grp60/CLA_16_bit_rippleTestBench.v
// Project Name:  assgn3.2_Grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_16_bit_ripple
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


module CLA_16_bit_rippleTestBench;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg c_in;

	// Outputs
	wire [15:0] s;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	CLA_16_bit_ripple uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.s(s), 
		.c_out(c_out)
	);

	initial begin
		$monitor("@%d ns, a = %d, b = %d, c_in = %d, s = %d, c_out = %d", $time, a, b, c_in, s, c_out);
		// Initialize Inputs
		a = 16'd32445; b = 16'd16785; c_in = 1'b0;
		#100;
		a = 16'd32145; b = 16'd16785; c_in = 1'b0;
		#100;
		a = 16'd12500; b = 16'd40535; c_in = 1'b1;
		#100;
		a = 16'd25021; b = 16'd40535; c_in = 1'b1;
		#100;
		a = 16'd25020; b = 16'd01535; c_in = 1'b0;
	end
      
endmodule

