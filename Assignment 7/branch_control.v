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
module branch_control(
    input[5:0] opcode,
    input SignFlag,
    input CarryFlag, 
    input ZeroFlag,
    output reg NextPC
);
    always @(*) begin
        case (opcode)
            6'b001000:   begin      // b
                NextPC = 1;
            end 
            6'b001001:   begin     // bl
                NextPC = 1;
            end 
            6'b001010:   begin     // bcy
                NextPC = CarryFlag; 
            end  
            6'b001011:   begin     // bncy
                NextPC = ~CarryFlag;
            end          
            6'b010000:   begin     // br
                NextPC = 1;
            end
            6'b010001:   begin     // bltz
                NextPC = SignFlag;
            end
            6'b010010:   begin     // bz
                NextPC = ZeroFlag;
            end   
            6'b010011:   begin     // bnz
                NextPC = ~ZeroFlag;
            end
            default: NextPC = 0;
        endcase
    end
endmodule