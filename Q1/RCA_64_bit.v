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

module RCA_64_bit(
    input [63:0] a,
    input [63:0] b,
    input c_in,
    output [63:0] s,
    output c_out
);

wire carry;
RCA_32_bit ra1(a[31:0], b[31:0], c_in, s[31:0], carry);
RCA_32_bit ra2(a[63:32], b[63:32], carry, s[63:32], c_out);
endmodule