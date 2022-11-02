`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:38 08/26/2022 
// Design Name: 
// Module Name:    Subtracter_64_bit 
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
module Subtracter_64_bit(
	input[63:0] a,
	input[63:0] b,
	output[63:0] s,
	output c
    );
	
	wire[63:0] twos_complement;
	genvar i;
	for(i=0; i<64; i=i+1) begin
		nor (twos_complement[i], b[i], b[i]);
	end
	wire connect;
	
	RCA_32_bit r1(a[31:0], twos_complement[31:0], 1, s[31:0], connect);
	RCA_32_bit r2(a[63:32],twos_complement[63:32], connect, s[63:32], c);

endmodule
