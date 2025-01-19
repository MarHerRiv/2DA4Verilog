module hexdisp (x3, x2, x1, x0, segment0, segment1, segment2, segment3, segment4, segment5, segment6);
	input x3, x2, x1, x0;
	output segment0, segment1, segment2, segment3, segment4, segment5, segment6;
	assign segment0 = ~((x3 | x2 | x1 | ~x0) & (x3 | ~x2 | x1 | x0) & (~x3 | ~x2 | x1 | ~x0) & (~x3 | x2 | ~x1 | ~x0));
	assign segment1 = ~((~x3 | ~x1 | ~x0) & (~x2 | ~x1 | x0) & (~x3 | ~x2 | x0) & (x3 | ~x2 | x1 | ~x0));
	assign segment2 = ~((~x1 & x0) | (~x3 & x2) | (x3 & ~x2) | (~x3 & ~x1) | (~x3 & x0));
	assign segment3 = ~((~x2 | ~x1 | ~x0) & (x2 | x1 | ~x0) & (x3 | ~x2 | x1 | x0) & (~x3 | x2 | ~x1 | x0));
	assign segment4 = ~((x1 & ~x0) | (x3 & x2) | (x3 & x1) | (~x2 & ~x1 & ~x0));
	assign segment5 = ~((~x1 & ~x0) | (x3 & ~x2) | (x3 & x1) | (~x3 & x2 & ~x1) | (~x3 & x2 & ~x0));
	assign segment6 = ~((x3 & ~x2) | (x1 & ~x0) | (x3 & x0)  | (~x2 & x1) | (~x3 & x2 & ~x1));
endmodule