module comparator(x, combo, equals);
	input [3:0] x, combo;
	output reg equals;
	
	always @(x, combo)
	begin
		if (x == combo)
			equals = 1;
		else
			equals = 0;
	end
endmodule