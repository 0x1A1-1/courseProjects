module UART_wrapper(clk, rst_n, clr_cmd_rdy, cmd_rdy, TX, RX, cmd, send_resp, resp, resp_sent);

input clk, rst_n, RX, send_resp, resp, clr_cmd_rdy;

typedef enum reg[1:0] {IDLE, HIGH,LOW} state_t;
state_t state, nxt_state;

output logic clr_cmd_rdy, cmd_rdy, resp_sent;
output logic [15:0] cmd;

logic [7:0] rx_data;
logic clr_rdy, capture_high, rdy;

UART iDUT_UART(.clk(clk), .rst_n(rst_n), .RX(RX), .TX(TX), .rx_data(rx_data), .tx_data(resp),
				.tx_done(resp_sent), .trmt(send_resp), .clr_rdy(clr_rdy), .rdy(rdy));

/////////// infer data choosing mux with flop ///////////////
always_ff @(posedge clk)
	if (capture_high)
		cmd[15:8] <= rx_data;
	else
		cmd[15:8] <= cmd[15:8];
	

/////////// state machine ///////////////
always_ff @(posedge clk, negedge rst_n)
	if (!rst_n)
		state <= HIGH;
	else
		state <= nxt_state;

/////////// state machine logic///////////////		
always_comb begin
///// default outputs //////
	capture_high = 0;
	cmd_rdy = 0;
	clr_rdy = 0;
	nxt_state = HIGH;
	case (state)
		HIGH : 
			if (rdy) begin
				capture_high = 1;
				clr_rdy = 1;
				clr_cmd_rdy = 1;
				nxt_state = LOW;
			end else
				next_state = HIGH;
		///// default case = LOW /////
		default :
			if (rdy) begin
				cmd_rdy = 1;
				clr_rdy = 1;
				nxt_state = IDLE;
			end else
			nxt_state = LOW;
	endcase
end

endmodule
