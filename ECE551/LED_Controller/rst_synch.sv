module rst_synch(clk, RST_n, rst_n);

input RST_n, clk;
output logic rst_n;

logic q1;

always @(negedge clk, negedge RST_n)
	if (!RST_n)
		q1 <= 1'b0;
	else
		q1 <= 1'b1;
	
always @(negedge clk, negedge RST_n)
	if (!RST_n)
		rst_n <= 1'b0;
	else
		rst_n <= q1;
		
endmodule
