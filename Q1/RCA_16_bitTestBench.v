`timescale 1ns / 1ps

module RCA_16_bitTestbench;

    reg [15:0] a;
    reg [15:0] b;
    reg c_in;

    wire [15:0] s;
    wire c_out;

    RCA_16_bitTestbench uut(
        .a(a),
        .b(b),
        .c_in(c_in),
        .c_out(c_out),
        .s(s)
    );

    initial begin
        $monitor ("a = %d, b = %d, c_in = %d, c_out = %d, s = %d", a, b, c_in, c_out, s);
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