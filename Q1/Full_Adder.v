`timescale 1ns / 1ps
# ---------------------------------------------------------
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 3
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------

module FullAdder(
    input a,
    input b,
    input c_in,
    output S,
    output c_out
);

wire c1, c2, sum
halfAdder ha1(a, b, sum, c1);
halfAdder ha2(sum, c_in, S, c2);
or gate1(c_out, c1, c2);

endmodule
