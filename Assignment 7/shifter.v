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
module shifter(
    input signed [31:0] in, 
    input [31:0] shamt, 
    input shift_direction, 
    input arith_or_logic,
    output reg [31:0] out
);
    // arith_or_logic = 0 indicates logical shift and arith_or_logic = 1 indicates arithmetic shift
    // shift_direction = 0 indicates right shift and shift_direction = 1 indicates left shift
    always @(*) begin
        if (arith_or_logic) begin
            if (!shift_direction) begin
                out = in >>> shamt;     // Arithmetic right shift
            end 
            else begin
                out = in;
            end
        end 
        else begin
            if (!shift_direction) begin
                out = in >> shamt;      // Logical right shift
            end 
            else begin
                out = in << shamt;      // Left shift
            end
        end
    end
endmodule
