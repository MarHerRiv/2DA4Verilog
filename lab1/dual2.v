module dual2 (x1, x0, y1, y0, x, y, f1, f2);
	input x1, x0, y1, y0;
	output x, y, f1, f2;
	assign x = {x1, x0};
	assign y = {y1, y0};
	assign f1 = (x!=y);
	assign f2 = (x>=y);
endmodule
		