module name (nx3, nx2, nx1, nx0, nsegment0, nsegment1, nsegment2, nsegment3, nsegment4, nsegment5, nsegment6);
	input nx3, nx2, nx1, nx0;
	output nsegment0, nsegment1, nsegment2, nsegment3, nsegment4, nsegment5, nsegment6;
	assign nsegment0 = ~((~nx3) & (nx2 | ~nx1) & (~nx2 | ~nx0) & (nx2 | nx1 | nx0));
	assign nsegment1 = ~(nx2 | (~nx3 & ~nx1 & ~nx0));
	assign nsegment2 = ~(nx3 | (~nx1 & ~nx0) | (nx1 & nx0) | (nx2 & ~nx1));
	assign nsegment3 = ~((~nx1 | ~nx0) & (nx3 | nx1 | nx0) & ( nx3 | nx2 | ~nx1));
	assign nsegment4 = ~(nx3 | ~nx2 | ~nx1 | ~nx0);
	assign nsegment5 = ~(~nx3 & ~nx1 & (~nx2 | ~nx0));
	assign nsegment6 = ~((~nx3 & ~nx2) | (~nx3 & ~nx1) | (~nx3 & ~nx0));
endmodule