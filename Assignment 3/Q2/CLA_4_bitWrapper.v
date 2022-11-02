`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:47 08/31/2022 
// Design Name: 
// Module Name:    CLA_4_bitWrapper 
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
module CLA_4_bitWrapper(
   input clk,
	input rst,
	input [3:0] a,
   input [3:0] b,
   input c_in,
   output reg [3:0] s,
   output reg c_out
   );
	 
	reg [3:0] a_reg, b_reg;
	reg c_reg;
	wire [3:0] s_net;
	wire c_net;
	
	always @(posedge clk) begin
		if(rst) begin
			a_reg <= 4'd0;
			b_reg <= 4'd0;
			c_reg <= 1'd0;
			s <= 4'd0;
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
	
	CLA_4_bit cla(.a(a_reg), .b(b_reg), .c_in(c_reg), .s(s_net), .c_out(c_net));


endmodule
