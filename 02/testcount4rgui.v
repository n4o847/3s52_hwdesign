module testcount4rgui;
    wire [3:0] out;
    reg ck, res;
    initial begin
        $dumpfile("count4.vcd");
        $dumpvars;
        $monitor("%t %b %b %b", $time, ck, res, out);
        ck <= 0;
        res <= 0;
        #40
        res <= 1;
        #350
        $finish;
    end
    always #10 ck <= ~ck;
    count4r cnt(out, ck, res);
endmodule
