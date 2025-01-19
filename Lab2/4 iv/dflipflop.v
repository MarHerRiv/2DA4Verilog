module dflipflop (d, Clock, q);
	input d, Clock;
	output reg q;
	always @(posedge Clock)
		q = d;
endmodule