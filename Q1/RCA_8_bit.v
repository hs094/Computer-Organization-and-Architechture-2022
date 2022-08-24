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

module RCA_8_bit(
    input [7:0] a,
    input [7:0] b,
    input c_in,
    output [7:0] s,
    output c_out
);

wire[6:0] carry;
RCA_4_bit ra1(a[0],b[0],c_in, s[0], carry[0]);
RCA_4_bit ra2(a[1],b[1],carry[0], s[1], carry[1]);
RCA_4_bit ra3(a[2],b[2],carry[1], s[2], carry[2]);
RCA_4_bit ra4(a[3],b[3],carry[2], s[3], carry[3]);
RCA_4_bit ra5(a[4],b[4],carry[3], s[4], carry[4]);
RCA_4_bit ra6(a[5],b[5],carry[4 ], s[5], carry[5]);
RCA_4_bit ra7(a[6],b[6], carry[5], s[6], carry[6]);
RCA_4_bit ra8(a[7],b[7], carry[6], s[7], c_out);

endmodule