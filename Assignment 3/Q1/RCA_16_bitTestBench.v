`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:05:57 08/26/2022
// Design Name:   RCA_16_bit
// Module Name:   C:/Users/akabh/assgn3_grp60/RCA_16_bitTestBench.v
// Project Name:  assgn3_grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RCA_16_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RCA_16_bitTestBench;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg c_in;

	// Outputs
	wire [15:0] s;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	RCA_16_bit uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.s(s), 
		.c_out(c_out)
	);

	initial begin
		$monitor ("a = %d, b = %d, c_in = %d, c_out = %d, sum = %d", a, b, c_in, c_out, s);
      a = 16'd1076; b = 16'd13875; c_in = 1;
		#100;
		a = 16'd31245; b = 16'd7785; c_in = 0;
		#100;
		a = 16'd25000; b = 16'd25600; c_in = 1;
		#100;
		a = 16'd25001; b = 16'd40535; c_in = 1;
		#100;
		a = 16'd25080; b = 16'd40535; c_in = 0;
	end
      
endmodule

