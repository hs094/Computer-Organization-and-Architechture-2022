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
// The register file where we have 32 32-bit registers
module register_file(
    input [4:0] rs,
    input [4:0] rt,
    input regWrite,
    input [4:0] writeReg,
    input [31:0] writeData,
    input clk,
    input rst,
    output reg [31:0] readData1,
    output reg [31:0] readData2
);

// Async. Read and Sync. Write
reg [31:0]reg_data[31:0];
always @(*) begin 
    if (rs <= 31) begin 
        readData1 <= reg_data[rs];
    end
    else begin
        readData1 <= 32'b00000000000000000000000000000000;
    end
    if (rt <= 31) begin 
        readData2 <= reg_data[rt];
    end
    else begin
        readData2 <= 32'b00000000000000000000000000000000;
    end
end
always @(posedge clk or posedge rst) begin 
    if (rst) begin
        reg_data[0] <= 32'b00000000000000000000000000000000;
        reg_data[1] <= 32'b00000000000000000000000000000000;
        reg_data[2] <= 32'b00000000000000000000000000000000;
        reg_data[3] <= 32'b00000000000000000000000000000000;
        reg_data[4] <= 32'b00000000000000000000000000000000;
        reg_data[5] <= 32'b00000000000000000000000000000000;
        reg_data[6] <= 32'b00000000000000000000000000000000;
        reg_data[7] <= 32'b00000000000000000000000000000000;
        reg_data[8] <= 32'b00000000000000000000000000000000;
        reg_data[9] <= 32'b00000000000000000000000000000000;
        reg_data[10] <= 32'b00000000000000000000000000000000;
        reg_data[11] <= 32'b00000000000000000000000000000000;
        reg_data[12] <= 32'b00000000000000000000000000000000;
        reg_data[13] <= 32'b00000000000000000000000000000000;
        reg_data[14] <= 32'b00000000000000000000000000000000;
        reg_data[15] <= 32'b00000000000000000000000000000000;
        reg_data[16] <= 32'b00000000000000000000000000000000;
        reg_data[17] <= 32'b00000000000000000000000000000000;
        reg_data[18] <= 32'b00000000000000000000000000000000;
        reg_data[19] <= 32'b00000000000000000000000000000000;
        reg_data[20] <= 32'b00000000000000000000000000000000;
        reg_data[21] <= 32'b00000000000000000000000000000000;
        reg_data[22] <= 32'b00000000000000000000000000000000;
        reg_data[23] <= 32'b00000000000000000000000000000000;
        reg_data[24] <= 32'b00000000000000000000000000000000;
        reg_data[25] <= 32'b00000000000000000000000000000000;
        reg_data[26] <= 32'b00000000000000000000000000000000;
        reg_data[27] <= 32'b00000000000000000000000000000000;
        reg_data[28] <= 32'b00000000000000000000000000000000;
        reg_data[29] <= 32'b00000000000000000000000000000000;
        reg_data[30] <= 32'b00000000000000000000000000000000;
        reg_data[31] <= 32'b00000000000000000000000000000000;
    end
    if (regWrite) begin 
        reg_data[writeReg] <= writeData;
    end
end
    