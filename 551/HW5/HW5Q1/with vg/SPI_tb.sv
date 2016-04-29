`timescale 1ns/1ps
module SPI_tb();

reg clk, rst_n, width8, pos_edge, edg, wrt;
wire SS_n, SCLK, done, MOSI, SPItrig;
reg [15:0] data_out, mask, match;


SPI_RX rx(.clk(clk), .rst_n(rst_n), .SS_n(SS_n), .SCLK(SCLK), .MOSI(MOSI), 
	.edg(edg), .len8_16(width8), .mask(mask), .match(match), .SPItrig(SPItrig));
	
SPI_mstr mst(.clk(clk), .rst_n(rst_n), .SS_n(SS_n), .SCLK(SCLK), .wrt(wrt), 
	.done(done), .data_out(data_out), .MOSI(MOSI), .pos_edge(pos_edge), .width8(width8));

initial  begin
	data_out = 16'h1230;   // testing the case of 16 bit without mask
	match = 16'h1230;
	mask = 16'h0000;
	clk = 0;
	rst_n = 0;
	width8 = 0;
	@(posedge clk)
	@(negedge clk)
	rst_n =1;
	repeat(2) @(posedge clk)
	wrt = 1;
	pos_edge = 0;
	edg = 1;
	repeat(2) @(posedge clk)
	wrt = 0;
	wait(done==1)			// testing the case of 16 bit with mask
	rst_n = 0;
	data_out = 16'hf1f1;
	match = 16'h1230;
	mask = 16'hefc1;
	wrt = 1;
	@(posedge clk)
	@(negedge clk)
	rst_n =1 ;
	repeat(2) @(posedge clk)
	wrt = 0;
	wait(done==1)			// testing the case of 8 bit without mask
	rst_n = 0;
	data_out = 16'hf130;
	match = 16'h1230;
	mask = 16'h0000;
	width8 = 1;
	wrt = 1;
	@(posedge clk)
	@(negedge clk)
	rst_n =1 ;
	repeat(2) @(posedge clk)
	wrt = 0;
	wait(done==1) 	// testing the case of 8 bit with mask
	rst_n = 0;
	data_out = 16'hf1f1;
	match = 16'h1230;
	mask = 16'h0fc1;
	width8 = 1;
	wrt = 1;
	@(posedge clk)
	@(negedge clk)
	rst_n =1 ;
	repeat(2) @(posedge clk)
	wrt = 0;
	// where pos_edge & edg are different
	wait(done==1)
	pos_edge = 1;
	edg = 0;
	rst_n = 0;
	data_out = 16'h1230;   // testing the case of 16 bit without mask
	match = 16'h1230;
	mask = 16'h0000;
	width8 = 0;
	wrt = 1;
	@(posedge clk)
	@(negedge clk)
	rst_n =1;
	repeat(2) @(posedge clk)
	wrt = 0;
	wait(done==1) 	// testing the case of 16 bit with mask
	rst_n = 0;
	data_out = 16'hf1f1;
	match = 16'h1230;
	mask = 16'hefc1;
	wrt = 1;
	@(posedge clk)
	@(negedge clk)
	rst_n =1 ;
	repeat(2) @(posedge clk)
	wrt = 0;
	wait(done==1) 	// testing the case of 8 bit without mask
	rst_n = 0;
	data_out = 16'hf130;
	match = 16'h1230;
	mask = 16'h0000;
	width8 = 1;
	wrt = 1;
	@(posedge clk)
	@(negedge clk)
	rst_n =1 ;
	repeat(2) @(posedge clk)
	wrt = 0;
	wait(done==1)		// testing the case of 8 bit with mask
	rst_n = 0;
	data_out = 16'hf1f1;
	match = 16'h1230;
	mask = 16'h0fc1;
	width8 = 1;
	wrt = 1;
	@(posedge clk)
	@(negedge clk)
	rst_n =1 ;
	repeat(2) @(posedge clk)
	wrt = 0;
end
	
always #1 clk=~clk;	
	
endmodule