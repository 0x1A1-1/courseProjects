module RAMqueue(clk, we, waddr, wdata, raddr, rdata);

parameter ENTRIES = 384;
parameter LOG2 = 9;

input clk, we;
input [LOG2-2:0] wdata;
input [LOG2-1:0] waddr, raddr;
output reg [LOG2-2:0] rdata;

reg [LOG2-1:0] mem [0:ENTRIES-1];

always @(posedge clk)
	if(we==1)
	begin 
		mem[waddr] <= wdata;
		rdata <=  mem[raddr];
	end
	else
	begin
		rdata <= mem[raddr];

	end

endmodule
