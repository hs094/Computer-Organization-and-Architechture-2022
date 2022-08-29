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
module CLA_16_bit_ripple_TestBench;
    reg [15:0] a,b;
    reg c_in;
    wire [15:0] s;
    wire c_out;

    CLA_16_bit_ripple uut(
        .a(a),
        .b(b),
        .c_in(c_in),
        .s(s),
        .c_out(c_out)
    );
    
    initial begin
    $moniter("a = %d, b = %d, c_in = %d, s = %d, c_out = %d", a,b,c_in,s,c_out);
    // Initialise TestCases
    a = 16'd34783; b = 16'd3443; c_in = 1;
    #100;
    a = 16'd3783; b = 16'd673443; c_in = 0;
    #100;
    a = 16'd58783; b = 16'd33; c_in = 1;
    #100;
    a = 16'd457; b = 16'd45887; c_in = 0;
    end
endmodule