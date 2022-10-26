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
module main_control(
    input [5:0] opcode,
    output reg [1:0] branch,
    output reg mem_read,
    output reg mem_write,
    output reg [1:0] mem_reg_pc,
    output reg [2:0] alu_op,
    output reg alu_source,
    output reg [1:0] write_reg
);

    /*
        Assign the values based on the following table:
        OPCODE | ALUop | ALUsource | WriteReg | MemWrite | MemRead | MemRegPC | Branch
        000001 | 001   | 1         | 10       | 0        | 0       | 00       | 00
        000010 | 010   | 1         | 10       | 0        | 0       | 00       | 00
        000011 | 011   | 1         | 10       | 0        | 0       | 00       | 00
        000100 | 000   | 1         | 00       | 0        | 0       | 00       | 01
        000101 | 000   | 1         | 00       | 0        | 0       | 00       | 10
        000110 | 000   | 1         | 01       | 0        | 0       | 10       | 11
        111100 | 101   | 0         | 10       | 0        | 0       | 00       | 00
        111101 | 110   | 0         | 10       | 0        | 0       | 00       | 00
        111110 | 101   | 0         | 11       | 0        | 1       | 01       | 00
        111111 | 101   | 0         | 00       | 1        | 1       | 00       | 00
    */