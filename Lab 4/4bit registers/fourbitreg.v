module fourbitreg (D, Clock, Resetn, Q);
	input [3:0] D;
	input Clock, Resetn;
	output reg [3:0] Q;
	
	always @(posedge Clock, negedge Resetn)
		if (Resetn == 0)
			Q <= 4'b0000;
		else
			Q <= D;
endmodule