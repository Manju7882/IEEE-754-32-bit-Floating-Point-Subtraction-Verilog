module fp32_subtractor (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] result
);

    // Extract fields
    wire sign_a = a[31];
    wire sign_b = b[31];
    wire [7:0] exp_a = a[30:23];
    wire [7:0] exp_b = b[30:23];
    wire [23:0] man_a = {1'b1, a[22:0]};
    wire [23:0] man_b = {1'b1, b[22:0]};

    wire sign_res;
    wire [7:0] exp_res;
    wire [23:0] man_res;

    fp_align align (
        exp_a, exp_b,
        man_a, man_b,
        sign_a, sign_b,
        exp_res,
        man_a_aligned,
        man_b_aligned,
        sign_big
    );

    fp_mantissa_sub sub (
        man_a_aligned,
        man_b_aligned,
        sign_big,
        man_sub,
        sign_res
    );

    fp_normalize norm (
        man_sub,
        exp_res,
        man_norm,
        exp_norm
    );

    assign result = {sign_res, exp_norm, man_norm[22:0]};

endmodule
