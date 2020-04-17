module  count4r2m(out,ck,res);
  output	[3:0] out;
  input		ck, res;
  reg		[3:0] q;
  always @(posedge ck or negedge res) begin
	if( !res)	q<= 1;
	else		q <= q*2;
  end
  assign out = q;
endmodule
