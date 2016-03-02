module UART_tb();

logic clk, rst_n, trmt;
logic rdy, clr_rdy;
logic [7:0]TX_DATA, RX_DATA;
logic TX, tx_done;

UART_tx iDUT_tx(.clk(clk), .rst_n(rst_n), .TX(TX), .trmt(trmt), .TX_DATA(TX_DATA),.tx_done(tx_done));
UART_rx iDUT_rx(.clk(clk), .rst_n(rst_n), .RX(TX), .rdy(rdy), .cmd(RX_DATA), .clr_rdy(clr_rdy));

integer i;

initial
begin
	clk=1'b0;
	rst_n=1'b0;
	TX_DATA=8'h00;
	trmt = 1'b0;
	clr_rdy = 1'b1;

	repeat(50) @(posedge clk);
	rst_n=1'b1;

	for (i=0; i<8'hff; i=i+1) begin
		wait(tx_done == 1) TX_DATA = TX_DATA + 1;
		@(negedge clk) rst_n = 1; trmt = 1; clr_rdy = 1;
		repeat(2) @(posedge clk); 
		@(negedge clk) trmt = 0; clr_rdy = 0;
		wait(rdy == 1) if(RX_DATA !== TX_DATA)
		begin
			$display("Oh no!");
			$stop;
		end
	end
	$display("Ha you did it");
	$stop;
end

always #1 clk=~clk;

endmodule
