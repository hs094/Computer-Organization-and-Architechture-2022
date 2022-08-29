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
module LCA_Unit(
    input [3:0] P,
    input [3:0] G,
    input [4:1] carry,
    output p_out,
    output g_out
);

/*
	Logic:
	
	Take c_in to be carry[0] then
	carry[i] = G[i-1] | (P[i-1] & carry[i-1]), 1 <= i <= 4
	
	Recursively expanding we get
	carry[1] = G[0] | (P[0] & carry[0]) = G[0] | (P[0] & c_in)
	carry[2] = G[1] | (P[1] & carry[1]) = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in)
	carry[3] = G[2] | (P[2] & carry[2]) = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in)
	carry[4] = G[3] | (P[3] & carry[3]) = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in)
	
	Also block propogate P_out and generate G_out are calculated as
	P_out = P[3] & P[2] & P[1] & P[0]
	G_out = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0])
*/
	
	// calculate the lookahead carries using block propagate and generate from previous level
	assign carry[1] = G[0] | (P[0] & c_in);
	assign carry[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in);
	assign carry[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in);
	assign carry[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & c_in);
	
	// calculate the block propagate and generate for the next level
	assign p_out = P[0] & P[1] & P[2] & P[3];
	assign g_out = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);

endmodule
