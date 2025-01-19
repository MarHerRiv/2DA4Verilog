module lab2demo (x3, x2, x1, x0, nx3, nx2, nx1, nx0, seg0, seg1, seg2, seg3, seg4, seg5, seg6, nseg0, nseg1, nseg2, nseg3, nseg4, nseg5, nseg6);
	input x3, x2, x1, x0, nx3, nx2, nx1, nx0;
	output seg0, seg1, seg2, seg3, seg4, seg5, seg6, nseg0, nseg1, nseg2, nseg3, nseg4, nseg5, nseg6;
	hexdisp numbers(x3, x2, x1, x0, seg0, seg1, seg2, seg3, seg4, seg5, seg6);
	name letters(nx3, nx2, nx1, nx0, nseg0, nseg1, nseg2, nseg3, nseg4, nseg5, nseg6);
endmodule