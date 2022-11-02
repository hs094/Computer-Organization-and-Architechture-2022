`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:17:47 08/26/2022
// Design Name:   RCA_32_bit
// Module Name:   C:/Users/akabh/assgn3_grp60/RCA_32_bitTestBench.v
// Project Name:  assgn3_grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA_32_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RCA_32_bitTestBench;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg c_in;

	// Outputs
	wire [31:0] s;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	RCA_32_bit uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.s(s), 
		.c_out(c_out)
	);

	initial begin
		$monitor ("a = %d, b = %d, c_in = %d, c_out = %d, sum = %d", a, b, c_in, c_out, s);
      // Initialize Inputs
		a = 123456784; b = 98765432; c_in = 1;
		#100;
		a = 434893543; b = 98765432; c_in = 0;
		#100;
		a = 543895434; b = 45; c_in = 1;
		#100;
		a = 4294967290; b = 67; c_in = 1;
	end
      
endmodule

