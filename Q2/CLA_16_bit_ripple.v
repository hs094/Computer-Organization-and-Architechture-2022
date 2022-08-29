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
module CLA_16_bit_ripple(
    input [15:0] a,
    input [15:0] b,
    input c_in,
    output [15:0] s,
    output c_out
);

wire [2:0] c;
CLA_4_bit cl1(a[3:0], b[3:0], c_in, s[3:0], c[2]);
CLA_4_bit cl2(a[7:4], b[7:4], c[2], s[7:4], c[1]);
CLA_4_bit cl3(a[11:8], b[11:8], c[1], s[11:8], c[0]);
CLA_4_bit cl4(a[15:12], b[15:12], c[0], s[15:12], c_out);
endmodule