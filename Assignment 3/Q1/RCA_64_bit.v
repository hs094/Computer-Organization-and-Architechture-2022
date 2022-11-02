`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:21 08/26/2022 
// Design Name: 
// Module Name:    RCA_64_bit 
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
module RCA_64_bit(
    input [63:0] a,
    input [63:0] b,
    input c_in,
    output [63:0] s,
    output c_out
);

wire carry;

// Cascading 2 RCA_32_bit using carry wire

RCA_32_bit ra1(a[31:0], b[31:0], c_in, s[31:0], carry);
RCA_32_bit ra2(a[63:32], b[63:32], carry, s[63:32], c_out);

endmodule
