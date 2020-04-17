module	alu(A, B, O, CTR, ck);
	input	[7:0]	A, B;
	input	[3:0]	CTR;
	input	ck;
	output	[7:0]	O;
	reg	[7:0]	INA, INB, O;
	reg	[3:0]	C;

	function [7:0] alufunc;
		input	[7:0]	A;
		input	[7:0]	B;
		input	[3:0]	C;

		case (C)
		'b0000:	alufunc = A + B;
		'b0001:	alufunc = A - B;
		'b1000:	alufunc = A & B;
		'b1001:	alufunc = A | B;
		'b1010:	alufunc = A ^ B;
		'b1011:	alufunc = ~A;
		'b1100:	alufunc = A >> 1;
		'b1101:	alufunc = A << 1;
		'b1110:	alufunc = {A[0], A[7:1]};
		'b1111:	alufunc = {A[6:0], A[7]};
		endcase
	endfunction

	always @(posedge ck) begin
		INA <= A;
		INB <= B;
		C <= CTR;
		O <= alufunc(INA, INB, C);
	end
endmodule
