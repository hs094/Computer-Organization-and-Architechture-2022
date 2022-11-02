`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:13 08/26/2022 
// Design Name: 
// Module Name:    Full_Adder 
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
module Full_Adder(
	 input a,
    input b,
    input c_0,
    output S,
    output C
);

    /*         Inputs:                      Outputs:
    *   a = 0, b = 0, c_0 = 0     sum = 0, c = 0
    *   a = 0, b = 0, c_0 = 1     sum = 1, c = 0
    *   a = 0, b = 1, c_0 = 0     sum = 1, c = 0
    *   a = 0, b = 1, c_0 = 1     sum = 0, c = 1
    *   a = 1, b = 0, c_0 = 0     sum = 1, c = 0
    *   a = 1, b = 0, c_0 = 1     sum = 0, c = 1
    *   a = 1, b = 1, c_0 = 0     sum = 0, c = 1
    *   a = 1, b = 1, c_0 = 1     sum = 1, c = 1
    */

	wire c1, c2, sum;
	Half_Adder ha1(a, b, sum, c1);
	Half_Adder ha2(sum, c_0, S, c2);
	or or1(C, c1, c2);
endmodule
