module mul(A, B, O, ck, start, fin);
    input [7:0] A, B;
    input ck, start;
    output [16:0] O;
    output fin;

    reg [3:0] st;
    reg [7:0] AIN, BIN;
    reg [16:0] Y;
    reg fin;

    assign O = (fin == 1 ? Y : 'b0);

    always @(posedge ck) begin
        if (start == 1) begin
            st <= 0;
            AIN <= A;
            BIN <= B;
            Y <= 0;
            fin <= 0;
        end else begin
            case (st)
                0: Y <= (Y << 1) + (BIN[7] == 1 ? AIN : 0);
                1: Y <= (Y << 1) + (BIN[6] == 1 ? AIN : 0);
                2: Y <= (Y << 1) + (BIN[5] == 1 ? AIN : 0);
                3: Y <= (Y << 1) + (BIN[4] == 1 ? AIN : 0);
                4: Y <= (Y << 1) + (BIN[3] == 1 ? AIN : 0);
                5: Y <= (Y << 1) + (BIN[2] == 1 ? AIN : 0);
                6: Y <= (Y << 1) + (BIN[1] == 1 ? AIN : 0);
                7: begin Y <= (Y << 1) + (BIN[0] == 1 ? AIN : 0); fin <= 1; end
                8: fin <= 0;
            endcase
            st <= st + 1;
        end
    end
endmodule
