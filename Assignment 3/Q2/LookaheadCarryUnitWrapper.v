`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:04 08/31/2022 
// Design Name: 
// Module Name:    LookaheadCarryUnitWrapper 
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
module LookaheadCarryUnitWrapper(
   input clk,
	input rst,
	input [3:0] P,
   input [3:0] G,
   input c_in,
   output reg [3:0] carry,
   output reg c_out,
   output reg P_out,
   output reg G_out
    );
	 
	reg [3:0] P_reg, G_reg;
	reg c_reg;
	wire [3:0] carry_net;
	wire c_net, P_net, G_net;
	
	always @(posedge clk) begin
		if(rst) begin
			P_reg <= 4'd0;
			G_reg <= 4'd0;
			c_reg <= 1'd0;
			carry <= 4'd0;
			c_out <= 1'd0;
			P_out <= 1'd0;
			G_out <= 1'd0;
			
		end
		else begin
			P_reg <= P;
			G_reg <= G;
			c_reg <= c_in;
			carry <= carry_net;
			c_out <= c_net;
			P_out <= P_net;
			G_out <= G_net;
		end
	end
	
	LookaheadCarryUnit lcu(.P(P_reg), .G(G_reg), .c_in(c_reg), .carry(carry_net), .c_out(c_net), .P_out(P_net), .G_out(G_net));

endmodule
