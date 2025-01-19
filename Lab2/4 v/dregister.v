module dregister (D, clock, reset, Q);
	input [2:0] D;
	input clock, reset;
	output reg [2:0] Q;
	
	always @(posedge clock, negedge reset)
	if (reset == 0)
		Q = 3'b000;
   else
		Q = D;
endmodule