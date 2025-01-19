module sevensegment(alarm, new, open, leds);
	input alarm, new, open;
	output reg [0:6] leds;
	
	always @(alarm, new, open)
	begin
		if (alarm == 1)
			leds = 7'b0001000;
		else if (new == 1)
			leds = 7'b1101010;
		else if (open == 1)
			leds = 7'b1100010;
		else
			leds = 7'b1111110;
	end
endmodule