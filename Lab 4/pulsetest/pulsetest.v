module pulsetest (enter, change, clock, leds, leds3, leds2, leds1);
	input enter, change, clock;
	output leds3, leds2;
	
	reg [1:0] epulse, cpulse;
	parameter [1:0] Ae = 2'b00, Ac = 2'b00;
	parameter [1:0] Be = 2'b01, Bc = 2'b01;
	parameter [1:0] Ce = 2'b10, Cc = 2'b10;

	
		always @(posedge clock)
	begin
		case (epulse)
			Ae: if (~enter)
				 begin
					leds[7] = 1;
					leds[6] = 0;
					epulse = Be;
				 end
			Be: if (~enter)
				 begin
					leds[6] = 1;
					leds[7] = 0;
					epulse = Ce;
				 end
			Ce: if (enter)
				 begin
					epulse = Ae;
				 end
		endcase
	end
	
		always @(posedge clock)
	begin
		case (cpulse)
			Ac: if (~change)
				 begin
					leds[5] = 1;
					leds[4] = 0;
					cpulse = Bc;
				 end
			Bc: if (~change)
				 begin
					leds[4] = 1;
					leds[5] = 0;
					cpulse = Cc;
				 end
			Cc: if (change)
				 begin
					cpulse = Ac;
				 end
		endcase
	end

	assign leds3 = ~enter;
	assign leds2 = ~change;

endmodule