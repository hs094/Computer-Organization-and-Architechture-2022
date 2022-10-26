`timescale 1ns / 1 ps
/* ---------------------------------------------------------
*    # COMPUTER ORGANIZATION LABORATORY
*    # AUTUMN SEMESTER 2022
*    # RISC Processor Design
*    # Group No. 60
*    # Abhay Kumar Keshari 20CS10001
*    # Hardik Soni 20CS30023
*---------------------------------------------------------
*/ 
// This simple module is used to add 4 to the program counter value
module PC_inc(
    input [31:0] instr,
    output [31:0] next_instr
); 
    assign next_instr = instr + 32'b00000000000000000000000000000100;
endmodule
