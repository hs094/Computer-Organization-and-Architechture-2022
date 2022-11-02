`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:46 08/26/2022 
// Design Name: 
// Module Name:    RCA_16_bit 
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
module RCA_16_bit(
    input [15:0] a,
    input [15:0] b,
    input c_in,
    output [15:0] s,
    output c_out
);

	wire carry;
	// Cascading 2 RCA_8_bit using carry wire
	RCA_8_bit ra1(a[7:0], b[7:0], c_in, s[7:0], carry);
	RCA_8_bit ra2(a[15:8], b[15:8], carry, s[15:8], c_out);
	
endmodule
