module fp32_subtractor_tb;

    reg  [31:0] a, b;
    wire [31:0] result;

    fp32_subtractor dut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // 5.5 - 2.25 = 3.25
        a = 32'h40B00000; // 5.5
        b = 32'h40100000; // 2.25
        #10;

        // 10.0 - 3.0 = 7.0
        a = 32'h41200000;
        b = 32'h40400000;
        #10;

        // 4.0 - 6.0 = -2.0
        a = 32'h40800000;
        b = 32'h40C00000;
        #10;

        $finish;
    end

endmodule
