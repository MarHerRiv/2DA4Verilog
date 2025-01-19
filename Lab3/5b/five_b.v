module five_b (carryin, x, y, s, carryout);
	input [2:0] x, y;
	input carryin;
	output reg [2:0] s;
	output reg carryout;
	reg [3:0] c;
	integer k;
	
	always @(x, y, carryin)
	begin
		c[0] = carryin;
		for (k = 0; k <= 2; k = k+1)
		begin
			s[k] = x[k] ^ y[k] ^ c[k];
			c[k+1] = (x[k] & y[k]) | (x[k] & c[k]) | (y[k] & c[k]);
		end
		carryout = c[3];
	end
endmodule