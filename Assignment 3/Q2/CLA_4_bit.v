`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:20:46 08/31/2022 
// Design Name: 
// Module Name:    CLA_4_bit 
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

module CLA_4_bit(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] s,
    output c_out
);

/*
	Logic of the Circuit:-
	
	P =  a ^ b
	G =  a & b   
	Expanding for i,
	P[i] = a[i] ^ b[i] for all 0<=i<=3
	G[i] = a[i] & b[i] for all 0<=i<=3
	
	C[0] = c_in
	C[1] = G[0] | (P[0] & c_in)
	C[2] = G[1] | (P[1] & C1) = G[1] | (P[1] & (G[0] | (P[0] & c_in))) = G[1] | (P1 & G[0]) | (P[1] & P[0] & c_in)
	C[3] = G[2] | (P[2] & C2) = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in)
	c_out = G[3] | (P[3] & C3) = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in)
	
	s[i] = P[i] ^ C[i] 0<=i<=3
	
*/

wire [3:0] P, G, C;
assign P = a ^ b;
assign G = a & b;

assign C[0] = c_in;
assign C[1] = (G[0] | (P[0] & C[0]));
assign C[2] = (G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]));
assign C[3] = (G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]));
assign c_out = (G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]));

// calculating sum
assign s = P ^ C;

endmodule
