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
module Full_Adder(
    input a,
    input b,
    input c_0,
    output S,
    output c
);

    /*         Inputs:                      Outputs:
    *   a = 0, b = 0, c_0 = 0     sum = 0, c = 0
    *   a = 0, b = 0, c_0 = 1     sum = 1, c = 0
    *   a = 0, b = 1, c_0 = 0     sum = 1, c = 0
    *   a = 0, b = 1, c_0 = 1     sum = 0, c = 1
    *   a = 1, b = 0, c_0 = 0     sum = 1, c = 0
    *   a = 1, b = 0, c_0 = 1     sum = 0, c = 1
    *   a = 1, b = 1, c_0 = 0     sum = 0, c = 1
    *   a = 1, b = 1, c_0 = 1     sum = 1, c = 1
    */

wire c1, c2, sum
Half_Adder ha1(a, b, sum, c1);
Half_Adder ha2(sum, c_0, S, c2);
or gate1(c, c1, c2);

endmodule
