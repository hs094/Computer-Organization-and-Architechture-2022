`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:37 09/14/2022 
// Design Name: 
// Module Name:    Counter_4_bit_behavorial 
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
module Counter_4_bit_behavorial(
   input clk,
   input rstn,
   output reg [3:0] counter
   );
	
	always@(posedge clk or negedge rstn) begin
		if(!rstn) counter <= 4'b0000;
		else counter <= counter + 4'b0001;
	end

endmodule
