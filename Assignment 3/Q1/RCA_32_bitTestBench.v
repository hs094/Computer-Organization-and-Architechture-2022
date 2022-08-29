`timescale 1ns / 1ps

module RCA_32_bitTestbench;

    reg [31:0]a;
    reg [31:0]b;
    reg c_in;

    wire [31:0]s;
    wire c_out;

    RCA_32_bit uut(
        .a(a),
        .b(b),
        .c_in(c_in),
        .c_out(c_out),
        .s(s)
    );

    initial begin
        $monitor ("a = %d, b = %d, c_in = %d, c_out = %d, s = %d", a, b, c_in, c_out, s);
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