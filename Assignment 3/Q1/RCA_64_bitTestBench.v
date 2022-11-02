`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:47:55 08/26/2022
// Design Name:   RCA_64_bit
// Module Name:   C:/Users/akabh/assgn3_grp60/RCA_64_bitTestBench.v
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

module RCA_64_bitTestBench;

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
		$monitor ("a = %d, b = %d, c_in = %d, c_out = %d, sum = %d", a, b, c_in, c_out, s);
      // Initialize Inputs
		a = 64'd84935734758545; b = 64'd98765432198765; c_in = 1;
		#100;
		a = 64'd45743957434588; b = 64'd98765432198765; c_in = 0;
		#100;
		a = 64'd43784634636457637747; b = 64'd5; c_in = 1;
		#100;
		a = 64'd37827833748738347834; b = 64'd6; c_in = 1;
		#100;
		a = 64'd79171848990075845807; b = 64'd6; c_in = 0;
	end
      
endmodule

