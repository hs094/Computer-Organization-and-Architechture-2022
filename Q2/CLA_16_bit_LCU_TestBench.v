`timescale 1ns / 1ps
/* ---------------------------------------------------------
*    # COMPUTER ORGANIZATION LABORATORY
*    # AUTUMN SEMESTER 2022
*    # Assignment 3
*    # Problem 1
*    # Group No. 60
*    # Abhay Kumar Keshari 20CS10001
*    # Hardik Soni 20CS30023
*---------------------------------------------------------
*/ 
module CLA_16_bit_LCU_TestBench;
    reg[15:0] a,b;
    reg c_in;
    wire[15:0]s;    
    wire c_out;
    wire p,g;

    CLA_16_bit_LCU uut(
        .a(a),
        .b(b),
        .s(s),
        .c_out(c_out),
        .p(p),
        .g(g);
    );

initial begin
    $moniter("a = %d, b = %d, s = %d, c_out = %d, p = %d, g = %d", a, b, s, c_out, p, g);
    // Initialize Inputs
	a = 16'd32445; b = 16'd16785; c_in = 0;
	#100;
	a = 16'd32145; b = 16'd16785; c_in = 0;
	#100;
	a = 16'd12500; b = 16'd40535; c_in = 1;
	#100;
	a = 16'd25021; b = 16'd40535; c_in = 1;
	#100;
	a = 16'd25020; b = 16'd01535; c_in = 0;
    end
endmodule