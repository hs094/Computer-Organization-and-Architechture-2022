`timescale 1ns / 1ps
# ---------------------------------------------------------
/*
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 3
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
*/
# ---------------------------------------------------------

module RCA_16_bit(
    input [15:0] a,
    input [15:0] b,
    input c_in,
    output [15:0] s,
    output c_out
);

wire carry;
// Cascading 2 RCA_8_bit using carry wire
RCA_8_bit ra1(a[7:0], b[7:0], c_in, s[7:0], carry);
RCA_8_bit ra2(a[15:8], b[15:8], carry, s[15:8], c_out);
endmodule