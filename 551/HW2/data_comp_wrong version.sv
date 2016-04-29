module data_comp(serial_data, serial_vld, mask, match, prot_trig);

input [7:0] serial_data, mask, match;
input serial_vld;
output prot_trig;

wire SPItrig, UARTtrig;

	module SPI_RX(clk, rst_n, SS_n, SCLK, MOSI, edg, len8_16, mask, match, SPItrig);
		input [15:0] mask, match;
		input clk, rst_n, SS_n, SCLK, MOSI, edg, len8_16;
		output SPItrig;
		
	endmodule

	module UART_RX(clk, rst_n, RX, baud_cnt, match, mask, UARTtrig);
		input [15:0] baud_cnt;
		input [7:0] mask, match;
		input clk, rst_n, RX;
		output UARTtrip;
		
	endmodule

assign prot_trig = ( SPItrig | disable ) & ( UARTtrig | disable );

endmodule

