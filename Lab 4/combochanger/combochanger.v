module combochanger(clock, enter, change, new, resetn, x, combo);
	input clock, enter, change, new, resetn;
	input [3:0] x;
	output reg [3:0] combo;
	
	always @(posedge clock, negedge resetn)
	begin
		if (resetn == 0)
			combo = 4'b0110;
		else if (new == 1 & (enter == 1 | change == 1))
			combo = x;
	end
endmodule