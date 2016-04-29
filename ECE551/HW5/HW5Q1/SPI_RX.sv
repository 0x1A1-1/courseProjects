module SPI_RX(clk, rst_n, SS_n, SCLK, MOSI, edg, len8_16, mask, match, SPItrig);

input clk, rst_n;
input SS_n, SCLK, MOSI, edg, len8_16;
input [15:0] mask, match;

output SPItrig;   //trigger signal of SPI module

// all intermediate logic 
logic SCLK_rise, SCLK_fall, shift;
logic SCLK_ff1, SCLK_ff2, SCLK_ff3, MOSI_ff1, MOSI_ff2, MOSI_ff3;
logic SS_n_ff1, SS_n_ff2, SS_n_ff3; 

logic [15:0] shft_reg, match_result;

////synchronize MOSI
always_ff @(posedge clk) begin
	MOSI_ff1 <= MOSI;
	MOSI_ff2 <= MOSI_ff1;
	MOSI_ff3 <= MOSI_ff2;
end

////synchronize SS_n
always_ff @(posedge clk) begin
		SS_n_ff1 <= SS_n;
		SS_n_ff2 <= SS_n_ff1; 
		SS_n_ff3 <= SS_n_ff2;
end

////synchronize SCLK
always_ff @(posedge clk) begin
		SCLK_ff1 <= SCLK;
		SCLK_ff2 <= SCLK_ff1;
		SCLK_ff3 <= SCLK_ff2;
end

//edge detection
assign SCLK_rise = (SCLK_ff3==0 && SCLK_ff2==1)? 1 : 0;
assign SCLK_fall = (SCLK_ff3==1 && SCLK_ff2==0)? 1 : 0;
assign shift = (edg == 1)? ((SCLK_rise==1)? 1 : 0) : ((SCLK_fall==1)? 1 : 0);

////shifting register
always_ff @(posedge clk, negedge rst_n) begin
	if (!rst_n)
		shft_reg <= 16'h0000;
	else
		shft_reg <= (shift==1)? {shft_reg[14:0], MOSI_ff3} : shft_reg;
end

//// data comparison
assign match_result = ((match) ~^ (shft_reg)) | mask; 		// check matching result with mask applied
assign SPItrig = ( SS_n == 1 && match_result[7:0]==8'hff ) ? ( (len8_16==1) ? 1 : ( (match_result[15:8]==8'hff)? 1 : 0 ) )  : 0 ; // check priority of lower bits first

endmodule