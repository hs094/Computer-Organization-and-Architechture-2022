`timescale 1ns/1ps

module add_by_one(
    input [0:3] in,
    output [0:3] out
    );

    assign out[0] = ~a[0];
    assign out[1] = a[1] ^ (a[0]);
    assign out[2] = a[2] ^ (a[1] & a[0]);
    assign out[3] = a[3] ^ (a[2] & a[1] & a[0]);

endmodule

