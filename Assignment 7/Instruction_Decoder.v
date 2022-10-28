`timescale 1ns/1ps
/* ---------------------------------------------------------
*    # COMPUTER ORGANIZATION LABORATORY
*    # AUTUMN SEMESTER 2022
*    # RISC Processor Design
*    # Group No. 60
*    # Abhay Kumar Keshari 20CS10001
*    # Hardik Soni 20CS30023
*---------------------------------------------------------
*/ 
module Instruction_Decoder(
    input  [31:0] instruction,
    output [5:0] opcode,
    output [5:0] funccode,
    output [25:0] label0,
    output [20:0] label1,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] shtamt,
    output [15:0] imm
);
// The module to slice the 32-bit instructuion into separate fields to decode the instruction
// into opcode, funccode, rs, rt, shamt, imm
    
    assign opcode   = instruction[5:0];         // Opcode
    assign funccode = instruction[31:26];       // Function code
    assign label0   = instruction[31:6];        // Jump address for 26-bit addresses
    assign label1   = instruction[31:11];       // Jump address for 16-bit addresses
    assign rs       = instruction[15:11];       // Register rs
    assign rt       = instruction[10:6];        // Register rt
    assign shtamt   = instruction[20:16];       // Shift amount
    assign imm      = instruction[31:16];       // Immediate value
endmodule
