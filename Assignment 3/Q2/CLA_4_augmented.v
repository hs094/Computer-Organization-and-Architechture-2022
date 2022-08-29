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
/*
*   @input a 4-bit first number
*   @input b 4-bit second number
*   @output p block propogate
*   @output g generate
*/
module CLA_4_bit_augmented(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output p,
    output g,
    output [3:0] s
);
/*
* Logic of the Circuit:-
* P =  a ^ b
* G =  a & b   
* Expanding for i,
* P[i] = a[i] ^ b[i] for all 0<=i<=3
* G[i] = a[i] & b[i] for all 0<=i<=3
* Take C[0] to be c_in
* Then recursively we can,
* s[i] = P[i] ^ C[i] 0<=i<=3
* C[i] = G[i-1] | (P[i-1] & C[i-1]) for all 1<=i<=4
* c_out = C4
* C0 = c_in
* C1 = G[0] | (P[0] & c_in)
* C2 = G[1] | (P[1] & C1) = G[1] | (P[1] & (G[0] | (P[0] & c_in))) = G[1] | (P1 & G[0]) | (P[1] & P[0] & c_in)
* C3 = G[2] | (P[2] & C2) = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in)
* C4 = G[3] | (P[3] & C3) = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in)
*
* Also Block Propogate p and Generate g are calculated as:-
*
* p = P[0] & P[1] & P[2] & P[3];
* g = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
*/
wire [3:0] P,G;
wire [4:0] C;
assign P = a ^ b;
assign G = a & b;
assign C[0] = c_in;
assign C[1] = G[0] | (P[0] & c_in);
assign C[2] = G[1] | (P1 & G[0]) | (P[1] & P[0] & c_in);
assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in);
assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in);
assign s = P ^ C;
assign p = P[0] & P[1] & P[2] & P[3];
assign g = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
endmodule