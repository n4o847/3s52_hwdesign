module simstm;
    reg ck, rst;
    wire [3:0] x;
    initial begin
        $dumpfile("stm.vcd");
        $dumpvars;
        $monitor("st = %b: x = %x", s.st, x);
        ck = 0; rst = 0;
        #20 rst = 1;
        #60 rst = 0;
        #1000 $finish;
    end
    always #10 ck = ~ck;

    stm s(ck, rst, x);

endmodule
