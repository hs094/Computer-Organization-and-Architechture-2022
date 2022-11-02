`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:16 09/14/2022 
// Design Name: 
// Module Name:    Structural_Wrapper 
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

module Structural_Wrapper(
   input clk_high,
   input rstn,
   output [3:0] counter
   );
	wire clk_low;
	Clock_divider clkDiv(.clock_in(clk_high), .clock_out(clk_low));
	Counter_4_bit_Structural cntr(.clk(clk_low), .rstn(rstn), .counter(counter));
endmodule

