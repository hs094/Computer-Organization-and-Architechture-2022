`timescale 1ns / 1ps

module RCA_8_bitTestbench;

    reg [7:0]a;
    reg [7:0]b;
    reg c_in;

    wire [7:0]s;
    wire c_out;

    RCA_8_bit uut(
        .a(a),
        .b(b),
        .c_in(c_in),
        .c_out(c_out),
        .s(s)
    );

    initial begin
        $monitor ("a = %d, b = %d, c_in = %d, c_out = %d, s = %d", a, b, c_in, c_out, s);
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