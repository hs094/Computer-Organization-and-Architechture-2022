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
// The top module for our KGP-RISC processor where we instantiate the datapath and controller units
module KGPRISC(
    input clk,
    input rst
);

    wire [5:0] opcode;
    wire [5:0] funccode;
    wire [1:0] RegDest;
    wire RegWrite;
    wire [1:0] MemToReg;
    wire MemRead;
    wire MemWrite;
    wire ImmSel;
    wire ALUsrc;
    wire [4:0] ALUop;
    wire isBranch;
    wire LblSel;
    wire BranchAddr;

    // Instantiate the control unit
    control_unit CU(
        .opcode(opcode),
        .funccode(funccode),
        .RegDest(RegDest),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ImmSel(ImmSel),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .isBranch(isBranch),
        .BranchAddr(BranchAddr),
        .LblSel(LblSel)
    );

    // Instantiate the datapath unit
    datapath dp(
        .opcode(opcode),
        .funcode(funccode),
        .RegDest(RegDest),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUsrc(ALUsrc),
        .ALUop(ALUop),
        .ALUsel(ALUsel),
        .isBranch(isBranch),
        .ImmSel(ImmSel),
        .BranchAddr(BranchAddr),
        .LblSel(LblSel),
        .clk(clk),
        .rst(rst),  
    );
endmodule