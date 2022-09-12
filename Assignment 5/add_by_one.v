module add_by_one(a);

    input [3:0]a;


    wire [3:0]P,C;
    assign P = a;
    assign C[0] = 1;
    assign C[1] = P[0];
    assign C[2] = P[0] & P[1];
    assign C[3] = P[0] & P[1] & P[2];
    assign p = a[3] & a[2] & a[1] & a[0];
    assign a = P ^ C;

endmodule