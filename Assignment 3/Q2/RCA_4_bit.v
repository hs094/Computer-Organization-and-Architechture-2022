`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:20 08/31/2022 
// Design Name: 
// Module Name:    RCA_4_bit 
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
module RCA_4_bit(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] s,
    output c_out
);

    wire[3:1] carry;
    // Cascading 4 Full_Adder using carry_wire
    Full_Adder fa1(.a(a[0]),.b(b[0]),.c_0(c_in),.S(s[0]),.C(carry[1]));
    Full_Adder fa2(.a(a[1]),.b(b[1]),.c_0(carry[1]),.S(s[1]),.C(carry[2]));
    Full_Adder fa3(.a(a[2]),.b(b[2]),.c_0(carry[2]),.S(s[2]),.C(carry[3]));
    Full_Adder fa4(.a(a[3]),.b(b[3]),.c_0(carry[3]),.S(s[3]),.C(c_out));
	 
endmodule
