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
    * @input a first 4-bit number
    * @input b second 4-bit number
    * @input c_in carry-in bit
    * @output s 4-bit sum
    * @output c_out  carry-out bit
*/
module CLA_4_bit(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] s,
    output c_out
);

/*
* Logic of the Circuit:-
* P =  a ^ b
* G =  a & b   
* Expanding for i,
* P[i] = a[i] & b[i] for all 0<=i<=3
* G[i] = a[i] ^ b[i] for all 0<=i<=3
* 
* Initialize C[0] to be c_in
* Then Recursively we can:-
* s[i] = P[i] ^ C[i] 0<=i<=3
* C[i] = G[i-1] | (P[i-1] & C[i-1]) for all 1<=i<=4
* C0 = c_in
* C1 = G[0] | (P[0] & c_in)
* C2 = G[1] | (P[1] & C[1]) = G[1] | (P[1] & (G[0] | (P[0] & c_in))) = G[1] | (P1 & G[0]) | (P[1] & P[0] & c_in)
* C3 = G[2] | (P[2] & C[2]) = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in)
* C4 = G[3] | (P[3] & C[3]) = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in)
* c_out = C4
* s = 
*/

wire [3:0] P,G;
wire C0,C1,C2,C3,C4;
assign P[0] = a[0] ^ b[0];
assign P[1] = a[1] ^ b[1];
assign P[2] = a[2] ^ b[2];
assign P[3] = a[3] ^ b[3];
assign G[0] = a[0] & b[0];
assign G[1] = a[1] & b[1];
assign G[2] = a[2] & b[2];
assign G[3] = a[3] & b[3];
assign C0 = c_in;
assign C1 = (G[0] | (P[0] & C0));
assign C2 = (G[1] | (P1 & G[0]) | (P[1] & P[0] & C0));
assign C3 = (G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C0));
assign C4 = (G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C0));
assign c_out = C4;
// calculating sum
assign s[0] = P[0] ^ C0;
assign s[1] = P[1] ^ C1;
assign s[2] = P[2] ^ C2;
assign s[3] = P[3] ^ C3;
endmodule