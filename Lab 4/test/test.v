module test (clock, resetn, enter_button, change_button, x, leds, statebits);
	input clock, resetn, enter_button, change_button;
	input [3:0] x;
	output reg [0:6] leds;
	output reg [2:0] statebits;
	
	reg [1:0] estate, cstate;
	parameter [1:0] Ae = 2'b00, Ac = 2'b00, Be = 2'b01, Bc = 2'b01, Ce = 2'b10, Cc = 2'b10;
	
	reg enter, change;
	
	always @(posedge clock)
	begin
		case (estate)
			Ae: if (~enter_button)
				 begin
					enter = 1;
					estate = Be;
				 end
			Be: if (~enter_button)
				 begin
					enter = 0;
					estate = Ce;
				 end
			Ce: if (enter_button)
				 begin
					estate = Ae;
				 end
		endcase
	end
	
		always @(posedge clock)
	begin
		case (cstate)
			Ac: if (~change_button)
				 begin
					change = 1;
					cstate = Bc;
				 end
			Bc: if (~change_button)
				 begin
					change = 0;
					cstate = Cc;
				 end
			Cc: if (change_button)
				 begin
					cstate = Ac;
				 end
		endcase
	end
	
	reg [3:0] xreg, comboreg, changereg;
	
	always @(posedge clock)
			xreg = x;
			
	always @(posedge clock, negedge resetn)
		if (resetn == 0)
			comboreg <= 4'b0110;
		else
			comboreg <= changereg;
			
	reg alarm, new, open;
			
	always @(posedge clock, negedge resetn)
	begin
		if (resetn == 0)
			changereg = 4'b0110;
		else if (new == 1 & (enter == 1 | change == 1))
			changereg = xreg;
	end
	
	reg equals;
	
	always @(xreg, comboreg)
	begin
		if (xreg == comboreg)
			equals = 1;
		else
			equals = 0;
	end
	
	reg [2:0] state, state_changer;
	parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
	
	always @(enter, change, equals)
	begin
		case (state)
			A: begin
					statebits = A;
					alarm = 0;
					new = 0;
					open = 0;
					if (change & equals) state_changer = B;
					else if (enter & equals) state_changer = E;
					else if ((enter | change) & ~equals) state_changer = C;
					else if (~enter & ~change) state_changer = A;
				end
			B: begin
					statebits = B;
					new = 1;
					alarm = 0;
					open = 0;
					if (enter | change) state_changer = A;
					else if (~enter & ~change) state_changer = B;
				end
			C: begin
					statebits = C;
					alarm = 0;
					new = 0;
					open = 0;
					if ((change | enter) & ~equals) state_changer = D;
					else if (change & equals) state_changer = B;
					else if (enter & equals) state_changer = E;
					else if (~enter & ~equals) state_changer = C;
				end
			D: begin
					statebits = D;
					alarm = 1;
					new = 0;
					open = 0;
					state_changer = D;
				end
			E: begin
					statebits = E;
					open = 1;
					alarm = 0;
					new = 0;
					if (enter) state_changer = A;
					else if (~enter) state_changer = E;
				end
			default: state_changer = 3'bxxx;
		endcase
	end
	
	always @(posedge clock, negedge resetn)
	begin
		if (~resetn) state <= A;
		else state <= state_changer;
	end
	
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