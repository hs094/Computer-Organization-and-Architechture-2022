`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:40 08/26/2022 
// Design Name: 
// Module Name:    RCA_32_bit 
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
module RCA_32_bit(
	 input [31:0] a,
    input [31:0] b,
    input c_in,
    output [31:0] s,
    output c_out
);

wire carry;

// Cascading 2 RCA_16_bit using carry wire

RCA_16_bit ra1(a[15:0], b[15:0], c_in, s[15:0], carry);
RCA_16_bit ra2(a[31:16], b[31:16], carry, s[31:16], c_out);

endmodule
