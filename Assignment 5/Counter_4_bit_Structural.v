`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:47:27 09/14/2022 
// Design Name: 
// Module Name:    Counter_4_bit_Structural 
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

/*
# ---------------------------------------------------------
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 5
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------
*/

module Counter_4_bit_Structural(
   input clk,
   input rstn,
   output [3:0] counter
   );
	wire [3:0] upcounter_net;
	DFF dff0(.clk(clk), .rstn(rstn), .d(upcounter_net[0]), .q(counter[0]));
	DFF dff1(.clk(clk), .rstn(rstn), .d(upcounter_net[1]), .q(counter[1]));
	DFF dff2(.clk(clk), .rstn(rstn), .d(upcounter_net[2]), .q(counter[2]));
	DFF dff3(.clk(clk), .rstn(rstn), .d(upcounter_net[3]), .q(counter[3]));
	add_by_one add_1(.in(counter), .out(upcounter_net));
endmodule
