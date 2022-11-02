`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:02 08/31/2022 
// Design Name: 
// Module Name:    Half_Adder 
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
module Half_Adder(
    input a,
    input b,
    output s,
    output c
);
    // For Half-Adder s = a xor b and c = a and b 

    /*
    *     Inputs:             Outputs:
	*   a = 0, b = 0        s = 0, c = 0
	*   a = 0, b = 1        s = 1, c = 0
	*   a = 1, b = 0        s = 1, c = 0
	*   a = 1, b = 1        s = 0, c = 1
    */

    assign s = a ^ b;
    assign c = a & b; 


endmodule
