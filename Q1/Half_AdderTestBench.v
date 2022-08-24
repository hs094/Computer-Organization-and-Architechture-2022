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
        in1 = 0; in2 = 0;
		#100;
		in1 = 1; in2 = 0;
		#100;
		in1 = 0; in2 = 1;
		#100;
		in1 = 1; in2 = 1;
    end
endmodule