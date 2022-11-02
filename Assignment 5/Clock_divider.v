`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:49:56 09/14/2022 
// Design Name: 
// Module Name:    Clock_divider 
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

module Clock_divider(
    input clock_in,
    output reg clock_out
    );

reg[27:0] n_cycle=28'd0;
parameter DIVISOR = 28'd100000000;

// frequency(clk_out) = frequency(clk_in)/DIVISOR

always @(posedge clock_in) begin
	n_cycle <= n_cycle + 28'd1;
	if(n_cycle >= (DIVISOR-1))
		n_cycle <= 28'd0;
	clock_out <= (n_cycle<DIVISOR/2) ? 1'b1 : 1'b0;
end

endmodule
