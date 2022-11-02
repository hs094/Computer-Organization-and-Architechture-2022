`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:19 08/26/2022 
// Design Name: 
// Module Name:    RCA_8_bit 
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
module RCA_8_bit(
	 input [7:0] a,
    input [7:0] b,
    input c_in,
    output [7:0] s,
    output c_out
);

    // Carry Wire bus for internal temporary variable queries

    wire[6:0] carry;

    // Cascading 8 Full_Adders using carry wire

    Full_Adder fa1(a[0],b[0],c_in, s[0], carry[0]);
    Full_Adder fa2(a[1],b[1],carry[0], s[1], carry[1]);
    Full_Adder fa3(a[2],b[2],carry[1], s[2], carry[2]);
    Full_Adder fa4(a[3],b[3],carry[2], s[3], carry[3]);
    Full_Adder fa5(a[4],b[4],carry[3], s[4], carry[4]);
    Full_Adder fa6(a[5],b[5],carry[4 ], s[5], carry[5]);
    Full_Adder fa7(a[6],b[6], carry[5], s[6], carry[6]);
    Full_Adder fa8(a[7],b[7], carry[6], s[7], c_out);
	 
endmodule
