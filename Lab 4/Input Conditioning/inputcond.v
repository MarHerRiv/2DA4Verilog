module inputcond (Ainput, clock, led);
	input Ainput, clock;
	output reg led;
	
	reg [1:0] pulse;
	parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10;

	
	always @(posedge clock)
	begin
		case (pulse)
			A: if (~Ainput)
				 begin
					led = 1;
					pulse = B;
				 end
			B: if (~Ainput)
				 begin
				 led = 0;
					pulse = C;
				 end
			C: if (Ainput)
				 begin
					pulse = A;
				 end
		endcase
	end

endmodule