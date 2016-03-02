module UART_tx_tb();

reg clk, rst_n, trmt;
reg [7:0]TX_DATA;
wire TX, tx_done;

UART_tx iDUT(.clk(clk), .rst_n(rst_n), .TX(TX), .trmt(trmt), .TX_DATA(TX_DATA),.tx_done(tx_done));

initial
	begin
		clk=1'b1;
		rst_n=1'b1;
		TX_DATA=8'b11011011;
		#10
		rst_n=1'b0;
		@(posedge clk);
		rst_n=1'b1;
		trmt=1'b1;
		repeat(2) @(posedge clk);
		trmt = 1'b0;
		#12000
		rst_n=1'b0;
		@(posedge clk);
		rst_n=1'b1;
		trmt = 1'b1;
		TX_DATA=8'b01010101;
		repeat(2) @(posedge clk);
		@(posedge clk);
		trmt = 1'b0;
	end

always #5 clk=~clk;
	
endmodule
