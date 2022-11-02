`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:57:08 08/31/2022 
// Design Name: 
// Module Name:    CLA_16_bit_lookahead 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
/*
# ---------------------------------------------------------
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 3
    # Problem 2
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------
*/

module CLA_16_bit_lookahead(
    input [15:0] a,
    input [15:0] b,
    input c_in,
    output [15:0] s,
    output c_out,
    output p,
    output g
);

wire [3:0] P,G,C;

CLA_4_bit_augmented cla0(.a(a[3:0]), .b(b[3:0]), .c_in(c_in), .s(s[3:0]), .p(P[0]), .g(G[0]));
CLA_4_bit_augmented cla1(.a(a[7:4]), .b(b[7:4]), .c_in(C[1]), .s(s[7:4]), .p(P[1]), .g(G[1]));
CLA_4_bit_augmented cla2(.a(a[11:8]), .b(b[11:8]), .c_in(C[2]), .s(s[11:8]), .p(P[2]), .g(G[2]));
CLA_4_bit_augmented cla3(.a(a[15:12]), .b(b[15:12]), .c_in(C[3]), .s(s[15:12]), .p(P[3]), .g(G[3]));

LookaheadCarryUnit lcu(.P(P), .G(G), .c_in(c_in), .carry(C), .c_out(c_out), .P_out(p), .G_out(g));

endmodule
