`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:08 09/14/2022 
// Design Name: 
// Module Name:    add_by_one 
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
    # Assignment 5
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------
*/

module add_by_one(
   input [3:0] in,
   output [3:0] out
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
	
	s[i] = P[i] ^ C[i] 0<=i<=3
	
	set b = 0001 and c_in=0
	reducing following formulas gives, 
	s[0] = ~a[0];
	s[1] = a[1] ^ (a[0]);
   s[2] = a[2] ^ (a[1] & a[0]);
   s[3] = a[3] ^ (a[2] & a[1] & a[0]);
	
*/

	assign out[0] = ~in[0];
   assign out[1] = in[1] ^ (in[0]);
   assign out[2] = in[2] ^ (in[1] & in[0]);
   assign out[3] = in[3] ^ (in[2] & in[1] & in[0]);

endmodule
