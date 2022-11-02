`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:47:08 08/26/2022
// Design Name:   Half_Adder
// Module Name:   C:/Users/akabh/assgn3_grp60/Half_AdderTestBench.v
// Project Name:  assgn3_grp60
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Half_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Half_AdderTestBench;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	Half_Adder uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.c(c)
	);

	initial begin
		$monitor ("a = %d, b = %d, s = %d, c = %d", a, b, s, c);
		
      a = 0; b = 0;
		#100;		// Wait 100 ns for global reset to finish
		
		a = 1; b = 0;
		#100;		// Wait 100 ns for global reset to finish
		
		a = 0; b = 1;
		#100;		// Wait 100 ns for global reset to finish
		
		a = 1; b = 1;
		
	end
	
	initial #500 $finish;
      
endmodule

