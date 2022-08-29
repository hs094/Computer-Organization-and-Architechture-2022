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
module CLA_4_bit_TestBench;
    /*
    * @input a first 4-bit number
    * @input b second 4-bit number
    * @input c_in carry-in bit
    * @output s 4-bit sum
    * @output c_out  carry-out bit
    */
    reg [3:0] a;
    reg [3:0] b;
    reg c_in;
    wire [3:0] s;
    wire c_out;

initial begin 
    $moniter("a = %d, b = %d, c_in = %d, s = %d, c_out = %d", a, b, c_in, s, c_out);
    // Inititalize the Test Cases
    a = 4'b0100; b = 4'b0100; c_in = 0;
    #100;
    a = 4'b1100; b = 4'b0100; c_in = 0;
    #100;
    a = 4'b0100; b = 4'b010; c_in = 0;
    #100;
    a = 4'b1001; b = 4'b0100; c_in = 0;
    #100;
    end
endmodule

