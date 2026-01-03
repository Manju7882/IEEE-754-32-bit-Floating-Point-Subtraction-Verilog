module fp_align (
    input  [7:0] exp_a,
    input  [7:0] exp_b,
    input  [23:0] man_a,
    input  [23:0] man_b,
    input  sign_a,
    input  sign_b,
    output reg [7:0] exp_out,
    output reg [23:0] man_a_out,
    output reg [23:0] man_b_out,
    output reg sign_big
);

always @(*) begin
    if (exp_a >= exp_b) begin
        exp_out   = exp_a;
        man_a_out = man_a;
        man_b_out = man_b >> (exp_a - exp_b);
        sign_big  = sign_a;
    end else begin
        exp_out   = exp_b;
        man_b_out = man_b;
        man_a_out = man_a >> (exp_b - exp_a);
        sign_big  = sign_b;
    end
end

endmodule
