`timescale 1ns / 1ps

module RCA_64_bitTestbench;

    reg [63:0]a;
    reg [63:0]b;
    reg c_in;

    wire [63:0]s;
    wire c_out;

    RCA_64_bit uut(
        .a(a),
        .b(b),
        .c_in(c_in),
        .c_out(c_out),
        .s(s)
    );

    initial begin
        $monitor ("a = %d, b = %d, c_in = %d, c_out = %d, s = %d", a, b, c_in, c_out, s);
        // Initialize Inputs
		in1 = 64'd84935734758545; in2 = 64'd98765432198765; c_in = 1;
		#100;
		in1 = 64'd45743957434588; in2 = 64'd98765432198765; c_in = 0;
		#100;
		in1 = 64'd43784634636457637747; in2 = 64'd5; c_in = 1;
		#100;
		in1 = 64'd37827833748738347834; in2 = 64'd6; c_in = 1;
		#100;
		in1 = 64'd79171848990075845807; in2 = 64'd6; c_in = 0;
    end
endmodule