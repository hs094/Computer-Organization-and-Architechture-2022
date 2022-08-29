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
module CLA_16_bit_LCU(
    input [15:0] a,
    input [15:0] b,
    input c_in,
    output [15:0] s,
    output c_out,
    output p,
    output g
);
wire [3:0] P,G;
wire [4:1] C;

CLA_4_bit_augmented cl1(a[3:0], b[3:0], c_in, P[0], G[0], s[3:0]);
CLA_4_bit_augmented cl2(a[7:4], b[7:4], C[1], P[1], G[1], s[3:0]);
CLA_4_bit_augmented cl3(a[11:8], b[11:8], C[2], P[2], G[2], s[3:0]);
CLA_4_bit_augmented cl4(a[15:12], b[15:12], C[3], P[3], G[3], s[3:0]);
LCA_Unit lu(P,G,C,p,g);
assign c_out = C[4];
endmodule