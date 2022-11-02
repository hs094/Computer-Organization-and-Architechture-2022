`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:28:04 08/26/2022
// Design Name:   RCA_64_bit
// Module Name:   C:/Users/akabh/assgn3_grp60/Subtracter_64_bitTestBench.v
// Project Name:  assgn3_grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA_64_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Subtracter_64_bitTestBench;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg c_in;

	// Outputs
	wire [63:0] s;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	RCA_64_bit uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.s(s), 
		.c_out(c_out)
	);

	initial begin
		$monitor ("a = %d, b = %d, c_out = %d, difference = %d", a, b, c_in, c_out, s);
      // Initialize Inputs
		a = 64'd108745; b = ~64'd98754; c_in = 1;
		#100;
		a = 64'd488; b = ~64'd65; c_in = 1;
		#100;
		a = 64'd10747; b = ~64'd1002; c_in = 1;
		#100;
		a = 64'd64; b = ~64'd21; c_in = 1;
	end
      
endmodule

