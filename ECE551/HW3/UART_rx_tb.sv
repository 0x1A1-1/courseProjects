module UART_rx_tb();
// test bench for UART receiver module

logic RX, rdy, clr_rdy;
logic clk, rst_n;
logic [7:0] cmd;

//initialize iDUT module
UART_rx iDUT(.clk(clk), .rst_n(rst_n), .RX(RX), .rdy(rdy), .cmd(cmd), .clr_rdy(clr_rdy));

always #1 clk = ~clk;

initial 
begin
	clk=1'b1;
	rst_n=1'b1;
	clr_rdy=1'b0;
	RX=1;
	repeat(2) @(posedge clk) 
	rst_n=1'b0;
	repeat(2) @(posedge clk)//create the falling edge of RX
	rst_n=1'b1;
	RX=1'b0;
	//start reading of first signal
	repeat(109) @(posedge clk) 
	RX=1'b1;
	repeat(109) @(posedge clk)
	RX=1'b0;
	repeat(109) @ (negedge clk);
	RX = 1'b1;
	repeat(109) @ (negedge clk);
	RX = 1'b0;
	repeat(109) @ (negedge clk);
	RX = 1'b1;
	repeat(109) @ (negedge clk);
	RX = 1'b0;
	repeat(109) @ (negedge clk);
	RX = 1'b1;
	repeat(109) @ (negedge clk);
	RX = 1'b0;
	//end of first reading
	repeat(109) @ (negedge clk);
	RX = 1'b1;
	repeat(109) @ (negedge clk);
	RX=1'b0;
	//start of next reading
	repeat(109) @(posedge clk)
	RX=1'b1;
	repeat(109) @(posedge clk)
	RX=1'b1;
	repeat(109) @ (negedge clk);
	RX = 1'b0;
	repeat(109) @ (negedge clk);
	RX = 1'b1;
	repeat(109) @ (negedge clk);
	RX = 1'b1;
	repeat(109) @ (negedge clk);
	RX = 1'b0;
	repeat(109) @ (negedge clk);
	RX = 1'b1;
	repeat(109) @ (negedge clk); 
	RX = 1'b1;
	$stop;
end
endmodule
