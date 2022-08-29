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
module CLA_4_bit_augmented_TestBench;

reg [3:0] a,b;
reg c_in;
wire p,g,[3:0] s;

CLA_4_bit_augmented uut(
    .a(a),
    .b(b),
    .p(p),
    .g(g),
    .s(s),
);

initial begin
    $moniter("a = %d, b = %d, c_in = %d, p = %d, g = %d, s = %d", a,b,c_in, p,g,s);
    // Initialize Testcases
    a = 4'b0100; b = 4'b0100; c_in = 0;
    #100;
    a = 4'b1010; b = 4'b1001; c_in = 1;
    #100;
    a = 4'b1100; b = 4'b1001; c_in = 0;
    #100;
    a = 4'b1001; b = 4'b1001; c_in = 1;
    #100;
    end
endmodule