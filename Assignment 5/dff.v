module dff(
    input d,
    input rstn,
    input clk,
    output reg q;
    );
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            q <= 1'b0;
        end
        else begin
            q <= d;
        end 
    end
endmodule 
