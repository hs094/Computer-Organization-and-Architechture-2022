`timescale 1ns / 1ps

module Full_AdderTestBench;

    // Inputs to the Hardware
    reg a;
    reg b;
    reg c_0;

    // Outputs from the Hardware

    wire s;
    wire c;

    // Instantiate the Unit Under Test (UUT)
	Full_Adder uut (
		.a(a), 
		.b(b), 
		.c_0(c_0), 
		.s(s), 
		.c(c)
	);
    
    initial begin
		$monitor ("a = %d, b = %d, c_0 = %d, s = %d, c = %d", a, b, c_0, s, c);
		// Initialize Inputs
		a = 0; b = 0; c_0 = 0;
		#100;
		a = 1; b = 0; c_0 = 0;
		#100;
		a = 0; b = 1; c_0 = 0;
		#100;
		a = 0; b = 0; c_0 = 1;
		#100;
		a = 1; b = 1; c_0 = 0;
		#100;
		a = 1; b = 0; c_0 = 1;
		#100;
		a = 0; b = 1; c_0 = 1;
		#100;
		a = 1; b = 1; c_0 = 1;
	end
endmodule