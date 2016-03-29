module UART(clk, rst_n, RX, TX, rx_data, tx_data, tx_done, trmt, clr_rdy, rdy);

input clk, rst_n, RX, clr_rdy, trmt;
input [7:0] tx_data;
output TX, rdy, tx_done;
output [7:0] rx_data; 

UART_tx iDUT_tx(.clk(clk), .rst_n(rst_n), .TX(TX), .trmt(trmt), .TX_DATA(tx_data),.tx_done(tx_done));
UART_rx iDUT_rx(.clk(clk), .rst_n(rst_n), .RX(TX), .rdy(rdy), .cmd(rx_data), .clr_rdy(clr_rdy));

endmodule