`timescale 1ns / 1ps
# ---------------------------------------------------------
/*
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 3
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
*/
# ---------------------------------------------------------

module RCA_4_bit(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] s,
    output c_out
);

    wire[2:0] carry;
    // Cascading 4 Full_Adder using carry_wire
    Full_Adder fa1(a[0],b[0],c_in,s[0],carry[0]);
    Full_Adder fa2(a[1],b[1],carry[0],s[1],carry[1]);
    Full_Adder fa3(a[2],b[2],carry[1],s[2],carry[2]);
    Full_Adder fa4(a[3],b[3],carry[2],s[3],c_out);

endmodule