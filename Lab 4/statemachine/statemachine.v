module statemachine(clock, enter, change, equals, resetn, new, open, alarm);
	input clock, enter, change, equals, resetn;
	output reg new, open, alarm;
	
	reg [2:0] state, state_changer;
	parameter [2:0] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
	
	always @(enter, change, equals)
	begin
		case (state)
			A: begin
					alarm = 0;
					new = 0;
					open = 0;
					if (change & equals) state_changer = B;
					else if (enter & equals) state_changer = E;
					else if ((enter | change) & ~equals) state_changer = C;
					else if (~enter & ~change) state_changer = A;
				end
			B: begin
					new = 1;
					alarm = 0;
					open = 0;
					if (enter | change) state_changer = A;
					else if (~enter & ~change) state_changer = B;
				end
			C: begin
					alarm = 0;
					new = 0;
					open = 0;
					if ((change | enter) & ~equals) state_changer = D;
					else if (change & equals) state_changer = B;
					else if (enter & equals) state_changer = E;
					else if (~enter & ~equals) state_changer = C;
				end
			D: begin
					alarm = 1;
					new = 0;
					open = 0;
					state_changer = D;
				end
			E: begin
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
	
endmodule