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

// This module controls the updation of the program counter at every clock edge
module program_counter(
    input clk,
    input rst,
    input [31:0] NextInstrAddr,
    output reg [31:0] InstrAddr
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            InstrAddr <= -32'd4; 
        end
        else begin
            InstrAddr <= NextInstrAddr;        // Update the program counter
        end
    end
endmodule
