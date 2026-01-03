module fp_mantissa_sub (
    input  [23:0] man_a,
    input  [23:0] man_b,
    input  sign_big,
    output reg [23:0] man_out,
    output reg sign_out
);

always @(*) begin
    if (man_a >= man_b) begin
        man_out  = man_a - man_b;
        sign_out = sign_big;
    end else begin
        man_out  = man_b - man_a;
        sign_out = ~sign_big;
    end
end

endmodule
