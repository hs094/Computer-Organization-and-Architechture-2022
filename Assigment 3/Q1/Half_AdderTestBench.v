`timescale 1ns / 1ps

module Half_AdderTestBench;

    // Inputs to the Hardware
    reg a;
    reg b;

    // Outputs from the Hardware
    wire s;
    wire c;

    // Instantiate the Unit Under Test (UUT)
    Half_Adder uut(
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );
    initial begin
        $moniter ("a = %d, b = %d, s = %d, c = %d", a, b, s, c);
        a = 0; b = 0;
		#100;
		a = 1; b = 0;
		#100;
		a = 0; b = 1;
		#100;
		a = 1; b = 1;
    end
endmodule