module combinationlock (clock, resetn, enter_button, change_button, x, leds);
	input clock, resetn, enter_button, change_button;
	input [3:0] x;
	output [0:6] leds;
	wire [0:6] ledstatus;
	
	wire enter, change, alarm, new, open, equals;
	wire [3:0] xreg, comboreg, changereg;
	
	inputcond enter_conditioning(enter_button, clock, enter);
	inputcond change_conditioning(change_button, clock, change);
	
	fourbitreg inputx(x, clock, resetn, xreg);
	fourbitreg stored_combo(changereg, clock, resetn, comboreg);
	
	comparator comp(xreg, comboreg, equals);
	
	combochanger(clock, enter, change, new, resetn, xreg, changereg);
	
	statemachine fsm(clock, enter, change, equals, resetn, new, open, alarm);
	
	sevensegment leddisplay(alarm, new, open, ledstatus);
	assign leds = ledstatus;
endmodule