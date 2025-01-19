module alu3 (x, clock, reset, leds);
	input [2:0] x;
	reg [2:0] q1, q2;
	input clock, reset;
	
	always @(posedge clock, negedge reset)
	begin
	if (reset == 0)
		q2 = 3'b000;
	else
		q2 = s;
	end
	
	always @(posedge clock)
	begin
		q1 = x;
	end
	
	reg [2:0] s;
	reg carryout;
	reg [3:0] c, hexadecimal;
	integer k;
	
	always @(q1)
	begin
		c[0] = 0;
		for (k = 0; k <= 2; k = k+1)
		begin
			s[k] = q1[k] ^ q2[k] ^ c[k];
			c[k+1] = (q1[k] & q2[k]) | (q1[k] & c[k]) | (q2[k] & c[k]);
			hexadecimal[k] = s[k];
		end
		carryout = c[3];
		hexadecimal[3] = carryout;


	end
	
	output reg [0:6] leds;
	
	always@(hexadecimal)
		case (hexadecimal)
			0: leds = 7'b0000001;
			1: leds = 7'b1001111;
			2: leds = 7'b0010010;
			3: leds = 7'b0000110;
			4: leds = 7'b1001100;
			5: leds = 7'b0100100;
			6: leds = 7'b0100000;
			7: leds = 7'b0001111;
			8: leds = 7'b0000000;
			9: leds = 7'b0000100;
			10: leds = 7'b0001000;
			11: leds = 7'b1100000;
			12: leds = 7'b0110001;
			13: leds = 7'b1000010;
			14: leds = 7'b0110000;
			15: leds = 7'b0111000;
		endcase
endmodule