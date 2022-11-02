`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:59:27 08/26/2022
// Design Name:   RCA_8_bit
// Module Name:   C:/Users/akabh/assgn3_grp60/RCA_8_bitTestBench.v
// Project Name:  assgn3_grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA_8_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RCA_8_bitTestBench;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg c_in;

	// Outputs
	wire [7:0] s;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	RCA_8_bit uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.s(s), 
		.c_out(c_out)
	);

	initial begin
		$monitor ("a = %d, b = %d, c_in = %d, c_out = %d, sum = %d", a, b, c_in, c_out, s);
      a = 8'd109; b = 8'd102; c_in = 0;
		#100;
		a = 8'd113; b = 8'd102; c_in = 1;
		#100;
		a = 8'd243; b = 8'd15; c_in = 0;
		#100;
		a = 8'd240; b = 8'd160; c_in = 0;
		#100;
		a = 8'd340; b = 8'd116; c_in = 1;
	end
      
endmodule

