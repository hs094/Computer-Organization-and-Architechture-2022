`timescale 1ns / 1ps
/*
# ---------------------------------------------------------

    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 3
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------
*/

module RCA_32_bit(
    input [31:0] a,
    input [31:0] b,
    input c_in,
    output [31:0] s,
    output c_out
);

wire carry;

// Cascading 2 RCA_16_bit using carry wire

RCA_16_bit ra1(a[15:0], b[15:0], c_in, s[15:0], carry);
RCA_16_bit ra2(a[31:16], b[31:16], carry, s[31:16], c_out);
endmodule