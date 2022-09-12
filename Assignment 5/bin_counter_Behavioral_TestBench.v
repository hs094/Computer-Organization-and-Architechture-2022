`timescale 1ps/10ns

module bin_counter_Behavioral_TestBench;

    reg clk, reset;
    wire [3:0] out;

    bin_sync_up uut(
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    initial begin
        clk = 0;
        reset = 0;
        $moniter("clk = %d, reset = %d, out = %d", clk, reset, out);
        #100;
        rst = 1;
        #100;
        rst = 0;
    end
    always #5 clk = ~clk;
endmodule