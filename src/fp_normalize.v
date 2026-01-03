module fp_normalize (
    input  [23:0] man_in,
    input  [7:0]  exp_in,
    output reg [23:0] man_out,
    output reg [7:0]  exp_out
);

integer i;

always @(*) begin
    man_out = man_in;
    exp_out = exp_in;

    if (man_in != 0) begin
        for (i = 23; i > 0; i = i - 1) begin
            if (man_out[23] == 1'b0) begin
                man_out = man_out << 1;
                exp_out = exp_out - 1;
            end
        end
    end
end

endmodule
