# ---------------------------------------------------------
    # COMPUTER ORGANIZATION LABORATORY
    # AUTUMN SEMESTER 2022
    # Assignment 3
    # Problem 1
    # Group No. 60
    # Abhay Kumar Keshari 20CS10001
    # Hardik Soni 20CS30023
# ---------------------------------------------------------

module halfAdder(
    input a,
    input b,
    output S,
    output C
);
    /*
    *     Inputs:             Outputs:
	*   a = 0, b = 0        S = 0, C = 0
	*   a = 0, b = 1        S = 1, C = 0
	*   a = 1, b = 0        S = 1, C = 0
	*   a = 1, b = 1        S = 0, C = 1
    */
    assign S = a ^ b;
    assign C = a & b; 
end module