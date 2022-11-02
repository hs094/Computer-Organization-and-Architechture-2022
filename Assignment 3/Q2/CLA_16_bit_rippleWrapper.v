`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:05 08/31/2022 
// Design Name: 
// Module Name:    CLA_16_bit_rippleWrapper 
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
module CLA_16_bit_rippleWrapper(
   input clk,
	input rst,
	input [15:0] a,
   input [15:0] b,
   input c_in,
   output reg [15:0] s,
   output reg c_out
   );
	 
	reg [15:0] a_reg, b_reg;
	reg c_reg;
	wire [15:0] s_net;
	wire c_net;
	
	always @(posedge clk) begin
		if(rst) begin
			a_reg <= 16'd0;
			b_reg <= 16'd0;
			c_reg <= 1'd0;
			s <= 16'd0;
			c_out <= 1'd0;
			
		end
		else begin
			a_reg <= a;
			b_reg <= b;
			c_reg <= c_in;
			s <= s_net;
			c_out <= c_net;
		end
	end
	
	CLA_16_bit_ripple cla(.a(a_reg), .b(b_reg), .c_in(c_reg), .s(s_net), .c_out(c_net));


endmodule
