`timescale 1ns / 1ps
/*
# ---------------------------------------------------------
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 3
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------
*/
module Half_Adder(
    input a,
    input b,
    output s,
    output c
);
    // For Half-Adder s = a xor b and c = a and b 

    /*
    *     Inputs:             Outputs:
	*   a = 0, b = 0        s = 0, c = 0
	*   a = 0, b = 1        s = 1, c = 0
	*   a = 1, b = 0        s = 1, c = 0
	*   a = 1, b = 1        s = 0, c = 1
    */

    assign s = a ^ b;
    assign c = a & b; 

endmodule