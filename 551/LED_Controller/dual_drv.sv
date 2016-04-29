module dual_drv(clk, rst_n, duty1, duty2);

input clk, rst_n;
output [7:0]duty1, duty2;

logic [25:0] cnt;

always @(posedge clk, negedge rst_n)
	if (!rst_n)
		cnt <= 25'b0;
	else
		cnt <= cnt + 1'b1;

assign duty1 = cnt[25:18];
assign duty2 = ~cnt[25:18];

endmodule