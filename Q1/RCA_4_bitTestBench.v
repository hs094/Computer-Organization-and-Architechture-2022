`timescale 1ns / 1ps

module RCA_4_bitTestbench;

    // Inputs to the Hardware
    reg [3:0]a;
    reg [3:0]b;
    reg c_in;

    // Outputs to the Hardware
    wire [3:0]s;
    wire c_out;


    RCA_4_bitTestbench(
        .a(a),
        .b(b),
        .c_in(c_in),
        .s(s),
        .c_out(c_out)
    );


    initial begin 
    $monitor ("a = %d, b = %d, c_in = %d, s = %d, c_out = %d", a, b, c_in, s, c_out);
        // Initialize Inputs
		    a = 4'b0100; b = 4'b0100; c_in = 0;
		    #100;
		    a = 4'b0100; b = 4'b1100; c_in = 0;
		    #100;
		    a = 4'b0011; b = 4'b0010; c_in = 1;
		    #100;
		    a = 4'b0001; b = 4'b0000; c_in = 1;
    end
endmodule
